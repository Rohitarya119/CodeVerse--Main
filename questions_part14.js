module.exports = [
    {
        "title": "Square Root",
        "description": "Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well. You must not use any built-in exponent function or operator.",
        "difficulty": "EASY",
        "topics": ["Math", "Binary Search"],
        "constraints": ["0 <= x <= 2^31 - 1"],
        "hints": ["Binary search between 0 and x.", "Find k such that k*k <= x."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int mySqrt(int x) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def mySqrt(self, x: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number} x\n * @return {number}\n */\nvar mySqrt = function(x) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int mySqrt(int x) {\n        return 0;\n    }\n};"
        },
        "function_name": "mySqrt",
        "examples": [
            {"input": "x = 4", "output": "2"},
            {"input": "x = 8", "output": "2"}
        ],
        "testCases": [
            { "input": JSON.stringify({ x: 8 }), "expectedOutput": "2" }
        ]
    },
    {
        "title": "Find Smallest Letter Greater Than Target",
        "description": "You are given an array of characters letters that is sorted in non-decreasing order, and a character target. There are at least two different characters in letters. Return the smallest character in letters that is lexicographically greater than target. If such a character does not exist, return the first character in letters.",
        "difficulty": "EASY",
        "topics": ["Array", "Binary Search"],
        "constraints": ["2 <= letters.length <= 10^4", "letters[i] is a lowercase English letter.", "letters is sorted in non-decreasing order.", "target is a lowercase English letter."],
        "hints": ["Standard binary search to find upper bound.", "Wrap around if index equals length."],
        "boilerplate_code": {
            "java": "class Solution {\n    public char nextGreatestLetter(char[] letters, char target) {\n        return ' ';\n    }\n}",
            "python": "class Solution:\n    def nextGreatestLetter(self, letters: List[str], target: str) -> str:\n        pass",
            "javascript": "/**\n * @param {character[]} letters\n * @param {character} target\n * @return {character}\n */\nvar nextGreatestLetter = function(letters, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    char nextGreatestLetter(vector<char>& letters, char target) {\n        return ' ';\n    }\n};"
        },
        "function_name": "nextGreatestLetter",
        "examples": [
            {"input": "letters = [\"c\",\"f\",\"j\"], target = \"a\"", "output": "\"c\""},
            {"input": "letters = [\"c\",\"f\",\"j\"], target = \"c\"", "output": "\"f\""}
        ],
        "testCases": [
            { "input": JSON.stringify({ letters: ["c","f","j"], target: "a" }), "expectedOutput": "\"c\"" }
        ]
    },
    {
        "title": "Single Element in a Sorted Array",
        "description": "You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once. Return the single element that appears only once. Your solution must run in O(log n) time and O(1) space.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["1 <= nums.length <= 10^5", "0 <= nums[i] <= 10^5"],
        "hints": ["Binary search. Pairs start at even indices.", "If nums[mid] == nums[mid^1], pattern holds, move right."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int singleNonDuplicate(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def singleNonDuplicate(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar singleNonDuplicate = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int singleNonDuplicate(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "singleNonDuplicate",
        "examples": [
            {"input": "nums = [1,1,2,3,3,4,4,8,8]", "output": "2"},
            {"input": "nums = [3,3,7,7,10,11,11]", "output": "10"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,1,2,3,3,4,4,8,8] }), "expectedOutput": "2" }
        ]
    },
    {
        "title": "Median of Two Sorted Arrays",
        "description": "Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.",
        "difficulty": "HARD",
        "topics": ["Array", "Binary Search", "Divide and Conquer"],
        "constraints": ["nums1.length == m", "nums2.length == n", "0 <= m <= 1000", "0 <= n <= 1000", "1 <= m + n <= 2000", "-10^6 <= nums1[i], nums2[i] <= 10^6"],
        "hints": ["Use binary search to partition the smaller array.", "Ensure max(left) <= min(right)."],
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
    },
    {
        "title": "Aggressive Cows",
        "description": "You are given an array of integers stalls representing the positions of stalls on a line, and an integer k representing the number of cows. Arrays stalls is sorted. Find the largest minimum distance between any two cows.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search"],
        "constraints": ["2 <= stalls.length <= 10^5", "0 <= stalls[i] <= 10^9", "2 <= k <= stalls.length"],
        "hints": ["Binary search on the answer (distance). Range [1, max(stalls) - min(stalls)].", "Greedily place cows to check if distance 'd' is possible."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int maxDistance(int[] position, int m) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def maxDistance(self, position: List[int], m: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} position\n * @param {number} m\n * @return {number}\n */\nvar maxDistance = function(position, m) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int maxDistance(vector<int>& position, int m) {\n        return 0;\n    }\n};"
        },
        "function_name": "maxDistance",
        "examples": [
            {"input": "position = [1,2,3,4,7], m = 3", "output": "3"},
            {"input": "position = [5,4,3,2,1,1000000000], m = 2", "output": "999999999"}
        ],
        "testCases": [
            { "input": JSON.stringify({ position: [1,2,3,4,7], m: 3 }), "expectedOutput": "3" }
        ]
    }
];
