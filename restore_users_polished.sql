-- Polished Users Table
CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(120) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    skill_level VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Optimize Lookups
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);

-- Polished Solved Problems Table
CREATE TABLE IF NOT EXISTS user_solved_problem (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    problem_id INTEGER NOT NULL,
    solved_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_problem FOREIGN KEY (problem_id) REFERENCES problems(id) ON DELETE CASCADE,
    CONSTRAINT uk_user_problem UNIQUE (user_id, problem_id)
);

-- Optimize Join Performance
CREATE INDEX IF NOT EXISTS idx_usp_user_id ON user_solved_problem(user_id);
CREATE INDEX IF NOT EXISTS idx_usp_problem_id ON user_solved_problem(problem_id);

-- Restore Data: Users
INSERT INTO users (id, username, email, password, full_name, skill_level) VALUES
(1, 'Priyanshu_Burman', 'pburman754@gmail.com', '$2a$10$9PnjdD9dn31aUmPprmV6H.pish5kUk0IPSeCM6S0eajONCx42dgIp', 'Priyanshu Burman', 'Beginner'),
(2, 'api_user_2', 'api_user_2@example.com', '$2a$10$7OJmYZJhx3w9/iFExor/JOEKMEMPlCaXPTblLN7npPe5RxNnTRLEE', 'API User Two', 'Beginner')
ON CONFLICT (username) DO UPDATE SET
    email = EXCLUDED.email,
    password = EXCLUDED.password,
    full_name = EXCLUDED.full_name;

-- Reset Users Sequence
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));

-- Restore Data: Solved Problems (Using proper Title lookup to handle ID mismatches)
-- User 1: Trapping Rain Water
INSERT INTO user_solved_problem (user_id, problem_id, solved_at)
SELECT u.id, p.id, '2025-12-13 16:28:53'
FROM users u, problems p
WHERE u.username = 'Priyanshu_Burman' AND p.title = 'Trapping Rain Water'
ON CONFLICT (user_id, problem_id) DO NOTHING;

-- User 1: Valid Triangle Number
INSERT INTO user_solved_problem (user_id, problem_id, solved_at)
SELECT u.id, p.id, '2025-12-13 16:28:53'
FROM users u, problems p
WHERE u.username = 'Priyanshu_Burman' AND p.title = 'Valid Triangle Number'
ON CONFLICT (user_id, problem_id) DO NOTHING;

-- User 2: Two Sum
INSERT INTO user_solved_problem (user_id, problem_id, solved_at)
SELECT u.id, p.id, '2025-12-11 11:51:00'
FROM users u, problems p
WHERE u.username = 'api_user_2' AND p.title = 'Two Sum'
ON CONFLICT (user_id, problem_id) DO NOTHING;

-- Reset Solved Problems Sequence
SELECT setval('user_solved_problem_id_seq', COALESCE((SELECT MAX(id) FROM user_solved_problem), 1));
