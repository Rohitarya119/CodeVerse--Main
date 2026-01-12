module.exports = [
    {
        "title": "Matrix Chain Multiplication",
        "description": "Given a sequence of matrices, find the most efficient way to multiply these matrices together. The problem is not actually to perform the multiplications, but merely to decide in which order to perform the multiplications.",
        "difficulty": "MEDIUM",
        "topics": ["Dynamic Programming"],
        "constraints": ["1 <= N <= 100", "arr[i] is dimension."],
        "hints": ["Gap strategy DP.", "dp[i][j] = min(dp[i][k] + dp[k+1][j] + cost)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int matrixMultiplication(int N, int arr[]) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def matrixMultiplication(self, N: int, arr: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number} N\n * @param {number[]} arr\n * @return {number}\n */\nvar matrixMultiplication = function(N, arr) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int matrixMultiplication(int N, int arr[]) {\n        return 0;\n    }\n};"
        },
        "function_name": "matrixMultiplication",
        "examples": [
            {"input": "N = 5, arr = [40, 20, 30, 10, 30]", "output": "26000"}
        ],
        "testCases": []
    },
    {
        "title": "Egg Dropping Puzzle",
        "description": "You are given `k` eggs and `n` floors. Determine the minimum number of moves (drops) required to confirm the critical floor `f` (0 <= f <= n) from which the egg breaks, in the worst case.",
        "difficulty": "HARD",
        "topics": ["Dynamic Programming", "Math", "Binary Search"],
        "constraints": ["1 <= k <= 100", "1 <= n <= 10^4"],
        "hints": ["dp[moves][eggs] >= floors.", "Binary search on moves."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int superEggDrop(int k, int n) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def superEggDrop(self, k: int, n: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number} k\n * @param {number} n\n * @return {number}\n */\nvar superEggDrop = function(k, n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int superEggDrop(int k, int n) {\n        return 0;\n    }\n};"
        },
        "function_name": "superEggDrop",
        "examples": [
            {"input": "k = 1, n = 2", "output": "2"},
            {"input": "k = 2, n = 6", "output": "3"}
        ],
        "testCases": [
            { "input": JSON.stringify({ k: 1, n: 2 }), "expectedOutput": "2" }
        ]
    },
    {
        "title": "Palindrome Partitioning II",
        "description": "Given a string s, partition s such that every substring of the partition is a palindrome. Return the minimum cuts needed for a palindrome partitioning of s.",
        "difficulty": "HARD",
        "topics": ["Dynamic Programming", "String"],
        "constraints": ["1 <= s.length <= 2000"],
        "hints": ["dp[i] = min cuts for s[0..i].", "Precompute palindromes."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int minCut(String s) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def minCut(self, s: str) -> int:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {number}\n */\nvar minCut = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int minCut(string s) {\n        return 0;\n    }\n};"
        },
        "function_name": "minCut",
        "examples": [
            {"input": "s = \"aab\"", "output": "1"},
            {"input": "s = \"a\"", "output": "0"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "aab" }), "expectedOutput": "1" }
        ]
    },
    {
        "title": "Minimum Falling Path Sum",
        "description": "Given an n x n array of integers matrix, return the minimum sum of any falling path through matrix. A falling path starts at any element in the first row and chooses the element in the next row that is either directly below or diagonally left/right. Specifically, the next element from position (row, col) will be (row + 1, col - 1), (row + 1, col), or (row + 1, col + 1).",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Dynamic Programming", "Matrix"],
        "constraints": ["n == matrix.length == matrix[i].length", "1 <= n <= 100", "-100 <= matrix[i][j] <= 100"],
        "hints": ["dp[i][j] = matrix[i][j] + min(dp[i-1][j-1], dp[i-1][j], dp[i-1][j+1])."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int minFallingPathSum(int[][] matrix) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def minFallingPathSum(self, matrix: List[List[int]]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[][]} matrix\n * @return {number}\n */\nvar minFallingPathSum = function(matrix) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int minFallingPathSum(vector<vector<int>>& matrix) {\n        return 0;\n    }\n};"
        },
        "function_name": "minFallingPathSum",
        "examples": [
            {"input": "matrix = [[2,1,3],[6,5,4],[7,8,9]]", "output": "13"},
            {"input": "matrix = [[-19,57],[-40,-5]]", "output": "-59"}
        ],
        "testCases": [
            { "input": JSON.stringify({ matrix: [[2,1,3],[6,5,4],[7,8,9]] }), "expectedOutput": "13" }
        ]
    },
    {
        "title": "Cherry Pickup",
        "description": "You are given an n x n grid representing a field of cherries, each cell is one of the following: 0: empty cell, 1: cherry, -1: thorn/obstacle. Your task is to collect maximum cherries by going from (0,0) to (n-1, n-1) and back to (0,0) without using thorns.",
        "difficulty": "HARD",
        "topics": ["Array", "Dynamic Programming", "Matrix"],
        "constraints": ["n == grid.length", "1 <= n <= 50"],
        "hints": ["Think of two people starting from (0,0) sumultaneously.", "dp[r1][c1][c2] max cherries."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int cherryPickup(int[][] grid) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def cherryPickup(self, grid: List[List[int]]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[][]} grid\n * @return {number}\n */\nvar cherryPickup = function(grid) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int cherryPickup(vector<vector<int>>& grid) {\n        return 0;\n    }\n};"
        },
        "function_name": "cherryPickup",
        "examples": [
            {"input": "grid = [[0,1,-1],[1,0,-1],[1,1,1]]", "output": "5"}
        ],
        "testCases": [
            { "input": JSON.stringify({ grid: [[0,1,-1],[1,0,-1],[1,1,1]] }), "expectedOutput": "5" }
        ]
    }
];
