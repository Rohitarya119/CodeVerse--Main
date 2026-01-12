module.exports = [
    {
        "title": "Binary Search",
        "description": "Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.",
        "difficulty": "EASY",
        "topics": ["Array", "Binary Search"],
        "constraints": ["1 <= nums.length <= 10^4", "-10^4 < nums[i], target < 10^4", "All the integers in nums are unique.", "nums is sorted in ascending order."],
        "hints": ["Check the middle element.", "If target > mid, search right. If target < mid, search left.", "Loop while left <= right."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int search(int[] nums, int target) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def search(self, nums: List[int], target: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar search = function(nums, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int search(vector<int>& nums, int target) {\n        return -1;\n    }\n};"
        },
        "function_name": "search",
        "examples": [
            {"input": "nums = [-1,0,3,5,9,12], target = 9", "output": "4"},
            {"input": "nums = [-1,0,3,5,9,12], target = 2", "output": "-1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [-1,0,3,5,9,12], target: 9 }), "expectedOutput": "4" }
        ]
    },
    {
        "title": "Search in Rotated Sorted Array",
        "description": "There is an integer array nums sorted in ascending order (with distinct values). Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length). Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["1 <= nums.length <= 5000", "-10^4 <= nums[i] <= 10^4", "All values of nums are unique.", "nums is an ascending array that is possibly rotated.", "-10^4 <= target <= 10^4"],
        "hints": ["One half of the array (left or right) will always be sorted.", "Check which half is sorted, then check if target lies in that range."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int search(int[] nums, int target) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def search(self, nums: List[int], target: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar search = function(nums, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int search(vector<int>& nums, int target) {\n        return -1;\n    }\n};"
        },
        "function_name": "search",
        "examples": [
            {"input": "nums = [4,5,6,7,0,1,2], target = 0", "output": "4"},
            {"input": "nums = [4,5,6,7,0,1,2], target = 3", "output": "-1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [4,5,6,7,0,1,2], target: 0 }), "expectedOutput": "4" }
        ]
    },
    {
        "title": "First and Last Position of Element in Sorted Array",
        "description": "Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value. If target is not found in the array, return [-1, -1].",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["0 <= nums.length <= 10^5", "-10^9 <= nums[i] <= 10^9", "nums is a non-decreasing array.", "-10^9 <= target <= 10^9"],
        "hints": ["Run binary search twice.", "First to find the leftmost index, second to find the rightmost index."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] searchRange(int[] nums, int target) {\n        return new int[]{-1, -1};\n    }\n}",
            "python": "class Solution:\n    def searchRange(self, nums: List[int], target: int) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number[]}\n */\nvar searchRange = function(nums, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> searchRange(vector<int>& nums, int target) {\n        return {-1, -1};\n    }\n};"
        },
        "function_name": "searchRange",
        "examples": [
            {"input": "nums = [5,7,7,8,8,10], target = 8", "output": "[3,4]"},
            {"input": "nums = [5,7,7,8,8,10], target = 6", "output": "[-1,-1]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [5,7,7,8,8,10], target: 8 }), "expectedOutput": `[3,4]` }
        ]
    },
    {
        "title": "Find Minimum in Rotated Sorted Array",
        "description": "Suppose an array of length n sorted in ascending order is rotated between 1 and n times. Given the sorted rotated array nums of unique elements, return the minimum element of this array.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["n == nums.length", "1 <= n <= 5000", "-5000 <= nums[i] <= 5000", "All the integers of nums are unique.", "nums is sorted and rotated."],
        "hints": ["If mid element > right element, minimum is in the right half.", "Otherwise, minimum is in the left half (including mid)."],
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
    },
    {
        "title": "Search a 2D Matrix",
        "description": "Write an efficient algorithm that searches for a value target in an m x n integer matrix matrix. This matrix has the following properties: Integers in each row are sorted from left to right. The first integer of each row is greater than the last integer of the previous row.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search", "Matrix"],
        "constraints": ["m == matrix.length", "n == matrix[i].length", "1 <= m, n <= 100", "-10^4 <= matrix[i][j], target <= 10^4"],
        "hints": ["Treat the 2D matrix as a flattened 1D sorted array of size m * n.", "Index mapping: row = index / n, col = index % n."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean searchMatrix(int[][] matrix, int target) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:\n        pass",
            "javascript": "/**\n * @param {number[][]} matrix\n * @param {number} target\n * @return {boolean}\n */\nvar searchMatrix = function(matrix, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool searchMatrix(vector<vector<int>>& matrix, int target) {\n        return false;\n    }\n};"
        },
        "function_name": "searchMatrix",
        "examples": [
            {"input": "matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3", "output": "true"},
            {"input": "matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ matrix: [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target: 3 }), "expectedOutput": "true" }
        ]
    }
];
