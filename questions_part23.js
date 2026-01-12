module.exports = [
    {
        "title": "N-Queens",
        "description": "The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other. Given an integer n, return all distinct solutions to the n-queens puzzle. You may return the answer in any order.",
        "difficulty": "HARD",
        "topics": ["Backtracking", "Array"],
        "constraints": ["1 <= n <= 9"],
        "hints": ["Place queens row by row.", "Use arrays/sets to keep track of occupied columns and diagonals."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<String>> solveNQueens(int n) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def solveNQueens(self, n: int) -> List[List[str]]:\n        pass",
            "javascript": "/**\n * @param {number} n\n * @return {string[][]}\n */\nvar solveNQueens = function(n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<string>> solveNQueens(int n) {\n        return {};\n    }\n};"
        },
        "function_name": "solveNQueens",
        "examples": [
            {"input": "n = 4", "output": "[[\".Q..\",\"...Q\",\"Q...\",\"..Q.\"],[\"..Q.\",\"Q...\",\"...Q\",\".Q..\"]]"},
            {"input": "n = 1", "output": "[[\"Q\"]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ n: 4 }), "expectedOutput": "[[\".Q..\",\"...Q\",\"Q...\",\"..Q.\"],[\"..Q.\",\"Q...\",\"...Q\",\".Q..\"]]" }
        ]
    },
    {
        "title": "Sudoku Solver",
        "description": "Write a program to solve a Sudoku puzzle by filling the empty cells. A sudoku solution must satisfy all of the following rules: Each of the digits 1-9 must occur exactly once in each row. Each of the digits 1-9 must occur exactly once in each column. Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid. The '.' character indicates empty cells.",
        "difficulty": "HARD",
        "topics": ["Array", "Backtracking", "Matrix"],
        "constraints": ["board.length == 9", "board[i].length == 9", "board[i][j] is a digit or '.'."],
        "hints": ["Try filling a cell with 1-9 and recursively check if it leads to a solution.", "Backtrack if valid number is not found."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void solveSudoku(char[][] board) {\n        \n    }\n}",
            "python": "class Solution:\n    def solveSudoku(self, board: List[List[str]]) -> None:\n        \"\"\"\n        Do not return anything, modify board in-place.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {character[][]} board\n * @return {void} Do not return anything, modify board in-place.\n */\nvar solveSudoku = function(board) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void solveSudoku(vector<vector<char>>& board) {\n        \n    }\n};"
        },
        "function_name": "solveSudoku",
        "examples": [
            {"input": "board = [[\"5\",\"3\",\".\",\".\",\"7\",\".\",\".\",\".\",\".\"],...]", "output": "[[\"5\",\"3\",\"4\",\"6\",\"7\",\"8\",\"9\",\"1\",\"2\"],...]"}
        ],
        "testCases": []
    },
    {
        "title": "Permutations",
        "description": "Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Backtracking"],
        "constraints": ["1 <= nums.length <= 6", "-10 <= nums[i] <= 10", "All the integers of nums are unique."],
        "hints": ["Use backtracking to swap elements.", "Or build permutations by adding one element at a time."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<Integer>> permute(int[] nums) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def permute(self, nums: List[int]) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number[][]}\n */\nvar permute = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> permute(vector<int>& nums) {\n        return {};\n    }\n};"
        },
        "function_name": "permute",
        "examples": [
            {"input": "nums = [1,2,3]", "output": "[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]"},
            {"input": "nums = [0,1]", "output": "[[0,1],[1,0]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [0,1] }), "expectedOutput": "[[0,1],[1,0]]" }
        ]
    },
    {
        "title": "Subsets",
        "description": "Given an integer array nums of unique elements, return all possible subsets (the power set). The solution set must not contain duplicate subsets. Return the solution in any order.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Backtracking", "Bit Manipulation"],
        "constraints": ["1 <= nums.length <= 10", "-10 <= nums[i] <= 10", "All the numbers of nums are unique."],
        "hints": ["For each element, there are 2 choices: include or exclude.", "Backtracking or Bitmasking (0 to 2^n - 1)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<Integer>> subsets(int[] nums) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def subsets(self, nums: List[int]) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number[][]}\n */\nvar subsets = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> subsets(vector<int>& nums) {\n        return {};\n    }\n};"
        },
        "function_name": "subsets",
        "examples": [
            {"input": "nums = [1,2,3]", "output": "[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]"},
            {"input": "nums = [0]", "output": "[[],[0]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [0] }), "expectedOutput": "[[],[0]]" }
        ]
    },
    {
        "title": "Word Search",
        "description": "Given an m x n grid of characters board and a string word, return true if word exists in the grid. The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Backtracking", "Matrix"],
        "constraints": ["m == board.length", "n = board[i].length", "1 <= m, n <= 6", "1 <= word.length <= 15"],
        "hints": ["Start DFS from every cell ensuring it matches the first char of word.", "Mark visited cells to avoid cycles."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean exist(char[][] board, String word) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def exist(self, board: List[List[str]], word: str) -> bool:\n        pass",
            "javascript": "/**\n * @param {character[][]} board\n * @param {string} word\n * @return {boolean}\n */\nvar exist = function(board, word) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool exist(vector<vector<char>>& board, string word) {\n        return false;\n    }\n};"
        },
        "function_name": "exist",
        "examples": [
            {"input": "board = [[\"A\",\"B\",\"C\",\"E\"],[\"S\",\"F\",\"C\",\"S\"],[\"A\",\"D\",\"E\",\"E\"]], word = \"ABCCED\"", "output": "true"},
            {"input": "board = [[\"A\",\"B\",\"C\",\"E\"],[\"S\",\"F\",\"C\",\"S\"],[\"A\",\"D\",\"E\",\"E\"]], word = \"SEE\"", "output": "true"}
        ],
        "testCases": [
            { "input": JSON.stringify({ board: [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word: "ABCCED" }), "expectedOutput": "true" }
        ]
    }
];
