# Telegram Bot with PostgreSQL

## Features
- Commands: /start, /add, /list
- Uses aiogram v3 and asyncpg
- PostgreSQL for persistence

## Local Run
```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
export BOT_TOKEN=your-token
export DATABASE_URL=postgres://user:pass@host:5432/dbname
python main.py
```

## Deploy on Railway
1. Push to GitHub
2. Create Railway project, add Postgres plugin
3. Set env vars: BOT_TOKEN, DATABASE_URL
4. Start command: `python main.py`

## Deploy on Render
1. Create Postgres DB
2. Create Worker service
3. Build: `pip install -r requirements.txt`
4. Start: `python main.py`
