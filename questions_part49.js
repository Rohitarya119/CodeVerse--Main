module.exports = [
    {
        "title": "Number of Islands",
        "description": "Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "DFS", "BFS", "Union Find", "Matrix"],
        "constraints": ["m == grid.length", "n == grid[i].length", "1 <= m, n <= 300"],
        "hints": ["Visit each cell. If '1', increment count and launch BFS/DFS to mark all connected '1's as '0'."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int numIslands(char[][] grid) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def numIslands(self, grid: List[List[str]]) -> int:\n        pass",
            "javascript": "/**\n * @param {character[][]} grid\n * @return {number}\n */\nvar numIslands = function(grid) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int numIslands(vector<vector<char>>& grid) {\n        return 0;\n    }\n};"
        },
        "function_name": "numIslands",
        "examples": [
            {"input": "grid = [[\"1\",\"1\",\"1\",\"1\",\"0\"],[\"1\",\"1\",\"0\",\"1\",\"0\"],[\"1\",\"1\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]", "output": "1"}
        ],
        "testCases": []
    },
    {
        "title": "Rotting Oranges",
        "description": "You are given an m x n grid where each cell can have one of three values: 0 representing an empty cell, 1 representing a fresh orange, or 2 representing a rotten orange. Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten. Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "BFS", "Matrix"],
        "constraints": ["m == grid.length", "n == grid[i].length", "1 <= m, n <= 10"],
        "hints": ["Multi-source BFS. Start BFS from all rotten oranges simultaneously."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int orangesRotting(int[][] grid) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def orangesRotting(self, grid: List[List[int]]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[][]} grid\n * @return {number}\n */\nvar orangesRotting = function(grid) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int orangesRotting(vector<vector<int>>& grid) {\n        return 0;\n    }\n};"
        },
        "function_name": "orangesRotting",
        "examples": [
            {"input": "grid = [[2,1,1],[1,1,0],[0,1,1]]", "output": "4"},
            {"input": "grid = [[2,1,1],[0,1,1],[1,0,1]]", "output": "-1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ grid: [[2,1,1],[1,1,0],[0,1,1]] }), "expectedOutput": "4" }
        ]
    },
    {
        "title": "Clone Graph",
        "description": "Given a reference of a node in a connected undirected graph. Return a deep copy (clone) of the graph. Each node in the graph contains a value (int) and a list (List[Node]) of its neighbors.",
        "difficulty": "MEDIUM",
        "topics": ["Hash Table", "DFS", "BFS", "Graph"],
        "constraints": ["The number of nodes in the graph is in the range [0, 100].", "1 <= Node.val <= 100"],
        "hints": ["Use HashMap to store (originalNode -> cloneNode) mapping. DFS/BFS to traverse."],
        "boilerplate_code": {
            "java": "class Solution {\n    public Node cloneGraph(Node node) {\n        return null;\n    }\n}",
            "python": "class Solution:\n    def cloneGraph(self, node: 'Node') -> 'Node':\n        pass",
            "javascript": "/**\n * @param {Node} node\n * @return {Node}\n */\nvar cloneGraph = function(node) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    Node* cloneGraph(Node* node) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "cloneGraph",
        "examples": [
            {"input": "adjList = [[2,4],[1,3],[2,4],[1,3]]", "output": "[[2,4],[1,3],[2,4],[1,3]]"}
        ],
        "testCases": []
    },
    {
        "title": "Surrounded Regions",
        "description": "Given an m x n matrix board containing 'X' and 'O', capture all regions that are 4-directionally surrounded by 'X'. A region is captured by flipping all 'O's into 'X's in that surrounded region.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "DFS", "BFS", "Matrix", "Union Find"],
        "constraints": ["m == board.length", "n == board[i].length", "1 <= m, n <= 200"],
        "hints": ["Start from 'O's on the boundary and mark them as safe. All other 'O's are captured."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void solve(char[][] board) {\n        \n    }\n}",
            "python": "class Solution:\n    def solve(self, board: List[List[str]]) -> None:\n        \"\"\"\n        Do not return anything, modify board in-place.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {character[][]} board\n * @return {void} Do not return anything, modify board in-place.\n */\nvar solve = function(board) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void solve(vector<vector<char>>& board) {\n        \n    }\n};"
        },
        "function_name": "solve",
        "examples": [
            {"input": "board = [[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"O\",\"O\",\"X\"],[\"X\",\"X\",\"O\",\"X\"],[\"X\",\"O\",\"X\",\"X\"]]", "output": "[[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"O\",\"X\",\"X\"]]"}
        ],
        "testCases": []
    },
    {
        "title": "Word Ladder",
        "description": "A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that: Every adjacent pair of words differs by a single letter. Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList. sk == endWord. Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.",
        "difficulty": "HARD",
        "topics": ["Hash Table", "String", "BFS"],
        "constraints": ["1 <= beginWord.length <= 10", "endWord.length == beginWord.length", "1 <= wordList.length <= 5000"],
        "hints": ["BFS to find shortest path. Change one letter at a time."],
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
    }
];
