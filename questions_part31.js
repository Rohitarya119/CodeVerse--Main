module.exports = [
    {
        "title": "Sort Colors",
        "description": "Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue. We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively. You must solve this problem without using the library's sort function.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Two Pointers", "Sorting"],
        "constraints": ["n == nums.length", "1 <= n <= 300", "nums[i] is either 0, 1, or 2."],
        "hints": ["Use the Dutch National Flag algorithm.", "Maintain three pointers: low, mid, high."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void sortColors(int[] nums) {\n        \n    }\n}",
            "python": "class Solution:\n    def sortColors(self, nums: List[int]) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {void} Do not return anything, modify nums in-place.\n */\nvar sortColors = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void sortColors(vector<int>& nums) {\n        \n    }\n};"
        },
        "function_name": "sortColors",
        "examples": [
            {"input": "nums = [2,0,2,1,1,0]", "output": "[0,0,1,1,2,2]"},
            {"input": "nums = [2,0,1]", "output": "[0,1,2]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [2,0,2,1,1,0] }), "expectedOutput": "[0,0,1,1,2,2]" }
        ]
    },
    {
        "title": "Max Consecutive Ones III",
        "description": "Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search", "Sliding Window", "Prefix Sum"],
        "constraints": ["1 <= nums.length <= 10^5", "nums[i] is either 0 or 1.", "0 <= k <= nums.length"],
        "hints": ["Sliding window: Expand right. If zeros > k, shrink left."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int longestOnes(int[] nums, int k) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def longestOnes(self, nums: List[int], k: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar longestOnes = function(nums, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int longestOnes(vector<int>& nums, int k) {\n        return 0;\n    }\n};"
        },
        "function_name": "longestOnes",
        "examples": [
            {"input": "nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2", "output": "6"},
            {"input": "nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3", "output": "10"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,1,1,0,0,0,1,1,1,1,0], k: 2 }), "expectedOutput": "6" }
        ]
    },
    {
        "title": "Permutation in String",
        "description": "Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise. In other words, return true if one of s1's permutations is the substring of s2.",
        "difficulty": "MEDIUM",
        "topics": ["Hash Table", "Two Pointers", "String", "Sliding Window"],
        "constraints": ["1 <= s1.length, s2.length <= 10^4", "s1 and s2 consist of lowercase English letters."],
        "hints": ["Sliding Window with Frequency Map array of size 26.", "Check if window match counts of s1."],
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
        ],
        "testCases": [
            { "input": JSON.stringify({ s1: "ab", s2: "eidbaooo" }), "expectedOutput": "true" }
        ]
    },
    {
        "title": "Find All Anagrams in a String",
        "description": "Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order. An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.",
        "difficulty": "MEDIUM",
        "topics": ["Hash Table", "String", "Sliding Window"],
        "constraints": ["1 <= s.length, p.length <= 3 * 10^4", "s and p consist of lowercase English letters."],
        "hints": ["Same as Permutation in String, but collect all start indices.", "Fixed size window of size p.length."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<Integer> findAnagrams(String s, String p) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def findAnagrams(self, s: str, p: str) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @param {string} p\n * @return {number[]}\n */\nvar findAnagrams = function(s, p) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> findAnagrams(string s, string p) {\n        return {};\n    }\n};"
        },
        "function_name": "findAnagrams",
        "examples": [
            {"input": "s = \"cbaebabacd\", p = \"abc\"", "output": "[0,6]"},
            {"input": "s = \"abab\", p = \"ab\"", "output": "[0,1,2]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "cbaebabacd", p: "abc" }), "expectedOutput": "[0,6]" }
        ]
    },
    {
        "title": "Longest Substring with At Most K Distinct Characters",
        "description": "Given a string s and an integer k, return the length of the longest substring of s that contains at most k distinct characters.",
        "difficulty": "MEDIUM",
        "topics": ["Hash Table", "String", "Sliding Window"],
        "constraints": ["1 <= s.length <= 5 * 10^4", "0 <= k <= 50"],
        "hints": ["Use a map to track character counts in window.", "If map size > k, shrink from left."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int lengthOfLongestSubstringKDistinct(String s, int k) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def lengthOfLongestSubstringKDistinct(self, s: str, k: int) -> int:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @param {number} k\n * @return {number}\n */\nvar lengthOfLongestSubstringKDistinct = function(s, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int lengthOfLongestSubstringKDistinct(string s, int k) {\n        return 0;\n    }\n};"
        },
        "function_name": "lengthOfLongestSubstringKDistinct",
        "examples": [
            {"input": "s = \"eceba\", k = 2", "output": "3"},
            {"input": "s = \"aa\", k = 1", "output": "2"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "eceba", k: 2 }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Subarray Product Less Than K",
        "description": "Given an array of integers nums and an integer k, return the number of contiguous subarrays where the product of all the elements in the subarray is strictly less than k.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Sliding Window"],
        "constraints": ["1 <= nums.length <= 3 * 10^4", "1 <= nums[i] <= 1000", "0 <= k <= 10^6"],
        "hints": ["Sliding window: expand right, multiply product. While product >= k, divide left and shrink.", "Count += (right - left + 1)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int numSubarrayProductLessThanK(int[] nums, int k) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def numSubarrayProductLessThanK(self, nums: List[int], k: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar numSubarrayProductLessThanK = function(nums, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int numSubarrayProductLessThanK(vector<int>& nums, int k) {\n        return 0;\n    }\n};"
        },
        "function_name": "numSubarrayProductLessThanK",
        "examples": [
            {"input": "nums = [10,5,2,6], k = 100", "output": "8"},
            {"input": "nums = [1,2,3], k = 0", "output": "0"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [10,5,2,6], k: 100 }), "expectedOutput": "8" }
        ]
    },
    {
        "title": "Reverse Words in a String",
        "description": "Given an input string s, reverse the order of the words. A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space. Return a string of the words in reverse order concatenated by a single space. Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "String"],
        "constraints": ["1 <= s.length <= 10^4", "s contains English letters (upper-case and lower-case), digits, and spaces ' '.", "There is at least one word in s."],
        "hints": ["Split by space, filter empty, reverse list, join."],
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
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "the sky is blue" }), "expectedOutput": "blue is sky the" }
        ]
    },
    {
        "title": "4Sum",
        "description": "Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that: 0 <= a, b, c, d < n, a, b, c, and d are distinct, and nums[a] + nums[b] + nums[c] + nums[d] == target. You may return the answer in any order.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Two Pointers", "Sorting"],
        "constraints": ["1 <= nums.length <= 200", "-10^9 <= nums[i] <= 10^9", "-10^9 <= target <= 10^9"],
        "hints": ["Sort the array.", "Use two nested loops for first two numbers, then Two Pointers for the remaining two."],
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
            { "input": JSON.stringify({ nums: [2,2,2,2,2], target: 8 }), "expectedOutput": "[[2,2,2,2]]" }
        ]
    }
];
