module.exports = [
    {
        "title": "Find All Anagrams in a String",
        "description": "Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order. An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Sliding Window", "Hash Table"],
        "constraints": ["1 <= s.length, p.length <= 3 * 10^4", "s and p consist of lowercase English letters."],
        "hints": ["Sliding window of size p.length.", "Maintain frequency counts of characters in the window and compare with p."],
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
            { "input": JSON.stringify({ s: "cbaebabacd", p: "abc" }), "expectedOutput": `[0,6]` },
            { "input": JSON.stringify({ s: "abab", p: "ab" }), "expectedOutput": `[0,1,2]` }
        ]
    },
    {
        "title": "Maximum Sum Subarray of Size K",
        "description": "Given an array of integers Arr of size N and an integer K, find the maximum sum of a subarray of size K.",
        "difficulty": "EASY",
        "topics": ["Arrays", "Sliding Window"],
        "constraints": ["1 <= K <= N <= 10^5", "0 <= Arr[i] <= 10^5"],
        "hints": ["Compute sum of first K elements.", "Slide the window by one element: subtract the element going out, add the element coming in. Update Max."],
        "boilerplate_code": {
            "java": "class Solution {\n    public long maximumSumSubarray(int K, ArrayList<Integer> Arr, int N) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def maximumSumSubarray(self, K: int, Arr: List[int], N: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number} K\n * @param {number[]} Arr\n * @param {number} N\n * @return {number}\n */\nvar maximumSumSubarray = function(K, Arr, N) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    long long maximumSumSubarray(int K, vector<int> &Arr, int N) {\n        return 0;\n    }\n};"
        },
        "function_name": "maximumSumSubarray",
        "examples": [
            {"input": "N = 4, K = 2, Arr = [100, 200, 300, 400]", "output": "700"},
            {"input": "N = 4, K = 4, Arr = [100, 200, 300, 400]", "output": "1000"}
        ],
        "testCases": [
            { "input": JSON.stringify({ K: 2, Arr: [100, 200, 300, 400], N: 4 }), "expectedOutput": "700" },
            { "input": JSON.stringify({ K: 4, Arr: [100, 200, 300, 400], N: 4 }), "expectedOutput": "1000" }
        ]
    },
    {
        "title": "First Negative Integer in Every Window of Size K",
        "description": "Given an array A of size N and a positive integer K, find the first negative integer for each and every window(contiguous subarray) of size K.",
        "difficulty": "MEDIUM",
        "topics": ["Arrays", "Sliding Window", "Queue"],
        "constraints": ["1 <= N <= 10^5", "-10^5 <= A[i] <= 10^5", "1 <= K <= N"],
        "hints": ["Use a Deque to store indices of negative integers in the current window.", "Or just a simple queue storing the negative numbers themselves."],
        "boilerplate_code": {
            "java": "class Solution {\n    public long[] printFirstNegativeInteger(long A[], int N, int K) {\n        return new long[0];\n    }\n}",
            "python": "class Solution:\n    def printFirstNegativeInteger(self, A: List[int], N: int, K: int) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} A\n * @param {number} N\n * @param {number} K\n * @return {number[]}\n */\nvar printFirstNegativeInteger = function(A, N, K) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<long long> printFirstNegativeInteger(long long A[], long long N, long long K) {\n        return {};\n    }\n};"
        },
        "function_name": "printFirstNegativeInteger",
        "examples": [
            {"input": "N = 5, A = [-8, 2, 3, -6, 10], K = 2", "output": "[-8, 0, -6, -6]"},
            {"input": "N = 8, A = [12, -1, -7, 8, -15, 30, 16, 28], K = 3", "output": "[-1, -1, -7, -15, -15, 0]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ A: [-8, 2, 3, -6, 10], N: 5, K: 2 }), "expectedOutput": `[-8,0,-6,-6]` },
            { "input": JSON.stringify({ A: [12, -1, -7, 8, -15, 30, 16, 28], N: 8, K: 3 }), "expectedOutput": `[-1,-1,-7,-15,-15,0]` }
        ]
    },
    {
        "title": "Distinct Elements in Window of size K",
        "description": "Given an array of integers and an integer K. Find the count of distinct elements in every window of size K in the array.",
        "difficulty": "MEDIUM",
        "topics": ["Arrays", "Hash Table", "Sliding Window"],
        "constraints": ["1 <= K <= N <= 10^5", "1 <= A[i] <= 10^5"],
        "hints": ["Use a HashMap to store frequency of elements in the current window.", "When sliding, decrease count of outgoing element (remove if 0), increase count of incoming. Map size is answer."],
        "boilerplate_code": {
            "java": "class Solution {\n    public ArrayList<Integer> countDistinct(int A[], int n, int k) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def countDistinct(self, A: List[int], n: int, k: int) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} A\n * @param {number} n\n * @param {number} k\n * @return {number[]}\n */\nvar countDistinct = function(A, n, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> countDistinct(vector<int> A, int n, int k) {\n        return {};\n    }\n};"
        },
        "function_name": "countDistinct",
        "examples": [
            {"input": "A = [1, 2, 1, 3, 4, 2, 3], K = 4", "output": "[3, 4, 4, 3]"},
            {"input": "A = [4, 1, 1], K = 2", "output": "[2, 1]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ A: [1, 2, 1, 3, 4, 2, 3], n: 7, k: 4 }), "expectedOutput": `[3,4,4,3]` },
            { "input": JSON.stringify({ A: [4, 1, 1], n: 3, k: 2 }), "expectedOutput": `[2,1]` }
        ]
    },
    {
        "title": "Minimum Platforms",
        "description": "Given arrival and departure times of all trains that reach a railway station. Find the minimum number of platforms required for the railway station so that no train is kept waiting. Consider that all the trains arrive on the same day and leave on the same day. Arrival and departure time can never be the same for a train but we can have arrival time of one train equal to departure time of the other. At any given instance of time, same platform can not be used for both departure of a train and arrival of another train. In such cases, we need different platforms.",
        "difficulty": "MEDIUM",
        "topics": ["Sorting", "Greedy", "Two Pointers"],
        "constraints": ["1 <= n <= 50000", "0 <= arr[i] <= dep[i] <= 2359"],
        "hints": ["Sort both arrival and departure arrays.", "Use two pointers. If arrival[i] <= departure[j], we need a platform. Else, a platform is freed."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int findPlatform(int arr[], int dep[], int n) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def findPlatform(self, arr: List[int], dep: List[int], n: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} arr\n * @param {number[]} dep\n * @param {number} n\n * @return {number}\n */\nvar findPlatform = function(arr, dep, n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int findPlatform(int arr[], int dep[], int n) {\n        return 0;\n    }\n};"
        },
        "function_name": "findPlatform",
        "examples": [
            {"input": "n = 6, arr = [0900, 0940, 0950, 1100, 1500, 1800], dep = [0910, 1200, 1120, 1130, 1900, 2000]", "output": "3"},
            {"input": "n = 3, arr = [0900, 1100, 1235], dep = [1000, 1200, 1240]", "output": "1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ arr: [900, 940, 950, 1100, 1500, 1800], dep: [910, 1200, 1120, 1130, 1900, 2000], n: 6 }), "expectedOutput": "3" }
        ]
    }
];
