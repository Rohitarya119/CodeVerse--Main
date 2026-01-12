-- Update Two Sum II
UPDATE problems 
SET boilerplate_code = '{"java": "class Solution {\n    public int[] twoSum(int[] numbers, int target) {\n        \n    }\n}", "python": "class Solution:\n    def twoSum(self, numbers: List[int], target: int) -> List[int]:\n        ", "javascript": "/**\n * @param {number[]} numbers\n * @param {number} target\n * @return {number[]}\n */\nvar twoSum = function(numbers, target) {\n    \n};", "cpp": "class Solution {\npublic:\n    vector<int> twoSum(vector<int>& numbers, int target) {\n        \n    }\n};"}'::jsonb
WHERE title = 'Two Sum II - Input Array Is Sorted';

-- Update Container With Most Water
UPDATE problems 
SET boilerplate_code = '{"java": "class Solution {\n    public int maxArea(int[] height) {\n        \n    }\n}", "python": "class Solution:\n    def maxArea(self, height: List[int]) -> int:\n        ", "javascript": "/**\n * @param {number[]} height\n * @return {number}\n */\nvar maxArea = function(height) {\n    \n};", "cpp": "class Solution {\npublic:\n    int maxArea(vector<int>& height) {\n        \n    }\n};"}'::jsonb
WHERE title = 'Container With Most Water';

-- Update 3Sum
UPDATE problems 
SET boilerplate_code = '{"java": "class Solution {\n    public List<List<Integer>> threeSum(int[] nums) {\n        \n    }\n}", "python": "class Solution:\n    def threeSum(self, nums: List[int]) -> List[List[int]]:\n        ", "javascript": "/**\n * @param {number[]} nums\n * @return {number[][]}\n */\nvar threeSum = function(nums) {\n    \n};", "cpp": "class Solution {\npublic:\n    vector<vector<int>> threeSum(vector<int>& nums) {\n        \n    }\n};"}'::jsonb
WHERE title = '3Sum';

-- Update Trapping Rain Water
UPDATE problems 
SET boilerplate_code = '{"java": "class Solution {\n    public int trap(int[] height) {\n        \n    }\n}", "python": "class Solution:\n    def trap(self, height: List[int]) -> int:\n        ", "javascript": "/**\n * @param {number[]} height\n * @return {number}\n */\nvar trap = function(height) {\n    \n};", "cpp": "class Solution {\npublic:\n    int trap(vector<int>& height) {\n        \n    }\n};"}'::jsonb
WHERE title = 'Trapping Rain Water';

-- Update Valid Palindrome
UPDATE problems 
SET boilerplate_code = '{"java": "class Solution {\n    public boolean isPalindrome(String s) {\n        \n    }\n}", "python": "class Solution:\n    def isPalindrome(self, s: str) -> bool:\n        ", "javascript": "/**\n * @param {string} s\n * @return {boolean}\n */\nvar isPalindrome = function(s) {\n    \n};", "cpp": "class Solution {\npublic:\n    bool isPalindrome(string s) {\n        \n    }\n};"}'::jsonb
WHERE title = 'Valid Palindrome';
