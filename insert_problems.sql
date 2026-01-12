INSERT INTO problems (title, description, difficulty, function_name, boilerplate_code, examples, constraints, hints, topics, similar_questions, acceptance, submissions, accepted, likes, dislikes)
VALUES
(
    'Two Sum',
    'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target. You may assume that each input would have exactly one solution, and you may not use the same element twice. You can return the answer in any order.',
    'EASY',
    'twoSum',
    '{"java": "class Solution {\n    public int[] twoSum(int[] nums, int target) {\n        \n    }\n}", "python": "class Solution:\n    def twoSum(self, nums: List[int], target: int) -> List[int]:\n        ", "javascript": "/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number[]}\n */\nvar twoSum = function(nums, target) {\n    \n};", "cpp": "class Solution {\npublic:\n    vector<int> twoSum(vector<int>& nums, int target) {\n        \n    }\n};"}',
    '[{"input": "nums = [2,7,11,15], target = 9", "output": "[0,1]", "explanation": "Because nums[0] + nums[1] == 9, we return [0, 1]."}]',
    '["2 <= nums.length <= 10^4", "-10^9 <= nums[i] <= 10^9", "-10^9 <= target <= 10^9", "Only one valid answer exists."]',
    '["A really brute force way would be to search for all possible pairs of numbers but that would be slow.", "Can we use additional space to somehow accelerate the search? I.e. a hash map."]',
    '["Array", "Hash Table"]',
    '["3Sum", "4Sum"]',
    '49.2%',
    1000,
    492,
    100,
    5
),
(
    'Palindrome Number',
    'Given an integer x, return true if x is a palindrome, and false otherwise.',
    'EASY',
    'isPalindrome',
    '{"java": "class Solution {\n    public boolean isPalindrome(int x) {\n        \n    }\n}", "python": "class Solution:\n    def isPalindrome(self, x: int) -> bool:\n        ", "javascript": "/**\n * @param {number} x\n * @return {boolean}\n */\nvar isPalindrome = function(x) {\n    \n};", "cpp": "class Solution {\npublic:\n    bool isPalindrome(int x) {\n        \n    }\n};"}',
    '[{"input": "x = 121", "output": "true", "explanation": "121 reads as 121 from left to right and from right to left."}]',
    '["-2^31 <= x <= 2^31 - 1"]',
    '["Beware of overflow when you reverse the integer."]',
    '["Math"]',
    '["Palindrome Linked List"]',
    '53.1%',
    2000,
    1062,
    200,
    10
);

INSERT INTO test_cases (problem_id, input, expected_output)
VALUES
((SELECT id FROM problems WHERE title = 'Two Sum'), '{"nums": [2, 7, 11, 15], "target": 9}', '[0, 1]'),
((SELECT id FROM problems WHERE title = 'Palindrome Number'), '{"x": 121}', 'true');
