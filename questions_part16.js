module.exports = [
    {
        "title": "Minimum Speed to Arrive on Time",
        "description": "You are given a floating-point number hour, representing the amount of time you have to reach the office. To commute to the office, you must take n trains in sequential order. Return the minimum positive integer speed (in km/h) that all the trains must travel at for you to reach the office on time, or -1 if it is impossible.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["n == dist.length", "1 <= n <= 10^5", "1 <= dist[i] <= 10^5", "1 <= hour <= 10^9"],
        "hints": ["Binary search on speed.", "Time calculation involves ceiling function for integers."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int minSpeedOnTime(int[] dist, double hour) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def minSpeedOnTime(self, dist, hour):\n        pass",
            "javascript": "/**\n * @param {number[]} dist\n * @param {number} hour\n * @return {number}\n */\nvar minSpeedOnTime = function(dist, hour) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int minSpeedOnTime(vector<int>& dist, double hour) {\n        return -1;\n    }\n};"
        },
        "function_name": "minSpeedOnTime",
        "examples": [
            {"input": "dist = [1,3,2], hour = 6", "output": "1"},
            {"input": "dist = [1,3,2], hour = 2.7", "output": "3"}
        ],
        "testCases": [
            { "input": JSON.stringify({ dist: [1,3,2], hour: 6 }), "expectedOutput": "1" }
        ]
    },
    {
        "title": "Find Transition Point",
        "description": "Given a sorted array containing only 0s and 1s, find the transition point, i.e., the first index where 1 was observed, and before that only 0 was observed. If no 1s are present, return -1.",
        "difficulty": "EASY",
        "topics": ["Array", "Binary Search"],
        "constraints": ["1 <= N <= 10^5", "0 <= arr[i] <= 1"],
        "hints": ["Binary search for the first occurrence of 1."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int transitionPoint(int[] arr, int n) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def transitionPoint(self, arr, n):\n        pass",
            "javascript": "/**\n * @param {number[]} arr\n * @param {number} n\n * @return {number}\n */\nvar transitionPoint = function(arr, n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int transitionPoint(int arr[], int n) {\n        return -1;\n    }\n};"
        },
        "function_name": "transitionPoint",
        "examples": [
            {"input": "arr = [0,0,0,1,1]", "output": "3"}
        ],
        "testCases": [
            { "input": JSON.stringify({ arr: [0,0,0,1,1], n: 5 }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Search in Row-Column Sorted Matrix",
        "description": "Given a matrix where every row and every column is sorted in increasing order, search for a given target.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search", "Matrix"],
        "constraints": ["n x m matrix"],
        "hints": ["Start from top-right corner.", "If current < target, move down. If current > target, move left."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean searchMatrix(int[][] matrix, int target) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def searchMatrix(self, matrix, target):\n        pass",
            "javascript": "/**\n * @param {number[][]} matrix\n * @param {number} target\n * @return {boolean}\n */\nvar searchMatrix = function(matrix, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool searchMatrix(vector<vector<int>>& matrix, int target) {\n        return false;\n    }\n};"
        },
        "function_name": "searchMatrix",
        "examples": [
            {"input": "matrix = [[10,20,30,40],[15,25,35,45],[27,29,37,48],[32,33,39,50]], target = 29", "output": "true"}
        ],
        "testCases": [
            { "input": JSON.stringify({ matrix: [[10,20,30,40],[15,25,35,45],[27,29,37,48],[32,33,39,50]], target: 29 }), "expectedOutput": "true" }
        ]
    },
    {
        "title": "Kth Element of Two Sorted Arrays",
        "description": "Given two sorted arrays arr1 and arr2 of size n and m respectively and an element k. The task is to find the element that would be at the kth position of the final sorted array.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search", "Divide and Conquer"],
        "constraints": ["1 <= n, m <= 10^6", "1 <= k <= n+m"],
        "hints": ["Similar logic to Median of Two Sorted Arrays.", "Binary search on partitioning."],
        "boilerplate_code": {
            "java": "class Solution {\n    public long kthElement( int arr1[], int arr2[], int n, int m, int k) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def kthElement(self, arr1, arr2, n, m, k):\n        pass",
            "javascript": "/**\n * @param {number[]} arr1\n * @param {number[]} arr2\n * @param {number} n\n * @param {number} m\n * @param {number} k\n * @return {number}\n */\nvar kthElement = function(arr1, arr2, n, m, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    long long kthElement(int arr1[], int arr2[], int n, int m, int k) {\n        return 0;\n    }\n};"
        },
        "function_name": "kthElement",
        "examples": [
            {"input": "arr1 = [2, 3, 6, 7, 9], arr2 = [1, 4, 8, 10], k = 5", "output": "6"}
        ],
        "testCases": [
            { "input": JSON.stringify({ arr1: [2, 3, 6, 7, 9], arr2: [1, 4, 8, 10], n: 5, m: 4, k: 5 }), "expectedOutput": "6" }
        ]
    }
];
