module.exports = [
    {
        "title": "Distinct Subsequences",
        "description": "Given two strings s and t, return the number of distinct subsequences of s which equals t. The test cases are generated so that the answer fits on a 32-bit signed integer.",
        "difficulty": "HARD",
        "topics": ["Dynamic Programming", "String"],
        "constraints": ["1 <= s.length, t.length <= 1000", "s and t consist of English letters."],
        "hints": ["dp[i][j]: number of ways to form t[0..j] using s[0..i].", "If s[i] == t[j], we can either use s[i] or skip it."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int numDistinct(String s, String t) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def numDistinct(self, s: str, t: str) -> int:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @param {string} t\n * @return {number}\n */\nvar numDistinct = function(s, t) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int numDistinct(string s, string t) {\n        return 0;\n    }\n};"
        },
        "function_name": "numDistinct",
        "examples": [
            {"input": "s = \"rabbbit\", t = \"rabbit\"", "output": "3"},
            {"input": "s = \"babgbag\", t = \"bag\"", "output": "5"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "rabbbit", t: "rabbit" }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Interleaving String",
        "description": "Given strings s1, s2, and s3, find whether s3 is formed by an interleaving of s1 and s2. An interleaving of two strings s and t is a configuration where s and t are divided into n and m substrings respectively, such that s = s1 + s2 + ... + sn and t = t1 + t2 + ... + tm, and the interleaving is s1 + t1 + s2 + t2 + ... or t1 + s1 + t2 + s2 + ...",
        "difficulty": "MEDIUM",
        "topics": ["Dynamic Programming", "String"],
        "constraints": ["0 <= s1.length, s2.length <= 100", "0 <= s3.length <= 200", "s3.length == s1.length + s2.length"],
        "hints": ["dp[i][j] means s1[0..i] and s2[0..j] can form s3[0..i+j]."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean isInterleave(String s1, String s2, String s3) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def isInterleave(self, s1: str, s2: str, s3: str) -> bool:\n        pass",
            "javascript": "/**\n * @param {string} s1\n * @param {string} s2\n * @param {string} s3\n * @return {boolean}\n */\nvar isInterleave = function(s1, s2, s3) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool isInterleave(string s1, string s2, string s3) {\n        return false;\n    }\n};"
        },
        "function_name": "isInterleave",
        "examples": [
            {"input": "s1 = \"aabcc\", s2 = \"dbbca\", s3 = \"aadbbcbcac\"", "output": "true"},
            {"input": "s1 = \"aabcc\", s2 = \"dbbca\", s3 = \"aadbbbaccc\"", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s1: "aabcc", s2: "dbbca", s3: "aadbbcbcac" }), "expectedOutput": "true" }
        ]
    },
    {
        "title": "Minimum Path Sum",
        "description": "Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path. You can only move either down or right at any point in time.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Dynamic Programming", "Matrix"],
        "constraints": ["m == grid.length", "n == grid[i].length", "1 <= m, n <= 200", "0 <= grid[i][j] <= 100"],
        "hints": ["dp[i][j] = grid[i][j] + min(dp[i-1][j], dp[i][j-1])."],
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
        "title": "Delete and Earn",
        "description": "You are given an integer array nums. You want to maximize the number of points you get by performing the following operation any number of times: Pick any nums[i] and delete it to earn nums[i] points. Afterwards, you must delete every element equal to nums[i] - 1 and every element equal to nums[i] + 1. Return the maximum number of points you can earn.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Hash Table", "Dynamic Programming"],
        "constraints": ["1 <= nums.length <= 2 * 10^4", "1 <= nums[i] <= 10^4"],
        "hints": ["Reduce to House Robber problem by summing up same values."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int deleteAndEarn(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def deleteAndEarn(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar deleteAndEarn = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int deleteAndEarn(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "deleteAndEarn",
        "examples": [
            {"input": "nums = [3,4,2]", "output": "6"},
            {"input": "nums = [2,2,3,3,3,4]", "output": "9"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [3,4,2] }), "expectedOutput": "6" }
        ]
    }
];
