import os
import asyncio
import logging
import asyncpg
from aiogram import Bot, Dispatcher, F
from aiogram.filters import Command
from aiogram.types import Message, InlineKeyboardButton, InlineKeyboardMarkup
from aiogram.client.bot import DefaultBotProperties
import signal
import sys
import json

logging.basicConfig(level=logging.INFO, format="%(asctime)s [%(levelname)s] %(message)s")
logger = logging.getLogger(__name__)

BOT_TOKEN = os.getenv("BOT_TOKEN")
DATABASE_URL = os.getenv("DATABASE_URL")
TELEGRAM_CHANNEL_ID = os.getenv("TELEGRAM_CHANNEL_ID")  # e.g. @yourchannel or -1001234567890
TELEGRAM_GROUP_ID = os.getenv("TELEGRAM_GROUP_ID")      # e.g. @yourgroup or -1001234567890

# Global variables for graceful shutdown
bot_instance = None
dp_instance = None
pool_instance = None


async def prepare_db(pool):
    """
    Ensure the helper function upsert_user_from_telegram(jsonb) and get_totals() exist.
    The upsert function will try to upsert into your existing users table if it has a telegram_id column.
    If not, it will create a fallback telegram_users table and upsert there.
    """
    create_sql = r"""
    -- Create a helper function that attempts to upsert into existing users table if possible
    CREATE OR REPLACE FUNCTION upsert_user_from_telegram(u jsonb)
    RETURNS bigint
    LANGUAGE plpgsql
    AS $$
    DECLARE
      t_id bigint := (u->>'id')::bigint;
      v_id bigint;
      has_users_table boolean := FALSE;
      users_has_telegram boolean := FALSE;
    BEGIN
      IF t_id IS NULL THEN
        RAISE EXCEPTION 'telegram user id missing in json';
      END IF;

      -- Check for public.users table
      SELECT to_regclass('public.users') IS NOT NULL INTO has_users_table;
      IF has_users_table THEN
        SELECT EXISTS(
          SELECT 1 FROM information_schema.columns
          WHERE table_schema='public' AND table_name='users' AND column_name='telegram_id'
        ) INTO users_has_telegram;
      END IF;

      IF has_users_table AND users_has_telegram THEN
        -- Try to upsert into the existing users table (assumes telegram_id unique constraint exists or create temporary upsert by matching telegram_id)
        INSERT INTO users (telegram_id, first_name, last_name, username, language_code, raw, created_at, updated_at)
        VALUES (
          t_id,
          u->>'first_name',
          u->>'last_name',
          u->>'username',
          u->>'language_code',
          u,
          now(),
          now()
        )
        ON CONFLICT (telegram_id) DO UPDATE
        SET
          first_name = COALESCE(EXCLUDED.first_name, users.first_name),
          last_name = COALESCE(EXCLUDED.last_name, users.last_name),
          username = COALESCE(EXCLUDED.username, users.username),
          language_code = COALESCE(EXCLUDED.language_code, users.language_code),
          raw = COALESCE(EXCLUDED.raw, users.raw) || users.raw,
          updated_at = now()
        RETURNING id INTO v_id;

        RETURN v_id;
      ELSE
        -- Fallback: ensure telegram_users table exists and upsert into it
        PERFORM 1 FROM pg_class WHERE relname = 'telegram_users' AND relkind = 'r';
        IF NOT FOUND THEN
          EXECUTE $create_tel$
            CREATE TABLE IF NOT EXISTS telegram_users (
              id SERIAL PRIMARY KEY,
              telegram_id BIGINT UNIQUE NOT NULL,
              is_bot BOOLEAN DEFAULT FALSE,
              first_name TEXT,
              last_name TEXT,
              username TEXT,
              language_code TEXT,
              raw JSONB,
              created_at TIMESTAMPTZ DEFAULT NOW(),
              updated_at TIMESTAMPTZ DEFAULT NOW()
            );
          $create_tel$;
        END IF;

        INSERT INTO telegram_users (telegram_id, is_bot, first_name, last_name, username, language_code, raw, created_at, updated_at)
        VALUES (
          t_id,
          (u->>'is_bot')::boolean,
          u->>'first_name',
          u->>'last_name',
          u->>'username',
          u->>'language_code',
          u,
          now(),
          now()
        )
        ON CONFLICT (telegram_id) DO UPDATE
        SET
          is_bot = EXCLUDED.is_bot,
          first_name = COALESCE(EXCLUDED.first_name, telegram_users.first_name),
          last_name = COALESCE(EXCLUDED.last_name, telegram_users.last_name),
          username = COALESCE(EXCLUDED.username, telegram_users.username),
          language_code = COALESCE(EXCLUDED.language_code, telegram_users.language_code),
          raw = EXCLUDED.raw || telegram_users.raw,
          updated_at = now()
        RETURNING id INTO v_id;

        RETURN v_id;
      END IF;
    END;
    $$;

    -- get_totals helper: count shops/products and choose users table automatically, plus orders today
    CREATE OR REPLACE FUNCTION get_totals()
    RETURNS TABLE(total_shops integer, total_products integer, total_users integer, orders_today integer)
    LANGUAGE plpgsql
    AS $$
    DECLARE
      users_count bigint := 0;
    BEGIN
      total_shops := CASE WHEN to_regclass('public.shops') IS NOT NULL THEN (SELECT COUNT(*) FROM shops) ELSE 0 END;
      total_products := CASE WHEN to_regclass('public.products') IS NOT NULL THEN (SELECT COUNT(*) FROM products) ELSE 0 END;

      IF to_regclass('public.users') IS NOT NULL THEN
        -- If users table exists, try to count either 'telegram_id' or a generic row count
        BEGIN
          SELECT COUNT(*) INTO users_count FROM users;
        EXCEPTION WHEN OTHERS THEN
          users_count := 0;
        END;
      ELSIF to_regclass('public.telegram_users') IS NOT NULL THEN
        BEGIN
          SELECT COUNT(*) INTO users_count FROM telegram_users;
        EXCEPTION WHEN OTHERS THEN
          users_count := 0;
        END;
      ELSE
        users_count := 0;
      END IF;

      total_users := COALESCE(users_count, 0);

      orders_today := CASE WHEN to_regclass('public.orders') IS NOT NULL THEN (SELECT COUNT(*) FROM orders WHERE created_at >= date_trunc('day', now())) ELSE 0 END;

      RETURN;
    END;
    $$;
    """

    async with pool.acquire() as conn:
        await conn.execute(create_sql)
        logger.info("Database helper functions ensured (prepare_db complete).")


async def upsert_db_user(conn, user):
    """
    Use the upsert_user_from_telegram(db) function to persist the Telegram user into the existing users table if possible,
    or into a fallback telegram_users table.
    Returns the numeric id returned by the DB function.
    """
    user_json = {
        "id": user.id,
        "is_bot": getattr(user, "is_bot", False),
        "first_name": getattr(user, "first_name", None),
        "last_name": getattr(user, "last_name", None),
        "username": getattr(user, "username", None),
        "language_code": getattr(user, "language_code", None)
    }
    val = await conn.fetchval("SELECT upsert_user_from_telegram($1::jsonb)", json.dumps(user_json))
    return val


async def get_totals(conn):
    """
    Call DB get_totals() and return a dict
    """
    row = await conn.fetchrow("SELECT * FROM get_totals()")
    if not row:
        return {"total_shops": 0, "total_products": 0, "total_users": 0, "orders_today": 0}
    return {
        "total_shops": row["total_shops"],
        "total_products": row["total_products"],
        "total_users": row["total_users"],
        "orders_today": row["orders_today"],
    }


async def check_membership(bot, chat_id, user_id):
    """
    Try to determine if user is a member of chat_id.
    Returns:
      - True if member
      - False if left or kicked
      - None if unknown or permission error
    """
    if not chat_id:
        return None
    try:
        member = await bot.get_chat_member(chat_id, user_id)
        status = getattr(member, "status", None)
        if status in ("left", "kicked"):
            return False
        return True
    except Exception as e:
        logger.debug("check_membership error: %s", e)
        return None


async def shutdown():
    """Graceful shutdown function"""
    logger.info("Starting graceful shutdown...")
    
    if dp_instance:
        await dp_instance.stop_polling()
        logger.info("Dispatcher polling stopped.")
    
    if bot_instance:
        await bot_instance.session.close()
        logger.info("Bot session closed.")
    
    if pool_instance:
        await pool_instance.close()
        logger.info("Database pool closed.")


def signal_handler(signum, frame):
    """Handle termination signals"""
    logger.info(f"Received signal {signum}, shutting down...")
    asyncio.create_task(shutdown())
    # do not sys.exit immediately; let shutdown complete
    # but to keep parity with previous behavior:
    sys.exit(0)


async def _run():
    global bot_instance, dp_instance, pool_instance
    
    if not BOT_TOKEN:
        logger.error("BOT_TOKEN is not set. Set the BOT_TOKEN environment variable.")
        return
    if not DATABASE_URL:
        logger.error("DATABASE_URL is not set. Set the DATABASE_URL environment variable.")
        return

    logger.info("Creating database pool...")
    try:
        pool = await asyncpg.create_pool(DATABASE_URL, min_size=1, max_size=5)
        pool_instance = pool
    except Exception as e:
        logger.exception("Failed to create database pool: %s", e)
        return

    try:
        logger.info("Preparing database...")
        await prepare_db(pool)
        logger.info("Database ready.")
    except Exception:
        logger.exception("Database preparation failed.")
        await pool.close()
        return

    try:
        # Use DefaultBotProperties for parse_mode (aiogram >= 3.7)
        bot = Bot(token=BOT_TOKEN, default=DefaultBotProperties(parse_mode="HTML"))
        bot_instance = bot
        
        logger.info("Bot client created, deleting webhook (if any) and starting dispatcher...")

        # Delete webhook with drop_pending_updates to avoid conflicts
        try:
            await bot.delete_webhook(drop_pending_updates=True)
            logger.info("Webhook deleted and pending updates dropped.")
        except Exception as e:
            logger.warning(f"Error deleting webhook: {e}. Continuing...")

        dp = Dispatcher()
        dp_instance = dp

        @dp.message(Command("start"))
        async def cmd_start(message: Message):
            # Upsert user and get totals within a transaction
            async with pool.acquire() as conn:
                try:
                    await conn.execute("BEGIN")
                    local_user_id = await upsert_db_user(conn, message.from_user)
                    totals = await get_totals(conn)
                    await conn.execute("COMMIT")
                except Exception as e:
                    await conn.execute("ROLLBACK")
                    logger.exception("DB transaction failed in /start handler: %s", e)
                    await message.answer("Sorry, database error during setup. Try again later.")
                    return

            # Check membership for channel/group if configured
            channel_joined = None
            group_joined = None
            if TELEGRAM_CHANNEL_ID:
                channel_joined = await check_membership(bot, TELEGRAM_CHANNEL_ID, message.from_user.id)
            if TELEGRAM_GROUP_ID:
                group_joined = await check_membership(bot, TELEGRAM_GROUP_ID, message.from_user.id)

            # Compose reply
            name = message.from_user.first_name or "friend"
            text = (
                f"Welcome, {name}!\n\n"
                f"Total shops: {totals['total_shops']}\n"
                f"Total products: {totals['total_products']}\n"
                f"Total users: {totals['total_users']}\n"
                f"Orders today: {totals['orders_today']}\n\n"
                "To get full support and ask questions, please join our channel and group:"
            )

            # Buttons
            buttons = []
            if TELEGRAM_CHANNEL_ID:
                label = "Joined channel ✅" if channel_joined is True else "Join our channel"
                channel_link = TELEGRAM_CHANNEL_ID
                # support both @name and full t.me links or numeric id
                if channel_link.startswith("@"):
                    channel_link = f"https://t.me/{channel_link[1:]}"
                elif channel_link.startswith("http"):
                    channel_link = channel_link
                else:
                    channel_link = f"https://t.me/{channel_link}"
                buttons.append([InlineKeyboardButton(text=label, url=channel_link)])

            if TELEGRAM_GROUP_ID:
                label = "Joined group ✅" if group_joined is True else "Join our group"
                group_link = TELEGRAM_GROUP_ID
                if group_link.startswith("@"):
                    group_link = f"https://t.me/{group_link[1:]}"
                elif group_link.startswith("http"):
                    group_link = group_link
                else:
                    group_link = f"https://t.me/{group_link}"
                buttons.append([InlineKeyboardButton(text=label, url=group_link)])

            # Ask question button (callback)
            buttons.append([InlineKeyboardButton(text="Ask a question", callback_data="ASK_QUESTION")])

            keyboard = InlineKeyboardMarkup(inline_keyboard=buttons)

            await message.answer(text, reply_markup=keyboard)

        @dp.callback_query(F.data == "ASK_QUESTION")
        async def ask_question_handler(callback):
            await callback.answer()
            await callback.message.answer("Please send your question — our team will respond soon.")

        @dp.message(Command("add"))
        async def cmd_add(message: Message):
            text = message.text or ""
            title = text.partition(" ")[2].strip()
            if not title:
                return await message.answer("Usage: <code>/add your item text</code>")
            async with pool.acquire() as conn:
                await conn.execute(
                    "INSERT INTO orders (user_id, product_id, quantity) VALUES ($1, $2, $3)",
                    message.from_user.id,
                    None,
                    1,
                )
            await message.answer("➕ Added order placeholder!")

        @dp.message(Command("list"))
        async def cmd_list(message: Message):
            async with pool.acquire() as conn:
                rows = await conn.fetch(
                    "SELECT id, product_id, quantity, created_at FROM orders WHERE user_id=$1 ORDER BY id DESC LIMIT 10",
                    message.from_user.id,
                )
            if not rows:
                return await message.answer("No orders yet. Add one with /add")
            lines = "\n".join(f"{r['id']}. product_id={r['product_id']} qty={r['quantity']}" for r in rows)
            await message.answer(f"🗂️ Your orders:\n{lines}")

        logger.info("Starting polling loop (this will block).")
        
        # Add signal handlers for graceful shutdown
        signal.signal(signal.SIGINT, signal_handler)
        signal.signal(signal.SIGTERM, signal_handler)
        
        # Start polling with error handling
        await dp.start_polling(bot)
        
    except asyncio.CancelledError:
        logger.info("Polling cancelled.")
    except Exception as e:
        logger.exception(f"Polling stopped with exception: {e}")
    finally:
        # Cleanup
        if 'bot' in locals():
            await bot.session.close()
            logger.info("Bot session closed in finally block.")
        if 'pool' in locals():
            await pool.close()
            logger.info("Database pool closed in finally block.")


def main():
    try:
        asyncio.run(_run())
    except KeyboardInterrupt:
        logger.info("Shutdown requested (KeyboardInterrupt).")
    except Exception as e:
        logger.exception(f"Top-level exception in main: {e}")
    finally:
        logger.info("Bot process ended.")


if __name__ == "__main__":
    main()
