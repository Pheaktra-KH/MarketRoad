import os
import asyncio
import asyncpg

from aiogram import Bot, Dispatcher
from aiogram.filters import Command
from aiogram.types import Message
from aiogram.client.bot import DefaultBotProperties

BOT_TOKEN = os.getenv("BOT_TOKEN")
DATABASE_URL = os.getenv("DATABASE_URL")

if not BOT_TOKEN:
    raise RuntimeError("BOT_TOKEN is not set")
if not DATABASE_URL:
    raise RuntimeError("DATABASE_URL is not set")


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


async def main():
    pool = await asyncpg.create_pool(DATABASE_URL, min_size=1, max_size=5)
    await prepare_db(pool)

    # Use DefaultBotProperties to set default parse_mode (aiogram >= 3.7)
    async with Bot(token=BOT_TOKEN, default=DefaultBotProperties(parse_mode="HTML")) as bot:
        dp = Dispatcher()

        @dp.message(Command("start"))
        async def cmd_start(message: Message):
            await message.answer(
                "✅ Bot is up! Try:\n"
                "/add <text> — add an item\n"
                "/list — show your last 10 items"
            )

        @dp.message(Command("add"))
        async def cmd_add(message: Message):
            # safely extract the text after the command
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

        await dp.start_polling(bot)

    await pool.close()


if __name__ == "__main__":
    asyncio.run(main())
