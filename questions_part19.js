module.exports = [
    {
        "title": "Number of Islands",
        "description": "Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "DFS", "BFS", "Union Find", "Matrix"],
        "constraints": ["m == grid.length", "n == grid[i].length", "1 <= m, n <= 300", "grid[i][j] is '0' or '1'."],
        "hints": ["Iterate through the grid. When a '1' is found, increment count and DFS/BFS to mark all connected '1's as visited."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int numIslands(char[][] grid) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def numIslands(self, grid: List[List[str]]) -> int:\n        pass",
            "javascript": "/**\n * @param {character[][]} grid\n * @return {number}\n */\nvar numIslands = function(grid) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int numIslands(vector<vector<char>>& grid) {\n        return 0;\n    }\n};"
        },
        "function_name": "numIslands",
        "examples": [
            {"input": "grid = [[\"1\",\"1\",\"1\",\"1\",\"0\"],[\"1\",\"1\",\"0\",\"1\",\"0\"],[\"1\",\"1\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]", "output": "1"},
            {"input": "grid = [[\"1\",\"1\",\"0\",\"0\",\"0\"],[\"1\",\"1\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"1\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"1\",\"1\"]]", "output": "3"}
        ],
        "testCases": [
            { "input": JSON.stringify({ grid: [["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]] }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Number of Provinces",
        "description": "There are n cities. Some of them are connected, while some are not. If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c. A province is a group of directly or indirectly connected cities and no other cities outside of the group. You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city and the jth city are directly connected, and isConnected[i][j] = 0 otherwise. Return the total number of provinces.",
        "difficulty": "MEDIUM",
        "topics": ["DFS", "BFS", "Union Find", "Graph"],
        "constraints": ["1 <= n <= 200", "n == isConnected.length", "n == isConnected[i].length", "isConnected[i][j] is 0 or 1.", "isConnected[i][i] == 1", "isConnected[i][j] == isConnected[j][i]"],
        "hints": ["This is finding the number of connected components in a graph.", "Use DFS, BFS, or Union-Find."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int findCircleNum(int[][] isConnected) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def findCircleNum(self, isConnected: List[List[int]]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[][]} isConnected\n * @return {number}\n */\nvar findCircleNum = function(isConnected) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int findCircleNum(vector<vector<int>>& isConnected) {\n        return 0;\n    }\n};"
        },
        "function_name": "findCircleNum",
        "examples": [
            {"input": "isConnected = [[1,1,0],[1,1,0],[0,0,1]]", "output": "2"},
            {"input": "isConnected = [[1,0,0],[0,1,0],[0,0,1]]", "output": "3"}
        ],
        "testCases": [
            { "input": JSON.stringify({ isConnected: [[1,1,0],[1,1,0],[0,0,1]] }), "expectedOutput": "2" }
        ]
    },
    {
        "title": "Rotting Oranges",
        "description": "You are given an m x n grid where each cell can have one of three values: 0 (empty), 1 (fresh orange), 2 (rotten orange). Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten. Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "BFS", "Matrix"],
        "constraints": ["m == grid.length", "n == grid[i].length", "1 <= m, n <= 10"],
        "hints": ["Multi-source BFS. Start BFS from all rotten oranges simultaneously.", "Track level (minutes) and count fresh oranges."],
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
        "title": "01 Matrix / Distance of Nearest Cell Having 0",
        "description": "Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell. The distance between two adjacent cells is 1.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "BFS", "Matrix"],
        "constraints": ["m == mat.length", "n == mat[i].length", "1 <= m, n <= 10^4", "mat[i][j] is either 0 or 1.", "There is at least one 0 in mat."],
        "hints": ["Multi-source BFS starting from all 0s.", "Initialize non-0 cells with infinity (or -1)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[][] updateMatrix(int[][] mat) {\n        return new int[][]{};\n    }\n}",
            "python": "class Solution:\n    def updateMatrix(self, mat: List[List[int]]) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {number[][]} mat\n * @return {number[][]}\n */\nvar updateMatrix = function(mat) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> updateMatrix(vector<vector<int>>& mat) {\n        return {};\n    }\n};"
        },
        "function_name": "updateMatrix",
        "examples": [
            {"input": "mat = [[0,0,0],[0,1,0],[0,0,0]]", "output": "[[0,0,0],[0,1,0],[0,0,0]]"},
            {"input": "mat = [[0,0,0],[0,1,0],[1,1,1]]", "output": "[[0,0,0],[0,1,0],[1,2,1]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ mat: [[0,0,0],[0,1,0],[1,1,1]] }), "expectedOutput": "[[0,0,0],[0,1,0],[1,2,1]]" }
        ]
    },
    {
        "title": "Clone Graph",
        "description": "Given a reference of a node in a connected undirected graph. Return a deep copy (clone) of the graph.",
        "difficulty": "MEDIUM",
        "topics": ["Hash Table", "DFS", "BFS", "Graph"],
        "constraints": ["The number of nodes in the graph is in the range [0, 100].", "1 <= Node.val <= 100", "Node.val is unique for each node."],
        "hints": ["Use a HashMap to map original nodes to their clones.", "DFS or BFS to traverse and clone."],
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
        "testCases": [
            { "input": JSON.stringify({ adjList: [[2,4],[1,3],[2,4],[1,3]] }), "expectedOutput": "[[2,4],[1,3],[2,4],[1,3]]" }
        ]
    },
    {
        "title": "Is Graph Bipartite?",
        "description": "There is an undirected graph with n nodes, where each node is numbered between 0 and n - 1. You are given a 2D array graph, where graph[u] is an array of nodes that node u is adjacent to. Return true if and only if it is bipartite.",
        "difficulty": "MEDIUM",
        "topics": ["DFS", "BFS", "Graph", "Union Find"],
        "constraints": ["graph.length == n", "1 <= n <= 100", "0 <= graph[u].length < n", "graph[u] does not contain u."],
        "hints": ["Try to color the graph with 2 colors using BFS or DFS.", "If you meet a node that is already colored with the same color as current, traverse fails."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean isBipartite(int[][] graph) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def isBipartite(self, graph: List[List[int]]) -> bool:\n        pass",
            "javascript": "/**\n * @param {number[][]} graph\n * @return {boolean}\n */\nvar isBipartite = function(graph) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool isBipartite(vector<vector<int>>& graph) {\n        return false;\n    }\n};"
        },
        "function_name": "isBipartite",
        "examples": [
            {"input": "graph = [[1,2,3],[0,2],[0,1,3],[0,2]]", "output": "false"},
            {"input": "graph = [[1,3],[0,2],[1,3],[0,2]]", "output": "true"}
        ],
        "testCases": [
            { "input": JSON.stringify({ graph: [[1,2,3],[0,2],[0,1,3],[0,2]] }), "expectedOutput": "false" }
        ]
    }
];
