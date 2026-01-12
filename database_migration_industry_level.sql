-- ============================================================================
-- CodeVerse Database Migration - Industry Level
-- ============================================================================
-- This script upgrades the CodeVerse PostgreSQL database to industry standards:
-- 1. Performance Indexes
-- 2. Row Level Security (RLS) for Supabase
-- 3. Audit Trail (created_at, updated_at)
-- 4. Check Constraints & Data Validation
-- 5. Database Functions & Triggers
-- 6. Views for Common Queries
-- 7. Full-Text Search
-- 8. Analytics Functions
-- ============================================================================

-- ============================================================================
-- PART 1: AUDIT COLUMNS & TRIGGERS
-- ============================================================================

-- Add audit columns to all tables if they don't exist

-- Users table audit columns
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'created_at') THEN
        ALTER TABLE users ADD COLUMN created_at TIMESTAMPTZ DEFAULT NOW();
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'updated_at') THEN
        ALTER TABLE users ADD COLUMN updated_at TIMESTAMPTZ DEFAULT NOW();
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'avatar_url') THEN
        ALTER TABLE users ADD COLUMN avatar_url TEXT;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'bio') THEN
        ALTER TABLE users ADD COLUMN bio TEXT;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'github_url') THEN
        ALTER TABLE users ADD COLUMN github_url TEXT;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'linkedin_url') THEN
        ALTER TABLE users ADD COLUMN linkedin_url TEXT;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'is_active') THEN
        ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'last_login_at') THEN
        ALTER TABLE users ADD COLUMN last_login_at TIMESTAMPTZ;
    END IF;
END $$;

-- Problems table audit columns
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'problems' AND column_name = 'created_at') THEN
        ALTER TABLE problems ADD COLUMN created_at TIMESTAMPTZ DEFAULT NOW();
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'problems' AND column_name = 'updated_at') THEN
        ALTER TABLE problems ADD COLUMN updated_at TIMESTAMPTZ DEFAULT NOW();
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'problems' AND column_name = 'is_active') THEN
        ALTER TABLE problems ADD COLUMN is_active BOOLEAN DEFAULT TRUE;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'problems' AND column_name = 'frequency') THEN
        ALTER TABLE problems ADD COLUMN frequency INTEGER DEFAULT 0;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'problems' AND column_name = 'companies') THEN
        ALTER TABLE problems ADD COLUMN companies JSONB DEFAULT '[]'::jsonb;
    END IF;
END $$;

-- Create updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Apply triggers to all tables
DROP TRIGGER IF EXISTS users_updated_at ON users;
CREATE TRIGGER users_updated_at
    BEFORE UPDATE ON users
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS problems_updated_at ON problems;
CREATE TRIGGER problems_updated_at
    BEFORE UPDATE ON problems
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- ============================================================================
-- PART 2: PERFORMANCE INDEXES
-- ============================================================================

-- Users table indexes
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_skill_level ON users(skill_level);
CREATE INDEX IF NOT EXISTS idx_users_created_at ON users(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_users_is_active ON users(is_active) WHERE is_active = TRUE;

-- Problems table indexes
CREATE INDEX IF NOT EXISTS idx_problems_title ON problems(title);
CREATE INDEX IF NOT EXISTS idx_problems_difficulty ON problems(difficulty);
CREATE INDEX IF NOT EXISTS idx_problems_created_at ON problems(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_problems_submissions ON problems(submissions DESC);
CREATE INDEX IF NOT EXISTS idx_problems_acceptance ON problems(acceptance);
CREATE INDEX IF NOT EXISTS idx_problems_frequency ON problems(frequency DESC);
CREATE INDEX IF NOT EXISTS idx_problems_is_active ON problems(is_active) WHERE is_active = TRUE;

-- GIN index for JSONB topics (for fast array searches)
CREATE INDEX IF NOT EXISTS idx_problems_topics ON problems USING GIN (topics);
CREATE INDEX IF NOT EXISTS idx_problems_companies ON problems USING GIN (companies);
CREATE INDEX IF NOT EXISTS idx_problems_hints ON problems USING GIN (hints);
CREATE INDEX IF NOT EXISTS idx_problems_constraints ON problems USING GIN (constraints);

-- Full-text search index on problems title and description
DROP INDEX IF EXISTS idx_problems_search;
CREATE INDEX idx_problems_search ON problems USING GIN (
    to_tsvector('english', COALESCE(title, '') || ' ' || COALESCE(description, ''))
);

-- Test cases indexes
CREATE INDEX IF NOT EXISTS idx_test_cases_problem_id ON test_cases(problem_id);

-- User solved problems indexes
CREATE INDEX IF NOT EXISTS idx_user_solved_problem_user_id ON user_solved_problem(user_id);
CREATE INDEX IF NOT EXISTS idx_user_solved_problem_problem_id ON user_solved_problem(problem_id);
CREATE INDEX IF NOT EXISTS idx_user_solved_problem_solved_at ON user_solved_problem(solved_at DESC);
CREATE INDEX IF NOT EXISTS idx_user_solved_problem_composite ON user_solved_problem(user_id, problem_id);

-- Battle table indexes
CREATE INDEX IF NOT EXISTS idx_battle_problem_id ON battle(problem_id);
CREATE INDEX IF NOT EXISTS idx_battle_status ON battle(status);
CREATE INDEX IF NOT EXISTS idx_battle_created_at ON battle(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_battle_mode ON battle(mode);
CREATE INDEX IF NOT EXISTS idx_battle_winner_user_id ON battle(winner_user_id);

-- Battle submission indexes
CREATE INDEX IF NOT EXISTS idx_battle_submission_battle_id ON battle_submission(battle_id);
CREATE INDEX IF NOT EXISTS idx_battle_submission_user_id ON battle_submission(user_id);
CREATE INDEX IF NOT EXISTS idx_battle_submission_submitted_at ON battle_submission(submitted_at DESC);
CREATE INDEX IF NOT EXISTS idx_battle_submission_result ON battle_submission(result);

-- Battle user indexes
CREATE INDEX IF NOT EXISTS idx_battle_user_battle_id ON battle_user(battle_id);
CREATE INDEX IF NOT EXISTS idx_battle_user_user_id ON battle_user(user_id);

-- ============================================================================
-- PART 3: CHECK CONSTRAINTS
-- ============================================================================

-- Difficulty constraint
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'chk_problems_difficulty') THEN
        ALTER TABLE problems ADD CONSTRAINT chk_problems_difficulty 
        CHECK (difficulty IN ('Easy', 'Medium', 'Hard', 'EASY', 'MEDIUM', 'HARD'));
    END IF;
END $$;

-- Battle mode constraint
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'chk_battle_mode') THEN
        ALTER TABLE battle ADD CONSTRAINT chk_battle_mode 
        CHECK (mode IN ('1v1', 'ffa', 'team'));
    END IF;
END $$;

-- Battle status constraint
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'chk_battle_status') THEN
        ALTER TABLE battle ADD CONSTRAINT chk_battle_status 
        CHECK (status IN ('PENDING', 'ACTIVE', 'FINISHED', 'CANCELLED'));
    END IF;
END $$;

-- Battle submission result constraint
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'chk_battle_submission_result') THEN
        ALTER TABLE battle_submission ADD CONSTRAINT chk_battle_submission_result 
        CHECK (result IN ('PASS', 'FAIL', 'ERROR', 'TIMEOUT', 'PENDING'));
    END IF;
END $$;

-- Non-negative submissions/accepted
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'chk_problems_submissions_positive') THEN
        ALTER TABLE problems ADD CONSTRAINT chk_problems_submissions_positive 
        CHECK (submissions >= 0 OR submissions IS NULL);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'chk_problems_accepted_positive') THEN
        ALTER TABLE problems ADD CONSTRAINT chk_problems_accepted_positive 
        CHECK (accepted >= 0 OR accepted IS NULL);
    END IF;
END $$;

-- ============================================================================
-- PART 4: DATABASE VIEWS
-- ============================================================================

-- View: Problem statistics with solved count
CREATE OR REPLACE VIEW v_problem_stats AS
SELECT 
    p.id,
    p.title,
    p.difficulty,
    p.topics,
    p.companies,
    p.submissions,
    p.accepted,
    CASE 
        WHEN p.submissions > 0 THEN ROUND((p.accepted::DECIMAL / p.submissions) * 100, 1)
        ELSE 0 
    END AS acceptance_rate,
    p.frequency,
    COUNT(DISTINCT usp.user_id) AS total_solvers,
    p.created_at,
    p.is_active
FROM problems p
LEFT JOIN user_solved_problem usp ON p.id = usp.problem_id
WHERE p.is_active = TRUE OR p.is_active IS NULL
GROUP BY p.id, p.title, p.difficulty, p.topics, p.companies, 
         p.submissions, p.accepted, p.frequency, p.created_at, p.is_active;

-- View: User statistics
CREATE OR REPLACE VIEW v_user_stats AS
SELECT 
    u.id,
    u.username,
    u.full_name,
    u.skill_level,
    u.avatar_url,
    COUNT(DISTINCT usp.problem_id) AS problems_solved,
    COUNT(DISTINCT CASE WHEN p.difficulty = 'Easy' THEN usp.problem_id END) AS easy_solved,
    COUNT(DISTINCT CASE WHEN p.difficulty = 'Medium' THEN usp.problem_id END) AS medium_solved,
    COUNT(DISTINCT CASE WHEN p.difficulty = 'Hard' THEN usp.problem_id END) AS hard_solved,
    COUNT(DISTINCT b.id) AS battles_participated,
    COUNT(DISTINCT CASE WHEN b.winner_user_id = u.id THEN b.id END) AS battles_won,
    u.created_at,
    u.last_login_at
FROM users u
LEFT JOIN user_solved_problem usp ON u.id = usp.user_id
LEFT JOIN problems p ON usp.problem_id = p.id
LEFT JOIN battle_user bu ON u.id = bu.user_id
LEFT JOIN battle b ON bu.battle_id = b.id
WHERE u.is_active = TRUE OR u.is_active IS NULL
GROUP BY u.id, u.username, u.full_name, u.skill_level, u.avatar_url, u.created_at, u.last_login_at;

-- View: Leaderboard
CREATE OR REPLACE VIEW v_leaderboard AS
SELECT 
    u.id,
    u.username,
    u.full_name,
    u.avatar_url,
    u.skill_level,
    COUNT(DISTINCT usp.problem_id) AS total_solved,
    COUNT(DISTINCT CASE WHEN p.difficulty = 'Easy' THEN usp.problem_id END) AS easy_count,
    COUNT(DISTINCT CASE WHEN p.difficulty = 'Medium' THEN usp.problem_id END) AS medium_count,
    COUNT(DISTINCT CASE WHEN p.difficulty = 'Hard' THEN usp.problem_id END) AS hard_count,
    -- Score calculation: Easy=1pt, Medium=3pts, Hard=5pts
    COALESCE(
        COUNT(DISTINCT CASE WHEN p.difficulty = 'Easy' THEN usp.problem_id END) * 1 +
        COUNT(DISTINCT CASE WHEN p.difficulty = 'Medium' THEN usp.problem_id END) * 3 +
        COUNT(DISTINCT CASE WHEN p.difficulty = 'Hard' THEN usp.problem_id END) * 5,
        0
    ) AS score,
    DENSE_RANK() OVER (
        ORDER BY (
            COALESCE(COUNT(DISTINCT CASE WHEN p.difficulty = 'Easy' THEN usp.problem_id END) * 1, 0) +
            COALESCE(COUNT(DISTINCT CASE WHEN p.difficulty = 'Medium' THEN usp.problem_id END) * 3, 0) +
            COALESCE(COUNT(DISTINCT CASE WHEN p.difficulty = 'Hard' THEN usp.problem_id END) * 5, 0)
        ) DESC
    ) AS rank
FROM users u
LEFT JOIN user_solved_problem usp ON u.id = usp.user_id
LEFT JOIN problems p ON usp.problem_id = p.id
WHERE u.is_active = TRUE OR u.is_active IS NULL
GROUP BY u.id, u.username, u.full_name, u.avatar_url, u.skill_level
ORDER BY score DESC;

-- View: Topic/Pattern statistics
CREATE OR REPLACE VIEW v_topic_stats AS
SELECT 
    topic,
    COUNT(*) AS problem_count,
    COUNT(CASE WHEN difficulty = 'Easy' THEN 1 END) AS easy_count,
    COUNT(CASE WHEN difficulty = 'Medium' THEN 1 END) AS medium_count,
    COUNT(CASE WHEN difficulty = 'Hard' THEN 1 END) AS hard_count,
    AVG(CASE WHEN submissions > 0 THEN (accepted::DECIMAL / submissions) * 100 END) AS avg_acceptance_rate
FROM problems, jsonb_array_elements_text(topics) AS topic
WHERE is_active = TRUE OR is_active IS NULL
GROUP BY topic
ORDER BY problem_count DESC;

-- View: Daily activity stats
CREATE OR REPLACE VIEW v_daily_activity AS
SELECT 
    DATE(usp.solved_at) AS activity_date,
    COUNT(DISTINCT usp.user_id) AS active_users,
    COUNT(*) AS problems_solved,
    COUNT(DISTINCT usp.problem_id) AS unique_problems
FROM user_solved_problem usp
WHERE usp.solved_at >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY DATE(usp.solved_at)
ORDER BY activity_date DESC;

-- ============================================================================
-- PART 5: DATABASE FUNCTIONS
-- ============================================================================

-- Function: Search problems with full-text search
CREATE OR REPLACE FUNCTION search_problems(search_query TEXT)
RETURNS TABLE (
    id INTEGER,
    title VARCHAR,
    difficulty VARCHAR,
    topics JSONB,
    rank REAL
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id,
        p.title,
        p.difficulty::VARCHAR,
        p.topics,
        ts_rank(
            to_tsvector('english', COALESCE(p.title, '') || ' ' || COALESCE(p.description, '')),
            plainto_tsquery('english', search_query)
        ) AS rank
    FROM problems p
    WHERE (p.is_active = TRUE OR p.is_active IS NULL)
    AND to_tsvector('english', COALESCE(p.title, '') || ' ' || COALESCE(p.description, ''))
        @@ plainto_tsquery('english', search_query)
    ORDER BY rank DESC
    LIMIT 50;
END;
$$ LANGUAGE plpgsql;

-- Function: Get user progress
CREATE OR REPLACE FUNCTION get_user_progress(p_user_id BIGINT)
RETURNS TABLE (
    topic TEXT,
    total_problems BIGINT,
    solved_problems BIGINT,
    progress_percentage NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    WITH all_topics AS (
        SELECT DISTINCT jsonb_array_elements_text(topics) AS topic
        FROM problems
        WHERE is_active = TRUE OR is_active IS NULL
    ),
    topic_counts AS (
        SELECT 
            t.topic,
            COUNT(DISTINCT p.id) AS total_problems
        FROM all_topics t
        JOIN problems p ON p.topics ? t.topic
        WHERE p.is_active = TRUE OR p.is_active IS NULL
        GROUP BY t.topic
    ),
    solved_counts AS (
        SELECT 
            t.topic,
            COUNT(DISTINCT usp.problem_id) AS solved_problems
        FROM all_topics t
        JOIN problems p ON p.topics ? t.topic
        JOIN user_solved_problem usp ON p.id = usp.problem_id AND usp.user_id = p_user_id
        WHERE p.is_active = TRUE OR p.is_active IS NULL
        GROUP BY t.topic
    )
    SELECT 
        tc.topic,
        tc.total_problems,
        COALESCE(sc.solved_problems, 0) AS solved_problems,
        ROUND((COALESCE(sc.solved_problems, 0)::NUMERIC / NULLIF(tc.total_problems, 0)) * 100, 1) AS progress_percentage
    FROM topic_counts tc
    LEFT JOIN solved_counts sc ON tc.topic = sc.topic
    ORDER BY tc.total_problems DESC;
END;
$$ LANGUAGE plpgsql;

-- Function: Get recommended problems for user
CREATE OR REPLACE FUNCTION get_recommended_problems(p_user_id BIGINT, p_limit INT DEFAULT 10)
RETURNS TABLE (
    id INTEGER,
    title VARCHAR,
    difficulty VARCHAR,
    topics JSONB,
    frequency INTEGER,
    reason TEXT
) AS $$
BEGIN
    RETURN QUERY
    -- Get problems the user hasn't solved, prioritizing by frequency and similar topics
    SELECT 
        p.id,
        p.title,
        p.difficulty::VARCHAR,
        p.topics,
        COALESCE(p.frequency, 0) AS frequency,
        CASE 
            WHEN p.difficulty = 'Easy' THEN 'Great for building confidence'
            WHEN p.difficulty = 'Medium' THEN 'Challenge yourself'
            WHEN p.difficulty = 'Hard' THEN 'Master your skills'
            ELSE 'Try this one'
        END AS reason
    FROM problems p
    WHERE (p.is_active = TRUE OR p.is_active IS NULL)
    AND p.id NOT IN (
        SELECT usp.problem_id 
        FROM user_solved_problem usp 
        WHERE usp.user_id = p_user_id
    )
    ORDER BY 
        COALESCE(p.frequency, 0) DESC,
        CASE p.difficulty 
            WHEN 'Easy' THEN 1 
            WHEN 'Medium' THEN 2 
            WHEN 'Hard' THEN 3 
            ELSE 4 
        END
    LIMIT p_limit;
END;
$$ LANGUAGE plpgsql;

-- Function: Calculate user streak
CREATE OR REPLACE FUNCTION get_user_streak(p_user_id BIGINT)
RETURNS TABLE (
    current_streak INTEGER,
    longest_streak INTEGER,
    last_active_date DATE
) AS $$
DECLARE
    v_current_streak INTEGER := 0;
    v_longest_streak INTEGER := 0;
    v_temp_streak INTEGER := 0;
    v_last_date DATE;
    v_current_date DATE;
    v_today DATE := CURRENT_DATE;
    rec RECORD;
BEGIN
    -- Get distinct dates user solved problems
    FOR rec IN (
        SELECT DISTINCT DATE(solved_at) AS solve_date
        FROM user_solved_problem
        WHERE user_id = p_user_id
        ORDER BY solve_date DESC
    ) LOOP
        v_current_date := rec.solve_date;
        
        IF v_last_date IS NULL THEN
            v_last_date := v_current_date;
            v_temp_streak := 1;
            
            -- Check if last activity was today or yesterday for current streak
            IF v_current_date >= v_today - INTERVAL '1 day' THEN
                v_current_streak := 1;
            END IF;
        ELSE
            IF v_last_date - v_current_date = 1 THEN
                v_temp_streak := v_temp_streak + 1;
                IF v_last_date >= v_today - INTERVAL '1 day' THEN
                    v_current_streak := v_temp_streak;
                END IF;
            ELSE
                v_temp_streak := 1;
            END IF;
        END IF;
        
        IF v_temp_streak > v_longest_streak THEN
            v_longest_streak := v_temp_streak;
        END IF;
        
        v_last_date := v_current_date;
    END LOOP;
    
    RETURN QUERY SELECT v_current_streak, v_longest_streak, v_last_date;
END;
$$ LANGUAGE plpgsql;

-- Function: Update problem statistics after submission
CREATE OR REPLACE FUNCTION update_problem_stats(p_problem_id INTEGER, p_passed BOOLEAN)
RETURNS VOID AS $$
BEGIN
    UPDATE problems 
    SET 
        submissions = COALESCE(submissions, 0) + 1,
        accepted = CASE WHEN p_passed THEN COALESCE(accepted, 0) + 1 ELSE COALESCE(accepted, 0) END,
        updated_at = NOW()
    WHERE id = p_problem_id;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- PART 6: ROW LEVEL SECURITY (RLS) - For Supabase
-- ============================================================================

-- Enable RLS on tables
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_solved_problem ENABLE ROW LEVEL SECURITY;
ALTER TABLE battle ENABLE ROW LEVEL SECURITY;
ALTER TABLE battle_user ENABLE ROW LEVEL SECURITY;
ALTER TABLE battle_submission ENABLE ROW LEVEL SECURITY;

-- Note: problems and test_cases are public read, so no RLS needed for read operations

-- Users policies
DROP POLICY IF EXISTS "Users can view their own profile" ON users;
CREATE POLICY "Users can view their own profile" ON users
    FOR SELECT USING (TRUE); -- Public profiles

DROP POLICY IF EXISTS "Users can update their own profile" ON users;
CREATE POLICY "Users can update their own profile" ON users
    FOR UPDATE USING (auth.uid()::TEXT = id::TEXT);

-- User solved problems policies
DROP POLICY IF EXISTS "Users can view all solved problems" ON user_solved_problem;
CREATE POLICY "Users can view all solved problems" ON user_solved_problem
    FOR SELECT USING (TRUE);

DROP POLICY IF EXISTS "Users can insert their own solved problems" ON user_solved_problem;
CREATE POLICY "Users can insert their own solved problems" ON user_solved_problem
    FOR INSERT WITH CHECK (auth.uid()::TEXT = user_id::TEXT);

-- Battle policies
DROP POLICY IF EXISTS "Anyone can view battles" ON battle;
CREATE POLICY "Anyone can view battles" ON battle
    FOR SELECT USING (TRUE);

DROP POLICY IF EXISTS "Authenticated users can create battles" ON battle;
CREATE POLICY "Authenticated users can create battles" ON battle
    FOR INSERT WITH CHECK (auth.role() = 'authenticated');

-- Battle user policies
DROP POLICY IF EXISTS "Anyone can view battle participants" ON battle_user;
CREATE POLICY "Anyone can view battle participants" ON battle_user
    FOR SELECT USING (TRUE);

DROP POLICY IF EXISTS "Users can join battles" ON battle_user;
CREATE POLICY "Users can join battles" ON battle_user
    FOR INSERT WITH CHECK (auth.uid()::TEXT = user_id::TEXT);

-- Battle submission policies
DROP POLICY IF EXISTS "Anyone can view battle submissions" ON battle_submission;
CREATE POLICY "Anyone can view battle submissions" ON battle_submission
    FOR SELECT USING (TRUE);

DROP POLICY IF EXISTS "Users can submit to battles" ON battle_submission;
CREATE POLICY "Users can submit to battles" ON battle_submission
    FOR INSERT WITH CHECK (auth.uid()::TEXT = user_id::TEXT);

-- ============================================================================
-- PART 7: DATA CLEANUP & NORMALIZATION
-- ============================================================================

-- Normalize difficulty values to proper case
UPDATE problems SET difficulty = 'Easy' WHERE LOWER(difficulty) = 'easy';
UPDATE problems SET difficulty = 'Medium' WHERE LOWER(difficulty) = 'medium';
UPDATE problems SET difficulty = 'Hard' WHERE LOWER(difficulty) = 'hard';

-- Update null submissions/accepted to 0
UPDATE problems SET submissions = 0 WHERE submissions IS NULL;
UPDATE problems SET accepted = 0 WHERE accepted IS NULL;
UPDATE problems SET likes = 0 WHERE likes IS NULL;
UPDATE problems SET dislikes = 0 WHERE dislikes IS NULL;
UPDATE problems SET frequency = 0 WHERE frequency IS NULL;

-- Ensure all problems have is_active set
UPDATE problems SET is_active = TRUE WHERE is_active IS NULL;

-- Ensure all users have is_active set
UPDATE users SET is_active = TRUE WHERE is_active IS NULL;

-- ============================================================================
-- PART 8: MATERIALIZED VIEWS FOR PERFORMANCE (Optional)
-- ============================================================================

-- Materialized view for leaderboard (refresh periodically)
DROP MATERIALIZED VIEW IF EXISTS mv_leaderboard;
CREATE MATERIALIZED VIEW mv_leaderboard AS
SELECT * FROM v_leaderboard;

-- Create index on materialized view
CREATE UNIQUE INDEX IF NOT EXISTS idx_mv_leaderboard_id ON mv_leaderboard(id);
CREATE INDEX IF NOT EXISTS idx_mv_leaderboard_rank ON mv_leaderboard(rank);
CREATE INDEX IF NOT EXISTS idx_mv_leaderboard_score ON mv_leaderboard(score DESC);

-- Function to refresh leaderboard (call this periodically or after user solves problem)
CREATE OR REPLACE FUNCTION refresh_leaderboard()
RETURNS VOID AS $$
BEGIN
    REFRESH MATERIALIZED VIEW CONCURRENTLY mv_leaderboard;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- PART 9: STATISTICS TABLE (for analytics dashboard)
-- ============================================================================

-- Create a statistics snapshot table
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
);

-- Function to update daily statistics
CREATE OR REPLACE FUNCTION update_daily_stats()
RETURNS VOID AS $$
BEGIN
    INSERT INTO platform_stats (
        stat_date,
        total_users,
        active_users_day,
        active_users_week,
        total_problems,
        total_submissions,
        successful_submissions,
        total_battles
    )
    SELECT 
        CURRENT_DATE,
        (SELECT COUNT(*) FROM users WHERE is_active = TRUE OR is_active IS NULL),
        (SELECT COUNT(DISTINCT user_id) FROM user_solved_problem WHERE solved_at >= CURRENT_DATE),
        (SELECT COUNT(DISTINCT user_id) FROM user_solved_problem WHERE solved_at >= CURRENT_DATE - INTERVAL '7 days'),
        (SELECT COUNT(*) FROM problems WHERE is_active = TRUE OR is_active IS NULL),
        (SELECT SUM(submissions) FROM problems),
        (SELECT SUM(accepted) FROM problems),
        (SELECT COUNT(*) FROM battle)
    ON CONFLICT (stat_date) 
    DO UPDATE SET
        total_users = EXCLUDED.total_users,
        active_users_day = EXCLUDED.active_users_day,
        active_users_week = EXCLUDED.active_users_week,
        total_problems = EXCLUDED.total_problems,
        total_submissions = EXCLUDED.total_submissions,
        successful_submissions = EXCLUDED.successful_submissions,
        total_battles = EXCLUDED.total_battles,
        created_at = NOW();
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- FINAL: Grant permissions for API access
-- ============================================================================

-- Grant read access to public data
GRANT SELECT ON problems TO anon, authenticated;
GRANT SELECT ON test_cases TO anon, authenticated;
GRANT SELECT ON v_problem_stats TO anon, authenticated;
GRANT SELECT ON v_leaderboard TO anon, authenticated;
GRANT SELECT ON v_topic_stats TO anon, authenticated;
GRANT SELECT ON mv_leaderboard TO anon, authenticated;

-- Grant authenticated user permissions
GRANT SELECT, INSERT ON user_solved_problem TO authenticated;
GRANT SELECT, INSERT ON battle TO authenticated;
GRANT SELECT, INSERT ON battle_user TO authenticated;
GRANT SELECT, INSERT ON battle_submission TO authenticated;
GRANT SELECT, UPDATE ON users TO authenticated;

-- Grant function execution
GRANT EXECUTE ON FUNCTION search_problems(TEXT) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION get_user_progress(BIGINT) TO authenticated;
GRANT EXECUTE ON FUNCTION get_recommended_problems(BIGINT, INT) TO authenticated;
GRANT EXECUTE ON FUNCTION get_user_streak(BIGINT) TO authenticated;

-- ============================================================================
-- SUCCESS MESSAGE
-- ============================================================================
DO $$
BEGIN
    RAISE NOTICE '============================================================';
    RAISE NOTICE 'CodeVerse Database Migration Complete!';
    RAISE NOTICE '============================================================';
    RAISE NOTICE 'Applied:';
    RAISE NOTICE '  ✓ Audit columns (created_at, updated_at)';
    RAISE NOTICE '  ✓ Performance indexes (15+ indexes)';
    RAISE NOTICE '  ✓ Check constraints for data validation';
    RAISE NOTICE '  ✓ Database views (5 views)';
    RAISE NOTICE '  ✓ Materialized view for leaderboard';
    RAISE NOTICE '  ✓ Full-text search on problems';
    RAISE NOTICE '  ✓ Database functions (6 functions)';
    RAISE NOTICE '  ✓ Row Level Security policies';
    RAISE NOTICE '  ✓ Data normalization';
    RAISE NOTICE '  ✓ Platform statistics table';
    RAISE NOTICE '============================================================';
END $$;
