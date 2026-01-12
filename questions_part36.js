module.exports = [
    {
        "title": "Split Array Largest Sum",
        "description": "Given an integer array nums and an integer k, split nums into k non-empty subarrays such that the largest sum of any subarray is minimized. Return the minimized largest sum of the split.",
        "difficulty": "HARD",
        "topics": ["Array", "Binary Search", "Dynamic Programming", "Greedy"],
        "constraints": ["1 <= nums.length <= 1000", "0 <= nums[i] <= 10^6", "1 <= k <= min(50, nums.length)"],
        "hints": ["Similar to Allocate Book Pages.", "Binary search the answer in range [max(nums), sum(nums)]."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int splitArray(int[] nums, int k) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def splitArray(self, nums: List[int], k: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar splitArray = function(nums, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int splitArray(vector<int>& nums, int k) {\n        return 0;\n    }\n};"
        },
        "function_name": "splitArray",
        "examples": [
            {"input": "nums = [7,2,5,10,8], k = 2", "output": "18"},
            {"input": "nums = [1,2,3,4,5], k = 2", "output": "9"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [7,2,5,10,8], k: 2 }), "expectedOutput": "18" }
        ]
    },
    {
        "title": "Capacity To Ship Packages Within D Days",
        "description": "A conveyor belt has packages that must be shipped from one port to another within days days. The ith package on the conveyor belt has a weight of weights[i]. Each day, we load the ship with packages on the conveyor belt (in the order given by weights). We may not load more weight than the maximum weight capacity of the ship. Return the least weight capacity of the ship that will result in all the packages on the conveyor belt being shipped within days days.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["1 <= days <= weights.length <= 5 * 10^4", "1 <= weights[i] <= 500"],
        "hints": ["Binary search on the capacity. Range [max(weights), sum(weights)]."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int shipWithinDays(int[] weights, int days) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def shipWithinDays(self, weights: List[int], days: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} weights\n * @param {number} days\n * @return {number}\n */\nvar shipWithinDays = function(weights, days) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int shipWithinDays(vector<int>& weights, int days) {\n        return 0;\n    }\n};"
        },
        "function_name": "shipWithinDays",
        "examples": [
            {"input": "weights = [1,2,3,4,5,6,7,8,9,10], days = 5", "output": "15"},
            {"input": "weights = [3,2,2,4,1,4], days = 3", "output": "6"}
        ],
        "testCases": [
            { "input": JSON.stringify({ weights: [1,2,3,4,5,6,7,8,9,10], days: 5 }), "expectedOutput": "15" }
        ]
    },
    {
        "title": "Koko Eating Bananas",
        "description": "Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours. Koko can decide her bananas-per-hour eating speed of k. Return the minimum integer k such that she can eat all the bananas within h hours.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["1 <= piles.length <= 10^4", "piles.length <= h <= 10^9", "1 <= piles[i] <= 10^9"],
        "hints": ["Binary search on eating speed k. Range [1, max(piles)]."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int minEatingSpeed(int[] piles, int h) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def minEatingSpeed(self, piles: List[int], h: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} piles\n * @param {number} h\n * @return {number}\n */\nvar minEatingSpeed = function(piles, h) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int minEatingSpeed(vector<int>& piles, int h) {\n        return 0;\n    }\n};"
        },
        "function_name": "minEatingSpeed",
        "examples": [
            {"input": "piles = [3,6,7,11], h = 8", "output": "4"},
            {"input": "piles = [30,11,23,4,20], h = 5", "output": "30"}
        ],
        "testCases": [
            { "input": JSON.stringify({ piles: [3,6,7,11], h: 8 }), "expectedOutput": "4" }
        ]
    },
    {
        "title": "Minimum Speed to Arrive on Time",
        "description": "You are given a floating-point number hour, representing the amount of time you have to reach the office. To commute to the office, you must take n trains in sequential order. You are also given an integer array dist of length n, where dist[i] describes the distance (in kilometers) of the ith train ride. Each train can only depart at an integer hour, so you may need to wait in between each train ride. Return the minimum positive integer speed (in kilometers per hour) that all the trains must travel at for you to reach the office on time, or -1 if it is impossible to be on time.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["n == dist.length", "1 <= n <= 10^5", "1 <= dist[i] <= 10^5", "1 <= hour <= 10^9"],
        "hints": ["Binary search the speed. Range [1, 10^7].", "Calculate time taken for a given speed carefully handling ceiling of hours."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int minSpeedOnTime(int[] dist, double hour) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def minSpeedOnTime(self, dist: List[int], hour: float) -> int:\n        pass",
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
        "title": "Find Minimum in Rotated Sorted Array",
        "description": "Suppose an array of length n sorted in ascending order is rotated between 1 and n times. Given the sorted rotated array nums of unique elements, return the minimum element of this array.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["n == nums.length", "1 <= n <= 5000", "-5000 <= nums[i] <= 5000"],
        "hints": ["Binary search. If mid > high, min is in right half. Else, in left half."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int findMin(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def findMin(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar findMin = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int findMin(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "findMin",
        "examples": [
            {"input": "nums = [3,4,5,1,2]", "output": "1"},
            {"input": "nums = [4,5,6,7,0,1,2]", "output": "0"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [3,4,5,1,2] }), "expectedOutput": "1" }
        ]
    }
];
