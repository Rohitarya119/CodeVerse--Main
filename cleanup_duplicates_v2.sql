-- Cleanup script to remove duplicate problems, keeping the latest one (by highest ID)

-- 0. Identify duplicate IDs (all except the max ID for each title)
CREATE TEMP TABLE duplicate_ids AS
SELECT id FROM problems 
WHERE id NOT IN (
    SELECT MAX(id) FROM problems GROUP BY title
);

-- 1. Delete dependent submissions (if any)
-- Assuming 'submissions' table might exist, if not this might fail, but based on Problem entity it has 'submissions' field but mapped?
-- Let's check Schema if possible, but safe to try to delete if table exists. 
-- Actually, the error mentioned "user_solved_problem".

DELETE FROM user_solved_problem
WHERE problem_id IN (SELECT id FROM duplicate_ids);

-- Also delete from test_cases again to be sure
DELETE FROM test_cases 
WHERE problem_id IN (SELECT id FROM duplicate_ids);

-- 2. Delete the duplicate problems themselves
DELETE FROM problems 
WHERE id IN (SELECT id FROM duplicate_ids);

DROP TABLE duplicate_ids;
