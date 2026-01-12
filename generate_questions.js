const fs = require('fs');

const questions = [
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
        ]
    },
    {
        "title": "3Sum Closest",
        "description": "Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Sorting"],
        "constraints": ["3 <= nums.length <= 500", "-1000 <= nums[i] <= 1000", "-10^4 <= target <= 10^4"],
        "hints": ["Similar to 3Sum, sort the array first.", "Iterate and use two pointers to find the pair that minimizes the difference with the target."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int threeSumClosest(int[] nums, int target) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def threeSumClosest(self, nums: List[int], target: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar threeSumClosest = function(nums, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int threeSumClosest(vector<int>& nums, int target) {\n        return 0;\n    }\n};"
        },
        "function_name": "threeSumClosest",
        "examples": [
            {"input": "nums = [-1,2,1,-4], target = 1", "output": "2"},
            {"input": "nums = [0,0,0], target = 1", "output": "0"}
        ]
    },
    {
        "title": "Remove Element",
        "description": "Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The order of the elements may be changed. Then return the number of elements in nums which are not equal to val.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Arrays"],
        "constraints": ["0 <= nums.length <= 100", "0 <= nums[i] <= 50", "0 <= val <= 100"],
        "hints": ["Use one pointer to iterate and another to mark the position for valid elements.", "Overwrite elements equal to val with valid elements."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int removeElement(int[] nums, int val) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def removeElement(self, nums: List[int], val: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} val\n * @return {number}\n */\nvar removeElement = function(nums, val) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int removeElement(vector<int>& nums, int val) {\n        return 0;\n    }\n};"
        },
        "function_name": "removeElement",
        "examples": [
            {"input": "nums = [3,2,2,3], val = 3", "output": "2, nums = [2,2,_,_]"},
            {"input": "nums = [0,1,2,2,3,0,4,2], val = 2", "output": "5, nums = [0,1,3,0,4,_,_,_]"}
        ]
    },
    {
        "title": "Reverse Words in a String",
        "description": "Given an input string s, reverse the order of the words. A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space. Return a string of the words in reverse order concatenated by a single space.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "String"],
        "constraints": ["1 <= s.length <= 10^4", "s contains English letters (upper-case and lower-case), digits, and spaces ' '.", "There is at least one word in s."],
        "hints": ["First, trim leading/trailing spaces and reduce multiple spaces to one.", "Reverse the entire string, then reverse each individual word."],
        "boilerplate_code": {
            "java": "class Solution {\n    public String reverseWords(String s) {\n        return \"\";\n    }\n}",
            "python": "class Solution:\n    def reverseWords(self, s: str) -> str:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {string}\n */\nvar reverseWords = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    string reverseWords(string s) {\n        return \"\";\n    }\n};"
        },
        "function_name": "reverseWords",
        "examples": [
            {"input": "s = \"the sky is blue\"", "output": "\"blue is sky the\""},
            {"input": "s = \"  hello world  \"", "output": "\"world hello\""}
        ]
    },
    {
        "title": "Valid Triangle Number",
        "description": "Given an integer array nums, return the number of triplets chosen from the array that can make triangles if we take them as side lengths of a triangle.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Sorting", "Greedy"],
        "constraints": ["1 <= nums.length <= 1000", "0 <= nums[i] <= 1000"],
        "hints": ["Sort the array.", "Fix the largest side (c) and use two pointers to find pairs (a, b) such that a + b > c."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int triangleNumber(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def triangleNumber(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar triangleNumber = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int triangleNumber(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "triangleNumber",
        "examples": [
            {"input": "nums = [2,2,3,4]", "output": "3"},
            {"input": "nums = [4,2,3,4]", "output": "4"}
        ]
    },
    {
        "title": "Boats to Save People",
        "description": "You are given an array people where people[i] is the weight of the ith person, and an infinite number of boats where each boat can carry a maximum weight of limit. Each boat carries at most two people at the same time, provided the sum of the weight of those people is at most limit. Return the minimum number of boats to carry every given person.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Greedy", "Sorting"],
        "constraints": ["1 <= people.length <= 5 * 10^4", "1 <= people[i] <= limit <= 3 * 10^4"],
        "hints": ["Sort the people by weight.", "Try to pair the heaviest person with the lightest person. If they fit, put them in a boat. otherwise, the heaviest person goes alone."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int numRescueBoats(int[] people, int limit) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def numRescueBoats(self, people: List[int], limit: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} people\n * @param {number} limit\n * @return {number}\n */\nvar numRescueBoats = function(people, limit) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int numRescueBoats(vector<int>& people, int limit) {\n        return 0;\n    }\n};"
        },
        "function_name": "numRescueBoats",
        "examples": [
            {"input": "people = [1,2], limit = 3", "output": "1"},
            {"input": "people = [3,2,2,1], limit = 3", "output": "3"}
        ]
    },
    {
        "title": "Bag of Tokens",
        "description": "You have an initial power of power and an initial score of 0. You are given a bag of tokens where tokens[i] is the value of the ith token. Your goal is to maximize your total score by potentially playing each token in one of two ways: Face-up (loose power, gain score) or Face-down (gain power, loose score). Return the maximum possible score you can achieve after playing any number of tokens.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Greedy", "Sorting"],
        "constraints": ["0 <= tokens.length <= 1000", "0 <= tokens[i], power <= 10^4"],
        "hints": ["Sort the tokens.", "Buy tokens (Face-up) with the smallest value to save power, and sell tokens (Face-down) with the largest value to gain power."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int bagOfTokensScore(int[] tokens, int power) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def bagOfTokensScore(self, tokens: List[int], power: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} tokens\n * @param {number} power\n * @return {number}\n */\nvar bagOfTokensScore = function(tokens, power) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int bagOfTokensScore(vector<int>& tokens, int power) {\n        return 0;\n    }\n};"
        },
        "function_name": "bagOfTokensScore",
        "examples": [
            {"input": "tokens = [100], power = 50", "output": "0"},
            {"input": "tokens = [100,200], power = 150", "output": "1"}
        ]
    },
    {
        "title": "Rotate Array",
        "description": "Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Math"],
        "constraints": ["1 <= nums.length <= 10^5", "-2^31 <= nums[i] <= 2^31 - 1", "0 <= k <= 10^5"],
        "hints": ["Reverse the entire array.", "Reverse the first k elements and then reverse the rest."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void rotate(int[] nums, int k) {\n        \n    }\n}",
            "python": "class Solution:\n    def rotate(self, nums: List[int], k: int) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} k\n * @return {void} Do not return anything, modify nums in-place instead.\n */\nvar rotate = function(nums, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void rotate(vector<int>& nums, int k) {\n        \n    }\n};"
        },
        "function_name": "rotate",
        "examples": [
            {"input": "nums = [1,2,3,4,5,6,7], k = 3", "output": "[5,6,7,1,2,3,4]"},
            {"input": "nums = [-1,-100,3,99], k = 2", "output": "[3,99,-1,-100]"}
        ]
    },
    {
        "title": "Palindromic Substrings",
        "description": "Given a string s, return the number of palindromic substrings in it. A string is a palindrome when it reads the same backward as forward. A substring is a contiguous sequence of characters within the string.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "String", "Dynamic Programming"],
        "constraints": ["1 <= s.length <= 1000", "s consists of lowercase English letters."],
        "hints": ["Expand around the center for each character (and between characters) to find palindromes.", "Count the valid palindromes found during expansion."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int countSubstrings(String s) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def countSubstrings(self, s: str) -> int:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {number}\n */\nvar countSubstrings = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int countSubstrings(string s) {\n        return 0;\n    }\n};"
        },
        "function_name": "countSubstrings",
        "examples": [
            {"input": "s = \"abc\"", "output": "3"},
            {"input": "s = \"aaa\"", "output": "6"}
        ]
    },
    {
        "title": "Median of Two Sorted Arrays",
        "description": "Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).",
        "difficulty": "HARD",
        "topics": ["Two Pointers", "Arrays", "Binary Search", "Divide and Conquer"],
        "constraints": ["nums1.length == m", "nums2.length == n", "0 <= m, n <= 1000", "1 <= m + n <= 2000"],
        "hints": ["Try to partition both arrays such that elements on the left are smaller than elements on the right.", "Use binary search on the smaller array to find the correct partition."],
        "boilerplate_code": {
            "java": "class Solution {\n    public double findMedianSortedArrays(int[] nums1, int[] nums2) {\n        return 0.0;\n    }\n}",
            "python": "class Solution:\n    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:\n        pass",
            "javascript": "/**\n * @param {number[]} nums1\n * @param {number[]} nums2\n * @return {number}\n */\nvar findMedianSortedArrays = function(nums1, nums2) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {\n        return 0.0;\n    }\n};"
        },
        "function_name": "findMedianSortedArrays",
        "examples": [
            {"input": "nums1 = [1,3], nums2 = [2]", "output": "2.0"},
            {"input": "nums1 = [1,2], nums2 = [3,4]", "output": "2.5"}
        ]
    },
     {
        "title": "Remove Duplicates from Sorted List",
        "description": "Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Linked List"],
        "constraints": ["The number of nodes in the list is in the range [0, 300].", "-100 <= Node.val <= 100", "The list is guaranteed to be sorted in ascending order."],
        "hints": ["Use a pointer to traverse carefully.", "If current node's value is same as next node's value, skip the next node."],
        "boilerplate_code": {
            "java": "/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode deleteDuplicates(ListNode head) {\n        return null;\n    }\n}",
            "python": "# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar deleteDuplicates = function(head) {\n    \n};",
            "cpp": "/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* deleteDuplicates(ListNode* head) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "deleteDuplicates",
        "examples": [
            {"input": "head = [1,1,2]", "output": "[1,2]"},
            {"input": "head = [1,1,2,3,3]", "output": "[1,2,3]"}
        ]
    },
    {
        "title": "Remove Nth Node From End of List",
        "description": "Given the head of a linked list, remove the nth node from the end of the list and return its head.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Linked List"],
        "constraints": ["The number of nodes in the list is sz.", "1 <= sz <= 30", "0 <= Node.val <= 100", "1 <= n <= sz"],
        "hints": ["Use two pointers, fast and slow.", "Move fast n steps ahead, then move both fast and slow until fast reaches the end."],
        "boilerplate_code": {
            "java": "/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode removeNthFromEnd(ListNode head, int n) {\n        return null;\n    }\n}",
            "python": "# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @param {number} n\n * @return {ListNode}\n */\nvar removeNthFromEnd = function(head, n) {\n    \n};",
            "cpp": "/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* removeNthFromEnd(ListNode* head, int n) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "removeNthFromEnd",
        "examples": [
            {"input": "head = [1,2,3,4,5], n = 2", "output": "[1,2,3,5]"},
            {"input": "head = [1], n = 1", "output": "[]"}
        ]
    },
    {
        "title": "Partition List",
        "description": "Given the head of a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x. You should preserve the original relative order of the nodes in each of the two partitions.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Linked List"],
        "constraints": ["The number of nodes in the list is in the range [0, 200].", "-100 <= Node.val <= 100", "-200 <= x <= 200"],
        "hints": ["Create two separate lists: one for elements less than x and one for elements greater or equal.", "Merge the two lists at the end."],
        "boilerplate_code": {
            "java": "/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode partition(ListNode head, int x) {\n        return null;\n    }\n}",
            "python": "# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def partition(self, head: Optional[ListNode], x: int) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @param {number} x\n * @return {ListNode}\n */\nvar partition = function(head, x) {\n    \n};",
            "cpp": "/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* partition(ListNode* head, int x) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "partition",
        "examples": [
            {"input": "head = [1,4,3,2,5,2], x = 3", "output": "[1,2,2,4,3,5]"},
            {"input": "head = [2,1], x = 2", "output": "[1,2]"}
        ]
    },
    {
        "title": "Linked List Cycle",
        "description": "Given head, the head of a linked list, determine if the linked list has a cycle in it. There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Linked List", "Hash Table"],
        "constraints": ["The number of nodes in the list is in the range [0, 10^4].", "-10^5 <= Node.val <= 10^5", "pos is -1 or a valid index in the linked-list."],
        "hints": ["Use two pointers (fast and slow). If they meet, there is a cycle.", "Fast moves 2 steps, slow moves 1 step."],
        "boilerplate_code": {
            "java": "/**\n * Definition for singly-linked list.\n * class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) {\n *         val = x;\n *         next = null;\n *     }\n * }\n */\npublic class Solution {\n    public boolean hasCycle(ListNode head) {\n        return false;\n    }\n}",
            "python": "# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, x):\n#         self.val = x\n#         self.next = None\nclass Solution:\n    def hasCycle(self, head: Optional[ListNode]) -> bool:\n        pass",
            "javascript": "/**\n * Definition for singly-linked list.\n * function ListNode(val) {\n *     this.val = val;\n *     this.next = null;\n * }\n */\n/**\n * @param {ListNode} head\n * @return {boolean}\n */\nvar hasCycle = function(head) {\n    \n};",
            "cpp": "/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode(int x) : val(x), next(NULL) {}\n * };\n */\nclass Solution {\npublic:\n    bool hasCycle(ListNode *head) {\n        return false;\n    }\n};"
        },
        "function_name": "hasCycle",
        "examples": [
            {"input": "head = [3,2,0,-4], pos = 1", "output": "true"},
            {"input": "head = [1,2], pos = 0", "output": "true"}
        ]
    },
    {
        "title": "Linked List Cycle II",
        "description": "Given the head of a linked list, return the node where the cycle begins. If there is no cycle, return null. There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Linked List", "Hash Table"],
        "constraints": ["The number of nodes in the list is in the range [0, 10^4].", "-10^5 <= Node.val <= 10^5", "pos is -1 or a valid index in the linked-list."],
        "hints": ["First detect the cycle using fast and slow pointers.", "Reset one pointer to head and move both one step at a time until they meet."],
        "boilerplate_code": {
            "java": "/**\n * Definition for singly-linked list.\n * class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) {\n *         val = x;\n *         next = null;\n *     }\n * }\n */\npublic class Solution {\n    public ListNode detectCycle(ListNode head) {\n        return null;\n    }\n}",
            "python": "# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, x):\n#         self.val = x\n#         self.next = None\nclass Solution:\n    def detectCycle(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * Definition for singly-linked list.\n * function ListNode(val) {\n *     this.val = val;\n *     this.next = null;\n * }\n */\n/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar detectCycle = function(head) {\n    \n};",
            "cpp": "/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode(int x) : val(x), next(NULL) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode *detectCycle(ListNode *head) {\n        return NULL;\n    }\n};"
        },
        "function_name": "detectCycle",
        "examples": [
            {"input": "head = [3,2,0,-4], pos = 1", "output": "tail connects to node index 1"},
            {"input": "head = [1], pos = -1", "output": "no cycle"}
        ]
    },
    {
        "title": "Longest Substring Without Repeating Characters",
        "description": "Given a string s, find the length of the longest substring without repeating characters.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "String", "Hash Table", "Sliding Window"],
        "constraints": ["0 <= s.length <= 5 * 10^4", "s consists of English letters, digits, symbols and spaces."],
        "hints": ["Use a sliding window approach.", "Keep a set or map of characters in the current window and contract from left if a duplicate is found."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int lengthOfLongestSubstring(String s) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def lengthOfLongestSubstring(self, s: str) -> int:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {number}\n */\nvar lengthOfLongestSubstring = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int lengthOfLongestSubstring(string s) {\n        return 0;\n    }\n};"
        },
        "function_name": "lengthOfLongestSubstring",
        "examples": [
            {"input": "s = \"abcabcbb\"", "output": "3"},
            {"input": "s = \"bbbbb\"", "output": "1"}
        ]
    },
     {
        "title": "Minimum Window Substring",
        "description": "Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string \"\".",
        "difficulty": "HARD",
        "topics": ["Two Pointers", "String", "Hash Table", "Sliding Window"],
        "constraints": ["m == s.length", "n == t.length", "1 <= m, n <= 10^5"],
        "hints": ["Use two pointers to create a window.", "Expand the window until constraints are met, then contract it to find the minimum length."],
        "boilerplate_code": {
            "java": "class Solution {\n    public String minWindow(String s, String t) {\n        return \"\";\n    }\n}",
            "python": "class Solution:\n    def minWindow(self, s: str, t: str) -> str:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @param {string} t\n * @return {string}\n */\nvar minWindow = function(s, t) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    string minWindow(string s, string t) {\n        return \"\";\n    }\n};"
        },
        "function_name": "minWindow",
        "examples": [
            {"input": "s = \"ADOBECODEBANC\", t = \"ABC\"", "output": "\"BANC\""},
            {"input": "s = \"a\", t = \"a\"", "output": "\"a\""}
        ]
    },
    {
        "title": "Permutation in String",
        "description": "Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise. In other words, return true if one of s1's permutations is the substring of s2.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "String", "Sliding Window", "Hash Table"],
        "constraints": ["1 <= s1.length, s2.length <= 10^4", "s1 and s2 consist of lowercase English letters."],
        "hints": ["Use a sliding window of size s1.length on s2.", "Compare character counts of the window with s1."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean checkInclusion(String s1, String s2) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def checkInclusion(self, s1: str, s2: str) -> bool:\n        pass",
            "javascript": "/**\n * @param {string} s1\n * @param {string} s2\n * @return {boolean}\n */\nvar checkInclusion = function(s1, s2) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool checkInclusion(string s1, string s2) {\n        return false;\n    }\n};"
        },
        "function_name": "checkInclusion",
        "examples": [
            {"input": "s1 = \"ab\", s2 = \"eidbaooo\"", "output": "true"},
            {"input": "s1 = \"ab\", s2 = \"eidboaoo\"", "output": "false"}
        ]
    },
    {
        "title": "Separate Black and White Balls",
        "description": "There are n balls on a table, each ball has a color black or white. You are given a 0-indexed binary string s of length n, where 1 and 0 represent black and white balls, respectively. In each step, you can choose two adjacent balls and swap them. Return the minimum number of steps to group all the black balls to the right and all the white balls to the left.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Strings", "Greedy"],
        "constraints": ["1 <= s.length <= 10^5", "s[i] is either '0' or '1'"],
        "hints": ["Every '0' encountered should be moved to the left of all '1's seen so far.", "Iterate and count '1's. When you see a '0', add the count of '1's to the answer."],
        "boilerplate_code": {
            "java": "class Solution {\n    public long minimumSteps(String s) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def minimumSteps(self, s: str) -> int:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {number}\n */\nvar minimumSteps = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    long long minimumSteps(string s) {\n        return 0;\n    }\n};"
        },
        "function_name": "minimumSteps",
        "examples": [
            {"input": "s = \"101\"", "output": "1"},
            {"input": "s = \"100\"", "output": "2"}
        ]
    },
    {
        "title": "Reverse Vowels of a String",
        "description": "Given a string s, reverse only all the vowels in the string and return it. The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "String"],
        "constraints": ["1 <= s.length <= 3 * 10^5", "s consist of printable ASCII characters."],
        "hints": ["Use two pointers: one from the start, one from the end.", "Move them until they both point to vowels, then swap and continue."],
        "boilerplate_code": {
            "java": "class Solution {\n    public String reverseVowels(String s) {\n        return \"\";\n    }\n}",
            "python": "class Solution:\n    def reverseVowels(self, s: str) -> str:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {string}\n */\nvar reverseVowels = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    string reverseVowels(string s) {\n        return \"\";\n    }\n};"
        },
        "function_name": "reverseVowels",
        "examples": [
            {"input": "s = \"hello\"", "output": "\"holle\""},
            {"input": "s = \"leetcode\"", "output": "\"leotcede\""}
        ]
    },
    {
        "title": "Sort Array By Parity",
        "description": "Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers. Return any array that satisfies this condition.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Arrays", "Sorting"],
        "constraints": ["1 <= nums.length <= 5000", "0 <= nums[i] <= 5000"],
        "hints": ["Use two pointers or simply process array and collect evens then odds.", "In-place: swap even element found at 'read' pointer to 'write' pointer position."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] sortArrayByParity(int[] nums) {\n        return new int[0];\n    }\n}",
            "python": "class Solution:\n    def sortArrayByParity(self, nums: List[int]) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number[]}\n */\nvar sortArrayByParity = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> sortArrayByParity(vector<int>& nums) {\n        return {};\n    }\n};"
        },
        "function_name": "sortArrayByParity",
        "examples": [
            {"input": "nums = [3,1,2,4]", "output": "[2,4,3,1]"},
            {"input": "nums = [0]", "output": "[0]"}
        ]
    }
];

// Generate SQL
let sql_content = "";
const values_list = [];
const titles = questions.map(q => `'${q.title.replace(/'/g, "''")}'`).join(", ");

// Delete existing to avoid duplicates
sql_content += `DELETE FROM test_cases WHERE problem_id IN (SELECT id FROM problems WHERE title IN (${titles}));\n`;
sql_content += `DELETE FROM problems WHERE title IN (${titles});\n\n`;

sql_content += "INSERT INTO problems (title, description, difficulty, topics, constraints, boilerplate_code, function_name, examples, hints) VALUES \n";

for (const q of questions) {
    const title = q.title.replace(/'/g, "''");
    const desc = q.description.replace(/'/g, "''");
    const diff = q.difficulty;
    const topics = JSON.stringify(q.topics);
    const constraints = JSON.stringify(q.constraints).replace(/'/g, "''");
    const boilerplate = JSON.stringify(q.boilerplate_code).replace(/'/g, "''");
    const func_name = q.function_name;
    const examples = JSON.stringify(q.examples).replace(/'/g, "''");
    const hints = JSON.stringify(q.hints).replace(/'/g, "''");
    
    const value = `('${title}', '${desc}', '${diff}', '${topics}'::jsonb, '${constraints}'::jsonb, '${boilerplate}'::jsonb, '${func_name}', '${examples}'::jsonb, '${hints}'::jsonb)`;
    values_list.push(value);
}

sql_content += values_list.join(",\n") + ";";

// Write to file
fs.writeFileSync("insert_two_pointers_30.sql", sql_content, { encoding: 'utf-8' });

console.log("SQL file generated successfully with " + questions.length + " questions.");
