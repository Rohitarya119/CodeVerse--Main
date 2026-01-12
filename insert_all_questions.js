const { Client } = require('pg');
const fs = require('fs');
const path = require('path');

// Database configuration from .env
const client = new Client({
    host: 'aws-1-ap-southeast-1.pooler.supabase.com',
    port: 5432,
    database: 'postgres',
    user: 'postgres.vfrqhbhkawmfacjenjiy',
    password: 'D2qCstgRoIp7nrue',
    ssl: {
        rejectUnauthorized: false
    }
});

async function loadAllQuestions() {
    const questions = [];

    // Find all question files
    const files = fs.readdirSync('.')
        .filter(f => f.startsWith('questions_part') && f.endsWith('.js'))
        .sort((a, b) => {
            const numA = parseInt(a.match(/\d+/)[0]);
            const numB = parseInt(b.match(/\d+/)[0]);
            return numA - numB;
        });

    console.log(`Found ${files.length} question files`);

    for (const file of files) {
        try {
            const filePath = path.join('.', file);
            const fileQuestions = require(filePath);
            if (Array.isArray(fileQuestions)) {
                questions.push(...fileQuestions);
                console.log(`Loaded ${fileQuestions.length} questions from ${file}`);
            }
        } catch (err) {
            console.error(`Error loading ${file}:`, err.message);
        }
    }

    return questions;
}

async function insertQuestions() {
    try {
        await client.connect();
        console.log('Connected to Supabase database');

        // Check current count
        const countResult = await client.query('SELECT COUNT(*) FROM problems');
        console.log(`Current problem count: ${countResult.rows[0].count}`);

        // Load all questions
        const questions = await loadAllQuestions();
        console.log(`\nTotal questions to insert: ${questions.length}`);

        // Get existing titles to avoid duplicates
        const existingResult = await client.query('SELECT title FROM problems');
        const existingTitles = new Set(existingResult.rows.map(r => r.title));
        console.log(`Existing problems: ${existingTitles.size}`);

        // Filter out duplicates
        const newQuestions = questions.filter(q => !existingTitles.has(q.title));
        console.log(`New questions to insert: ${newQuestions.length}`);

        if (newQuestions.length === 0) {
            console.log('No new questions to insert');
            return;
        }

        // Insert questions
        const insertQuery = `
            INSERT INTO problems (
                title, description, difficulty, topics, constraints, 
                boilerplate_code, function_name, examples, hints,
                submissions, accepted, likes, dislikes
            ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
            ON CONFLICT (title) DO UPDATE SET 
                description = EXCLUDED.description,
                difficulty = EXCLUDED.difficulty,
                topics = EXCLUDED.topics,
                constraints = EXCLUDED.constraints,
                boilerplate_code = EXCLUDED.boilerplate_code,
                function_name = EXCLUDED.function_name,
                examples = EXCLUDED.examples,
                hints = EXCLUDED.hints
            RETURNING id, title
        `;

        let inserted = 0;
        let failed = 0;

        for (const q of newQuestions) {
            try {
                const values = [
                    q.title,
                    q.description,
                    q.difficulty || 'MEDIUM',
                    JSON.stringify(q.topics || []),
                    JSON.stringify(q.constraints || []),
                    JSON.stringify(q.boilerplate_code || {}),
                    q.function_name || '',
                    JSON.stringify(q.examples || []),
                    JSON.stringify(q.hints || []),
                    Math.floor(Math.random() * 1000) + 100, // Random submissions
                    Math.floor(Math.random() * 500) + 50,   // Random accepted
                    Math.floor(Math.random() * 200) + 10,   // Random likes
                    Math.floor(Math.random() * 50)          // Random dislikes
                ];

                const result = await client.query(insertQuery, values);
                const problemId = result.rows[0].id;

                // Insert test cases if available
                if (q.testCases && q.testCases.length > 0) {
                    for (const tc of q.testCases) {
                        await client.query(
                            `INSERT INTO test_cases (problem_id, input, expected_output, is_sample) 
                             VALUES ($1, $2, $3, true)
                             ON CONFLICT DO NOTHING`,
                            [problemId, tc.input, tc.expectedOutput]
                        );
                    }
                }

                inserted++;
                if (inserted % 50 === 0) {
                    console.log(`Inserted ${inserted} questions...`);
                }
            } catch (err) {
                failed++;
                console.error(`Failed to insert "${q.title}": ${err.message}`);
            }
        }

        console.log(`\n✅ Successfully inserted ${inserted} questions`);
        if (failed > 0) {
            console.log(`❌ Failed to insert ${failed} questions`);
        }

        // Verify final count
        const finalCount = await client.query('SELECT COUNT(*) FROM problems');
        console.log(`\nFinal problem count: ${finalCount.rows[0].count}`);

    } catch (err) {
        console.error('Database error:', err);
    } finally {
        await client.end();
        console.log('Disconnected from database');
    }
}

insertQuestions();
