module.exports = [
    {
        "title": "Peak Element",
        "description": "A peak element is an element that is strictly greater than its neighbors. Given a 0-indexed integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["1 <= nums.length <= 1000", "-2^31 <= nums[i] <= 2^31 - 1", "nums[i] != nums[i + 1] for all valid i."],
        "hints": ["Binary search. If mid < mid+1, peak is to the right.", "Else peak is to the left (or mid itself)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int findPeakElement(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def findPeakElement(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar findPeakElement = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int findPeakElement(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "findPeakElement",
        "examples": [
            {"input": "nums = [1,2,3,1]", "output": "2"},
            {"input": "nums = [1,2,1,3,5,6,4]", "output": "5"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,2,3,1] }), "expectedOutput": "2" }
        ]
    },
    {
        "title": "Koko Eating Bananas",
        "description": "Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours. Koko can decide her bananas-per-hour eating speed of k. Return the minimum integer k such that she can eat all the bananas within h hours.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["1 <= piles.length <= 10^4", "piles.length <= h <= 10^9", "1 <= piles[i] <= 10^9"],
        "hints": ["Binary search on the speed k (from 1 to max(piles)).", "Check if a speed is feasible by simulating the eating process."],
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
        "title": "Capacity To Ship Packages Within D Days",
        "description": "A conveyor belt has packages that must be shipped from one port to another within days days. The ith package on the conveyor belt has a weight of weights[i]. Return the least weight capacity of the ship that will result in all the packages on the conveyor belt being shipped within days days.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["1 <= days <= weights.length <= 5 * 10^4", "1 <= weights[i] <= 500"],
        "hints": ["Binary search on capacity. Range [max(weights), sum(weights)].", "Check feasibility for a given capacity."],
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
        "title": "Split Array Largest Sum",
        "description": "Given an integer array nums and an integer k, split nums into k non-empty subarrays such that the largest sum of any subarray is minimized. Return the minimized largest sum of the split.",
        "difficulty": "HARD",
        "topics": ["Array", "Binary Search", "Dynamic Programming"],
        "constraints": ["1 <= nums.length <= 1000", "1 <= k <= min(50, nums.length)", "0 <= nums[i] <= 10^6"],
        "hints": ["Binary search on the answer (max sum of a subarray).", "Determine if a max sum is possible with <= k subarrays."],
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
        "title": "Median of Two Sorted Arrays",
        "description": "Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).",
        "difficulty": "HARD",
        "topics": ["Array", "Binary Search", "Divide and Conquer"],
        "constraints": ["nums1.length == m", "nums2.length == n", "0 <= m <= 1000", "0 <= n <= 1000", "1 <= m + n <= 2000"],
        "hints": ["Binary Search on the smaller array to partition both arrays such that elements on left <= elements on right.", "Handle edge cases (empty arrays)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public double findMedianSortedArrays(int[] nums1, int[] nums2) {\n        return 0.0;\n    }\n}",
            "python": "class Solution:\n    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:\n        pass",
            "javascript": "/**\n * @param {number[]} nums1\n * @param {number[]} nums2\n * @return {number}\n */\nvar findMedianSortedArrays = function(nums1, nums2) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {\n        return 0.0;\n    }\n};"
        },
        "function_name": "findMedianSortedArrays",
        "examples": [
            {"input": "nums1 = [1,3], nums2 = [2]", "output": "2.00000"},
            {"input": "nums1 = [1,2], nums2 = [3,4]", "output": "2.50000"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums1: [1,3], nums2: [2] }), "expectedOutput": "2.00000" }
        ]
    }
];
