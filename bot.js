const { Client } = require('discord.js');
const client = new Client({ intents: 3276799 });

client.once('ready', () => {
    console.log('Pick-Of-Gods-Bot is ready!');
});

client.login(process.env.DISCORD_TOKEN); // Token from .env