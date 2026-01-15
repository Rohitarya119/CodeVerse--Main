INSERT INTO test_cases (problem_id, input, expected_output) VALUES
((SELECT id FROM problems WHERE title = 'Two Sum'), '{"nums": [3, 2, 4], "target": 6}', '[1, 2]'),
((SELECT id FROM problems WHERE title = 'Two Sum'), '{"nums": [3, 3], "target": 6}', '[0, 1]');
