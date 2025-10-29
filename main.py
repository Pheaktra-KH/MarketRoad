import os
import asyncio
import logging
import asyncpg
from aiogram import Bot, Dispatcher, types, F
from aiogram.filters import Command
from aiogram.enums import ParseMode
from aiogram.client.bot import DefaultBotProperties
from aiogram.types import (
    InlineKeyboardMarkup,
    InlineKeyboardButton,
    ReplyKeyboardMarkup,
    KeyboardButton,
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
# Database
# ------------------------------------------------
async def init_db():
    pool = await asyncpg.create_pool(DATABASE_URL)
    logging.info("✅ Connected to Railway PostgreSQL database")
    return pool


# ------------------------------------------------
# Helper Functions
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
        has_products = await conn.fetchval("SELECT to_regclass('products');")
        has_orders = await conn.fetchval("SELECT to_regclass('orders');")
        products = await conn.fetchval("SELECT COUNT(*) FROM products;") if has_products else 0
        orders_today = await conn.fetchval(
            "SELECT COUNT(*) FROM orders WHERE created_at::date = CURRENT_DATE;"
        ) if has_orders else 0
    return shops, products, users, orders_today


# ------------------------------------------------
# Persistent Keyboard (visible under chat)
# ------------------------------------------------
shop_keyboard = ReplyKeyboardMarkup(
    keyboard=[
        [
            KeyboardButton(text="🛍️ Shop Menu"),
            KeyboardButton(text="⚙️ User Setting"),
        ]
    ],
    resize_keyboard=True,
    one_time_keyboard=False,
)


# ------------------------------------------------
# /start Command
# ------------------------------------------------
@dp.message(Command("start"))
async def cmd_start(message: types.Message, pool):
    user = message.from_user
    await upsert_user(pool, user)

    welcome_text = (
        f"👋 <b>Welcome, {user.first_name or 'friend'}!</b>\n\n"
        "We're glad to have you here.\n"
        "Explore shops, discover new products, and enjoy your shopping experience!"
    )
    await message.answer(welcome_text)

    shops, products, users, today_orders = await get_summary(pool)
    summary_text = (
        f"📊 <b>Today's Summary</b>\n\n"
        f"🏬 Total Shops: <b>{shops}</b>\n"
        f"🛍️ Products: <b>{products}</b>\n"
        f"👥 Users: <b>{users}</b>\n"
        f"🧾 Orders Today: <b>{today_orders}</b>\n\n"
        "Stay connected or start exploring below 👇"
    )

    buttons = []
    if TELEGRAM_CHANNEL_ID:
        buttons.append([InlineKeyboardButton("📢 Channel", url=TELEGRAM_CHANNEL_ID)])
    if TELEGRAM_GROUP_ID:
        buttons.append([InlineKeyboardButton("💬 Group", url=TELEGRAM_GROUP_ID)])
    buttons.append([InlineKeyboardButton("🛒 Start Shopping", callback_data="start_shopping")])

    markup = InlineKeyboardMarkup(inline_keyboard=buttons)
    await message.answer(summary_text, reply_markup=markup)


# ------------------------------------------------
# Start Shopping (Shop Menu)
# ------------------------------------------------
@dp.callback_query(F.data == "start_shopping")
async def start_shopping_callback(callback_query: types.CallbackQuery):
    await callback_query.answer()

    shop_menu_text = (
        "🎁 <b>Welcome to the Shop Menu!</b>\n\n"
        "Here are some things you can do:\n"
        "• 🏬 Browse all shops\n"
        "• 🔍 Search for products\n"
        "• 💰 Check today’s best deals\n"
        "• 📦 View your orders\n\n"
        "Select an option below 👇"
    )

    buttons = [
        [InlineKeyboardButton("🏬 Browse Shops", callback_data="browse_shops")],
        [InlineKeyboardButton("🔍 Search Products", callback_data="search_products")],
        [InlineKeyboardButton("💰 Best Deals", callback_data="best_deals")],
        [InlineKeyboardButton("⬅️ Back to Home", callback_data="back_home")],
    ]
    markup = InlineKeyboardMarkup(inline_keyboard=buttons)

    await callback_query.message.answer(shop_menu_text, reply_markup=markup)
    await callback_query.message.answer("🛍️ Choose your next step below:", reply_markup=shop_keyboard)


# ------------------------------------------------
# Shop Menu Button (from reply keyboard)
# ------------------------------------------------
@dp.message(F.text == "🛍️ Shop Menu")
async def shop_menu_from_keyboard(message: types.Message):
    buttons = [
        [InlineKeyboardButton("🏬 Browse Shops", callback_data="browse_shops")],
        [InlineKeyboardButton("🔍 Search Products", callback_data="search_products")],
        [InlineKeyboardButton("💰 Best Deals", callback_data="best_deals")],
        [InlineKeyboardButton("⬅️ Back to Home", callback_data="back_home")],
    ]
    markup = InlineKeyboardMarkup(inline_keyboard=buttons)
    await message.answer("🛍️ <b>Main Shop Menu</b>\nSelect an option below 👇", parse_mode="HTML", reply_markup=markup)


# ------------------------------------------------
# User Setting / Dashboard (from reply keyboard)
# ------------------------------------------------
@dp.message(F.text == "⚙️ User Setting")
async def user_setting_dashboard(message: types.Message):
    user = message.from_user
    text = (
        f"⚙️ <b>User Dashboard</b>\n\n"
        f"👋 Hello, <b>{user.first_name or 'friend'}</b>!\n\n"
        "Manage your shop or account below 👇"
    )

    buttons = [
        [InlineKeyboardButton("🏬 Create My Shop", callback_data="create_shop")],
        [InlineKeyboardButton("📋 View My Shop", callback_data="view_shop")],
        [InlineKeyboardButton("⬅️ Back to Shop Menu", callback_data="start_shopping")],
    ]
    markup = InlineKeyboardMarkup(inline_keyboard=buttons)
    await message.answer(text, reply_markup=markup)


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

    logging.info("🤖 Bot started polling...")
    await dp.start_polling(bot)


if __name__ == "__main__":
    try:
        asyncio.run(main())
    except (KeyboardInterrupt, SystemExit):
        logging.info("Bot stopped.")
