import os
import asyncio
import logging
import asyncpg
from aiogram import Bot, Dispatcher, types, F
from aiogram.filters import Command
from aiogram.enums import ParseMode
from aiogram.client.bot import DefaultBotProperties
from aiogram.types import (
    ReplyKeyboardMarkup,
    KeyboardButton,
    InlineKeyboardMarkup,
    InlineKeyboardButton,
)
from dotenv import load_dotenv

# ------------------------------------------------
# Setup logging and environment
# ------------------------------------------------
logging.basicConfig(level=logging.INFO)
load_dotenv()

BOT_TOKEN = os.getenv("BOT_TOKEN")
DATABASE_URL = os.getenv("DATABASE_URL")
TELEGRAM_CHANNEL_ID = os.getenv("TELEGRAM_CHANNEL_ID")
TELEGRAM_GROUP_ID = os.getenv("TELEGRAM_GROUP_ID")

bot = Bot(token=BOT_TOKEN, default=DefaultBotProperties(parse_mode=ParseMode.HTML))
dp = Dispatcher()


# ------------------------------------------------
# Database connection
# ------------------------------------------------
async def init_db():
    pool = await asyncpg.create_pool(DATABASE_URL)
    logging.info("✅ Connected to Railway PostgreSQL database")
    return pool


# ------------------------------------------------
# Helper functions
# ------------------------------------------------
async def upsert_user(pool, user: types.User):
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
            user.model_dump_json(),
        )


async def get_summary(pool):
    async with pool.acquire() as conn:
        shops = await conn.fetchval("SELECT COUNT(*) FROM shops;")
        users = await conn.fetchval("SELECT COUNT(*) FROM users;")
        products = await conn.fetchval("SELECT COUNT(*) FROM products;") if await conn.fetchval("SELECT to_regclass('products')") else 0
        orders_today = await conn.fetchval(
            "SELECT COUNT(*) FROM orders WHERE created_at::date = CURRENT_DATE;"
        ) if await conn.fetchval("SELECT to_regclass('orders')") else 0
    return shops, products, users, orders_today


# ------------------------------------------------
# Persistent keyboard (bottom of chat)
# ------------------------------------------------
main_menu_keyboard = ReplyKeyboardMarkup(
    keyboard=[
        [KeyboardButton(text="📊 User Dashboard")],
    ],
    resize_keyboard=True,
    one_time_keyboard=False,
)


# ------------------------------------------------
# /start Command — Home Menu
# ------------------------------------------------
@dp.message(Command("start"))
async def cmd_start(message: types.Message, pool):
    user = message.from_user
    await upsert_user(pool, user)

    # Welcome
    welcome_text = (
        f"👋 <b>Welcome, {user.first_name or 'friend'}!</b>\n\n"
        "We're glad to have you here.\n"
        "Explore shops, discover new products, and enjoy your shopping experience!"
    )
    await message.answer(welcome_text, reply_markup=main_menu_keyboard)

    # Summary
    shops, products, users, today_orders = await get_summary(pool)
    summary_text = (
        f"🏠 <b>Home Menu</b>\n\n"
        f"🏬 Shops: <b>{shops}</b>\n"
        f"🛍️ Products: <b>{products}</b>\n"
        f"👥 Users: <b>{users}</b>\n"
        f"🧾 Orders Today: <b>{today_orders}</b>\n\n"
        "You can explore more below 👇"
    )

    # Inline buttons
    buttons = []
    if TELEGRAM_CHANNEL_ID:
        buttons.append([InlineKeyboardButton("📢 Channel", url=TELEGRAM_CHANNEL_ID)])
    if TELEGRAM_GROUP_ID:
        buttons.append([InlineKeyboardButton("💬 Group", url=TELEGRAM_GROUP_ID)])
    buttons.append([InlineKeyboardButton("🛒 Start Shopping", callback_data="start_shopping")])

    markup = InlineKeyboardMarkup(inline_keyboard=buttons)
    await message.answer(summary_text, reply_markup=markup)


# ------------------------------------------------
# User Dashboard (from reply keyboard)
# ------------------------------------------------
@dp.message(F.text == "📊 User Dashboard")
async def user_dashboard_message(message: types.Message):
    user = message.from_user

    dashboard_text = (
        f"📊 <b>User Dashboard</b>\n\n"
        f"👋 Hello, <b>{user.first_name or 'friend'}</b>!\n\n"
        "Manage your account and shop here:\n"
        "• Create or view your shop\n"
        "• Update information\n"
        "• Submit for approval\n\n"
        "Choose an option below 👇"
    )

    buttons = [
        [InlineKeyboardButton("🏬 Create My Shop", callback_data="create_shop")],
        [InlineKeyboardButton("📋 View My Shop", callback_data="view_shop")],
        [InlineKeyboardButton("⬅️ Back to Home", callback_data="back_home")],
    ]

    markup = InlineKeyboardMarkup(inline_keyboard=buttons)
    await message.answer(dashboard_text, reply_markup=markup)


# ------------------------------------------------
# Create Shop (basic)
# ------------------------------------------------
@dp.callback_query(F.data == "create_shop")
async def create_shop_callback(callback_query: types.CallbackQuery, pool):
    await callback_query.answer()
    user_id = callback_query.from_user.id

    async with pool.acquire() as conn:
        exists = await conn.fetchval("SELECT id FROM shops WHERE owner_id = $1;", user_id)
        if exists:
            await callback_query.message.answer(
                "⚠️ You already have a shop. Use 'Edit My Shop' to update it."
            )
            return

    await callback_query.message.answer("🏬 Please send your shop name:")

    @dp.message(F.text)
    async def receive_shop_name(message: types.Message):
        shop_name = message.text.strip()
        async with pool.acquire() as conn:
            await conn.execute(
                "INSERT INTO shops (name, owner_id, created_at) VALUES ($1, $2, NOW());",
                shop_name,
                user_id,
            )
        await message.answer(
            f"✅ Shop '<b>{shop_name}</b>' created successfully!",
            parse_mode="HTML",
        )


# ------------------------------------------------
# Start Shopping (Shop Menu)
# ------------------------------------------------
@dp.callback_query(F.data == "start_shopping")
async def start_shopping_callback(callback_query: types.CallbackQuery):
    await callback_query.answer()

    shop_menu_text = (
        "🛍️ <b>Welcome to the Shop Menu!</b>\n\n"
        "Here are some things you can do:\n"
        "• 🏬 Browse all shops\n"
        "• 🔍 Search for products\n"
        "• 💰 Check today’s best deals\n"
        "• 📦 View your orders\n\n"
        "Select an option below to begin 👇"
    )

    buttons = [
        [InlineKeyboardButton("🏬 Browse Shops", callback_data="browse_shops")],
        [InlineKeyboardButton("🔍 Search Products", callback_data="search_products")],
        [InlineKeyboardButton("💰 Best Deals", callback_data="best_deals")],
        [InlineKeyboardButton("⬅️ Back to Home", callback_data="back_home")],
    ]
    markup = InlineKeyboardMarkup(inline_keyboard=buttons)

    await callback_query.message.answer(shop_menu_text, parse_mode="HTML", reply_markup=markup)


# ------------------------------------------------
# Back to Home
# ------------------------------------------------
@dp.callback_query(F.data == "back_home")
async def back_home_callback(callback_query: types.CallbackQuery, pool):
    await callback_query.answer()
    shops, products, users, today_orders = await get_summary(pool)
    summary_text = (
        f"🏠 <b>Home Menu</b>\n\n"
        f"🏬 Shops: <b>{shops}</b>\n"
        f"🛍️ Products: <b>{products}</b>\n"
        f"👥 Users: <b>{users}</b>\n"
        f"🧾 Orders Today: <b>{today_orders}</b>\n\n"
        "You can explore more below 👇"
    )

    buttons = []
    if TELEGRAM_CHANNEL_ID:
        buttons.append([InlineKeyboardButton("📢 Channel", url=TELEGRAM_CHANNEL_ID)])
    if TELEGRAM_GROUP_ID:
        buttons.append([InlineKeyboardButton("💬 Group", url=TELEGRAM_GROUP_ID)])
    buttons.append([InlineKeyboardButton("🛒 Start Shopping", callback_data="start_shopping")])

    markup = InlineKeyboardMarkup(inline_keyboard=buttons)
    await callback_query.message.answer(summary_text, reply_markup=markup)


# ------------------------------------------------
# Run Bot
# ------------------------------------------------
async def main():
    pool = await init_db()
    dp["pool"] = pool

    @dp.update.middleware
    async def db_middleware(handler, event, data):
        data["pool"] = pool
        return await handler(event, data)

    await dp.start_polling(bot)


if __name__ == "__main__":
    try:
        asyncio.run(main())
    except (KeyboardInterrupt, SystemExit):
        logging.info("Bot stopped.")
