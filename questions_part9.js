module.exports = [
    {
        "title": "Max Consecutive Ones III",
        "description": "Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.",
        "difficulty": "MEDIUM",
        "topics": ["Arrays", "Sliding Window", "Prefix Sum"],
        "constraints": ["1 <= nums.length <= 10^5", "nums[i] is either 0 or 1", "0 <= k <= nums.length"],
        "hints": ["Use a sliding window. Keep track of the number of zeros in the window.", "If zeros > k, shrink window from left until zeros <= k."],
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
            { "input": JSON.stringify({ nums: [1,1,1,0,0,0,1,1,1,1,0], k: 2 }), "expectedOutput": "6" },
            { "input": JSON.stringify({ nums: [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k: 3 }), "expectedOutput": "10" }
        ]
    },
    {
        "title": "Permutation in String",
        "description": "Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise. In other words, return true if one of s1's permutations is the substring of s2.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Sliding Window", "Hash Table"],
        "constraints": ["1 <= s1.length, s2.length <= 10^4", "s1 and s2 consist of lowercase English letters."],
        "hints": ["Use a sliding window of size s1.length on s2.", "Compare frequency counts of characters."],
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
            { "input": JSON.stringify({ s1: "ab", s2: "eidbaooo" }), "expectedOutput": "true" },
            { "input": JSON.stringify({ s1: "ab", s2: "eidboaoo" }), "expectedOutput": "false" }
        ]
    },
    {
        "title": "Longest Substring with At Most Two Distinct Characters",
        "description": "Given a string s, return the length of the longest substring that contains at most two distinct characters.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Sliding Window", "Hash Table"],
        "constraints": ["1 <= s.length <= 10^5", "s consists of English letters."],
        "hints": ["Sliding window with a hash map to count characters.", "If map size > 2, shrink window."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int lengthOfLongestSubstringTwoDistinct(String s) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def lengthOfLongestSubstringTwoDistinct(self, s: str) -> int:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {number}\n */\nvar lengthOfLongestSubstringTwoDistinct = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int lengthOfLongestSubstringTwoDistinct(string s) {\n        return 0;\n    }\n};"
        },
        "function_name": "lengthOfLongestSubstringTwoDistinct",
        "examples": [
            {"input": "s = \"eceba\"", "output": "3"},
            {"input": "s = \"ccaabbb\"", "output": "5"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "eceba" }), "expectedOutput": "3" },
            { "input": JSON.stringify({ s: "ccaabbb" }), "expectedOutput": "5" }
        ]
    },
    {
        "title": "Count Occurrences of Anagrams",
        "description": "Given a word pat and a text txt. Return the count of the occurrences of anagrams of the word in the text.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Sliding Window", "Hash Table"],
        "constraints": ["1 <= txt.length <= 10^5", "1 <= pat.length <= txt.length"],
        "hints": ["Sliding window of size pat.length.", "Compare frequency maps."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int search(String pat, String txt) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def search(self, pat: str, txt: str) -> int:\n        pass",
            "javascript": "/**\n * @param {string} pat\n * @param {string} txt\n * @return {number}\n */\nvar search = function(pat, txt) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int search(string pat, string txt) {\n        return 0;\n    }\n};"
        },
        "function_name": "search",
        "examples": [
            {"input": "txt = \"forxxorfxdofr\", pat = \"for\"", "output": "3"},
            {"input": "txt = \"aabaabaa\", pat = \"aaba\"", "output": "4"}
        ],
        "testCases": [
            { "input": JSON.stringify({ txt: "forxxorfxdofr", pat: "for" }), "expectedOutput": "3" },
            { "input": JSON.stringify({ txt: "aabaabaa", pat: "aaba" }), "expectedOutput": "4" }
        ]
    },
    {
        "title": "Longest Repeating Character Replacement",
        "description": "You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times. Return the length of the longest substring containing the same letter you can get after performing the above operations.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Sliding Window"],
        "constraints": ["1 <= s.length <= 10^5", "s consists of only uppercase English letters.", "0 <= k <= s.length"],
        "hints": ["Sliding window. Maintain count of the most frequent character in the window.", "Window length - max freq <= k is valid. If > k, shrink."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int characterReplacement(String s, int k) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def characterReplacement(self, s: str, k: int) -> int:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @param {number} k\n * @return {number}\n */\nvar characterReplacement = function(s, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int characterReplacement(string s, int k) {\n        return 0;\n    }\n};"
        },
        "function_name": "characterReplacement",
        "examples": [
            {"input": "s = \"ABAB\", k = 2", "output": "4"},
            {"input": "s = \"AABABBA\", k = 1", "output": "4"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "ABAB", k: 2 }), "expectedOutput": "4" },
            { "input": JSON.stringify({ s: "AABABBA", k: 1 }), "expectedOutput": "4" }
        ]
    }
];
