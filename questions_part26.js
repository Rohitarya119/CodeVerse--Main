module.exports = [
    {
        "title": "Jump Game",
        "description": "You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position. Return true if you can reach the last index, or false otherwise.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Dynamic Programming", "Greedy"],
        "constraints": ["1 <= nums.length <= 10^4", "0 <= nums[i] <= 10^5"],
        "hints": ["Greedy: Track the furthest reachable index.", "Iterate and update max reach."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean canJump(int[] nums) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def canJump(self, nums: List[int]) -> bool:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {boolean}\n */\nvar canJump = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool canJump(vector<int>& nums) {\n        return false;\n    }\n};"
        },
        "function_name": "canJump",
        "examples": [
            {"input": "nums = [2,3,1,1,4]", "output": "true"},
            {"input": "nums = [3,2,1,0,4]", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [2,3,1,1,4] }), "expectedOutput": "true" }
        ]
    },
    {
        "title": "Gas Station",
        "description": "There are n gas stations along a circular route, where the amount of gas at the ith station is gas[i]. You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from the ith station to its next (i + 1)th station. You begin the journey with an empty tank at one of the gas stations. Given two integer arrays gas and cost, return the starting gas station's index if you can travel around the circuit once in the clockwise direction, otherwise return -1. If there exists a solution, it is guaranteed to be unique.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Greedy"],
        "constraints": ["n == gas.length == cost.length", "1 <= n <= 10^5"],
        "hints": ["If total gas < total cost, impossible.", "Greedy: If current tank < 0, reset start to next station."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int canCompleteCircuit(int[] gas, int[] cost) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} gas\n * @param {number[]} cost\n * @return {number}\n */\nvar canCompleteCircuit = function(gas, cost) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int canCompleteCircuit(vector<int>& gas, vector<int>& cost) {\n        return -1;\n    }\n};"
        },
        "function_name": "canCompleteCircuit",
        "examples": [
            {"input": "gas = [1,2,3,4,5], cost = [3,4,5,1,2]", "output": "3"},
            {"input": "gas = [2,3,4], cost = [3,4,3]", "output": "-1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ gas: [1,2,3,4,5], cost: [3,4,5,1,2] }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Candy",
        "description": "There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings. You are giving candies to these children subjected to the following requirements: Each child must have at least one candy. Children with a higher rating get more candies than their neighbors. Return the minimum number of candies you need to have to distribute the candies to the children.",
        "difficulty": "HARD",
        "topics": ["Array", "Greedy"],
        "constraints": ["n == ratings.length", "1 <= n <= 2 * 10^4", "0 <= ratings[i] <= 2 * 10^4"],
        "hints": ["Two passes: Left to right (satisfy left neighbor), Right to left (satisfy right neighbor).", "Take max of both passes."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int candy(int[] ratings) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def candy(self, ratings: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} ratings\n * @return {number}\n */\nvar candy = function(ratings) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int candy(vector<int>& ratings) {\n        return 0;\n    }\n};"
        },
        "function_name": "candy",
        "examples": [
            {"input": "ratings = [1,0,2]", "output": "5"},
            {"input": "ratings = [1,2,2]", "output": "4"}
        ],
        "testCases": [
            { "input": JSON.stringify({ ratings: [1,0,2] }), "expectedOutput": "5" }
        ]
    },
    {
        "title": "Merge Intervals",
        "description": "Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Sorting", "Greedy"],
        "constraints": ["1 <= intervals.length <= 10^4", "intervals[i].length == 2", "0 <= starti <= endi <= 10^4"],
        "hints": ["Sort by start time.", "Iterate and merge if overlap (end >= next.start)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[][] merge(int[][] intervals) {\n        return new int[][]{};\n    }\n}",
            "python": "class Solution:\n    def merge(self, intervals: List[List[int]]) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {number[][]} intervals\n * @return {number[][]}\n */\nvar merge = function(intervals) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> merge(vector<vector<int>>& intervals) {\n        return {};\n    }\n};"
        },
        "function_name": "merge",
        "examples": [
            {"input": "intervals = [[1,3],[2,6],[8,10],[15,18]]", "output": "[[1,6],[8,10],[15,18]]"},
            {"input": "intervals = [[1,4],[4,5]]", "output": "[[1,5]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ intervals: [[1,3],[2,6],[8,10],[15,18]] }), "expectedOutput": "[[1,6],[8,10],[15,18]]" }
        ]
    },
    {
        "title": "Non-overlapping Intervals",
        "description": "Given an array of intervals intervals where intervals[i] = [starti, endi], return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Dynamic Programming", "Greedy", "Sorting"],
        "constraints": ["1 <= intervals.length <= 10^5", "intervals[i].length == 2", "starti < endi"],
        "hints": ["Greedy: Sort by end time.", "Keep the interval ending earliest to leave room for others."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int eraseOverlapIntervals(int[][] intervals) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[][]} intervals\n * @return {number}\n */\nvar eraseOverlapIntervals = function(intervals) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int eraseOverlapIntervals(vector<vector<int>>& intervals) {\n        return 0;\n    }\n};"
        },
        "function_name": "eraseOverlapIntervals",
        "examples": [
            {"input": "intervals = [[1,2],[2,3],[3,4],[1,3]]", "output": "1"},
            {"input": "intervals = [[1,2],[1,2],[1,2]]", "output": "2"}
        ],
        "testCases": [
            { "input": JSON.stringify({ intervals: [[1,2],[2,3],[3,4],[1,3]] }), "expectedOutput": "1" }
        ]
    },
    {
        "title": "Lemonade Change",
        "description": "At a lemonade stand, each lemonade costs $5. Customers are standing in a queue to buy from you and order one at a time. Each customer will only buy one lemonade and pay with either a $5, $10, or $20 bill. You must provide the correct change to each customer so that the net transaction is that the customer pays $5. Return true if you can provide every customer with correct change, or false otherwise.",
        "difficulty": "EASY",
        "topics": ["Array", "Greedy"],
        "constraints": ["1 <= bills.length <= 10^5", "bills[i] is either 5, 10, or 20."],
        "hints": ["Track count of $5s and $10s.", "Greedy: For $20 bill, prefer giving one $10 and one $5."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean lemonadeChange(int[] bills) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def lemonadeChange(self, bills: List[int]) -> bool:\n        pass",
            "javascript": "/**\n * @param {number[]} bills\n * @return {boolean}\n */\nvar lemonadeChange = function(bills) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool lemonadeChange(vector<int>& bills) {\n        return false;\n    }\n};"
        },
        "function_name": "lemonadeChange",
        "examples": [
            {"input": "bills = [5,5,5,10,20]", "output": "true"},
            {"input": "bills = [5,5,10,10,20]", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ bills: [5,5,5,10,20] }), "expectedOutput": "true" }
        ]
    }
];
