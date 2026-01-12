module.exports = [
    {
        "title": "Unique Paths II",
        "description": "You are given an m x n integer array grid. There is a robot initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time. An obstacle and space are marked as 1 or 0 respectively in grid. A path that the robot takes cannot include any square that is an obstacle. Return the number of possible unique paths that the robot can take to reach the bottom-right corner.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Dynamic Programming", "Matrix"],
        "constraints": ["m == obstacleGrid.length", "n == obstacleGrid[i].length", "1 <= m, n <= 100"],
        "hints": ["If cell has obstacle, dp[i][j] = 0.", "Else dp[i][j] = dp[i-1][j] + dp[i][j-1]."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int uniquePathsWithObstacles(int[][] obstacleGrid) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def uniquePathsWithObstacles(self, obstacleGrid: List[List[int]]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[][]} obstacleGrid\n * @return {number}\n */\nvar uniquePathsWithObstacles = function(obstacleGrid) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int uniquePathsWithObstacles(vector<vector<int>>& obstacleGrid) {\n        return 0;\n    }\n};"
        },
        "function_name": "uniquePathsWithObstacles",
        "examples": [
            {"input": "obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]", "output": "2"},
            {"input": "obstacleGrid = [[0,1],[0,0]]", "output": "1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ obstacleGrid: [[0,0,0],[0,1,0],[0,0,0]] }), "expectedOutput": "2" }
        ]
    },
    {
        "title": "Minimum Path Sum",
        "description": "Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path. You can only move either down or right at any point in time.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Dynamic Programming", "Matrix"],
        "constraints": ["m == grid.length", "n == grid[i].length", "1 <= m, n <= 200"],
        "hints": ["dp[i][j] = grid[i][j] + min(dp[i-1][j], dp[i][j-1])"],
        "boilerplate_code": {
            "java": "class Solution {\n    public int minPathSum(int[][] grid) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def minPathSum(self, grid: List[List[int]]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[][]} grid\n * @return {number}\n */\nvar minPathSum = function(grid) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int minPathSum(vector<vector<int>>& grid) {\n        return 0;\n    }\n};"
        },
        "function_name": "minPathSum",
        "examples": [
            {"input": "grid = [[1,3,1],[1,5,1],[4,2,1]]", "output": "7"},
            {"input": "grid = [[1,2,3],[4,5,6]]", "output": "12"}
        ],
        "testCases": [
            { "input": JSON.stringify({ grid: [[1,3,1],[1,5,1],[4,2,1]] }), "expectedOutput": "7" }
        ]
    },
    {
        "title": "Maximum Product Subarray",
        "description": "Given an integer array nums, find a subarray that has the largest product, and return the product.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Dynamic Programming"],
        "constraints": ["1 <= nums.length <= 2 * 10^4", "-10 <= nums[i] <= 10"],
        "hints": ["Keep track of both max product and min product (because of negative numbers).", "Swap max and min if number is negative."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int maxProduct(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def maxProduct(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar maxProduct = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int maxProduct(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "maxProduct",
        "examples": [
            {"input": "nums = [2,3,-2,4]", "output": "6"},
            {"input": "nums = [-2,0,-1]", "output": "0"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [2,3,-2,4] }), "expectedOutput": "6" }
        ]
    },
    {
        "title": "Longest Palindromic Substring",
        "description": "Given a string s, return the longest palindromic substring in s.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Dynamic Programming"],
        "constraints": ["1 <= s.length <= 1000", "s consist of only digits and English letters."],
        "hints": ["Expand around center strategy is O(n^2).", "DP approach: dp[i][j] is true if s[i..j] is palindrome."],
        "boilerplate_code": {
            "java": "class Solution {\n    public String longestPalindrome(String s) {\n        return \"\";\n    }\n}",
            "python": "class Solution:\n    def longestPalindrome(self, s: str) -> str:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {string}\n */\nvar longestPalindrome = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    string longestPalindrome(string s) {\n        return \"\";\n    }\n};"
        },
        "function_name": "longestPalindrome",
        "examples": [
            {"input": "s = \"babad\"", "output": "\"bab\""},
            {"input": "s = \"cbbd\"", "output": "\"bb\""}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "babad" }), "expectedOutput": "bab" }
        ]
    },
    {
        "title": "Burst Balloons",
        "description": "You are given n balloons, indexed from 0 to n - 1. Each balloon is painted with a number on it represented by an array nums. You are asked to burst all the balloons. If you burst the ith balloon, you will get nums[i - 1] * nums[i] * nums[i + 1] coins. Return the maximum coins you can collect by bursting the balloons wisely.",
        "difficulty": "HARD",
        "topics": ["Array", "Dynamic Programming"],
        "constraints": ["n == nums.length", "1 <= n <= 300", "0 <= nums[i] <= 100"],
        "hints": ["Work backwards: think about which balloon is burst LAST.", "dp[i][j] is max coins for range i to j."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int maxCoins(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def maxCoins(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar maxCoins = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int maxCoins(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "maxCoins",
        "examples": [
            {"input": "nums = [3,1,5,8]", "output": "167"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [3,1,5,8] }), "expectedOutput": "167" }
        ]
    }
];
