module.exports = [
    {
        "title": "Word Ladder",
        "description": "A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that every adjacent pair differs by a single letter. Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.",
        "difficulty": "HARD",
        "topics": ["Hash Table", "String", "BFS"],
        "constraints": ["1 <= beginWord.length <= 10", "endWord.length == beginWord.length", "1 <= wordList.length <= 5000"],
        "hints": ["Standard BFS for shortest path in an unweighted graph.", "Preprocess wordList to efficiently find neighbors."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int ladderLength(String beginWord, String endWord, List<String> wordList) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:\n        pass",
            "javascript": "/**\n * @param {string} beginWord\n * @param {string} endWord\n * @param {string[]} wordList\n * @return {number}\n */\nvar ladderLength = function(beginWord, endWord, wordList) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int ladderLength(string beginWord, string endWord, vector<string>& wordList) {\n        return 0;\n    }\n};"
        },
        "function_name": "ladderLength",
        "examples": [
            {"input": "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\"]", "output": "5"},
            {"input": "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\"]", "output": "0"}
        ],
        "testCases": [
            { "input": JSON.stringify({ beginWord: "hit", endWord: "cog", wordList: ["hot","dot","dog","lot","log","cog"] }), "expectedOutput": "5" }
        ]
    },
    {
        "title": "Sliding Puzzle",
        "description": "On an 2 x 3 board, there are five tiles labeled from 1 to 5, and an empty square represented by 0. A move consists of choosing 0 and a 4-directionally adjacent number and swapping it. The state of the board is solved if: board = [[1,2,3],[4,5,0]]. Return the least number of moves required so that the state of the board is solved. If it is impossible for the state of the board to be solved, return -1.",
        "difficulty": "HARD",
        "topics": ["Array", "BFS", "Matrix"],
        "constraints": ["board.length == 2", "board[i].length == 3", "0 <= board[i][j] <= 5"],
        "hints": ["BFS to find the shortest path to target state [[1,2,3],[4,5,0]].", "Convert 2D board to string for state tracking."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int slidingPuzzle(int[][] board) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def slidingPuzzle(self, board: List[List[int]]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[][]} board\n * @return {number}\n */\nvar slidingPuzzle = function(board) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int slidingPuzzle(vector<vector<int>>& board) {\n        return -1;\n    }\n};"
        },
        "function_name": "slidingPuzzle",
        "examples": [
            {"input": "board = [[1,2,3],[4,0,5]]", "output": "1"},
            {"input": "board = [[1,2,3],[5,4,0]]", "output": "-1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ board: [[1,2,3],[4,0,5]] }), "expectedOutput": "1" }
        ]
    },
    {
        "title": "Snakes and Ladders",
        "description": "You are given an n x n integer matrix board where the cells are labeled from 1 to n^2 in a Boustrophedon style starting from the bottom left of the board (i.e. board[n - 1][0]) and alternating direction each row.  Return the least number of moves required to reach the square n^2. If it is not possible to reach the square, return -1.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "BFS", "Matrix"],
        "constraints": ["n == board.length == board[i].length", "2 <= n <= 20", "board[i][j] is either -1 or an integer in the range [1, n^2]."],
        "hints": ["BFS for shortest path from 1 to n^2.", "Map 1D coordinate to 2D grid coordinates."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int snakesAndLadders(int[][] board) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def snakesAndLadders(self, board: List[List[int]]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[][]} board\n * @return {number}\n */\nvar snakesAndLadders = function(board) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int snakesAndLadders(vector<vector<int>>& board) {\n        return -1;\n    }\n};"
        },
        "function_name": "snakesAndLadders",
        "examples": [
            {"input": "board = [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]", "output": "4"}
        ],
        "testCases": [
            { "input": JSON.stringify({ board: [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]] }), "expectedOutput": "4" }
        ]
    },
    {
        "title": "Evaluate Division",
        "description": "You are given an array of variable pairs equations and an array of real numbers values, where equations[i] = [Ai, Bi] and values[i] represent the equation Ai / Bi = values[i]. Each Ai or Bi is a string that represents a single variable. You are also given some queries, where queries[j] = [Cj, Dj] represents the jth query where you must find the answer for Cj / Dj = ?. Return the answers to all queries.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "DFS", "BFS", "Union Find", "Graph"],
        "constraints": ["1 <= equations.length <= 20", "equations[i].length == 2", "1 <= values.length <= 20"],
        "hints": ["Model variables as nodes and equations as weighted edges.", "For query (a, b), find path product from a to b."],
        "boilerplate_code": {
            "java": "class Solution {\n    public double[] calcEquation(List<List<String>> equations, double[] values, List<List<String>> queries) {\n        return new double[]{};\n    }\n}",
            "python": "class Solution:\n    def calcEquation(self, equations: List[List[str]], values: List[float], queries: List[List[str]]) -> List[float]:\n        pass",
            "javascript": "/**\n * @param {string[][]} equations\n * @param {number[]} values\n * @param {string[][]} queries\n * @return {number[]}\n */\nvar calcEquation = function(equations, values, queries) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<double> calcEquation(vector<vector<string>>& equations, vector<double>& values, vector<vector<string>>& queries) {\n        return {};\n    }\n};"
        },
        "function_name": "calcEquation",
        "examples": [
            {"input": "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"c\"],[\"b\",\"a\"],[\"a\",\"e\"],[\"a\",\"a\"],[\"x\",\"x\"]]", "output": "[6.00000,0.50000,-1.00000,1.00000,-1.00000]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ equations: [["a","b"],["b","c"]], values: [2.0,3.0], queries: [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]] }), "expectedOutput": "[6.00000,0.50000,-1.00000,1.00000,-1.00000]" }
        ]
    }
];
