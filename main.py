import os
import asyncio
import logging
import asyncpg
from aiogram import Bot, Dispatcher, types, F
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

print("DEBUG ENV CHECK:")
print("BOT_TOKEN:", bool(BOT_TOKEN))
print("CHANNEL:", TELEGRAM_CHANNEL_ID)
print("GROUP:", TELEGRAM_GROUP_ID)

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
            user.model_dump_json(),
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
# Utility: normalize Telegram links
# ------------------------------------------------
def normalize_tg_link(value: str | None) -> str | None:
    """
    Accepts: '@username', 'https://t.me/username', '-1001234567890'
    Returns a usable https URL or None.
    """
    if not value:
        return None
    v = value.strip()
    if v.startswith("http://") or v.startswith("https://"):
        return v
    if v.startswith("@"):
        return f"https://t.me/{v[1:]}"
    if v.startswith("-100"):
        return None  # Can't convert safely to link
    return f"https://t.me/{v}"


# ------------------------------------------------
# /start command
# ------------------------------------------------
@dp.message(Command("start"))
async def cmd_start(message: types.Message, pool):
    user = message.from_user
    await upsert_user(pool, user)

    # --- First message: welcome ---
    welcome_text = (
        f"👋 <b>Welcome, {user.first_name or 'friend'}!</b>\n\n"
        "We're glad to have you here.\n"
        "Explore shops, discover new products, and enjoy your shopping experience!"
    )
    await message.answer(welcome_text)

    # --- Fetch summary ---
    shops, products, users, today_orders = await get_summary(pool)

    summary_text = (
        f"📊 <b>Today's Summary</b>\n\n"
        f"🏬 Total Shops: <b>{shops}</b>\n"
        f"🛍️ Products: <b>{products}</b>\n"
        f"👥 Users: <b>{users}</b>\n"
        f"🧾 Orders Today: <b>{today_orders}</b>\n\n"
        "Stay connected or start exploring below 👇"
    )

    # --- Build Buttons ---
    channel_link = normalize_tg_link(TELEGRAM_CHANNEL_ID)
    group_link = normalize_tg_link(TELEGRAM_GROUP_ID)

    print("[DEBUG LINKS]")
    print("Raw channel:", TELEGRAM_CHANNEL_ID)
    print("Raw group:", TELEGRAM_GROUP_ID)
    print("Parsed channel link:", channel_link)
    print("Parsed group link:", group_link)

    buttons = []

    # Channel and Group on same row if available
    row = []
    if channel_link:
        row.append(types.InlineKeyboardButton(text="📢 Channel", url=channel_link))
    if group_link:
        row.append(types.InlineKeyboardButton(text="💬 Group", url=group_link))
    if row:
        buttons.append(row)

    # Always add Start Shopping button
    buttons.append([
        types.InlineKeyboardButton(text="🛒 Start Shopping", callback_data="start_shopping")
    ])

    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)
    await message.answer(summary_text, reply_markup=markup)


# ------------------------------------------------
# Callback for "Start Shopping"
# ------------------------------------------------
@dp.callback_query(F.data == "start_shopping")
async def start_shopping_callback(callback_query: types.CallbackQuery):
    await callback_query.answer()  # acknowledge the button press

    shop_menu_text = (
        "🛍️ <b>Welcome to the Shop Menu!</b>\n\n"
        "Here are some things you can do:\n"
        "• 🏬 Browse all shops\n"
        "• 🔍 Search for products\n"
        "• 💰 Check today’s best deals\n"
        "• 🧾 View your orders\n\n"
        "Select an option below to begin 👇"
    )

    # Add placeholder buttons for now
    buttons = [
        [types.InlineKeyboardButton(text="🏬 Browse Shops", callback_data="browse_shops")],
        [types.InlineKeyboardButton(text="🔍 Search Products", callback_data="search_products")],
        [types.InlineKeyboardButton(text="💰 Best Deals", callback_data="best_deals")],
        [types.InlineKeyboardButton(text="⚙️ User Settings", callback_data="user_settings")],
        [types.InlineKeyboardButton(text="⬅️ Back to Home", callback_data="back_home")]
    ]

    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)

    await callback_query.message.answer(shop_menu_text, reply_markup=markup)

@dp.callback_query(F.data == "back_home")
async def back_home_callback(callback_query: types.CallbackQuery, pool):
    await callback_query.answer()
    user = callback_query.from_user

    shops, products, users, today_orders = await get_summary(pool)
    summary_text = (
        f"🏠 <b>Home Menu</b>\n\n"
        f"🏬 Shops: <b>{shops}</b>\n"
        f"🛍️ Products: <b>{products}</b>\n"
        f"👥 Users: <b>{users}</b>\n"
        f"🧾 Orders Today: <b>{today_orders}</b>\n\n"
        "You can explore more below 👇"
    )

    # Reuse same main buttons
    channel_link = TELEGRAM_CHANNEL_ID
    group_link = TELEGRAM_GROUP_ID

    buttons = []
    row = []
    if channel_link:
        row.append(types.InlineKeyboardButton(text="📢 Channel", url=channel_link))
    if group_link:
        row.append(types.InlineKeyboardButton(text="💬 Group", url=group_link))
    if row:
        buttons.append(row)

    buttons.append([
        types.InlineKeyboardButton(text="🛒 Start Shopping", callback_data="start_shopping")
    ])

    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)

    await callback_query.message.answer(summary_text, reply_markup=markup)

# ------------------------------------------------
# Callback: User Settings
# ------------------------------------------------
@dp.callback_query(F.data == "user_settings")
async def user_settings_callback(callback_query: types.CallbackQuery, pool):
    await callback_query.answer()
    user = callback_query.from_user

    # Fetch stored user info
    async with pool.acquire() as conn:
        record = await conn.fetchrow(
            "SELECT first_name, last_name, username, language_code, country, city, status, created_at "
            "FROM users WHERE telegram_id = $1;",
            user.id
        )

    if not record:
        await callback_query.message.answer("⚙️ No user settings found. Please /start again.")
        return

    profile_text = (
        f"⚙️ <b>User Settings</b>\n\n"
        f"👤 <b>Name:</b> {record['first_name'] or ''} {record['last_name'] or ''}\n"
        f"💬 <b>Username:</b> @{record['username'] or 'N/A'}\n"
        f"🌐 <b>Language:</b> {record['language_code'] or 'unknown'}\n"
        f"📍 <b>Location:</b> {record['city'] or '-'}, {record['country'] or '-'}\n"
        f"📅 <b>Joined:</b> {record['created_at'].strftime('%Y-%m-%d') if record['created_at'] else '-'}\n"
        f"🔖 <b>Status:</b> {record['status'] or 'active'}"
    )

    buttons = [
        [types.InlineKeyboardButton(text="⬅️ Back to Shop Menu", callback_data="start_shopping")]
    ]
    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)
    await callback_query.message.answer(profile_text, reply_markup=markup)


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

    await dp.start_polling(bot)


if __name__ == "__main__":
    try:
        asyncio.run(main())
    except (KeyboardInterrupt, SystemExit):
        logging.info("Bot stopped.")
