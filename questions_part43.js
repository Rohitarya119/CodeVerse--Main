module.exports = [
    {
        "title": "Task Scheduler",
        "description": "Given a characters array tasks, representing the tasks a CPU needs to do, where each letter represents a different task. Tasks could be done in any order. Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle. However, there is a non-negative integer n that represents the cooldown period between two same tasks (the same letter in the array), that is that there must be at least n units of time between any two same tasks. Return the least number of units of times that the CPU will take to finish all the given tasks.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "HashTable", "Greedy", "Heap", "Counting"],
        "constraints": ["1 <= tasks.length <= 10^4", "tasks[i] is upper-case English letter.", "0 <= n <= 100"],
        "hints": ["Frequency counting. Max frequency determines structure."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int leastInterval(char[] tasks, int n) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def leastInterval(self, tasks: List[str], n: int) -> int:\n        pass",
            "javascript": "/**\n * @param {character[]} tasks\n * @param {number} n\n * @return {number}\n */\nvar leastInterval = function(tasks, n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int leastInterval(vector<char>& tasks, int n) {\n        return 0;\n    }\n};"
        },
        "function_name": "leastInterval",
        "examples": [
            {"input": "tasks = [\"A\",\"A\",\"A\",\"B\",\"B\",\"B\"], n = 2", "output": "8"},
            {"input": "tasks = [\"A\",\"A\",\"A\",\"B\",\"B\",\"B\"], n = 0", "output": "6"}
        ],
        "testCases": [
            { "input": JSON.stringify({ tasks: ["A","A","A","B","B","B"], n: 2 }), "expectedOutput": "8" }
        ]
    },
    {
        "title": "Reorganize String",
        "description": "Given a string s, rearrange the characters of s so that any two adjacent characters are not the same. Return any possible rearrangement of s or return \"\" if not possible.",
        "difficulty": "MEDIUM",
        "topics": ["HashTable", "String", "Greedy", "Heap", "Counting"],
        "constraints": ["1 <= s.length <= 500", "s consists of lowercase English letters."],
        "hints": ["Use Max Heap to store character frequencies. Pick top 2 and place them."],
        "boilerplate_code": {
            "java": "class Solution {\n    public String reorganizeString(String s) {\n        return \"\";\n    }\n}",
            "python": "class Solution:\n    def reorganizeString(self, s: str) -> str:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {string}\n */\nvar reorganizeString = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    string reorganizeString(string s) {\n        return \"\";\n    }\n};"
        },
        "function_name": "reorganizeString",
        "examples": [
            {"input": "s = \"aab\"", "output": "\"aba\""},
            {"input": "s = \"aaab\"", "output": "\"\""}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "aab" }), "expectedOutput": "aba" }
        ]
    },
    {
        "title": "K Closest Points to Origin",
        "description": "Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane and an integer k, return the k closest points to the origin (0, 0). The distance between two points on the X-Y plane is the Euclidean distance (i.e., v((x1 - x2)^2 + (y1 - y2)^2)). You may return the answer in any order. The answer is guaranteed to be unique (except for the order that it is in).",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Math", "Divide and Conquer", "Geometry", "Sorting", "Heap", "Quickselect"],
        "constraints": ["1 <= k <= points.length <= 10^4", "-10^4 < xi, yi < 10^4"],
        "hints": ["Calculate distance squared for each point. Use Max Heap of size K to keep smallest distances."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[][] kClosest(int[][] points, int k) {\n        return new int[][]{};\n    }\n}",
            "python": "class Solution:\n    def kClosest(self, points: List[List[int]], k: int) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {number[][]} points\n * @param {number} k\n * @return {number[][]}\n */\nvar kClosest = function(points, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> kClosest(vector<vector<int>>& points, int k) {\n        return {};\n    }\n};"
        },
        "function_name": "kClosest",
        "examples": [
            {"input": "points = [[1,3],[-2,2]], k = 1", "output": "[[-2,2]]"},
            {"input": "points = [[3,3],[5,-1],[-2,4]], k = 2", "output": "[[3,3],[-2,4]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ points: [[1,3],[-2,2]], k: 1 }), "expectedOutput": "[[-2,2]]" }
        ]
    },
    {
        "title": "Top K Frequent Words",
        "description": "Given an array of strings words and an integer k, return the k most frequent strings. Return the answer sorted by the frequency from highest to lowest. Sort the words with the same frequency by their lexicographical order.",
        "difficulty": "MEDIUM",
        "topics": ["HashTable", "String", "Trie", "Sorting", "Heap", "Bucket Sort", "Counting"],
        "constraints": ["1 <= words.length <= 500", "1 <= words[i].length <= 10"],
        "hints": ["Count freq. Use Min Heap of size K with custom comparator."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<String> topKFrequent(String[] words, int k) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def topKFrequent(self, words: List[str], k: int) -> List[str]:\n        pass",
            "javascript": "/**\n * @param {string[]} words\n * @param {number} k\n * @return {string[]}\n */\nvar topKFrequent = function(words, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<string> topKFrequent(vector<string>& words, int k) {\n        return {};\n    }\n};"
        },
        "function_name": "topKFrequent",
        "examples": [
            {"input": "words = [\"i\",\"love\",\"leetcode\",\"i\",\"love\",\"coding\"], k = 2", "output": "[\"i\",\"love\"]"},
            {"input": "words = [\"the\",\"day\",\"is\",\"sunny\",\"the\",\"the\",\"the\",\"sunny\",\"is\",\"is\"], k = 4", "output": "[\"the\",\"is\",\"sunny\",\"day\"]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ words: ["i","love","leetcode","i","love","coding"], k: 2 }), "expectedOutput": "[\"i\",\"love\"]" }
        ]
    }
];
