module.exports = [
    {
        "title": "Chocolate Distribution Problem",
        "description": "Given an array A[ ] of positive integers of size N, where each value represents the number of chocolates in a packet. Each packet can have a variable number of chocolates. There are M students, the task is to distribute chocolate packets among M students such that: 1. Each student gets exactly one packet. 2. The difference between maximum number of chocolates given to a student and minimum number of chocolates given to a student is minimum.",
        "difficulty": "EASY",
        "topics": ["Arrays", "Sorting", "Sliding Window"],
        "constraints": ["1 <= N <= 10^5", "1 <= A[i] <= 10^9", "1 <= M <= N"],
        "hints": ["Sort the array.", "Use a sliding window of size M to find the minimum difference between A[i+M-1] and A[i]."],
        "boilerplate_code": {
            "java": "class Solution {\n    public long findMinDiff(ArrayList<Integer> a, int n, int m) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def findMinDiff(self, a: List[int], n: int, m: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} a\n * @param {number} n\n * @param {number} m\n * @return {number}\n */\nvar findMinDiff = function(a, n, m) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    long long findMinDiff(vector<long long> a, long long n, long long m) {\n        return 0;\n    }\n};"
        },
        "function_name": "findMinDiff",
        "examples": [
            {"input": "a = [3, 4, 1, 9, 56, 7, 9, 12], n = 8, m = 5", "output": "6"},
            {"input": "a = [7, 3, 2, 4, 9, 12, 56], n = 7, m = 3", "output": "2"}
        ],
        "testCases": [
            { "input": JSON.stringify({ a: [3, 4, 1, 9, 56, 7, 9, 12], n: 8, m: 5 }), "expectedOutput": "6" },
            { "input": JSON.stringify({ a: [7, 3, 2, 4, 9, 12, 56], n: 7, m: 3 }), "expectedOutput": "2" }
        ]
    },
    {
        "title": "Subarray with Given Sum",
        "description": "Given an unsorted array A of size N that contains only non-negative integers, find a continuous sub-array which adds to a given number S. Return the left and right indexes (1-based index) of that subarray.",
        "difficulty": "MEDIUM",
        "topics": ["Arrays", "Two Pointers", "Sliding Window"],
        "constraints": ["1 <= N <= 10^5", "0 <= A[i] <= 10^9", "0 <= S <= 10^9"],
        "hints": ["Use a sliding window. Add elements to variable 'currentSum'.", "While 'currentSum' > S, remove elements from the start."],
        "boilerplate_code": {
            "java": "class Solution {\n    public ArrayList<Integer> subarraySum(int[] arr, int n, int s) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def subarraySum(self, arr: List[int], n: int, s: int) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} arr\n * @param {number} n\n * @param {number} s\n * @return {number[]}\n */\nvar subarraySum = function(arr, n, s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> subarraySum(vector<int> arr, int n, long long s) {\n        return {};\n    }\n};"
        },
        "function_name": "subarraySum",
        "examples": [
            {"input": "n = 5, s = 12, arr = [1,2,3,7,5]", "output": "[2,4]"},
            {"input": "n = 10, s = 15, arr = [1,2,3,4,5,6,7,8,9,10]", "output": "[1,5]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ arr: [1,2,3,7,5], n: 5, s: 12 }), "expectedOutput": `[2,4]` },
            { "input": JSON.stringify({ arr: [1,2,3,4,5,6,7,8,9,10], n: 10, s: 15 }), "expectedOutput": `[1,5]` }
        ]
    },
    {
        "title": "Longest Subarray with Sum K",
        "description": "Given an array containing N integers and an integer K, your task is to find the length of the longest Sub-Array with the sum of the elements equal to the given value K.",
        "difficulty": "MEDIUM",
        "topics": ["Arrays", "Hash Table", "Prefix Sum"],
        "constraints": ["1 <= N <= 10^5", "-10^5 <= A[i] <= 10^5", "-10^9 <= K <= 10^9"],
        "hints": ["This works for negative numbers too, so simple sliding window won't work.", "Use a HashMap to store the prefix sum and its first occurrence index."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int lenOfLongSubarr(int A[], int N, int K) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def lenOfLongSubarr(self, A: List[int], N: int, K: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} A\n * @param {number} N\n * @param {number} K\n * @return {number}\n */\nvar lenOfLongSubarr = function(A, N, K) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int lenOfLongSubarr(int A[], int N, int K) {\n        return 0;\n    }\n};"
        },
        "function_name": "lenOfLongSubarr",
        "examples": [
            {"input": "A = [10, 5, 2, 7, 1, 9], K = 15", "output": "4"},
            {"input": "A = [-1, 2, 3], K = 6", "output": "0"}
        ],
        "testCases": [
            { "input": JSON.stringify({ A: [10, 5, 2, 7, 1, 9], N: 6, K: 15 }), "expectedOutput": "4" },
            { "input": JSON.stringify({ A: [-1, 2, 3], N: 3, K: 6 }), "expectedOutput": "0" }
        ]
    },
    {
        "title": "Minimum Window Substring",
        "description": "Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string \"\".",
        "difficulty": "HARD",
        "topics": ["Strings", "Sliding Window", "Hash Table"],
        "constraints": ["m == s.length", "n == t.length", "1 <= m, n <= 10^5", "s and t consist of uppercase and lowercase English letters."],
        "hints": ["Use a sliding window and two hash maps (or arrays) for frequency.", "Expand window to satisfy counts. Shrink to minimize length."],
        "boilerplate_code": {
            "java": "class Solution {\n    public String minWindow(String s, String t) {\n        return \"\";\n    }\n}",
            "python": "class Solution:\n    def minWindow(self, s: str, t: str) -> str:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @param {string} t\n * @return {string}\n */\nvar minWindow = function(s, t) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    string minWindow(string s, string t) {\n        return \"\";\n    }\n};"
        },
        "function_name": "minWindow",
        "examples": [
            {"input": "s = \"ADOBECODEBANC\", t = \"ABC\"", "output": "\"BANC\""},
            {"input": "s = \"a\", t = \"aa\"", "output": "\"\""}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "ADOBECODEBANC", t: "ABC" }), "expectedOutput": "BANC" },
            { "input": JSON.stringify({ s: "a", t: "aa" }), "expectedOutput": "" }
        ]
    },
    {
        "title": "Subarray Product Less Than K",
        "description": "Given an array of integers nums and an integer k, return the number of contiguous subarrays where the product of all the elements in the subarray is strictly less than k.",
        "difficulty": "MEDIUM",
        "topics": ["Arrays", "Sliding Window"],
        "constraints": ["1 <= nums.length <= 3 * 10^4", "1 <= nums[i] <= 1000", "0 <= k <= 10^6"],
        "hints": ["Use a sliding window. Maintain the product of elements in the window.", "If product >= k, divide by nums[left] and increment left.", "Add (right - left + 1) to the count at each step."],
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
            { "input": JSON.stringify({ nums: [10,5,2,6], k: 100 }), "expectedOutput": "8" },
            { "input": JSON.stringify({ nums: [1,2,3], k: 0 }), "expectedOutput": "0" }
        ]
    },
    {
        "title": "Longest Substring with At Most K Distinct Characters",
        "description": "Given a string s and an integer k, return the length of the longest substring of s that contains at most k distinct characters.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Sliding Window", "Hash Table"],
        "constraints": ["1 <= s.length <= 5 * 10^4", "0 <= k <= 50"],
        "hints": ["Use a sliding window and a hash map to count character frequencies.", "If map size > k, shrink the window from the left."],
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
            { "input": JSON.stringify({ s: "eceba", k: 2 }), "expectedOutput": "3" },
            { "input": JSON.stringify({ s: "aa", k: 1 }), "expectedOutput": "2" }
        ]
    }
];
