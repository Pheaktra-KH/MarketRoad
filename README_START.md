```markdown
Setup steps

1. Create/migrate the database:
   - Run the SQL files against your Postgres database:
     psql $DATABASE_URL -f create_users_shops_products.sql
     psql $DATABASE_URL -f functions.sql

2. Set environment variables (example .env):
   TELEGRAM_BOT_TOKEN=123456:ABC-DEF...
   DATABASE_URL=postgresql://user:pass@host:5432/dbname
   TELEGRAM_CHANNEL_ID=https://t.me/roadshopchannel	# optional
   TELEGRAM_GROUP_ID=https://t.me/roadshopgroup		# optional

3. Install and run the bot:
   npm install
   node bot.js

Notes on membership checking:
- Bots can use getChatMember to inspect membership for groups and channels they can access.
- For channels, the bot generally needs to be an admin or have permission to see members to determine membership reliably.
- If getChatMember returns a permission error, the code sets membership to unknown (null) and shows join links instead.
- Alternative: require user to press "I joined" and have them press a callback that triggers getChatMember verification.

Security:
- Use DB migrations and secrets management in production.
- Sanitize user-provided fields stored on DB; jsonb is used to preserve raw metadata safely.
```