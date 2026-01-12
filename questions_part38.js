module.exports = [
    {
        "title": "Network Delay Time",
        "description": "You are given a network of n nodes, labeled from 1 to n. You are also given times, a list of travel times as directed edges times[i] = (ui, vi, wi), where ui is the source node, vi is the target node, and wi is the time it takes for a signal to travel from source to target. We will send a signal from a given node k. Return the minimum time it takes for all the n nodes to receive the signal. If it is impossible for all the n nodes to receive the signal, return -1.",
        "difficulty": "MEDIUM",
        "topics": ["Graph", "BFS", "Heap", "Shortest Path"],
        "constraints": ["1 <= k <= n <= 100", "1 <= times.length <= 6000"],
        "hints": ["Dijkstra's Algorithm or Bellman-Ford."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int networkDelayTime(int[][] times, int n, int k) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def networkDelayTime(self, times: List[List[int]], n: int, k: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[][]} times\n * @param {number} n\n * @param {number} k\n * @return {number}\n */\nvar networkDelayTime = function(times, n, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int networkDelayTime(vector<vector<int>>& times, int n, int k) {\n        return -1;\n    }\n};"
        },
        "function_name": "networkDelayTime",
        "examples": [
            {"input": "times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2", "output": "2"},
            {"input": "times = [[1,2,1]], n = 2, k = 1", "output": "1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ times: [[2,1,1],[2,3,1],[3,4,1]], n: 4, k: 2 }), "expectedOutput": "2" }
        ]
    },
    {
        "title": "Cheapest Flights Within K Stops",
        "description": "There are n cities connected by some number of flights. You are given an array flights where flights[i] = [from_i, to_i, price_i] indicates that there is a flight from city from_i to city to_i with cost price_i. You are also given three integers src, dst, and k, return the cheapest price from src to dst with at most k stops. If there is no such route, return -1.",
        "difficulty": "MEDIUM",
        "topics": ["Dynamic Programming", "Graph", "Shortest Path", "BFS"],
        "constraints": ["1 <= n <= 100", "0 <= flights.length <= (n * (n - 1) / 2)", "0 <= k < n"],
        "hints": ["Run Dijkstra's but track steps. Or BFS level by level. Or Bellman-Ford k+1 times."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int findCheapestPrice(int n, int[][] flights, int src, int dst, int k) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number} n\n * @param {number[][]} flights\n * @param {number} src\n * @param {number} dst\n * @param {number} k\n * @return {number}\n */\nvar findCheapestPrice = function(n, flights, src, dst, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int findCheapestPrice(int n, vector<vector<int>>& flights, int src, int dst, int k) {\n        return -1;\n    }\n};"
        },
        "function_name": "findCheapestPrice",
        "examples": [
            {"input": "n = 4, flights = [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], src = 0, dst = 3, k = 1", "output": "700"},
            {"input": "n = 3, flights = [[0,1,100],[1,2,100],[0,2,500]], src = 0, dst = 2, k = 1", "output": "200"}
        ],
        "testCases": [
            { "input": JSON.stringify({ n: 3, flights: [[0,1,100],[1,2,100],[0,2,500]], src: 0, dst: 2, k: 1 }), "expectedOutput": "200" }
        ]
    },
    {
        "title": "Is Graph Bipartite?",
        "description": "There is an undirected graph with n nodes, where each node is numbered between 0 and n - 1. You are given a 2D array graph, where graph[u] is an array of nodes that node u is adjacent to. More formally, for each v in graph[u], there is an undirected edge between node u and node v. The graph has the following properties: There are no self-edges (graph[u] does not contain u). There are no parallel edges (graph[u] does not contain duplicate values). If v is in graph[u], then u is in graph[v] (the graph is undirected). The graph may not be connected, meaning there may be two nodes u and v such that there is no path between them. A graph is bipartite if the nodes can be partitioned into two independent sets A and B such that every edge in the graph connects a node in set A and a node in set B. Return true if and only if it is bipartite.",
        "difficulty": "MEDIUM",
        "topics": ["DFS", "BFS", "Graph", "Union Find"],
        "constraints": ["graph.length == n", "1 <= n <= 100"],
        "hints": ["Use 2-coloring (BFS/DFS). Assign colors 0 and 1. If neighbors have same color, not bipartite."],
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
