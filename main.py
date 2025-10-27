import os
import asyncio
import logging
import asyncpg
from aiogram import Bot, Dispatcher, types
from aiogram.filters import Command
from aiogram.enums import ParseMode
from aiogram.client.bot import DefaultBotProperties
from dotenv import load_dotenv
from datetime import datetime

# ------------------------------------------------
# Setup logging and load environment variables
# ------------------------------------------------
logging.basicConfig(level=logging.INFO)
load_dotenv()

BOT_TOKEN = os.getenv("BOT_TOKEN")
DATABASE_URL = os.getenv("DATABASE_URL")
TELEGRAM_CHANNEL_ID = os.getenv("TELEGRAM_CHANNEL_ID")
TELEGRAM_GROUP_ID = os.getenv("TELEGRAM_GROUP_ID")

# ------------------------------------------------
# Initialize bot and database
# ------------------------------------------------
bot = Bot(token=BOT_TOKEN, default=DefaultBotProperties(parse_mode=ParseMode.HTML))
dp = Dispatcher()


async def init_db():
    """Initialize a PostgreSQL connection pool."""
    pool = await asyncpg.create_pool(DATABASE_URL)
    logging.info("✅ Connected to Railway PostgreSQL database")
    return pool


# ------------------------------------------------
# Helper functions
# ------------------------------------------------
async def upsert_user(pool, user: types.User):
    """Insert or update Telegram user information."""
    async with pool.acquire() as conn:
        await conn.execute(
            """
            INSERT INTO users (telegram_id, first_name, last_name, username, language_code, raw, created_at, updated_at)
            VALUES ($1, $2, $3, $4, $5, $6::jsonb, NOW(), NOW())
            ON CONFLICT (telegram_id)
            DO UPDATE SET
                first_name = EXCLUDED.first_name,
                last_name = EXCLUDED.last_name,
                username = EXCLUDED.username,
                language_code = EXCLUDED.language_code,
                raw = EXCLUDED.raw,
                updated_at = NOW();
            """,
            user.id,
            user.first_name,
            user.last_name,
            user.username,
            getattr(user, "language_code", "unknown"),
            user.model_dump_json(),   # ✅ fixed here
        )


async def get_summary(pool):
    """Fetch total counts from key tables."""
    async with pool.acquire() as conn:
        shop_count = await conn.fetchval("SELECT COUNT(*) FROM shops;") if await conn.fetchval("SELECT to_regclass('shops')") else 0
        product_count = await conn.fetchval("SELECT COUNT(*) FROM products;") if await conn.fetchval("SELECT to_regclass('products')") else 0
        user_count = await conn.fetchval("SELECT COUNT(*) FROM users;") if await conn.fetchval("SELECT to_regclass('users')") else 0
        order_count = await conn.fetchval("""
            SELECT COUNT(*) FROM orders
            WHERE created_at::date = CURRENT_DATE;
        """) if await conn.fetchval("SELECT to_regclass('orders')") else 0

    return shop_count, product_count, user_count, order_count


# ------------------------------------------------
# /start command
# ------------------------------------------------
@dp.message(Command("start"))
async def cmd_start(message: types.Message, pool):
    user = message.from_user

    # Save or update user in DB
    await upsert_user(pool, user)

    # Fetch totals
    shops, products, users, today_orders = await get_summary(pool)

    # Compose welcome message
    welcome_text = (
        f"👋 <b>Welcome, {user.first_name}!</b>\n\n"
        f"📦 Total Shops: <b>{shops}</b>\n"
        f"🛍️ Products: <b>{products}</b>\n"
        f"👥 Users: <b>{users}</b>\n"
        f"🧾 Orders Today: <b>{today_orders}</b>\n\n"
        f"🔗 Join our community:\n"
        f"• Channel: {TELEGRAM_CHANNEL_ID or 'N/A'}\n"
        f"• Group: {TELEGRAM_GROUP_ID or 'N/A'}"
    )

    await message.answer(welcome_text)


# ------------------------------------------------
# Run bot
# ------------------------------------------------
async def main():
    pool = await init_db()
    dp["pool"] = pool

    # Middleware to inject pool into handlers
    @dp.update.middleware
    async def db_middleware(handler, event, data):
        data["pool"] = pool
        return await handler(event, data)

    # ✅ simplified for Aiogram v3
    await dp.start_polling(bot)

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except (KeyboardInterrupt, SystemExit):
        logging.info("Bot stopped.")
