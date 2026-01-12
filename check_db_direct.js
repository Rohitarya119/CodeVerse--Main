const { Client } = require('./server/node_modules/pg');

const config = {
    host: 'db.vfrqhbhkawmfacjenjiy.supabase.co',
    port: 5432,
    user: 'postgres',
    password: 'D2qCstgRoIp7nrue',
    database: 'postgres',
    ssl: { rejectUnauthorized: false }
};

async function run() {
    console.log('Testing Direct Connection...');
    const client = new Client(config);
    try {
        await client.connect();
        console.log('Connected to Direct DB!');
        const res = await client.query('SELECT count(*) FROM problems');
        console.log('Problem count:', res.rows[0].count);
    } catch (err) {
        console.error('Connection Error:', err);
    } finally {
        await client.end();
    }
}

run();
