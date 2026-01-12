module.exports = [
    {
        "title": "Partition Equal Subset Sum",
        "description": "Given an integer array nums, return true if you can partition the array into two subsets such that the sum of the elements in both subsets is equal or false otherwise.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Dynamic Programming"],
        "constraints": ["1 <= nums.length <= 200", "1 <= nums[i] <= 100"],
        "hints": ["This is a 0/1 Knapsack problem variant.", "Target sum is sum(nums) / 2."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean canPartition(int[] nums) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def canPartition(self, nums: List[int]) -> bool:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {boolean}\n */\nvar canPartition = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool canPartition(vector<int>& nums) {\n        return false;\n    }\n};"
        },
        "function_name": "canPartition",
        "examples": [
            {"input": "nums = [1,5,11,5]", "output": "true"},
            {"input": "nums = [1,2,3,5]", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,5,11,5] }), "expectedOutput": "true" }
        ]
    },
    {
        "title": "Generate Parentheses",
        "description": "Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Dynamic Programming", "Backtracking"],
        "constraints": ["1 <= n <= 8"],
        "hints": ["Backtracking: keep count of open and close brackets.", "Add ')' only if close < open."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<String> generateParenthesis(int n) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def generateParenthesis(self, n: int) -> List[str]:\n        pass",
            "javascript": "/**\n * @param {number} n\n * @return {string[]}\n */\nvar generateParenthesis = function(n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<string> generateParenthesis(int n) {\n        return {};\n    }\n};"
        },
        "function_name": "generateParenthesis",
        "examples": [
            {"input": "n = 3", "output": "[\"((()))\",\"(()())\",\"(())()\",\"()(())\",\"()()()\"]"},
            {"input": "n = 1", "output": "[\"()\"]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ n: 1 }), "expectedOutput": "[\"()\"]" }
        ]
    },
    {
        "title": "Wildcard Matching",
        "description": "Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*'. '?' Matches any single character. '*' Matches any sequence of characters (including the empty sequence). The matching should cover the entire input string (not partial).",
        "difficulty": "HARD",
        "topics": ["String", "Dynamic Programming", "Greedy", "Recursion"],
        "constraints": ["0 <= s.length, p.length <= 2000", "s contains only lowercase English letters.", "p contains only lowercase English letters, '?' or '*'."],
        "hints": ["DP: dp[i][j] is true if s[0..i] matches p[0..j].", "If p[j] == '*', it matches empty sequence or any sequence."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean isMatch(String s, String pattern) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def isMatch(self, s: str, p: str) -> bool:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @param {string} p\n * @return {boolean}\n */\nvar isMatch = function(s, p) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool isMatch(string s, string p) {\n        return false;\n    }\n};"
        },
        "function_name": "isMatch",
        "examples": [
            {"input": "s = \"aa\", p = \"a\"", "output": "false"},
            {"input": "s = \"aa\", p = \"*\"", "output": "true"},
            {"input": "s = \"cb\", p = \"?a\"", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "aa", p: "*" }), "expectedOutput": "true" }
        ]
    },
    {
        "title": "Best Time to Buy and Sell Stock III",
        "description": "You are given an array prices where prices[i] is the price of a given stock on the ith day. Find the maximum profit you can achieve. You may complete at most two transactions. Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).",
        "difficulty": "HARD",
        "topics": ["Array", "Dynamic Programming"],
        "constraints": ["1 <= prices.length <= 10^5", "0 <= prices[i] <= 10^5"],
        "hints": ["Use 4 variables: buy1, sell1, buy2, sell2.", "Or DP state: dp[k][i] max profit with k transactions up to day i."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int maxProfit(int[] prices) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def maxProfit(self, prices: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} prices\n * @return {number}\n */\nvar maxProfit = function(prices) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int maxProfit(vector<int>& prices) {\n        return 0;\n    }\n};"
        },
        "function_name": "maxProfit",
        "examples": [
            {"input": "prices = [3,3,5,0,0,3,1,4]", "output": "6"},
            {"input": "prices = [1,2,3,4,5]", "output": "4"}
        ],
        "testCases": [
            { "input": JSON.stringify({ prices: [3,3,5,0,0,3,1,4] }), "expectedOutput": "6" }
        ]
    },
    {
        "title": "Combination Sum",
        "description": "Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order. The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Backtracking"],
        "constraints": ["1 <= candidates.length <= 30", "2 <= candidates[i] <= 40", "All elements of candidates are distinct.", "1 <= target <= 40"],
        "hints": ["Backtracking: At each step, choose a candidate.", "Allow reusing the same candidate index."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<Integer>> combinationSum(int[] candidates, int target) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {number[]} candidates\n * @param {number} target\n * @return {number[][]}\n */\nvar combinationSum = function(candidates, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> combinationSum(vector<int>& candidates, int target) {\n        return {};\n    }\n};"
        },
        "function_name": "combinationSum",
        "examples": [
            {"input": "candidates = [2,3,6,7], target = 7", "output": "[[2,2,3],[7]]"},
            {"input": "candidates = [2,3,5], target = 8", "output": "[[2,2,2,2],[2,3,3],[3,5]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ candidates: [2,3,6,7], target: 7 }), "expectedOutput": "[[2,2,3],[7]]" }
        ]
    }
];
