module.exports = [
    {
        "title": "Single Number",
        "description": "Given a non-empty array of integers nums, every element appears twice except for one. Find that single one. You must implement a solution with a linear runtime complexity and use only constant extra space.",
        "difficulty": "EASY",
        "topics": ["Bit Manipulation", "Array"],
        "constraints": ["1 <= nums.length <= 3 * 10^4", "-3 * 10^4 <= nums[i] <= 3 * 10^4"],
        "hints": ["XOR all elements. a ^ a = 0."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int singleNumber(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def singleNumber(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar singleNumber = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int singleNumber(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "singleNumber",
        "examples": [
            {"input": "nums = [2,2,1]", "output": "1"},
            {"input": "nums = [4,1,2,1,2]", "output": "4"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [2,2,1] }), "expectedOutput": "1" }
        ]
    },
    {
        "title": "Single Number II",
        "description": "Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it. You must implement a solution with a linear runtime complexity and use only constant extra space.",
        "difficulty": "MEDIUM",
        "topics": ["Bit Manipulation", "Array"],
        "constraints": ["1 <= nums.length <= 3 * 10^4", "-2^31 <= nums[i] <= 2^31 - 1"],
        "hints": ["Count bits at each position modulo 3."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int singleNumber(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def singleNumber(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar singleNumber = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int singleNumber(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "singleNumber",
        "examples": [
            {"input": "nums = [2,2,3,2]", "output": "3"},
            {"input": "nums = [0,1,0,1,0,1,99]", "output": "99"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [2,2,3,2] }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Single Number III",
        "description": "Given an integer array nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once. You can return the answer in any order. You must write an algorithm that runs in linear runtime complexity and uses only constant extra space.",
        "difficulty": "MEDIUM",
        "topics": ["Bit Manipulation", "Array"],
        "constraints": ["2 <= nums.length <= 3 * 10^4", "-2^31 <= nums[i] <= 2^31 - 1"],
        "hints": ["XOR all. Result is x^y. Find rightmost set bit to separate into two groups."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] singleNumber(int[] nums) {\n        return new int[]{};\n    }\n}",
            "python": "class Solution:\n    def singleNumber(self, nums: List[int]) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number[]}\n */\nvar singleNumber = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> singleNumber(vector<int>& nums) {\n        return {};\n    }\n};"
        },
        "function_name": "singleNumber",
        "examples": [
            {"input": "nums = [1,2,1,3,2,5]", "output": "[3,5]"},
            {"input": "nums = [-1,0]", "output": "[-1,0]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,2,1,3,2,5] }), "expectedOutput": "[3,5]" }
        ]
    },
    {
        "title": "Counting Bits",
        "description": "Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.",
        "difficulty": "EASY",
        "topics": ["Dynamic Programming", "Bit Manipulation"],
        "constraints": ["0 <= n <= 10^5"],
        "hints": ["dp[i] = dp[i >> 1] + (i & 1)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] countBits(int n) {\n        return new int[]{};\n    }\n}",
            "python": "class Solution:\n    def countBits(self, n: int) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number} n\n * @return {number[]}\n */\nvar countBits = function(n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> countBits(int n) {\n        return {};\n    }\n};"
        },
        "function_name": "countBits",
        "examples": [
            {"input": "n = 2", "output": "[0,1,1]"},
            {"input": "n = 5", "output": "[0,1,1,2,1,2]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ n: 2 }), "expectedOutput": "[0,1,1]" }
        ]
    },
    {
        "title": "Reverse Bits",
        "description": "Reverse bits of a given 32 bits unsigned integer.",
        "difficulty": "EASY",
        "topics": ["Bit Manipulation", "Divide and Conquer"],
        "constraints": ["n is a binary string of length 32"],
        "hints": ["Iterate 32 times, extract bit and push to result."],
        "boilerplate_code": {
            "java": "public class Solution {\n    // you need treat n as an unsigned value\n    public int reverseBits(int n) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def reverseBits(self, n: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number} n - a positive integer\n * @return {number} - a positive integer\n */\nvar reverseBits = function(n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    uint32_t reverseBits(uint32_t n) {\n        return 0;\n    }\n};"
        },
        "function_name": "reverseBits",
        "examples": [
            {"input": "n = 00000010100101000001111010011100", "output": "964176192 (00111001011110000010100101000000)"}
        ],
        "testCases": []
    }
];
