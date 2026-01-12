INSERT INTO problems (title, description, difficulty, topics, constraints, boilerplate_code, function_name, examples)
VALUES 
(
    '3Sum', 
    'Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0. Notice that the solution set must not contain duplicate triplets.', 
    'MEDIUM', 
    '["Two Pointers", "Arrays", "Sorting"]'::jsonb, 
    '["0 <= nums.length <= 3000", "-10^5 <= nums[i] <= 10^5"]'::jsonb, 
    '{"java": "class Solution { public List<List<Integer>> threeSum(int[] nums) { return new ArrayList<>(); } }"}'::jsonb, 
    'threeSum',
    '[{"input": "nums = [-1,0,1,2,-1,-4]", "output": "[[-1,-1,2],[-1,0,1]]"}]'::jsonb
),
(
    'Trapping Rain Water', 
    'Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.', 
    'HARD', 
    '["Two Pointers", "Arrays", "Dynamic Programming", "Stack"]'::jsonb, 
    '["n == height.length", "1 <= n <= 2 * 10^4", "0 <= height[i] <= 10^5"]'::jsonb, 
    '{"java": "class Solution { public int trap(int[] height) { return 0; } }"}'::jsonb, 
    'trap',
    '[{"input": "height = [0,1,0,2,1,0,1,3,2,1,2,1]", "output": "6"}]'::jsonb
),
(
    'Valid Palindrome', 
    'A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers. Given a string s, return true if it is a palindrome, or false otherwise.', 
    'EASY', 
    '["Two Pointers", "Strings"]'::jsonb, 
    '["1 <= s.length <= 2 * 10^5", "s consists only of printable ASCII characters."]'::jsonb, 
    '{"java": "class Solution { public boolean isPalindrome(String s) { return false; } }"}'::jsonb, 
    'isPalindrome',
    '[{"input": "s = \"A man, a plan, a canal: Panama\"", "output": "true"}]'::jsonb
);
