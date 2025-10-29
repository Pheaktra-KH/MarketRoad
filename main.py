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
# Callback: User Dashboard
# ------------------------------------------------
@dp.callback_query(F.data == "user_settings")
async def user_dashboard_callback(callback_query: types.CallbackQuery, pool):
    await callback_query.answer()
    user = callback_query.from_user

    async with pool.acquire() as conn:
        # Fetch user profile info
        user_info = await conn.fetchrow("""
            SELECT first_name, last_name, username, email, phone, country, city, status, created_at
            FROM users
            WHERE telegram_id = $1;
        """, user.id)

        # Fetch order stats
        order_stats = await conn.fetchrow("""
            SELECT COUNT(*) AS total_orders, COALESCE(SUM(total), 0) AS total_spent
            FROM orders
            WHERE user_id = $1;
        """, user.id)

        # Fetch recent orders (last 3)
        recent_orders = await conn.fetch("""
            SELECT o.id, o.total, o.created_at, p.name AS product_name, s.name AS shop_name
            FROM orders o
            LEFT JOIN products p ON o.product_id = p.id
            LEFT JOIN shops s ON p.shop_id = s.id
            WHERE o.user_id = $1
            ORDER BY o.created_at DESC
            LIMIT 3;
        """, user.id)

        # Fetch user-related shop (if owner)
        user_shop = await conn.fetchval("""
            SELECT name FROM shops WHERE owner_id = $1 LIMIT 1;
        """, user.id)

    if not user_info:
        await callback_query.message.answer("⚙️ No user data found. Please use /start again.")
        return

    full_name = f"{user_info['first_name'] or ''} {user_info['last_name'] or ''}".strip()
    user_text = (
        f"👤 <b>User Dashboard</b>\n\n"
        f"🧑 Name: <b>{full_name or 'N/A'}</b>\n"
        f"💬 Username: @{user_info['username'] or 'N/A'}\n"
        f"📧 Email: {user_info['email'] or '-'}\n"
        f"📞 Phone: {user_info['phone'] or '-'}\n"
        f"🌍 Location: {user_info['city'] or '-'}, {user_info['country'] or '-'}\n"
        f"📅 Joined: {user_info['created_at'].strftime('%Y-%m-%d') if user_info['created_at'] else '-'}\n"
        f"🔖 Status: {user_info['status'] or 'active'}\n"
    )

    # Add order summary
    total_orders = order_stats['total_orders'] if order_stats else 0
    total_spent = order_stats['total_spent'] if order_stats else 0
    user_text += (
        f"\n📦 <b>Order Summary</b>\n"
        f"🧾 Total Orders: {total_orders}\n"
        f"💰 Total Spent: ${float(total_spent):,.2f}\n"
    )

    # Add recent orders
    if recent_orders:
        user_text += "\n🕓 <b>Recent Orders</b>\n"
        for order in recent_orders:
            user_text += (
                f"• <b>{order['product_name'] or 'Unknown'}</b> from <i>{order['shop_name'] or 'N/A'}</i>\n"
                f"  💵 ${float(order['total']):,.2f} | 📅 {order['created_at'].strftime('%Y-%m-%d')}\n"
            )
    else:
        user_text += "\n🕓 No recent orders yet.\n"

    # Add shop info (if user is a shop owner)
    if user_shop:
        user_text += f"\n🏪 <b>Your Shop:</b> {user_shop}\n"

    # Dashboard buttons
    buttons = [
        [types.InlineKeyboardButton(text="🧾 View All Orders", callback_data="view_orders")],
        [types.InlineKeyboardButton(text="✏️ Edit Profile", callback_data="edit_profile")],
        [types.InlineKeyboardButton(text="⬅️ Back to Shop Menu", callback_data="start_shopping")]
    ]
    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)

    await callback_query.message.answer(user_text, reply_markup=markup)


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
