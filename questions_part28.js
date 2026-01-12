module.exports = [
    {
        "title": "Redundant Connection",
        "description": "In this problem, a tree is an undirected graph that is connected and has no cycles. You are given a graph that started as a tree with n nodes labeled from 1 to n, with one additional edge added. The added edge has two different vertices chosen from 1 to n, and was not an edge that already existed. The graph is represented as an array edges of length n where edges[i] = [ai, bi] indicates that there is an edge between nodes ai and bi in the graph. Return an edge that can be removed so that the resulting graph is a tree of n nodes.",
        "difficulty": "MEDIUM",
        "topics": ["DFS", "BFS", "Union Find", "Graph"],
        "constraints": ["n == edges.length", "3 <= n <= 1000", "edges[i].length == 2", "1 <= ai < bi <= n"],
        "hints": ["Use Union-Find.", "If adding an edge connects two already connected nodes, that's the redundant one."],
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
        "description": "Given a list of accounts where each element accounts[i] is a list of strings, where the first element accounts[i][0] is a name, and the rest of the elements are emails representing emails of the account. Now, we would like to merge these accounts. Two accounts definitely belong to the same person if there is some common email to both accounts. Return the accounts in the following format: the first element of each account is the name, and the rest of the elements are emails in sorted order. The accounts themselves can be returned in any order.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "DFS", "BFS", "Union Find", "Hash Table"],
        "constraints": ["1 <= accounts.length <= 1000", "2 <= accounts[i].length <= 10", "1 <= accounts[i][j].length <= 30"],
        "hints": ["Use Union-Find to group component emails.", "Map email to ID."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<String>> accountsMerge(List<List<String>> accounts) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def accountsMerge(self, accounts: List[List[str]]) -> List[List[str]]:\n        pass",
            "javascript": "/**\n * @param {string[][]} accounts\n * @return {string[][কান\n */\nvar accountsMerge = function(accounts) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<string>> accountsMerge(vector<vector<string>>& accounts) {\n        return {};\n    }\n};"
        },
        "function_name": "accountsMerge",
        "examples": [
            {"input": "accounts = [[\"John\",\"johnsmith@mail.com\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\",\"john00@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]", "output": "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]"}
        ],
        "testCases": [
             { "input": JSON.stringify({ accounts: [["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]] }), "expectedOutput": "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]" }
        ]
    },
    {
        "title": "Longest Consecutive Sequence",
        "description": "Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence. You must write an algorithm that runs in O(n) time.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Hash Table", "Union Find"],
        "constraints": ["0 <= nums.length <= 10^5", "-10^9 <= nums[i] <= 10^9"],
        "hints": ["Use a HashSet to store numbers for O(1) lookup.", "Or use Union-Find on adjacent numbers."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int longestConsecutive(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def longestConsecutive(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar longestConsecutive = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int longestConsecutive(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "longestConsecutive",
        "examples": [
            {"input": "nums = [100,4,200,1,3,2]", "output": "4"},
            {"input": "nums = [0,3,7,2,5,8,4,6,0,1]", "output": "9"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [100,4,200,1,3,2] }), "expectedOutput": "4" }
        ]
    },
    {
        "title": "Number of Operations to Make Network Connected",
        "description": "There are n computers numbered from 0 to n - 1 connected by ethernet cables connections forming a network where connections[i] = [a, b] represents a connection between computers a and b. Any computer can reach any other computer directly or indirectly through the network. You are given an initial computer network connections. You can extract certain cables between two directly connected computers, and place them between any pair of disconnected computers to make them directly connected. Return the minimum number of times you need to do this in order to make all the computers connected. If it is not possible, return -1.",
        "difficulty": "MEDIUM",
        "topics": ["DFS", "BFS", "Union Find", "Graph"],
        "constraints": ["1 <= n <= 10^5", "1 <= connections.length <= 10^5", "connections[i].length == 2"],
        "hints": ["Need at least n-1 cables.", "Count connected components k. Ans is k-1."],
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
    }
];
