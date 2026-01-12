module.exports = [
    {
        "title": "Allocate Minimum Pages / Book Allocation",
        "description": "Given an array of integers pages where pages[i] is the number of pages in the ith book, and an integer m representing the number of students. Allocate books to m students such that the maximum number of pages allocated to a student is minimized.",
        "difficulty": "HARD",
        "topics": ["Array", "Binary Search"],
        "constraints": ["1 <= pages.length <= 10^5", "1 <= m <= 10^5"],
        "hints": ["Binary search on the answer (max pages).", "Range [max(pages), sum(pages)]."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int findPages(int[] A, int N, int M) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def findPages(self, A, N, M):\n        pass",
            "javascript": "/**\n * @param {number[]} A\n * @param {number} N\n * @param {number} M\n * @return {number}\n */\nvar findPages = function(A, N, M) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int findPages(int A[], int N, int M) {\n        return -1;\n    }\n};"
        },
        "function_name": "findPages",
        "examples": [
            {"input": "A = [12,34,67,90], M = 2", "output": "113"}
        ],
        "testCases": [
            { "input": JSON.stringify({ A: [12,34,67,90], N: 4, M: 2 }), "expectedOutput": "113" }
        ]
    },
    {
        "title": "Painter's Partition Problem",
        "description": "Given n boards of different lengths and k painters, find the minimum time required to paint all boards. Each painter takes 1 unit of time to paint 1 unit of board length.",
        "difficulty": "HARD",
        "topics": ["Array", "Binary Search"],
        "constraints": ["1 <= n <= 10^5", "1 <= k <= 10^5"],
        "hints": ["Binary search on time.", "Similar to Book Allocation."],
        "boilerplate_code": {
            "java": "class Solution {\n    public long minTime(int[] arr, int n, int k) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def minTime(self, arr, n, k):\n        pass",
            "javascript": "/**\n * @param {number[]} arr\n * @param {number} n\n * @param {number} k\n * @return {number}\n */\nvar minTime = function(arr, n, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    long long minTime(int arr[], int n, int k) {\n        return 0;\n    }\n};"
        },
        "function_name": "minTime",
        "examples": [
            {"input": "arr = [5,10,30,20,15], k = 3", "output": "35"}
        ],
        "testCases": [
            { "input": JSON.stringify({ arr: [5,10,30,20,15], n: 5, k: 3 }), "expectedOutput": "35" }
        ]
    },
    {
        "title": "Search in Infinite Array",
        "description": "Given an infinite sorted array (or an array of unknown size), find if a given target value exists. If it exists, return its index, otherwise return -1. You cannot use array.length.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["Array is sorted."],
        "hints": ["Find the range [start, end] where target might lie by exponentially increasing the range size.", "Binary search within that range."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int searchInfinite(int[] nums, int target) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def searchInfinite(self, nums: List[int], target: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar searchInfinite = function(nums, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int searchInfinite(vector<int>& nums, int target) {\n        return -1;\n    }\n};"
        },
        "function_name": "searchInfinite",
        "examples": [
            {"input": "nums = [1,2,3...], target = 5", "output": "4"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,2,3,4,5,6,7,8,9,10,12,15], target: 5 }), "expectedOutput": "4" }
        ]
    },
    {
        "title": "Find Floor and Ceiling",
        "description": "Given a sorted array of distinct integers and a target value x, find the floor and ceiling of x in the array. Floor is the largest element <= x, Ceiling is the smallest element >= x.",
        "difficulty": "EASY",
        "topics": ["Array", "Binary Search"],
        "constraints": ["1 <= nums.length <= 10^4"],
        "hints": ["Standard binary search can find the position.", "Return elements at appropriate indices."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] getFloorAndCeil(int[] nums, int x) {\n        return new int[]{-1, -1};\n    }\n}",
            "python": "class Solution:\n    def getFloorAndCeil(self, nums: List[int], x: int) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} x\n * @return {number[]}\n */\nvar getFloorAndCeil = function(nums, x) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> getFloorAndCeil(vector<int>& nums, int x) {\n        return {-1, -1};\n    }\n};"
        },
        "function_name": "getFloorAndCeil",
        "examples": [
            {"input": "nums = [1, 2, 8, 10, 10, 12, 19], x = 5", "output": "[2, 8]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1, 2, 8, 10, 10, 12, 19], x: 5 }), "expectedOutput": `[2, 8]` }
        ]
    },
    {
        "title": "Count 1s in Binary Sorted Array",
        "description": "Given a binary array sorted in non-increasing order (all 1s then 0s), count the number of 1s.",
        "difficulty": "EASY",
        "topics": ["Array", "Binary Search"],
        "constraints": ["1 <= nums.length <= 10^5"],
        "hints": ["Find the last occurrence of 1 using binary search.", "Index + 1 is the count."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int countOnes(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def countOnes(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar countOnes = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int countOnes(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "countOnes",
        "examples": [
            {"input": "nums = [1,1,1,1,0,0,0]", "output": "4"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,1,1,1,0,0,0] }), "expectedOutput": "4" }
        ]
    }
];
