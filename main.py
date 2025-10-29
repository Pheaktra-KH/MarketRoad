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
# Setup logging and environment
# ------------------------------------------------
logging.basicConfig(level=logging.INFO)
load_dotenv()

BOT_TOKEN = os.getenv("BOT_TOKEN")
DATABASE_URL = os.getenv("DATABASE_URL")
TELEGRAM_CHANNEL_ID = os.getenv("TELEGRAM_CHANNEL_ID")
TELEGRAM_GROUP_ID = os.getenv("TELEGRAM_GROUP_ID")

# ------------------------------------------------
# Initialize bot and dispatcher
# ------------------------------------------------
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
            '''
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
            ''',
            user.id, user.first_name, user.last_name, user.username, getattr(user, 'language_code', 'unknown'), user.model_dump_json()
        )

async def get_summary(pool):
    async with pool.acquire() as conn:
        shop_count = await conn.fetchval("SELECT COUNT(*) FROM shops;") if await conn.fetchval("SELECT to_regclass('shops')") else 0
        product_count = await conn.fetchval("SELECT COUNT(*) FROM products;") if await conn.fetchval("SELECT to_regclass('products')") else 0
        user_count = await conn.fetchval("SELECT COUNT(*) FROM users;") if await conn.fetchval("SELECT to_regclass('users')") else 0
        order_count = await conn.fetchval("SELECT COUNT(*) FROM orders WHERE created_at::date = CURRENT_DATE;") if await conn.fetchval("SELECT to_regclass('orders')") else 0
    return shop_count, product_count, user_count, order_count

def normalize_tg_link(value: str | None) -> str | None:
    if not value:
        return None
    v = value.strip()
    if v.startswith("http://") or v.startswith("https://"):
        return v
    if v.startswith("@"):
        return f"https://t.me/{v[1:]}"
    if v.startswith("-100"):
        return None
    return f"https://t.me/{v}"

# ------------------------------------------------
# /start command
# ------------------------------------------------
@dp.message(Command("start"))
async def cmd_start(message: types.Message, pool):
    user = message.from_user
    await upsert_user(pool, user)

    welcome_text = f"👋 <b>Welcome, {user.first_name or 'friend'}!</b>\n\nExplore shops, discover new products, and enjoy shopping!"
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

    channel_link = normalize_tg_link(TELEGRAM_CHANNEL_ID)
    group_link = normalize_tg_link(TELEGRAM_GROUP_ID)

    buttons = []
    row = []
    if channel_link:
        row.append(types.InlineKeyboardButton("📢 Channel", url=channel_link))
    if group_link:
        row.append(types.InlineKeyboardButton("💬 Group", url=group_link))
    if row:
        buttons.append(row)
    buttons.append([types.InlineKeyboardButton("🛒 Start Shopping", callback_data="start_shopping")])

    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)
    await message.answer(summary_text, reply_markup=markup)

# ------------------------------------------------
# Callback: Start Shopping
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
        "• ⚙️ Access your user dashboard\n"
        "• 🧾 View your orders\n\n"
        "Select an option below to begin 👇"
    )

    buttons = [
        [types.InlineKeyboardButton("🏬 Browse Shops", callback_data="browse_shops")],
        [types.InlineKeyboardButton("🔍 Search Products", callback_data="search_products")],
        [types.InlineKeyboardButton("💰 Best Deals", callback_data="best_deals")],
        [types.InlineKeyboardButton("⚙️ User Dashboard", callback_data="user_settings")],
        [types.InlineKeyboardButton("⬅️ Back to Home", callback_data="back_home")]
    ]
    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)
    await callback_query.message.answer(shop_menu_text, reply_markup=markup)

# ------------------------------------------------
# Callback: Back to Home Menu
# ------------------------------------------------
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

    channel_link = normalize_tg_link(TELEGRAM_CHANNEL_ID)
    group_link = normalize_tg_link(TELEGRAM_GROUP_ID)

    buttons = []
    row = []
    if channel_link:
        row.append(types.InlineKeyboardButton("📢 Channel", url=channel_link))
    if group_link:
        row.append(types.InlineKeyboardButton("💬 Group", url=group_link))
    if row:
        buttons.append(row)
    buttons.append([types.InlineKeyboardButton("🛒 Start Shopping", callback_data="start_shopping")])

    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)
    await callback_query.message.answer(summary_text, reply_markup=markup)

# ------------------------------------------------
# Callback: User Dashboard (Advanced)
# ------------------------------------------------
@dp.callback_query(F.data == "user_settings")
async def user_dashboard_callback(callback_query: types.CallbackQuery, pool):
    await callback_query.answer()
    user = callback_query.from_user

    async with pool.acquire() as conn:
        user_info = await conn.fetchrow("SELECT first_name, last_name, username, email, phone, country, city, status, created_at FROM users WHERE telegram_id=$1;", user.id)
        order_stats = await conn.fetchrow("SELECT COUNT(*) AS total_orders, COALESCE(SUM(total),0) AS total_spent FROM orders WHERE user_id=$1;", user.id)
        recent_orders = await conn.fetch("SELECT o.id,o.total,o.created_at,p.name AS product_name,s.name AS shop_name FROM orders o LEFT JOIN products p ON o.product_id=p.id LEFT JOIN shops s ON p.shop_id=s.id WHERE o.user_id=$1 ORDER BY o.created_at DESC LIMIT 3;", user.id)
        user_shop = await conn.fetchval("SELECT name FROM shops WHERE owner_id=$1 LIMIT 1;", user.id)

    if not user_info:
        await callback_query.message.answer("⚙️ No user data found. Please /start again.")
        return

    full_name = f"{user_info['first_name'] or ''} {user_info['last_name'] or ''}".strip()
    user_text = (
        f"👤 <b>User Dashboard</b>\n\n"
        f"🧑 Name: {full_name or 'N/A'}\n"
        f"💬 Username: @{user_info['username'] or 'N/A'}\n"
        f"📧 Email: {user_info['email'] or '-'}\n"
        f"📞 Phone: {user_info['phone'] or '-'}\n"
        f"🌍 Location: {user_info['city'] or '-'}, {user_info['country'] or '-'}\n"
        f"📅 Joined: {user_info['created_at'].strftime('%Y-%m-%d') if user_info['created_at'] else '-'}\n"
        f"🔖 Status: {user_info['status'] or 'active'}\n"
    )

    total_orders = order_stats['total_orders'] if order_stats else 0
    total_spent = order_stats['total_spent'] if order_stats else 0
    user_text += f"\n📦 <b>Order Summary</b>\n🧾 Total Orders: {total_orders}\n💰 Total Spent: ${float(total_spent):,.2f}\n"

    if recent_orders:
        user_text += "\n🕓 <b>Recent Orders</b>\n"
        for o in recent_orders:
            user_text += f"• {o['product_name']} from {o['shop_name']} — ${float(o['total']):,.2f} ({o['created_at'].strftime('%Y-%m-%d')})\n"
    else:
        user_text += "\n🕓 No recent orders yet.\n"

    if user_shop:
        user_text += f"\n🏪 Your Shop: {user_shop}\n"

    buttons = [
        [types.InlineKeyboardButton("🧾 View All Orders", callback_data="view_orders")],
        [types.InlineKeyboardButton("📊 View Spending Stats", callback_data="view_stats")],
        [types.InlineKeyboardButton("✏️ Edit Profile", callback_data="edit_profile")],
        [types.InlineKeyboardButton("⬅️ Back to Shop Menu", callback_data="start_shopping")]
    ]
    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)
    await callback_query.message.answer(user_text, reply_markup=markup)

# ------------------------------------------------
# View Orders (Paginated)
# ------------------------------------------------
@dp.callback_query(F.data.startswith("view_orders"))
async def view_orders_callback(callback_query: types.CallbackQuery, pool):
    await callback_query.answer()
    user_id = callback_query.from_user.id
    parts = callback_query.data.split(":")
    page = int(parts[1]) if len(parts) > 1 else 1
    limit, offset = 5, (page - 1) * 5

    async with pool.acquire() as conn:
        total = await conn.fetchval("SELECT COUNT(*) FROM orders WHERE user_id=$1;", user_id)
        orders = await conn.fetch("SELECT o.id,o.total,o.created_at,p.name AS product_name,s.name AS shop_name FROM orders o LEFT JOIN products p ON o.product_id=p.id LEFT JOIN shops s ON p.shop_id=s.id WHERE o.user_id=$1 ORDER BY o.created_at DESC LIMIT $2 OFFSET $3;", user_id, limit, offset)

    if not orders:
        await callback_query.message.answer("🧾 You don’t have any orders yet.")
        return

    pages = (total + limit - 1) // limit
    text = "<b>🧾 Your Orders</b>\n\n"
    for o in orders:
        text += f"• {o['product_name']} ({o['shop_name']}) — ${float(o['total']):,.2f} | {o['created_at'].strftime('%Y-%m-%d')}\n"

    buttons = []
    if page > 1:
        buttons.append(types.InlineKeyboardButton("⬅️ Prev", callback_data=f"view_orders:{page-1}"))
    if page < pages:
        buttons.append(types.InlineKeyboardButton("➡️ Next", callback_data=f"view_orders:{page+1}"))

    nav = [buttons] if buttons else []
    nav.append([types.InlineKeyboardButton("⬅️ Back to Dashboard", callback_data="user_settings")])
    markup = types.InlineKeyboardMarkup(inline_keyboard=nav)
    await callback_query.message.answer(text, reply_markup=markup)

# ------------------------------------------------
# Edit Profile + Update Handler
# ------------------------------------------------
pending_updates = {}

@dp.callback_query(F.data == "edit_profile")
async def edit_profile_menu(callback_query: types.CallbackQuery):
    await callback_query.answer()
    text = "✏️ <b>Edit Your Profile</b>\nChoose what to update:"
    buttons = [
        [types.InlineKeyboardButton("📞 Phone", callback_data="edit_field:phone")],
        [types.InlineKeyboardButton("📧 Email", callback_data="edit_field:email")],
        [types.InlineKeyboardButton("🏙️ City", callback_data="edit_field:city")],
        [types.InlineKeyboardButton("🌐 Language", callback_data="edit_field:language")],
        [types.InlineKeyboardButton("⬅️ Back to Dashboard", callback_data="user_settings")]
    ]
    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)
    await callback_query.message.answer(text, reply_markup=markup)

@dp.callback_query(F.data.startswith("edit_field:"))
async def edit_field_callback(callback_query: types.CallbackQuery):
    await callback_query.answer()
    field = callback_query.data.split(":")[1]
    user_id = callback_query.from_user.id
    pending_updates[user_id] = field
    await callback_query.message.answer(f"Please send your new value for {field}:")

@dp.message(F.text)
async def update_field_handler(message: types.Message, pool):
    user_id = message.from_user.id
    if user_id not in pending_updates:
        return
    field = pending_updates[user_id]
    new_value = message.text.strip()

    async with pool.acquire() as conn:
        await conn.execute(f"UPDATE users SET {field}=$1, updated_at=NOW() WHERE telegram_id=$2;", new_value, user_id)

    del pending_updates[user_id]
    buttons = [[types.InlineKeyboardButton("⬅️ Back to Dashboard", callback_data="user_settings")]]
    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)
    await message.answer(f"✅ Your {field} has been updated successfully.", reply_markup=markup)

# ------------------------------------------------
# Spending Analytics
# ------------------------------------------------
@dp.callback_query(F.data == "view_stats")
async def view_stats_callback(callback_query: types.CallbackQuery, pool):
    await callback_query.answer()
    user_id = callback_query.from_user.id

    async with pool.acquire() as conn:
        stats = await conn.fetchrow("SELECT COUNT(*) AS total_orders, COALESCE(SUM(total),0) AS total_spent, COALESCE(AVG(total),0) AS avg_value FROM orders WHERE user_id=$1;", user_id)
        top_shops = await conn.fetch("SELECT s.name, SUM(o.total) AS spent FROM orders o JOIN products p ON o.product_id=p.id JOIN shops s ON p.shop_id=s.id WHERE o.user_id=$1 GROUP BY s.name ORDER BY spent DESC LIMIT 3;", user_id)

    text = (
        f"📊 <b>Spending Analytics</b>\n\n"
        f"🧾 Total Orders: {stats['total_orders']}\n"
        f"💰 Total Spent: ${float(stats['total_spent']):,.2f}\n"
        f"📈 Avg Order Value: ${float(stats['avg_value']):,.2f}\n\n"
    )

    if top_shops:
        text += "🏪 <b>Top Shops</b>\n"
        for shop in top_shops:
            bar = '▓' * int(min(shop['spent'] / (stats['total_spent'] or 1) * 10, 10))
            text += f"{shop['name']:<15} {bar} ${float(shop['spent']):,.2f}\n"
    else:
        text += "No shop data yet.\n"

    buttons = [[types.InlineKeyboardButton("⬅️ Back to Dashboard", callback_data="user_settings")]]
    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)
    await callback_query.message.answer(text, reply_markup=markup)

# ------------------------------------------------
# Run Bot
# ------------------------------------------------
async def main():
    pool = await init_db()
    dp['pool'] = pool

    @dp.update.middleware
    async def db_middleware(handler, event, data):
        data['pool'] = pool
        return await handler(event, data)

    await dp.start_polling(bot)

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except (KeyboardInterrupt, SystemExit):
        logging.info("Bot stopped.")
