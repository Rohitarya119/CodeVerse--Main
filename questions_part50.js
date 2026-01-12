module.exports = [
    {
        "title": "Trapping Rain Water II",
        "description": "Given an m x n integer matrix heightMap representing the height of each unit cell in a 2D elevation map, return the volume of water it can trap after raining.",
        "difficulty": "HARD",
        "topics": ["Array", "BFS", "Heap", "Matrix"],
        "constraints": ["m == heightMap.length", "n == heightMap[i].length", "1 <= m, n <= 200"],
        "hints": ["Min-Heap boundary. Always pick the smallest height from boundary and explore neighbors. If neighbor is lower, water trapped."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int trapRainWater(int[][] heightMap) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def trapRainWater(self, heightMap: List[List[int]]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[][]} heightMap\n * @return {number}\n */\nvar trapRainWater = function(heightMap) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int trapRainWater(vector<vector<int>>& heightMap) {\n        return 0;\n    }\n};"
        },
        "function_name": "trapRainWater",
        "examples": [
            {"input": "heightMap = [[1,4,3,1,3,2],[3,2,1,3,2,4],[2,3,3,2,3,1]]", "output": "4"}
        ],
        "testCases": []
    },
    {
        "title": "Largest Rectangle in Histogram",
        "description": "Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.",
        "difficulty": "HARD",
        "topics": ["Array", "Stack", "Monotonic Stack"],
        "constraints": ["1 <= heights.length <= 10^5", "0 <= heights[i] <= 10^4"],
        "hints": ["Monotonic Stack. Store indices of increasing heights. When decrease, calc area using height[top] * (current - stack.peek - 1)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int largestRectangleArea(int[] heights) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def largestRectangleArea(self, heights: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} heights\n * @return {number}\n */\nvar largestRectangleArea = function(heights) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int largestRectangleArea(vector<int>& heights) {\n        return 0;\n    }\n};"
        },
        "function_name": "largestRectangleArea",
        "examples": [
            {"input": "heights = [2,1,5,6,2,3]", "output": "10"},
            {"input": "heights = [2,4]", "output": "4"}
        ],
        "testCases": [
            { "input": JSON.stringify({ heights: [2,1,5,6,2,3] }), "expectedOutput": "10" }
        ]
    },
    {
        "title": "Maximal Rectangle",
        "description": "Given a rows x cols binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.",
        "difficulty": "HARD",
        "topics": ["Array", "Dynamic Programming", "Stack", "Matrix", "Monotonic Stack"],
        "constraints": ["rows == matrix.length", "cols == matrix[i].length", "1 <= rows, cols <= 200"],
        "hints": ["Treat each row as a histogram base. Compute Largest Rectangle in Histogram for each row."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int maximalRectangle(char[][] matrix) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def maximalRectangle(self, matrix: List[List[str]]) -> int:\n        pass",
            "javascript": "/**\n * @param {character[][]} matrix\n * @return {number}\n */\nvar maximalRectangle = function(matrix) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int maximalRectangle(vector<vector<char>>& matrix) {\n        return 0;\n    }\n};"
        },
        "function_name": "maximalRectangle",
        "examples": [
            {"input": "matrix = [[\"1\",\"0\",\"1\",\"0\",\"0\"],[\"1\",\"0\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"0\",\"0\",\"1\",\"0\"]]", "output": "6"}
        ],
        "testCases": []
    },
    {
        "title": "The Skyline Problem",
        "description": "A city's skyline is the outer contour of the silhouette formed by all the buildings in that city when viewed from a distance. Given the locations and heights of all the buildings, return the skyline formed by these buildings collectively. The geometric information of each building is given by an array buildings where buildings[i] = [lefti, righti, heighti].",
        "difficulty": "HARD",
        "topics": ["Array", "Divide and Conquer", "Heap", "Binary Indexed Tree", "Segment Tree"],
        "constraints": ["1 <= buildings.length <= 10^4", "0 <= lefti < righti <= 2^31 - 1"],
        "hints": ["Sweep Line algorithm. Use Max Heap to store live buildings' heights."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<Integer>> getSkyline(int[][] buildings) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def getSkyline(self, buildings: List[List[int]]) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {number[][]} buildings\n * @return {number[][]}\n */\nvar getSkyline = function(buildings) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> getSkyline(vector<vector<int>>& buildings) {\n        return {};\n    }\n};"
        },
        "function_name": "getSkyline",
        "examples": [
            {"input": "buildings = [[2,9,10],[3,7,15],[5,12,12],[15,20,10],[19,24,8]]", "output": "[[2,10],[3,15],[7,12],[12,0],[15,10],[20,8],[24,0]]"}
        ],
        "testCases": []
    },
    {
        "title": "Find Median from Data Stream",
        "description": "The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values. Implement the MedianFinder class: MedianFinder() initializes the MedianFinder object. void addNum(int num) adds the integer num from the data stream to the data structure. double findMedian() returns the median of all elements so far.",
        "difficulty": "HARD",
        "topics": ["Two Heaps", "Design", "Heap"],
        "constraints": ["-10^5 <= num <= 10^5", "There will be at least one element in the data structure before calling findMedian."],
        "hints": ["Use two heaps: Max Heap for the left half, Min Heap for the right half."],
        "boilerplate_code": {
            "java": "class MedianFinder {\n    public MedianFinder() {\n        \n    }\n    public void addNum(int num) {\n        \n    }\n    public double findMedian() {\n        return 0.0;\n    }\n}",
            "python": "class MedianFinder:\n    def __init__(self):\n        pass\n    def addNum(self, num: int) -> None:\n        pass\n    def findMedian(self) -> float:\n        pass",
            "javascript": "\nvar MedianFinder = function() {\n    \n};\n\n/** \n * @param {number} num\n * @return {void}\n */\nMedianFinder.prototype.addNum = function(num) {\n    \n};\n\n/**\n * @return {number}\n */\nMedianFinder.prototype.findMedian = function() {\n    \n};",
            "cpp": "class MedianFinder {\npublic:\n    MedianFinder() {\n        \n    }\n    void addNum(int num) {\n        \n    }\n    double findMedian() {\n        return 0.0;\n    }\n};"
        },
        "function_name": "findMedian",
        "examples": [
            {"input": "[\"MedianFinder\", \"addNum\", \"addNum\", \"findMedian\", \"addNum\", \"findMedian\"]\n[[], [1], [2], [], [3], []]", "output": "[null, null, null, 1.5, null, 2.0]"}
        ],
        "testCases": []
    }
];
