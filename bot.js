// Example Node.js bot using telegraf and node-postgres
// Install: npm i telegraf pg dotenv

require('dotenv').config();
const { Telegraf, Markup } = require('telegraf');
const { Pool } = require('pg');

const BOT_TOKEN = process.env.TELEGRAM_BOT_TOKEN;
const CHANNEL_ID = process.env.TELEGRAM_CHANNEL_ID; // e.g. @yourchannel or -1001234567890
const GROUP_ID = process.env.TELEGRAM_GROUP_ID;     // e.g. @yourgroup or -1001234567890

if (!BOT_TOKEN) {
  console.error('TELEGRAM_BOT_TOKEN not set');
  process.exit(1);
}

const bot = new Telegraf(BOT_TOKEN);
const pool = new Pool({
  connectionString: process.env.DATABASE_URL // or other PG env vars
});

async function upsertTelegramUser(pgClient, from) {
  const userJson = {
    telegram_id: from.id,
    is_bot: from.is_bot,
    first_name: from.first_name || '',
    last_name: from.last_name || '',
    username: from.username || '',
    language_code: from.language_code || ''
  };
  const res = await pgClient.query('SELECT upsert_telegram_user($1::jsonb) AS id', [userJson]);
  return res.rows[0].id;
}

async function getTotals(pgClient) {
  const res = await pgClient.query('SELECT * FROM get_totals()');
  return res.rows[0]; // { total_shops, total_products }
}

async function checkMembership(ctx, chatId, userId) {
  // getChatMember may fail if bot is not admin or chat is not accessible
  try {
    const member = await ctx.telegram.getChatMember(chatId, userId);
    // status can be "left", "kicked", "member", "administrator", "creator"
    return member && member.status && member.status !== 'left' && member.status !== 'kicked';
  } catch (err) {
    // Could be forbidden; return null to indicate unknown
    return null;
  }
}

bot.start(async (ctx) => {
  const from = ctx.from;
  const client = await pool.connect();
  try {
    await client.query('BEGIN');
    const localUserId = await upsertTelegramUser(client, from);
    const totals = await getTotals(client);
    await client.query('COMMIT');

    // Try to check membership (optional)
    const channelJoined = CHANNEL_ID ? await checkMembership(ctx, CHANNEL_ID, from.id) : null;
    const groupJoined = GROUP_ID ? await checkMembership(ctx, GROUP_ID, from.id) : null;

    // Compose message
    let text = `Welcome, ${from.first_name || 'friend'}!\n\n`;
    text += `Total shops: ${totals.total_shops}\n`;
    text += `Total products: ${totals.total_products}\n\n`;
    text += `To get full support and ask questions, please join our channel and group:\n`;

    // Buttons: Open channel/group links or join
    const buttons = [];
    if (CHANNEL_ID) {
      const label = channelJoined === true ? 'Joined channel ✅' : 'Join our channel';
      const channelLink = CHANNEL_ID.startsWith('@') ? `https://t.me/${CHANNEL_ID.slice(1)}` : `https://t.me/${CHANNEL_ID}`;
      buttons.push(Markup.button.url(label, channelLink));
    }
    if (GROUP_ID) {
      const label = groupJoined === true ? 'Joined group ✅' : 'Join our group';
      const groupLink = GROUP_ID.startsWith('@') ? `https://t.me/${GROUP_ID.slice(1)}` : `https://t.me/${GROUP_ID}`;
      buttons.push(Markup.button.url(label, groupLink));
    }

    // Add "Ask a question" quick button
    buttons.push(Markup.button.callback('Ask a question', 'ASK_QUESTION'));

    await ctx.reply(text, Markup.inlineKeyboard(buttons, { columns: 1 }));

  } catch (err) {
    await client.query('ROLLBACK');
    console.error('Error in /start handler', err);
    await ctx.reply('Sorry, something went wrong while setting up your account. Try again later.');
  } finally {
    client.release();
  }
});

bot.action('ASK_QUESTION', async (ctx) => {
  await ctx.answerCbQuery();
  await ctx.reply('Please send your question — our team will respond soon.');
});

bot.launch().then(() => {
  console.log('Bot started');
});

// Graceful stop
process.once('SIGINT', () => bot.stop('SIGINT'));
process.once('SIGTERM', () => bot.stop('SIGTERM'));