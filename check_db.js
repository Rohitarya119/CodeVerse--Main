const { Client } = require('./server/node_modules/pg');

const config = {
    host: 'aws-1-ap-southeast-1.pooler.supabase.com',
    port: 6543,
    user: 'postgres.vfrqhbhkawmfacjenjiy',
    password: 'D2qCstgRoIp7nrue',
    database: 'postgres',
    ssl: { rejectUnauthorized: false }
};

async function run() {
    const client = new Client(config);
    try {
        await client.connect();
        console.log('Connected to database');

        const res = await client.query('SELECT count(*) FROM problems');
        console.log('Problem count:', res.rows[0].count);

        const res2 = await client.query('SELECT id, title FROM problems LIMIT 5');
        console.log('First 5 problems:', res2.rows);

    } catch (err) {
        console.error('Error:', err);
    } finally {
        await client.end();
    }
}

run();
