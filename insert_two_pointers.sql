INSERT INTO problems (title, description, difficulty, topics, constraints, boilerplate_code, function_name, examples)
VALUES 
(
    'Two Sum II - Input Array Is Sorted', 
    'Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number.', 
    'MEDIUM', 
    '["Two Pointers", "Arrays"]'::jsonb, 
    '["2 <= numbers.length <= 3 * 10^4"]'::jsonb, 
    '{"java": "class Solution { public int[] twoSum(int[] numbers, int target) { return new int[0]; } }"}'::jsonb, 
    'twoSum',
    '[{"input": "numbers = [2,7,11,15], target = 9", "output": "[1,2]"}]'::jsonb
),
(
    'Container With Most Water', 
    'You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]). Find two lines that together with the x-axis form a container, such that the container contains the most water.', 
    'MEDIUM', 
    '["Two Pointers", "Arrays", "Greedy"]'::jsonb, 
    '["n == height.length", "2 <= n <= 10^5"]'::jsonb, 
    '{"java": "class Solution { public int maxArea(int[] height) { return 0; } }"}'::jsonb, 
    'maxArea',
    '[{"input": "height = [1,8,6,2,5,4,8,3,7]", "output": "49"}]'::jsonb
);
