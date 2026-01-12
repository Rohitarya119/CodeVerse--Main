const { Client } = require('pg');

const config = {
    host: 'aws-1-ap-southeast-1.pooler.supabase.com',
    port: 5432,
    user: 'postgres.vfrqhbhkawmfacjenjiy',
    password: 'D2qCstgRoIp7nrue',
    database: 'postgres',
    ssl: { rejectUnauthorized: false }
};

async function checkTestCases() {
    const client = new Client(config);
    await client.connect();

    try {
        const res = await client.query(`
            SELECT p.title, tc.input, tc.expected_output, p.function_name 
            FROM test_cases tc 
            JOIN problems p ON tc.problem_id = p.id 
            LIMIT 5
        `);

        console.log("🔍 Sample Test Cases:");
        res.rows.forEach(row => {
            console.log(`\nProblem: ${row.title}`);
            console.log(`Function: ${row.function_name}`);
            console.log(`Input (Type: ${typeof row.input}): ${row.input}`);
            console.log(`Expected Output (Type: ${typeof row.expected_output}): ${row.expected_output}`);
        });

    } catch (err) {
        console.error(err);
    } finally {
        await client.end();
    }
}

checkTestCases();
