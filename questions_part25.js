module.exports = [
    {
        "title": "Palindrome Partitioning",
        "description": "Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Dynamic Programming", "Backtracking"],
        "constraints": ["1 <= s.length <= 16", "s contains only lowercase English letters."],
        "hints": ["Backtracking with DP to check palindrome efficiently."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<String>> partition(String s) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def partition(self, s: str) -> List[List[str]]:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {string[][]}\n */\nvar partition = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<string>> partition(string s) {\n        return {};\n    }\n};"
        },
        "function_name": "partition",
        "examples": [
            {"input": "s = \"aab\"", "output": "[[\"a\",\"a\",\"b\"],[\"aa\",\"b\"]]"},
            {"input": "s = \"a\"", "output": "[[\"a\"]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "aab" }), "expectedOutput": "[[\"a\",\"a\",\"b\"],[\"aa\",\"b\"]]" }
        ]
    },
    {
        "title": "Target Sum",
        "description": "You are given an integer array nums and an integer target. You want to build an expression out of nums by adding one of the symbols '+' and '-' before each integer in nums and then concatenate all the integers. Return the number of different expressions that you can build, which evaluates to target.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Dynamic Programming", "Backtracking"],
        "constraints": ["1 <= nums.length <= 20", "0 <= nums[i] <= 1000", "0 <= sum(nums[i]) <= 1000", "-1000 <= target <= 1000"],
        "hints": ["This is a Subset Sum variant: Find a subset P (positive) and N (negative) such that sum(P) - sum(N) = target.", "Transform to: sum(P) = (target + sum(nums)) / 2."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int findTargetSumWays(int[] nums, int target) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def findTargetSumWays(self, nums: List[int], target: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar findTargetSumWays = function(nums, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int findTargetSumWays(vector<int>& nums, int target) {\n        return 0;\n    }\n};"
        },
        "function_name": "findTargetSumWays",
        "examples": [
            {"input": "nums = [1,1,1,1,1], target = 3", "output": "5"},
            {"input": "nums = [1], target = 1", "output": "1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,1,1,1,1], target: 3 }), "expectedOutput": "5" }
        ]
    },
    {
        "title": "Maximal Square",
        "description": "Given an m x n binary matrix filled with 0s and 1s, find the largest square containing only 1s and return its area.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Dynamic Programming", "Matrix"],
        "constraints": ["m == matrix.length", "n == matrix[i].length", "1 <= m, n <= 300", "matrix[i][j] is '0' or '1'."],
        "hints": ["dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1 if matrix[i][j] == '1'."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int maximalSquare(char[][] matrix) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def maximalSquare(self, matrix: List[List[str]]) -> int:\n        pass",
            "javascript": "/**\n * @param {character[][]} matrix\n * @return {number}\n */\nvar maximalSquare = function(matrix) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int maximalSquare(vector<vector<char>>& matrix) {\n        return 0;\n    }\n};"
        },
        "function_name": "maximalSquare",
        "examples": [
            {"input": "matrix = [[\"1\",\"0\",\"1\",\"0\",\"0\"],[\"1\",\"0\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"0\",\"0\",\"1\",\"0\"]]", "output": "4"},
            {"input": "matrix = [[\"0\",\"1\"],[\"1\",\"0\"]]", "output": "1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ matrix: [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]] }), "expectedOutput": "4" }
        ]
    },
    {
        "title": "Letter Combinations of a Phone Number",
        "description": "Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Backtracking", "Hash Table"],
        "constraints": ["0 <= digits.length <= 4", "digits[i] is a digit in the range ['2', '9']."],
        "hints": ["Backtracking: Iterate through letters for current digit and recurse."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<String> letterCombinations(String digits) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def letterCombinations(self, digits: str) -> List[str]:\n        pass",
            "javascript": "/**\n * @param {string} digits\n * @return {string[]}\n */\nvar letterCombinations = function(digits) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<string> letterCombinations(string digits) {\n        return {};\n    }\n};"
        },
        "function_name": "letterCombinations",
        "examples": [
            {"input": "digits = \"23\"", "output": "[\"ad\",\"ae\",\"af\",\"bd\",\"be\",\"bf\",\"cd\",\"ce\",\"cf\"]"},
            {"input": "digits = \"\"", "output": "[]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ digits: "23" }), "expectedOutput": "[\"ad\",\"ae\",\"af\",\"bd\",\"be\",\"bf\",\"cd\",\"ce\",\"cf\"]" }
        ]
    },
    {
        "title": "Decode Ways",
        "description": "A message containing letters from A-Z can be encoded into numbers using the following mapping: 'A' -> \"1\", 'B' -> \"2\", ... 'Z' -> \"26\". To decode an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above. Given a string s containing only digits, return the number of ways to decode it.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Dynamic Programming"],
        "constraints": ["1 <= s.length <= 100", "s contains only digits and may contain leading zero(s)."],
        "hints": ["dp[i] = dp[i-1] (if single digit valid) + dp[i-2] (if two digits valid).", "Watch out for '0'."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int numDecodings(String s) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def numDecodings(self, s: str) -> int:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {number}\n */\nvar numDecodings = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int numDecodings(string s) {\n        return 0;\n    }\n};"
        },
        "function_name": "numDecodings",
        "examples": [
            {"input": "s = \"12\"", "output": "2"},
            {"input": "s = \"226\"", "output": "3"},
            {"input": "s = \"06\"", "output": "0"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "12" }), "expectedOutput": "2" }
        ]
    }
];
