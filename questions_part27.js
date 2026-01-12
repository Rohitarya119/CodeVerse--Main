module.exports = [
    {
        "title": "Next Greater Element I",
        "description": "The next greater element of some element x in an array is the first greater element that is to the right of x in the same array. You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2. For each 0 <= i < nums1.length, find the index j such that nums1[i] == nums2[j] and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is -1.",
        "difficulty": "EASY",
        "topics": ["Array", "Hash Table", "Stack", "Monotonic Stack"],
        "constraints": ["1 <= nums1.length <= nums2.length <= 1000", "0 <= nums1[i], nums2[i] <= 10^4", "All integers in nums1 and nums2 are unique."],
        "hints": ["Use a monotonic stack to find next greater element for all items in nums2.", "Store results in a map."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] nextGreaterElement(int[] nums1, int[] nums2) {\n        return new int[]{};\n    }\n}",
            "python": "class Solution:\n    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} nums1\n * @param {number[]} nums2\n * @return {number[]}\n */\nvar nextGreaterElement = function(nums1, nums2) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> nextGreaterElement(vector<int>& nums1, vector<int>& nums2) {\n        return {};\n    }\n};"
        },
        "function_name": "nextGreaterElement",
        "examples": [
            {"input": "nums1 = [4,1,2], nums2 = [1,3,4,2]", "output": "[-1,3,-1]"},
            {"input": "nums1 = [2,4], nums2 = [1,2,3,4]", "output": "[3,-1]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums1: [4,1,2], nums2: [1,3,4,2] }), "expectedOutput": "[-1,3,-1]" }
        ]
    },
    {
        "title": "Daily Temperatures",
        "description": "Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Stack", "Monotonic Stack"],
        "constraints": ["1 <= temperatures.length <= 10^5", "30 <= temperatures[i] <= 100"],
        "hints": ["Stack stores indices. While current temp > stack top temp, pop and resolve."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] dailyTemperatures(int[] temperatures) {\n        return new int[]{};\n    }\n}",
            "python": "class Solution:\n    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} temperatures\n * @return {number[]}\n */\nvar dailyTemperatures = function(temperatures) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> dailyTemperatures(vector<int>& temperatures) {\n        return {};\n    }\n};"
        },
        "function_name": "dailyTemperatures",
        "examples": [
            {"input": "temperatures = [73,74,75,71,69,72,76,73]", "output": "[1,1,4,2,1,1,0,0]"},
            {"input": "temperatures = [30,40,50,60]", "output": "[1,1,1,0]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ temperatures: [73,74,75,71,69,72,76,73] }), "expectedOutput": "[1,1,4,2,1,1,0,0]" }
        ]
    },
    {
        "title": "Largest Rectangle in Histogram",
        "description": "Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.",
        "difficulty": "HARD",
        "topics": ["Array", "Stack", "Monotonic Stack"],
        "constraints": ["1 <= heights.length <= 10^5", "0 <= heights[i] <= 10^4"],
        "hints": ["For each bar, find the first smaller bar to left and right.", "Use monotonic stack to find boundaries."],
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
        "title": "Online Stock Span",
        "description": "Design an algorithm that collects daily price quotes for some stock and returns the span of that stock's price for the current day. The span of the stock's price in one day is the maximum number of consecutive days (starting from that day and going backward) for which the stock price was less than or equal to the price of that day.",
        "difficulty": "MEDIUM",
        "topics": ["Stack", "Design", "Monotonic Stack", "Data Stream"],
        "constraints": ["Prices are positive.", "At most 10^4 calls."],
        "hints": ["Maintain a monotonic stack of (price, span) pairs.", "If current price >= stack top, pop and add span."],
        "boilerplate_code": {
            "java": "class StockSpanner {\n    public StockSpanner() {\n        \n    }\n    public int next(int price) {\n        return 0;\n    }\n}",
            "python": "class StockSpanner:\n    def __init__(self):\n        pass\n    def next(self, price: int) -> int:\n        pass",
            "javascript": "\nvar StockSpanner = function() {\n    \n};\n\n/** \n * @param {number} price\n * @return {number}\n */\nStockSpanner.prototype.next = function(price) {\n    \n};",
            "cpp": "class StockSpanner {\npublic:\n    StockSpanner() {\n        \n    }\n    \n    int next(int price) {\n        return 0;\n    }\n};"
        },
        "function_name": "next",
        "examples": [
            {"input": "price = [100, 80, 60, 70, 60, 75, 85]", "output": "[1, 1, 1, 2, 1, 4, 6]"}
        ],
        "testCases": []
    },
    {
        "title": "Trapping Rain Water",
        "description": "Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.",
        "difficulty": "HARD",
        "topics": ["Array", "Two Pointers", "Dynamic Programming", "Stack", "Monotonic Stack"],
        "constraints": ["n == height.length", "1 <= n <= 2 * 10^4", "0 <= height[i] <= 10^5"],
        "hints": ["Min of max-left and max-right height determines capacity.", "Monotonic stack can find boundaries for trapped water."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int trap(int[] height) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def trap(self, height: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} height\n * @return {number}\n */\nvar trap = function(height) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int trap(vector<int>& height) {\n        return 0;\n    }\n};"
        },
        "function_name": "trap",
        "examples": [
            {"input": "height = [0,1,0,2,1,0,1,3,2,1,2,1]", "output": "6"},
            {"input": "height = [4,2,0,3,2,5]", "output": "9"}
        ],
        "testCases": [
            { "input": JSON.stringify({ height: [0,1,0,2,1,0,1,3,2,1,2,1] }), "expectedOutput": "6" }
        ]
    }
];
