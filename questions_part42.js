module.exports = [
    {
        "title": "Redundant Connection",
        "description": "In this problem, a tree is an undirected graph that is connected and has no cycles. You are given a graph that started as a tree with n nodes labeled from 1 to n, with one additional edge added. The added edge has two different vertices chosen from 1 to n, and was not an edge that already existed. The graph is represented as an array edges of length n where edges[i] = [ai, bi] indicates that there is an edge between nodes ai and bi in the graph. Return an edge that can be removed so that the resulting graph is a tree of n nodes. If there are multiple answers, return the answer that occurs last in the input.",
        "difficulty": "MEDIUM",
        "topics": ["Graph", "Union Find", "DFS", "BFS"],
        "constraints": ["n == edges.length", "3 <= n <= 1000", "edges[i].length == 2", "1 <= ai < bi <= n", "ai != bi", "There are no repeated edges."],
        "hints": ["Use Union-Find. Iterate edges; if u and v are already connected, this is the redundant edge."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] findRedundantConnection(int[][] edges) {\n        return new int[]{};\n    }\n}",
            "python": "class Solution:\n    def findRedundantConnection(self, edges: List[List[int]]) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[][]} edges\n * @return {number[]}\n */\nvar findRedundantConnection = function(edges) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> findRedundantConnection(vector<vector<int>>& edges) {\n        return {};\n    }\n};"
        },
        "function_name": "findRedundantConnection",
        "examples": [
            {"input": "edges = [[1,2],[1,3],[2,3]]", "output": "[2,3]"},
            {"input": "edges = [[1,2],[2,3],[3,4],[1,4],[1,5]]", "output": "[1,4]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ edges: [[1,2],[1,3],[2,3]] }), "expectedOutput": "[2,3]" }
        ]
    },
    {
        "title": "Accounts Merge",
        "description": "Given a list of accounts where each element accounts[i] is a list of strings, where the first element accounts[i][0] is a name, and the rest of the elements are emails representing emails of the account. Now, we would like to merge these accounts. Two accounts definitely belong to the same person if there is some common email to both accounts. Note that even if two accounts have the same name, they may belong to different people as people could have the same name. A person can have any number of accounts initially, but all of their accounts definitely have the same name. After merging the accounts, return the accounts in the following format: the first element of each account is the name, and the rest of the elements are emails in sorted order. The accounts themselves can be returned in any order.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "String", "Union Find", "DFS"],
        "constraints": ["1 <= accounts.length <= 1000", "2 <= accounts[i].length <= 10", "1 <= accounts[i][j].length <= 30", "accounts[i][0] consists of English letters.", "accounts[i][j] (for j > 0) is a valid email."],
        "hints": ["Use Union-Find on emails. Map each email to an ID."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<String>> accountsMerge(List<List<String>> accounts) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def accountsMerge(self, accounts: List[List[str]]) -> List[List[str]]:\n        pass",
            "javascript": "/**\n * @param {string[][]} accounts\n * @return {string[][]}\n */\nvar accountsMerge = function(accounts) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<string>> accountsMerge(vector<vector<string>>& accounts) {\n        return {};\n    }\n};"
        },
        "function_name": "accountsMerge",
        "examples": [
            {"input": "accounts = [[\"John\",\"johnsmith@mail.com\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\",\"john00@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]", "output": "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]"}
        ],
        "testCases": []
    },
    {
        "title": "Number of Operations to Make Network Connected",
        "description": "There are n computers numbered from 0 to n - 1 connected by ethernet cables connections forming a network where connections[i] = [ai, bi] represents a connection between computers ai and bi. Any computer can reach any other computer directly or indirectly through the network. You are given an initial computer network connections. You can extract certain cables between two directly connected computers, and place them between any pair of disconnected computers to make them directly connected. Return the minimum number of times you need to do this in order to make all the computers connected. If it is not possible, return -1.",
        "difficulty": "MEDIUM",
        "topics": ["DFS", "BFS", "Union Find", "Graph"],
        "constraints": ["1 <= n <= 10^5", "1 <= connections.length <= min(n * (n - 1) / 2, 10^5)"],
        "hints": ["If connections < n-1, return -1.", "Otherwise, find number of connected components C. Answer is C - 1."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int makeConnected(int n, int[][] connections) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def makeConnected(self, n: int, connections: List[List[int]]) -> int:\n        pass",
            "javascript": "/**\n * @param {number} n\n * @param {number[][]} connections\n * @return {number}\n */\nvar makeConnected = function(n, connections) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int makeConnected(int n, vector<vector<int>>& connections) {\n        return 0;\n    }\n};"
        },
        "function_name": "makeConnected",
        "examples": [
            {"input": "n = 4, connections = [[0,1],[0,2],[1,2]]", "output": "1"},
            {"input": "n = 6, connections = [[0,1],[0,2],[0,3],[1,2],[1,3]]", "output": "2"}
        ],
        "testCases": [
            { "input": JSON.stringify({ n: 4, connections: [[0,1],[0,2],[1,2]] }), "expectedOutput": "1" }
        ]
    },
    {
        "title": "Smallest String With Swaps",
        "description": "You are given a string s, and an array of pairs of indices in the string pairs where pairs[i] = [a, b] indicates 2 indices(0-indexed) of the string. You can swap the characters at any pair of indices in the given pairs any number of times. Return the lexicographically smallest string that s can be changed to after using the swaps.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "String", "Union Find", "Graph"],
        "constraints": ["1 <= s.length <= 10^5", "0 <= pairs.length <= 10^5"],
        "hints": ["Union-Find to group indices that can be swapped.", "For each group, collect characters, sort them, and place them back in sorted indices."],
        "boilerplate_code": {
            "java": "class Solution {\n    public String smallestStringWithSwaps(String s, List<List<Integer>> pairs) {\n        return \"\";\n    }\n}",
            "python": "class Solution:\n    def smallestStringWithSwaps(self, s: str, pairs: List[List[int]]) -> str:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @param {number[][]} pairs\n * @return {string}\n */\nvar smallestStringWithSwaps = function(s, pairs) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    string smallestStringWithSwaps(string s, vector<vector<int>>& pairs) {\n        return \"\";\n    }\n};"
        },
        "function_name": "smallestStringWithSwaps",
        "examples": [
            {"input": "s = \"dcab\", pairs = [[0,3],[1,2]]", "output": "\"bacd\""},
            {"input": "s = \"dcab\", pairs = [[0,3],[1,2],[0,2]]", "output": "\"abcd\""}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "dcab", pairs: [[0,3],[1,2]] }), "expectedOutput": "bacd" }
        ]
    },
    {
        "title": "Evaluate Division",
        "description": "You are given an array of variable pairs equations and an array of real numbers values, where equations[i] = [Ai, Bi] and values[i] represent the equation Ai / Bi = values[i]. Each Ai or Bi is a string that represents a single variable. You are also given some queries, where queries[j] = [Cj, Dj] represents the jth query where you must find the answer for Cj / Dj = ?. Return the answers to all queries. If a single answer cannot be determined, return -1.0.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "DFS", "BFS", "Union Find", "Graph"],
        "constraints": ["1 <= equations.length <= 20", "equations[i].length == 2", "1 <= values.length <= 20"],
        "hints": ["Build a graph where edge (a,b) has weight value, (b,a) has weight 1/value.", "Use BFS/DFS to find path product."],
        "boilerplate_code": {
            "java": "class Solution {\n    public double[] calcEquation(List<List<String>> equations, double[] values, List<List<String>> queries) {\n        return new double[]{};\n    }\n}",
            "python": "class Solution:\n    def calcEquation(self, equations: List[List[str]], values: List[float], queries: List[List[str]]) -> List[float]:\n        pass",
            "javascript": "/**\n * @param {string[][]} equations\n * @param {number[]} values\n * @param {string[][]} queries\n * @return {number[]}\n */\nvar calcEquation = function(equations, values, queries) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<double> calcEquation(vector<vector<string>>& equations, vector<double>& values, vector<vector<string>>& queries) {\n        return {};\n    }\n};"
        },
        "function_name": "calcEquation",
        "examples": [
            {"input": "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"c\"],[\"b\",\"a\"]]", "output": "[6.00000,0.50000]"}
        ],
        "testCases": []
    }
];
