const { Client } = require('pg');

const config = {
    host: 'aws-1-ap-southeast-1.pooler.supabase.com',
    port: 5432,
    user: 'postgres.vfrqhbhkawmfacjenjiy',
    password: 'D2qCstgRoIp7nrue',
    database: 'postgres',
    ssl: { rejectUnauthorized: false }
};

async function run() {
    const client = new Client(config);
    await client.connect();
    console.log('Connected to Supabase');

    // Run migrations one by one
    const migrations = [
        // 1. Add audit columns to users
        { name: 'Add created_at to users', sql: `ALTER TABLE users ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT NOW()` },
        { name: 'Add updated_at to users', sql: `ALTER TABLE users ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT NOW()` },
        { name: 'Add avatar_url to users', sql: `ALTER TABLE users ADD COLUMN IF NOT EXISTS avatar_url TEXT` },
        { name: 'Add bio to users', sql: `ALTER TABLE users ADD COLUMN IF NOT EXISTS bio TEXT` },
        { name: 'Add github_url to users', sql: `ALTER TABLE users ADD COLUMN IF NOT EXISTS github_url TEXT` },
        { name: 'Add linkedin_url to users', sql: `ALTER TABLE users ADD COLUMN IF NOT EXISTS linkedin_url TEXT` },
        { name: 'Add is_active to users', sql: `ALTER TABLE users ADD COLUMN IF NOT EXISTS is_active BOOLEAN DEFAULT TRUE` },
        { name: 'Add last_login_at to users', sql: `ALTER TABLE users ADD COLUMN IF NOT EXISTS last_login_at TIMESTAMPTZ` },

        // 2. Add audit columns to problems
        { name: 'Add created_at to problems', sql: `ALTER TABLE problems ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT NOW()` },
        { name: 'Add updated_at to problems', sql: `ALTER TABLE problems ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT NOW()` },
        { name: 'Add is_active to problems', sql: `ALTER TABLE problems ADD COLUMN IF NOT EXISTS is_active BOOLEAN DEFAULT TRUE` },
        { name: 'Add frequency to problems', sql: `ALTER TABLE problems ADD COLUMN IF NOT EXISTS frequency INTEGER DEFAULT 0` },
        { name: 'Add companies to problems', sql: `ALTER TABLE problems ADD COLUMN IF NOT EXISTS companies JSONB DEFAULT '[]'::jsonb` },

        // 3. Create updated_at trigger function
        {
            name: 'Create update_updated_at_column function', sql: `
            CREATE OR REPLACE FUNCTION update_updated_at_column()
            RETURNS TRIGGER AS $body$
            BEGIN
                NEW.updated_at = NOW();
                RETURN NEW;
            END;
            $body$ LANGUAGE plpgsql
        `},

        // 4. Apply triggers
        {
            name: 'Create users_updated_at trigger', sql: `
            DROP TRIGGER IF EXISTS users_updated_at ON users;
            CREATE TRIGGER users_updated_at BEFORE UPDATE ON users
            FOR EACH ROW EXECUTE FUNCTION update_updated_at_column()
        `},
        {
            name: 'Create problems_updated_at trigger', sql: `
            DROP TRIGGER IF EXISTS problems_updated_at ON problems;
            CREATE TRIGGER problems_updated_at BEFORE UPDATE ON problems
            FOR EACH ROW EXECUTE FUNCTION update_updated_at_column()
        `},

        // 5. Additional indexes
        { name: 'Create idx_users_created_at', sql: `CREATE INDEX IF NOT EXISTS idx_users_created_at ON users(created_at DESC)` },
        { name: 'Create idx_users_is_active', sql: `CREATE INDEX IF NOT EXISTS idx_users_is_active ON users(is_active) WHERE is_active = TRUE` },
        { name: 'Create idx_problems_created_at', sql: `CREATE INDEX IF NOT EXISTS idx_problems_created_at ON problems(created_at DESC)` },
        { name: 'Create idx_problems_is_active', sql: `CREATE INDEX IF NOT EXISTS idx_problems_is_active ON problems(is_active) WHERE is_active = TRUE` },
        { name: 'Create idx_problems_frequency', sql: `CREATE INDEX IF NOT EXISTS idx_problems_frequency ON problems(frequency DESC)` },
        { name: 'Create idx_problems_companies', sql: `CREATE INDEX IF NOT EXISTS idx_problems_companies ON problems USING GIN (companies)` },

        // 6. Create views
        {
            name: 'Create v_problem_stats view', sql: `
            CREATE OR REPLACE VIEW v_problem_stats AS
            SELECT 
                p.id, p.title, p.difficulty, p.topics, p.companies, p.submissions, p.accepted,
                CASE WHEN p.submissions > 0 THEN ROUND((p.accepted::DECIMAL / p.submissions) * 100, 1) ELSE 0 END AS acceptance_rate,
                p.frequency, COUNT(DISTINCT usp.user_id) AS total_solvers, p.created_at, p.is_active
            FROM problems p
            LEFT JOIN user_solved_problem usp ON p.id = usp.problem_id
            WHERE p.is_active = TRUE OR p.is_active IS NULL
            GROUP BY p.id, p.title, p.difficulty, p.topics, p.companies, p.submissions, p.accepted, p.frequency, p.created_at, p.is_active
        `},
        {
            name: 'Create v_user_stats view', sql: `
            CREATE OR REPLACE VIEW v_user_stats AS
            SELECT 
                u.id, u.username, u.full_name, u.skill_level, u.avatar_url,
                COUNT(DISTINCT usp.problem_id) AS problems_solved,
                COUNT(DISTINCT CASE WHEN p.difficulty = 'Easy' THEN usp.problem_id END) AS easy_solved,
                COUNT(DISTINCT CASE WHEN p.difficulty = 'Medium' THEN usp.problem_id END) AS medium_solved,
                COUNT(DISTINCT CASE WHEN p.difficulty = 'Hard' THEN usp.problem_id END) AS hard_solved,
                u.created_at, u.last_login_at
            FROM users u
            LEFT JOIN user_solved_problem usp ON u.id = usp.user_id
            LEFT JOIN problems p ON usp.problem_id = p.id
            WHERE u.is_active = TRUE OR u.is_active IS NULL
            GROUP BY u.id, u.username, u.full_name, u.skill_level, u.avatar_url, u.created_at, u.last_login_at
        `},
        {
            name: 'Create v_leaderboard view', sql: `
            CREATE OR REPLACE VIEW v_leaderboard AS
            SELECT 
                u.id, u.username, u.full_name, u.avatar_url, u.skill_level,
                COUNT(DISTINCT usp.problem_id) AS total_solved,
                COUNT(DISTINCT CASE WHEN p.difficulty = 'Easy' THEN usp.problem_id END) AS easy_count,
                COUNT(DISTINCT CASE WHEN p.difficulty = 'Medium' THEN usp.problem_id END) AS medium_count,
                COUNT(DISTINCT CASE WHEN p.difficulty = 'Hard' THEN usp.problem_id END) AS hard_count,
                COALESCE(
                    COUNT(DISTINCT CASE WHEN p.difficulty = 'Easy' THEN usp.problem_id END) * 1 +
                    COUNT(DISTINCT CASE WHEN p.difficulty = 'Medium' THEN usp.problem_id END) * 3 +
                    COUNT(DISTINCT CASE WHEN p.difficulty = 'Hard' THEN usp.problem_id END) * 5, 0
                ) AS score
            FROM users u
            LEFT JOIN user_solved_problem usp ON u.id = usp.user_id
            LEFT JOIN problems p ON usp.problem_id = p.id
            WHERE u.is_active = TRUE OR u.is_active IS NULL
            GROUP BY u.id, u.username, u.full_name, u.avatar_url, u.skill_level
            ORDER BY score DESC
        `},
        {
            name: 'Create v_topic_stats view', sql: `
            CREATE OR REPLACE VIEW v_topic_stats AS
            SELECT 
                topic,
                COUNT(*) AS problem_count,
                COUNT(CASE WHEN difficulty = 'Easy' THEN 1 END) AS easy_count,
                COUNT(CASE WHEN difficulty = 'Medium' THEN 1 END) AS medium_count,
                COUNT(CASE WHEN difficulty = 'Hard' THEN 1 END) AS hard_count
            FROM problems, jsonb_array_elements_text(topics) AS topic
            WHERE is_active = TRUE OR is_active IS NULL
            GROUP BY topic
            ORDER BY problem_count DESC
        `},

        // 7. Create functions
        {
            name: 'Create search_problems function', sql: `
            CREATE OR REPLACE FUNCTION search_problems(search_query TEXT)
            RETURNS TABLE (id INTEGER, title VARCHAR, difficulty VARCHAR, topics JSONB, rank REAL) AS $body$
            BEGIN
                RETURN QUERY
                SELECT p.id, p.title, p.difficulty::VARCHAR, p.topics,
                    ts_rank(to_tsvector('english', COALESCE(p.title, '') || ' ' || COALESCE(p.description, '')),
                        plainto_tsquery('english', search_query)) AS rank
                FROM problems p
                WHERE (p.is_active = TRUE OR p.is_active IS NULL)
                AND to_tsvector('english', COALESCE(p.title, '') || ' ' || COALESCE(p.description, ''))
                    @@ plainto_tsquery('english', search_query)
                ORDER BY rank DESC LIMIT 50;
            END;
            $body$ LANGUAGE plpgsql
        `},
        {
            name: 'Create update_problem_stats function', sql: `
            CREATE OR REPLACE FUNCTION update_problem_stats(p_problem_id INTEGER, p_passed BOOLEAN)
            RETURNS VOID AS $body$
            BEGIN
                UPDATE problems 
                SET submissions = COALESCE(submissions, 0) + 1,
                    accepted = CASE WHEN p_passed THEN COALESCE(accepted, 0) + 1 ELSE COALESCE(accepted, 0) END,
                    updated_at = NOW()
                WHERE id = p_problem_id;
            END;
            $body$ LANGUAGE plpgsql
        `},

        // 8. Data normalization
        { name: 'Normalize Easy difficulty', sql: `UPDATE problems SET difficulty = 'Easy' WHERE LOWER(difficulty::text) = 'easy'` },
        { name: 'Normalize Medium difficulty', sql: `UPDATE problems SET difficulty = 'Medium' WHERE LOWER(difficulty::text) = 'medium'` },
        { name: 'Normalize Hard difficulty', sql: `UPDATE problems SET difficulty = 'Hard' WHERE LOWER(difficulty::text) = 'hard'` },
        { name: 'Set default submissions', sql: `UPDATE problems SET submissions = 0 WHERE submissions IS NULL` },
        { name: 'Set default accepted', sql: `UPDATE problems SET accepted = 0 WHERE accepted IS NULL` },
        { name: 'Set default likes', sql: `UPDATE problems SET likes = 0 WHERE likes IS NULL` },
        { name: 'Set default dislikes', sql: `UPDATE problems SET dislikes = 0 WHERE dislikes IS NULL` },
        { name: 'Set default frequency', sql: `UPDATE problems SET frequency = 0 WHERE frequency IS NULL` },
        { name: 'Set default is_active problems', sql: `UPDATE problems SET is_active = TRUE WHERE is_active IS NULL` },
        { name: 'Set default is_active users', sql: `UPDATE users SET is_active = TRUE WHERE is_active IS NULL` },

        // 9. Platform stats table
        {
            name: 'Create platform_stats table', sql: `
            CREATE TABLE IF NOT EXISTS platform_stats (
                id SERIAL PRIMARY KEY,
                stat_date DATE NOT NULL UNIQUE,
                total_users INTEGER,
                active_users_day INTEGER,
                active_users_week INTEGER,
                total_problems INTEGER,
                total_submissions INTEGER,
                successful_submissions INTEGER,
                total_battles INTEGER,
                created_at TIMESTAMPTZ DEFAULT NOW()
            )
        `},
    ];

    let success = 0;
    let failed = 0;
    console.log('Running migrations...\n');

    for (const m of migrations) {
        try {
            await client.query(m.sql);
            console.log(`✓ ${m.name}`);
            success++;
        } catch (err) {
            if (err.message.includes('already exists') || err.message.includes('does not exist')) {
                console.log(`○ ${m.name} (skipped - already done)`);
            } else {
                console.log(`✗ ${m.name}: ${err.message.substring(0, 60)}`);
                failed++;
            }
        }
    }

    console.log(`\n${'='.repeat(50)}`);
    console.log(`Completed: ${success} successful, ${failed} failed`);
    console.log(`${'='.repeat(50)}`);

    await client.end();
}

run().catch(console.error);
