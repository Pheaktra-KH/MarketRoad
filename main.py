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
from typing import Union

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
# Reply keyboard (persistent main buttons above the typing field)
# ------------------------------------------------
def get_main_reply_keyboard() -> types.ReplyKeyboardMarkup:
    """
    Returns a ReplyKeyboardMarkup that appears on top of the message input,
    giving quick access to main actions like Start Shopping and Settings.
    """
    kb = types.ReplyKeyboardMarkup(resize_keyboard=True, row_width=2)
    kb.add(types.KeyboardButton("🛒 Start Shopping"), types.KeyboardButton("⚙️ Settings"))
    return kb


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

    # Main actions row: Start Shopping + Settings
    main_row = [
        types.InlineKeyboardButton(text="🛒 Start Shopping", callback_data="start_shopping"),
        types.InlineKeyboardButton(text="⚙️ Settings", callback_data="user_settings")
    ]
    buttons.append(main_row)

    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)
    await message.answer(summary_text, reply_markup=markup)

    # Send persistent reply keyboard so "Settings" appears on top of the typing field
    await message.answer("Quick actions:", reply_markup=get_main_reply_keyboard())


# ------------------------------------------------
# /settings command to open user settings directly
# ------------------------------------------------
@dp.message(Command("settings"))
async def cmd_settings(message: types.Message, pool):
    """Allow users to open their settings directly with /settings."""
    # Reuse the same behaviour as clicking the 'Settings' button
    await user_dashboard_show(message.from_user, message, pool)


# ------------------------------------------------
# Handle main reply keyboard presses (text messages)
# ------------------------------------------------
@dp.message(F.text == "⚙️ Settings")
async def settings_keyboard_handler(message: types.Message, pool):
    """User pressed the persistent 'Settings' reply keyboard button."""
    await user_dashboard_show(message.from_user, message, pool)


@dp.message(F.text == "🛒 Start Shopping")
async def start_shopping_text_handler(message: types.Message):
    """User pressed the persistent 'Start Shopping' reply keyboard button."""
    shop_menu_text = (
        "🛍️ <b>Welcome to the Shop Menu!</b>\n\n"
        "Here are some things you can do:\n"
        "• 🏬 Browse all shops\n"
        "• 🔍 Search for products\n"
        "• 💰 Check today’s best deals\n"
        "• 🧾 View your orders\n\n"
        "Select an option below to begin 👇"
    )

    # Add placeholder buttons for now (include Settings here as navigation)
    buttons = [
        [types.InlineKeyboardButton(text="🏬 Browse Shops", callback_data="browse_shops")],
        [types.InlineKeyboardButton(text="🔍 Search Products", callback_data="search_products")],
        [types.InlineKeyboardButton(text="💰 Best Deals", callback_data="best_deals")],
        [types.InlineKeyboardButton(text="⬅️ Back to Home", callback_data="back_home")]
    ]

    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)
    await message.answer(shop_menu_text, reply_markup=markup)


# ------------------------------------------------
# Shared function to render user dashboard (used by callback and /settings)
# ------------------------------------------------
async def user_dashboard_show(user: types.User, target_message: Union[types.Message, types.CallbackQuery], pool):
    # This function fetches data and sends the dashboard to target_message (which supports .answer/.reply)
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
        # determine how to reply based on message type
        if isinstance(target_message, types.Message):
            await target_message.answer("⚙️ No user data found. Please use /start again.")
        else:
            # target_message is a CallbackQuery
            await target_message.message.reply("⚙️ No user data found. Please use /start again.")
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

    # ➕ FIXED ORDER — add this before building markup
    if user_shop:
        buttons.insert(0, [types.InlineKeyboardButton(text="🏪 Manage My Shop", callback_data="manage_shop")])
    else:
        buttons.insert(0, [types.InlineKeyboardButton(text="🛍️ Create My Shop", callback_data="create_shop")])

    # ✅ Build the markup *after* modifying buttons
    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)

    # send via message or callback query message
    if isinstance(target_message, types.Message):
        await target_message.answer(user_text, reply_markup=markup)
    else:
        await target_message.message.answer(user_text, reply_markup=markup)

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

    # Add placeholder buttons for now (include Settings here as navigation)
    buttons = [
        [types.InlineKeyboardButton(text="🏬 Browse Shops", callback_data="browse_shops")],
        [types.InlineKeyboardButton(text="🔍 Search Products", callback_data="search_products")],
        [types.InlineKeyboardButton(text="💰 Best Deals", callback_data="best_deals")],
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

    # Reuse same main buttons with normalized links
    channel_link = normalize_tg_link(TELEGRAM_CHANNEL_ID)
    group_link = normalize_tg_link(TELEGRAM_GROUP_ID)

    buttons = []
    row = []
    if channel_link:
        row.append(types.InlineKeyboardButton(text="📢 Channel", url=channel_link))
    if group_link:
        row.append(types.InlineKeyboardButton(text="💬 Group", url=group_link))
    if row:
        buttons.append(row)

    # include Start Shopping + Settings
    buttons.append([
        types.InlineKeyboardButton(text="🛒 Start Shopping", callback_data="start_shopping"),
        types.InlineKeyboardButton(text="⚙️ Settings", callback_data="user_settings")
    ])

    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)

    await callback_query.message.answer(summary_text, reply_markup=markup)


# ------------------------------------------------
# Callback: User Dashboard (invoked via button)
# ------------------------------------------------
@dp.callback_query(F.data == "user_settings")
async def user_dashboard_callback(callback_query: types.CallbackQuery, pool):
    await callback_query.answer()
    # reuse the shared rendering function
    await user_dashboard_show(callback_query.from_user, callback_query, pool)


# ------------------------------------------------
# Callback: View Orders (Paginated)
# ------------------------------------------------
@dp.callback_query(F.data.startswith("view_orders"))
async def view_orders_callback(callback_query: types.CallbackQuery, pool):
    await callback_query.answer()
    user_id = callback_query.from_user.id

    # Extract page number (default 1)
    parts = callback_query.data.split(":")
    page = int(parts[1]) if len(parts) > 1 else 1
    limit = 5
    offset = (page - 1) * limit

    async with pool.acquire() as conn:
        total_orders = await conn.fetchval("SELECT COUNT(*) FROM orders WHERE user_id = $1;", user_id)
        orders = await conn.fetch("""
            SELECT o.id, o.total, o.created_at, p.name AS product_name, s.name AS shop_name
            FROM orders o
            LEFT JOIN products p ON o.product_id = p.id
            LEFT JOIN shops s ON p.shop_id = s.id
            WHERE o.user_id = $1
            ORDER BY o.created_at DESC
            LIMIT $2 OFFSET $3;
        """, user_id, limit, offset)

    if not orders:
        await callback_query.message.answer("🧾 You don’t have any orders yet.")
        return

    total_pages = (total_orders + limit - 1) // limit
    text = "<b>🧾 Your Orders</b>\n\n"

    for order in orders:
        text += (
            f"• <b>{order['product_name'] or 'Unknown Product'}</b>\n"
            f"  🏪 {order['shop_name'] or 'N/A'}\n"
            f"  💰 ${float(order['total']):,.2f}\n"
            f"  📅 {order['created_at'].strftime('%Y-%m-%d')}\n\n"
        )

    # Navigation buttons
    buttons = []
    nav_row = []
    if page > 1:
        nav_row.append(types.InlineKeyboardButton("⬅️ Prev", callback_data=f"view_orders:{page-1}"))
    if page < total_pages:
        nav_row.append(types.InlineKeyboardButton("➡️ Next", callback_data=f"view_orders:{page+1}"))

    if nav_row:
        buttons.append(nav_row)

    buttons.append([types.InlineKeyboardButton("⬅️ Back to Dashboard", callback_data="user_settings")])

    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)
    await callback_query.message.answer(text, reply_markup=markup)


# ------------------------------------------------
# Callback: Edit Profile Menu
# ------------------------------------------------
@dp.callback_query(F.data == "edit_profile")
async def edit_profile_menu(callback_query: types.CallbackQuery):
    await callback_query.answer()

    text = (
        "✏️ <b>Edit Your Profile</b>\n\n"
        "Choose what you'd like to update:"
    )

    buttons = [
        [types.InlineKeyboardButton("📞 Phone", callback_data="edit_field:phone")],
        [types.InlineKeyboardButton("📧 Email", callback_data="edit_field:email")],
        [types.InlineKeyboardButton("🏙️ City", callback_data="edit_field:city")],
        [types.InlineKeyboardButton("🌐 Language", callback_data="edit_field:language")],
        [types.InlineKeyboardButton("⬅️ Back to Dashboard", callback_data="user_settings")]
    ]
    markup = types.InlineKeyboardMarkup(inline_keyboard=buttons)
    await callback_query.message.answer(text, reply_markup=markup)


# ------------------------------------------------
# Callback: Handle edit_field:<field> to initiate an update
# ------------------------------------------------
@dp.callback_query(F.data.startswith("edit_field:"))
async def edit_field_callback(callback_query: types.CallbackQuery, pool):
    await callback_query.answer()
    parts = callback_query.data.split(":", 1)
    if len(parts) != 2:
        await callback_query.message.answer("⚠️ Invalid edit request.")
        return

    field = parts[1]
    valid_fields = ["phone", "email", "city", "language"]
    if field not in valid_fields:
        await callback_query.message.answer("⚠️ You cannot edit that field via this bot.")
        return

    user_id = callback_query.from_user.id
    # Store pending field on dispatcher (consistent with dp["pool"] usage).
    # This is a simple approach; in production use per-user storage or a DB-backed state.
    dp["pending_field"] = (user_id, field)

    # Prompt user to send the new value
    prompt = f"✏️ Please send your new {field} now. To cancel, send /cancel."
    await callback_query.message.answer(prompt)


@dp.callback_query(F.data == "create_shop")
async def create_shop_callback(callback_query: types.CallbackQuery, pool):
    await callback_query.answer()
    user_id = callback_query.from_user.id

    # prevent duplicate shops
    async with pool.acquire() as conn:
        exists = await conn.fetchval("SELECT id FROM shops WHERE owner_id = $1 LIMIT 1;", user_id)
    if exists:
        await callback_query.message.answer("ℹ️ You already own a shop. Use “🏪 Manage My Shop”.")
        return

    # init wizard
    set_state(dp, user_id, "shop_wizard", {"step": 1})
    await callback_query.message.answer(
        "🛍️ <b>Create My Shop</b>\n\n"
        "Step 1/3: Send your <b>Shop Name</b>.\n"
        "To cancel at any time, send /cancel."
    )

@dp.callback_query(F.data == "manage_shop")
async def manage_shop_callback(callback_query: types.CallbackQuery, pool):
    await callback_query.answer()
    user_id = callback_query.from_user.id
    async with pool.acquire() as conn:
        shop = await conn.fetchrow("""
            SELECT id, name, status, created_at
            FROM shops
            WHERE owner_id = $1
            ORDER BY id ASC LIMIT 1;
        """, user_id)

    if not shop:
        await callback_query.message.answer("ℹ️ You don’t have a shop yet. Use “🛍️ Create My Shop”.")
        return

    text = (
        f"🏪 <b>{shop['name']}</b> (ID: {shop['id']})\n"
        f"📌 Status: {shop['status']}\n"
        f"📅 Created: {shop['created_at'].strftime('%Y-%m-%d')}\n\n"
        "🧰 Owner tools coming next: add/edit/delete products, view orders, deals, etc."
    )
    buttons = [
        [types.InlineKeyboardButton("➕ Add Product", callback_data="shop_add_product")],
        [types.InlineKeyboardButton("🗂️ My Products", callback_data="shop_products")],
        [types.InlineKeyboardButton("🧾 Shop Orders", callback_data="shop_orders")],
        [types.InlineKeyboardButton("⬅️ Back to Dashboard", callback_data="user_settings")],
    ]
    await callback_query.message.answer(text, reply_markup=types.InlineKeyboardMarkup(inline_keyboard=buttons))

# ------------------------------------------------
# /cancel command to abort pending edits
# ------------------------------------------------
@dp.message(Command("cancel"))
async def cancel_pending(message: types.Message):
    if "pending_field" in dp:
        stored_user_id, _ = dp["pending_field"]
        if stored_user_id == message.from_user.id:
            del dp["pending_field"]
            await message.answer("✅ Edit cancelled.")
            return

    # ➕ ADD: cancel shop wizard too
    if get_state(dp, message.from_user.id, "shop_wizard"):
        del_state(dp, message.from_user.id, "shop_wizard")
        await message.answer("✅ Shop creation cancelled.")
        return

    await message.answer("ℹ️ Nothing to cancel.")

    await message.answer("ℹ️ Nothing to cancel.")


# ------------------------------------------------
# Message Handler: Update Field
# ------------------------------------------------
@dp.message(F.text)
async def update_field_handler(message: types.Message, pool):
    if "pending_field" not in dp:
        return  # not editing

    user_id, field = dp["pending_field"]
    if message.from_user.id != user_id:
        return

    new_value = message.text.strip()
    valid_fields = ["phone", "email", "city", "language"]

    if field not in valid_fields:
        await message.answer("⚠️ Invalid field.")
        return

    async with pool.acquire() as conn:
        await conn.execute(
            f"UPDATE users SET {field} = $1, updated_at = NOW() WHERE telegram_id = $2;",
            new_value, user_id
        )

    del dp["pending_field"]
    await message.answer(f"✅ Your {field} has been updated successfully.")

@dp.message(F.text)
async def shop_wizard_handler(message: types.Message, pool):
    # Only act if user is in shop wizard
    data = get_state(dp, message.from_user.id, "shop_wizard")
    if not data:
        return  # not in this flow

    step = data.get("step", 1)
    text = message.text.strip()

    # STEP 1: Shop Name
    if step == 1:
        if len(text) < 3:
            await message.answer("⚠️ Shop name is too short. Try again (≥ 3 chars).")
            return
        data["name"] = text
        data["step"] = 2
        set_state(dp, message.from_user.id, "shop_wizard", data)
        await message.answer(
            "Step 2/3: Send a short <b>Shop Description</b> (what you sell, highlight, etc.)."
        )
        return

    # STEP 2: Description
    if step == 2:
        data["description"] = text[:500]  # cap length a bit
        data["step"] = 3
        set_state(dp, message.from_user.id, "shop_wizard", data)
        await message.answer(
            "Step 3/3: Send your <b>Bot Token</b> for this shop.\n"
            "Tip: It looks like <code>123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11</code>"
        )
        return

    # STEP 3: Bot Token
    if step == 3:
        bot_token = text
        # minimal validation
        if ":" not in bot_token or len(bot_token) < 25:
            await message.answer("⚠️ That doesn’t look like a valid bot token. Please check and send again.")
            return

        user_id = message.from_user.id

        async with pool.acquire() as conn:
            # insert shop
            shop_id = await conn.fetchval("""
                INSERT INTO shops (name, owner_id, description, status, bot_token, telegram_link, created_at)
                VALUES ($1, $2, $3, 'active', $4, $5, NOW())
                RETURNING id;
            """, data["name"], user_id, data["description"], bot_token, None)

            # promote user role
            await conn.execute("UPDATE users SET role = 'seller', updated_at = NOW() WHERE telegram_id = $1;", user_id)

        # clear state
        del_state(dp, user_id, "shop_wizard")

        # confirm (do NOT echo the token)
        await message.answer(
            "✅ <b>Shop created!</b>\n\n"
            f"🏪 <b>{data['name']}</b>\n"
            f"🆔 Shop ID: <code>{shop_id}</code>\n"
            "👑 You are now a <b>Shop Owner</b>.\n\n"
            "Use “🏪 Manage My Shop” in your dashboard to handle products and orders."
        )


# -----------------------------
# Minimal per-user temp state
# -----------------------------
def _mk_key(user_id: int, name: str) -> str:
    return f"state:{name}:{user_id}"

def set_state(dp, user_id: int, name: str, value):
    dp[_mk_key(user_id, name)] = value

def get_state(dp, user_id: int, name: str, default=None):
    return dp.get(_mk_key(user_id, name), default)

def del_state(dp, user_id: int, name: str):
    dp.pop(_mk_key(user_id, name), None)


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
