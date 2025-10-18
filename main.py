import os
import asyncio
import logging
import asyncpg
from aiogram import Bot, Dispatcher
from aiogram.filters import Command
from aiogram.types import Message
from aiogram.client.bot import DefaultBotProperties

logging.basicConfig(level=logging.INFO, format="%(asctime)s [%(levelname)s] %(message)s")
logger = logging.getLogger(__name__)

BOT_TOKEN = os.getenv("BOT_TOKEN")
DATABASE_URL = os.getenv("DATABASE_URL")


async def prepare_db(pool):
    async with pool.acquire() as conn:
        await conn.execute(
            """
            CREATE TABLE IF NOT EXISTS items (
                id SERIAL PRIMARY KEY,
                user_id BIGINT NOT NULL,
                title TEXT NOT NULL,
                created_at TIMESTAMPTZ DEFAULT NOW()
            );
            """
        )


async def _run():
    if not BOT_TOKEN:
        logger.error("BOT_TOKEN is not set. Set the BOT_TOKEN environment variable.")
        return
    if not DATABASE_URL:
        logger.error("DATABASE_URL is not set. Set the DATABASE_URL environment variable.")
        return

    logger.info("Creating database pool...")
    try:
        pool = await asyncpg.create_pool(DATABASE_URL, min_size=1, max_size=5)
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
        async with Bot(token=BOT_TOKEN, default=DefaultBotProperties(parse_mode="HTML")) as bot:
            logger.info("Bot client created, deleting webhook (if any) and starting dispatcher...")

            # IMPORTANT: remove webhook before polling to avoid TelegramConflictError
            try:
                await bot.delete_webhook(drop_pending_updates=True)
                logger.info("Webhook deleted (if existed).")
            except Exception:
                logger.exception("Error deleting webhook (continuing to polling)")

            dp = Dispatcher()

            @dp.message(Command("start"))
            async def cmd_start(message: Message):
                # Use <code> for the 'text' placeholder so HTML parse_mode does not treat '<text>' as an invalid tag
                await message.answer(
                    "✅ Bot is up! Try:\n"
                    "/add <code>text</code> — add an item\n"
                    "/list — show your last 10 items"
                )

            @dp.message(Command("add"))
            async def cmd_add(message: Message):
                text = message.text or ""
                title = text.partition(" ")[2].strip()
                if not title:
                    return await message.answer("Usage: <code>/add your item text</code>")
                async with pool.acquire() as conn:
                    await conn.execute(
                        "INSERT INTO items (user_id, title) VALUES ($1, $2)",
                        message.from_user.id,
                        title,
                    )
                await message.answer("➕ Added!")

            @dp.message(Command("list"))
            async def cmd_list(message: Message):
                async with pool.acquire() as conn:
                    rows = await conn.fetch(
                        "SELECT id, title, created_at FROM items WHERE user_id=$1 ORDER BY id DESC LIMIT 10",
                        message.from_user.id,
                    )
                if not rows:
                    return await message.answer("No items yet. Add one with /add")
                lines = "\n".join(f"{r['id']}. {r['title']}" for r in rows)
                await message.answer(f"🗂️ Your items:\n{lines}")

            logger.info("Starting polling loop (this will block).")
            try:
                await dp.start_polling(bot)
            except Exception:
                logger.exception("Polling stopped with an exception.")
    except Exception:
        logger.exception("Failed to initialize Bot (check BOT_TOKEN and aiogram version).")
    finally:
        logger.info("Closing database pool...")
        try:
            await pool.close()
        except Exception:
            logger.exception("Error closing database pool.")


def main():
    try:
        asyncio.run(_run())
    except KeyboardInterrupt:
        logger.info("Shutdown requested (KeyboardInterrupt).")
    except Exception:
        logger.exception("Top-level exception in main.")


if __name__ == "__main__":
    main()
