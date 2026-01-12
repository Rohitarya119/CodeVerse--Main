const fs = require('fs');
const path = require('path');
const { Client } = require('pg');

const config = {
    host: 'aws-1-ap-southeast-1.pooler.supabase.com',
    port: 5432,
    user: 'postgres.vfrqhbhkawmfacjenjiy',
    password: 'D2qCstgRoIp7nrue',
    database: 'postgres',
    ssl: { rejectUnauthorized: false }
};

const COMPANIES = [
    'Google', 'Amazon', 'Facebook', 'Microsoft', 'Apple', 'Netflix', 'Uber', 'Airbnb',
    'LinkedIn', 'Twitter', 'Salesforce', 'Adobe', 'Oracle', 'IBM', 'Intel', 'Cisco',
    'Spotify', 'ByteDance', 'Goldman Sachs', 'Morgan Stanley', 'JPMorgan', 'Bloomberg',
    'Walmart', 'Target', 'Tesla', 'SpaceX', 'Nvidia', 'AMD', 'Shopify', 'Stripe'
];

function getRandomCompanies(difficulty) {
    const num = Math.floor(Math.random() * 4) + 1; // 1 to 4 companies
    const shuffled = COMPANIES.sort(() => 0.5 - Math.random());
    return shuffled.slice(0, num);
}

function getRandomFrequency() {
    return Math.floor(Math.random() * 100) + 1;
}

function getRandomLikes() {
    return Math.floor(Math.random() * 5000) + 10;
}

function getRandomDislikes(likes) {
    return Math.floor(likes * (Math.random() * 0.2)); // Dislikes are usually lower
}

async function run() {
    console.log("🚀 Starting Industry-Level Database Population...");

    // 1. Gather all questions
    let allQuestions = [];
    for (let i = 1; i <= 62; i++) {
        try {
            const part = require(`./questions_part${i}`);
            if (Array.isArray(part)) {
                allQuestions = allQuestions.concat(part);
            }
        } catch (e) {
            console.warn(`⚠️ Could not load questions_part${i}.js: ${e.message}`);
        }
    }
    console.log(`📦 Loaded ${allQuestions.length} questions.`);

    // 2. Generate SQL
    console.log("📝 Generating optimized SQL...");
    let sql = `-- CodeVerse Industry Data Population
-- Generated: ${new Date().toISOString()}

-- Clean up conflicting data first
DO $$ 
DECLARE
    r RECORD;
BEGIN 
    -- Delete questions that we are about to re-insert (by title)
    DELETE FROM test_cases WHERE problem_id IN (SELECT id FROM problems WHERE title IN (
        ${allQuestions.map(q => `'${q.title.replace(/'/g, "''")}'`).join(', ')}
    ));
    DELETE FROM user_solved_problem WHERE problem_id IN (SELECT id FROM problems WHERE title IN (
        ${allQuestions.map(q => `'${q.title.replace(/'/g, "''")}'`).join(', ')}
    ));
    DELETE FROM problems WHERE title IN (
        ${allQuestions.map(q => `'${q.title.replace(/'/g, "''")}'`).join(', ')}
    );
END $$;

`;

    // Process questions in chunks to avoid massive transaction blocks
    const seenTitles = new Set();

    // We'll wrap each insert in a DO block to handle ID retrieval and test case insertion atomically
    allQuestions.forEach((q, index) => {
        if (!q.title || seenTitles.has(q.title)) return;
        seenTitles.add(q.title);

        const title = q.title.replace(/'/g, "''");
        // Fix for long descriptions that might break things or look bad
        const description = (q.description || "").replace(/'/g, "''");

        let difficulty = q.difficulty ? q.difficulty.toUpperCase() : "MEDIUM";
        // Normalize difficulty
        if (!['EASY', 'MEDIUM', 'HARD'].includes(difficulty)) difficulty = 'MEDIUM';

        // Ensure topics is an array and valid JSON
        let topics = q.topics || [];
        if (typeof topics === 'string') {
            try { topics = JSON.parse(topics); } catch (e) { topics = []; }
        }

        // Enrich data
        const companies = getRandomCompanies(difficulty);
        const frequency = getRandomFrequency();
        const likes = getRandomLikes();
        const dislikes = getRandomDislikes(likes);
        const submissions = likes * (Math.floor(Math.random() * 5) + 2);
        const accepted = Math.floor(submissions * (Math.random() * 0.4 + 0.3)); // 30-70% acceptance

        // Format JSON fields
        const jsonTopics = JSON.stringify(topics).replace(/'/g, "''");
        const jsonCompanies = JSON.stringify(companies).replace(/'/g, "''");
        const jsonConstraints = JSON.stringify(q.constraints || []).replace(/'/g, "''");
        const jsonHints = JSON.stringify(q.hints || []).replace(/'/g, "''");
        const jsonBoilerplate = JSON.stringify(q.boilerplate_code || {}).replace(/'/g, "''");
        const jsonExamples = JSON.stringify(q.examples || []).replace(/'/g, "''");
        const funcName = (q.function_name || "solve").replace(/'/g, "''");

        sql += `
DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        '${title}', '${description}', '${difficulty}', '${jsonTopics}'::jsonb, '${jsonCompanies}'::jsonb,
        ${frequency}, ${likes}, ${dislikes}, ${submissions}, ${accepted},
        '${jsonConstraints}'::jsonb, '${jsonHints}'::jsonb, '${jsonBoilerplate}'::jsonb, '${funcName}', '${jsonExamples}'::jsonb, true
    ) RETURNING id INTO p_id;

`;

        if (q.testCases && q.testCases.length > 0) {
            q.testCases.forEach(tc => {
                // Ensure inputs are strings
                let input = tc.input;
                if (typeof input !== 'string') input = JSON.stringify(input);
                input = input.replace(/'/g, "''");

                let output = tc.expectedOutput;
                if (typeof output !== 'string') output = JSON.stringify(output);
                output = output.replace(/'/g, "''");

                sql += `    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '${input}', '${output}');\n`;
            });
        }
        sql += `END $$;\n\n`;
    });

    // Write SQL to file
    fs.writeFileSync('populate_industry_data.sql', sql);
    console.log(`💾 Generated SQL file: populate_industry_data.sql (${(sql.length / 1024 / 1024).toFixed(2)} MB)`);

    // 3. Execute against DB
    console.log("📡 Connecting to Supabase to execute script...");
    const client = new Client(config);
    await client.connect();

    // Execute in chunks of statements because the file might be huge
    const statements = sql.split(/\n\n(?=DO \$\$)/); // Split by DO blocks
    console.log(`🧩 split into ${statements.length} transactions.`);

    let success = 0;
    let failed = 0;

    for (let i = 0; i < statements.length; i++) {
        const stmt = statements[i].trim();
        if (!stmt) continue;

        try {
            await client.query(stmt);
            success++;
            if (i % 50 === 0) process.stdout.write('.');
        } catch (e) {
            failed++;
            console.error(`\n❌ Error in chunk ${i}: ${e.message.substring(0, 100)}...`);
        }
    }

    console.log(`\n\n✅ Population Complete!`);
    console.log(`   Success: ${success}`);
    console.log(`   Failed: ${failed}`);

    // 4. Update stats view
    console.log("🔄 Refreshing materialized views...");
    try {
        await client.query("REFRESH MATERIALIZED VIEW mv_leaderboard");
        await client.query("SELECT update_daily_stats()");
        console.log("   Stats updated.");
    } catch (e) {
        console.log("   (Optional stats update failed, ignoring)");
    }

    await client.end();
}

run().catch(e => console.error(e));
