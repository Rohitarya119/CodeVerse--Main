-- Cleanup script to remove duplicate problems, keeping the latest one (by highest ID)

-- 1. Delete test cases associated with problem IDs that are about to be deleted
DELETE FROM test_cases 
WHERE problem_id IN (
    SELECT id FROM problems 
    WHERE id NOT IN (
        SELECT MAX(id) FROM problems GROUP BY title
    )
);

-- 2. Delete the duplicate problems themselves
DELETE FROM problems 
WHERE id NOT IN (
    SELECT MAX(id) FROM problems GROUP BY title
);
