module.exports = [
    {
        "title": "Climbing Stairs",
        "description": "You are climbing a staircase. It takes n steps to reach the top. Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?",
        "difficulty": "EASY",
        "topics": ["Dynamic Programming", "Math"],
        "constraints": ["1 <= n <= 45"],
        "hints": ["This is a classic Fibonacci sequence problem.", "dp[i] = dp[i-1] + dp[i-2]"],
        "boilerplate_code": {
            "java": "class Solution {\n    public int climbStairs(int n) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def climbStairs(self, n: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number} n\n * @return {number}\n */\nvar climbStairs = function(n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int climbStairs(int n) {\n        return 0;\n    }\n};"
        },
        "function_name": "climbStairs",
        "examples": [
            {"input": "n = 2", "output": "2"},
            {"input": "n = 3", "output": "3"}
        ],
        "testCases": [
            { "input": JSON.stringify({ n: 2 }), "expectedOutput": "2" },
            { "input": JSON.stringify({ n: 3 }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "House Robber",
        "description": "You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night. Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Dynamic Programming"],
        "constraints": ["1 <= nums.length <= 100", "0 <= nums[i] <= 400"],
        "hints": ["dp[i] = max(dp[i-1], dp[i-2] + nums[i])"],
        "boilerplate_code": {
            "java": "class Solution {\n    public int rob(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def rob(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar rob = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int rob(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "rob",
        "examples": [
            {"input": "nums = [1,2,3,1]", "output": "4"},
            {"input": "nums = [2,7,9,3,1]", "output": "12"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,2,3,1] }), "expectedOutput": "4" }
        ]
    },
    {
        "title": "Longest Increasing Subsequence",
        "description": "Given an integer array nums, return the length of the longest strictly increasing subsequence.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search", "Dynamic Programming"],
        "constraints": ["1 <= nums.length <= 2500", "-10^4 <= nums[i] <= 10^4"],
        "hints": ["O(n^2) DP: dp[i] = max(dp[j]) + 1 for j < i and nums[j] < nums[i].", "O(n log n) using patience sorting/binary search."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int lengthOfLIS(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def lengthOfLIS(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar lengthOfLIS = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int lengthOfLIS(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "lengthOfLIS",
        "examples": [
            {"input": "nums = [10,9,2,5,3,7,101,18]", "output": "4"},
            {"input": "nums = [0,1,0,3,2,3]", "output": "4"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [10,9,2,5,3,7,101,18] }), "expectedOutput": "4" }
        ]
    },
    {
        "title": "Longest Common Subsequence",
        "description": "Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Dynamic Programming"],
        "constraints": ["1 <= text1.length, text2.length <= 1000", "text1 and text2 consist of only lowercase English characters."],
        "hints": ["2D DP array where dp[i][j] is LCS of text1[0..i] and text2[0..j].", "If chars match, 1 + dp[i-1][j-1]. Else max(dp[i-1][j], dp[i][j-1])."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int longestCommonSubsequence(String text1, String text2) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def longestCommonSubsequence(self, text1: str, text2: str) -> int:\n        pass",
            "javascript": "/**\n * @param {string} text1\n * @param {string} text2\n * @return {number}\n */\nvar longestCommonSubsequence = function(text1, text2) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int longestCommonSubsequence(string text1, string text2) {\n        return 0;\n    }\n};"
        },
        "function_name": "longestCommonSubsequence",
        "examples": [
            {"input": "text1 = \"abcde\", text2 = \"ace\"", "output": "3"},
            {"input": "text1 = \"abc\", text2 = \"abc\"", "output": "3"}
        ],
        "testCases": [
            { "input": JSON.stringify({ text1: "abcde", text2: "ace" }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Coin Change",
        "description": "You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money. Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Dynamic Programming", "BFS"],
        "constraints": ["1 <= coins.length <= 12", "1 <= coins[i] <= 2^31 - 1", "0 <= amount <= 10^4"],
        "hints": ["dp[i] = min(dp[i], dp[i - coin] + 1) for each coin."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int coinChange(int[] coins, int amount) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def coinChange(self, coins: List[int], amount: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} coins\n * @param {number} amount\n * @return {number}\n */\nvar coinChange = function(coins, amount) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int coinChange(vector<int>& coins, int amount) {\n        return -1;\n    }\n};"
        },
        "function_name": "coinChange",
        "examples": [
            {"input": "coins = [1,2,5], amount = 11", "output": "3"},
            {"input": "coins = [2], amount = 3", "output": "-1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ coins: [1,2,5], amount: 11 }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Edit Distance",
        "description": "Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2. You have the following three operations permitted on a word: Insert a character, Delete a character, Replace a character.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Dynamic Programming"],
        "constraints": ["0 <= word1.length, word2.length <= 500"],
        "hints": ["2D DP. dp[i][j] is min operations for word1[0..i] to word2[0..j].", "If chars are same, dp[i-1][j-1]. Else 1 + min(insert, delete, replace)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int minDistance(String word1, String word2) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def minDistance(self, word1: str, word2: str) -> int:\n        pass",
            "javascript": "/**\n * @param {string} word1\n * @param {string} word2\n * @return {number}\n */\nvar minDistance = function(word1, word2) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int minDistance(string word1, string word2) {\n        return 0;\n    }\n};"
        },
        "function_name": "minDistance",
        "examples": [
            {"input": "word1 = \"horse\", word2 = \"ros\"", "output": "3"},
            {"input": "word1 = \"intention\", word2 = \"execution\"", "output": "5"}
        ],
        "testCases": [
            { "input": JSON.stringify({ word1: "horse", word2: "ros" }), "expectedOutput": "3" }
        ]
    }
];
