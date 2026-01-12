module.exports = [
    {
        "title": "Reverse String",
        "description": "Write a function that reverses a string. The input string is given as an array of characters s. You must do this by modifying the input array in-place with O(1) extra memory.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "String"],
        "constraints": ["1 <= s.length <= 10^5", "s[i] is a printable ascii character"],
        "hints": ["Use two pointers, one at the beginning and one at the end of the string.", "Swap the characters at the two pointers and move them towards the center."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void reverseString(char[] s) {\n        \n    }\n}",
            "python": "class Solution:\n    def reverseString(self, s: List[str]) -> None:\n        \"\"\"\n        Do not return anything, modify s in-place instead.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {character[]} s\n * @return {void} Do not return anything, modify s in-place instead.\n */\nvar reverseString = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void reverseString(vector<char>& s) {\n        \n    }\n};"
        },
        "function_name": "reverseString",
        "examples": [
            {"input": "s = [\"h\",\"e\",\"l\",\"l\",\"o\"]", "output": "[\"o\",\"l\",\"l\",\"e\",\"h\"]"},
            {"input": "s = [\"H\",\"a\",\"n\",\"n\",\"a\",\"h\"]", "output": "[\"h\",\"a\",\"n\",\"n\",\"a\",\"H\"]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: ["h","e","l","l","o"] }), "expectedOutput": `["o","l","l","e","h"]` },
            { "input": JSON.stringify({ s: ["H","a","n","n","a","h"] }), "expectedOutput": `["h","a","n","n","a","H"]` }
        ]
    },
    {
        "title": "Squares of a Sorted Array",
        "description": "Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Arrays", "Sorting"],
        "constraints": ["1 <= nums.length <= 10^4", "-10^4 <= nums[i] <= 10^4", "nums is sorted in non-decreasing order"],
        "hints": ["The largest square will be either at the start or the end of the array.", "Use two pointers to compare absolute values at both ends and fill the result array from the back."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] sortedSquares(int[] nums) {\n        return new int[0];\n    }\n}",
            "python": "class Solution:\n    def sortedSquares(self, nums: List[int]) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number[]}\n */\nvar sortedSquares = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> sortedSquares(vector<int>& nums) {\n        return {};\n    }\n};"
        },
        "function_name": "sortedSquares",
        "examples": [
            {"input": "nums = [-4,-1,0,3,10]", "output": "[0,1,9,16,100]"},
            {"input": "nums = [-7,-3,2,3,11]", "output": "[4,9,9,49,121]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [-4,-1,0,3,10] }), "expectedOutput": `[0,1,9,16,100]` },
            { "input": JSON.stringify({ nums: [-7,-3,2,3,11] }), "expectedOutput": `[4,9,9,49,121]` }
        ]
    },
    {
        "title": "3Sum",
        "description": "Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0. Notice that the solution set must not contain duplicate triplets.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Sorting"],
        "constraints": ["3 <= nums.length <= 3000", "-10^5 <= nums[i] <= 10^5"],
        "hints": ["Sort the array first to handle duplicates and make the two-pointer approach easier.", "Iterate through the array with one pointer, and for each element, use two pointers to find the other two numbers that sum to zero."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<Integer>> threeSum(int[] nums) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def threeSum(self, nums: List[int]) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number[][]}\n */\nvar threeSum = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> threeSum(vector<int>& nums) {\n        return {};\n    }\n};"
        },
        "function_name": "threeSum",
        "examples": [
            {"input": "nums = [-1,0,1,2,-1,-4]", "output": "[[-1,-1,2],[-1,0,1]]"},
            {"input": "nums = [0,1,1]", "output": "[]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [-1,0,1,2,-1,-4] }), "expectedOutput": `[[-1,-1,2],[-1,0,1]]` },
            { "input": JSON.stringify({ nums: [0,1,1] }), "expectedOutput": `[]` },
            { "input": JSON.stringify({ nums: [0,0,0] }), "expectedOutput": `[[0,0,0]]` }
        ]
    },
    {
        "title": "Move Zeroes",
        "description": "Given an integer array nums, move all 0s to the end of it while maintaining the relative order of the non-zero elements. Note that you must do this in-place without making a copy of the array.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Arrays"],
        "constraints": ["1 <= nums.length <= 10^4", "-2^31 <= nums[i] <= 2^31 - 1"],
        "hints": ["Keep a pointer for the position of the next non-zero element.", "Iterate through the array and swap non-zero elements to the position indicated by the pointer."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void moveZeroes(int[] nums) {\n        \n    }\n}",
            "python": "class Solution:\n    def moveZeroes(self, nums: List[int]) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {void} Do not return anything, modify nums in-place instead.\n */\nvar moveZeroes = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void moveZeroes(vector<int>& nums) {\n        \n    }\n};"
        },
        "function_name": "moveZeroes",
        "examples": [
            {"input": "nums = [0,1,0,3,12]", "output": "[1,3,12,0,0]"},
            {"input": "nums = [0]", "output": "[0]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [0,1,0,3,12] }), "expectedOutput": `[1,3,12,0,0]` },
            { "input": JSON.stringify({ nums: [0] }), "expectedOutput": `[0]` }
        ]
    },
    {
        "title": "Remove Duplicates from Sorted Array",
        "description": "Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Return k after placing the final result in the first k slots of nums.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Arrays"],
        "constraints": ["1 <= nums.length <= 3 * 10^4", "-100 <= nums[i] <= 100", "nums is sorted in non-decreasing order"],
        "hints": ["Use a slow pointer to track the position of unique elements.", "Use a fast pointer to iterate through the array considering each element."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int removeDuplicates(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def removeDuplicates(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar removeDuplicates = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int removeDuplicates(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "removeDuplicates",
        "examples": [
            {"input": "nums = [1,1,2]", "output": "2, nums = [1,2,_]"},
            {"input": "nums = [0,0,1,1,1,2,2,3,3,4]", "output": "5, nums = [0,1,2,3,4,_,_,_,_,_]"}
        ],
        "testCases": [
            // Note: DB expects string output. For this special case, driver usually handles logic.
            // But if driver returns just 'k', we can't fully verify.
            // However, the provided 'updateSubmission' or custom driver logic might need adapting.
            // The existing drivers check return value.
            // For 'removeDuplicates', the LeetCode style returns k, but also checks the array content.
            // The current CodeVerse driver just returns the function result.
            // So we will expect '2' (Java/JS/C++) or '2' (Python).
            // But wait, the EXAMPLE output says "2, nums = ...".
            // Our driver implementation is simple. It returns exactly what the function returns.
            { "input": JSON.stringify({ nums: [1,1,2] }), "expectedOutput": "2" },
            { "input": JSON.stringify({ nums: [0,0,1,1,1,2,2,3,3,4] }), "expectedOutput": "5" }
        ]
    },
    {
        "title": "Trapping Rain Water",
        "description": "Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.",
        "difficulty": "HARD",
        "topics": ["Two Pointers", "Arrays", "Dynamic Programming", "Stack"],
        "constraints": ["n == height.length", "1 <= n <= 2 * 10^4", "0 <= height[i] <= 10^5"],
        "hints": ["For each element, the water it can trap depends on the maximum height to its left and to its right.", "Use two pointers starting from both ends to maintain the left max and right max."],
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
            { "input": JSON.stringify({ height: [0,1,0,2,1,0,1,3,2,1,2,1] }), "expectedOutput": "6" },
            { "input": JSON.stringify({ height: [4,2,0,3,2,5] }), "expectedOutput": "9" }
        ]
    },
    {
        "title": "Sort Colors",
        "description": "Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue. We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Sorting"],
        "constraints": ["n == nums.length", "1 <= n <= 300", "nums[i] is either 0, 1, or 2"],
        "hints": ["Use three pointers: low (for 0s), mid (for 1s), and high (for 2s).", "Swap elements to move 0s to the beginning and 2s to the end, while iterating with mid."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void sortColors(int[] nums) {\n        \n    }\n}",
            "python": "class Solution:\n    def sortColors(self, nums: List[int]) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {void} Do not return anything, modify nums in-place instead.\n */\nvar sortColors = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void sortColors(vector<int>& nums) {\n        \n    }\n};"
        },
        "function_name": "sortColors",
        "examples": [
            {"input": "nums = [2,0,2,1,1,0]", "output": "[0,0,1,1,2,2]"},
            {"input": "nums = [2,0,1]", "output": "[0,1,2]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [2,0,2,1,1,0] }), "expectedOutput": `[0,0,1,1,2,2]` },
            { "input": JSON.stringify({ nums: [2,0,1] }), "expectedOutput": `[0,1,2]` }
        ]
    },
    {
        "title": "4Sum",
        "description": "Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that 0 <= a, b, c, d < n and a, b, c, d are distinct and nums[a] + nums[b] + nums[c] + nums[d] == target.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Sorting"],
        "constraints": ["1 <= nums.length <= 200", "-10^9 <= nums[i] <= 10^9", "-10^9 <= target <= 10^9"],
        "hints": ["Sort the array first.", "Use nested loops for the first two numbers and then use the two-pointer approach for the remaining two numbers."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<Integer>> fourSum(int[] nums, int target) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number[][]}\n */\nvar fourSum = function(nums, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> fourSum(vector<int>& nums, int target) {\n        return {};\n    }\n};"
        },
        "function_name": "fourSum",
        "examples": [
            {"input": "nums = [1,0,-1,0,-2,2], target = 0", "output": "[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]"},
            {"input": "nums = [2,2,2,2,2], target = 8", "output": "[[2,2,2,2]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,0,-1,0,-2,2], target: 0 }), "expectedOutput": `[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]` },
            { "input": JSON.stringify({ nums: [2,2,2,2,2], target: 8 }), "expectedOutput": `[[2,2,2,2]]` }
        ]
    },
    {
        "title": "Intersection of Two Arrays",
        "description": "Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must be unique and you may return the result in any order.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Arrays", "Hash Table"],
        "constraints": ["1 <= nums1.length, nums2.length <= 1000", "0 <= nums1[i], nums2[i] <= 1000"],
        "hints": ["Sort both arrays.", "Use two pointers to iterate through both arrays and find common elements."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] intersection(int[] nums1, int[] nums2) {\n        return new int[0];\n    }\n}",
            "python": "class Solution:\n    def intersection(self, nums1: List[int], nums2: List[int]) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} nums1\n * @param {number[]} nums2\n * @return {number[]}\n */\nvar intersection = function(nums1, nums2) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> intersection(vector<int>& nums1, vector<int>& nums2) {\n        return {};\n    }\n};"
        },
        "function_name": "intersection",
        "examples": [
            {"input": "nums1 = [1,2,2,1], nums2 = [2,2]", "output": "[2]"},
            {"input": "nums1 = [4,9,5], nums2 = [9,4,9,8,4]", "output": "[9,4]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums1: [1,2,2,1], nums2: [2,2] }), "expectedOutput": `[2]` },
            { "input": JSON.stringify({ nums1: [4,9,5], nums2: [9,4,9,8,4] }), "expectedOutput": `[9,4]` }
        ]
    },
    {
        "title": "Merge Sorted Array",
        "description": "You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively. Merge nums1 and nums2 into a single array sorted in non-decreasing order. The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Arrays", "Sorting"],
        "constraints": ["nums1.length == m + n", "nums2.length == n", "0 <= m, n <= 200"],
        "hints": ["Fill nums1 from the back.", "Compare elements from the end of valid parts of nums1 and nums2 and place the larger one at the end of nums1."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void merge(int[] nums1, int m, int[] nums2, int n) {\n        \n    }\n}",
            "python": "class Solution:\n    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:\n        \"\"\"\n        Do not return anything, modify nums1 in-place instead.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {number[]} nums1\n * @param {number} m\n * @param {number[]} nums2\n * @param {number} n\n * @return {void} Do not return anything, modify nums1 in-place instead.\n */\nvar merge = function(nums1, m, nums2, n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {\n        \n    }\n};"
        },
        "function_name": "merge",
        "examples": [
            {"input": "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3", "output": "[1,2,2,3,5,6]"},
            {"input": "nums1 = [1], m = 1, nums2 = [], n = 0", "output": "[1]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums1: [1,2,3,0,0,0], m: 3, nums2: [2,5,6], n: 3 }), "expectedOutput": `[1,2,2,3,5,6]` },
            { "input": JSON.stringify({ nums1: [1], m: 1, nums2: [], n: 0 }), "expectedOutput": `[1]` }
        ]
    }
];
