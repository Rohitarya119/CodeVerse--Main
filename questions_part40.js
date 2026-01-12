module.exports = [
    {
        "title": "Reverse Pairs",
        "description": "Given an integer array nums, return the number of reverse pairs in the array. A reverse pair is a pair (i, j) where: 0 <= i < j < nums.length and nums[i] > 2 * nums[j].",
        "difficulty": "HARD",
        "topics": ["Array", "Binary Search", "Divide and Conquer", "Sorting"],
        "constraints": ["1 <= nums.length <= 5 * 10^4", "-2^31 <= nums[i] <= 2^31 - 1"],
        "hints": ["Use Merge Sort logic. Count pairs during merge step."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int reversePairs(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def reversePairs(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar reversePairs = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int reversePairs(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "reversePairs",
        "examples": [
            {"input": "nums = [1,3,2,3,1]", "output": "2"},
            {"input": "nums = [2,4,3,5,1]", "output": "3"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,3,2,3,1] }), "expectedOutput": "2" }
        ]
    },
    {
        "title": "Count of Range Sum",
        "description": "Given an integer array nums and two integers lower and upper, return the number of range sums that lie in [lower, upper] inclusive. Range sum S(i, j) is defined as the sum of the elements in nums between indices i and j inclusive, where i <= j.",
        "difficulty": "HARD",
        "topics": ["Array", "Binary Search", "Divide and Conquer", "Sorting"],
        "constraints": ["1 <= nums.length <= 10^5", "lower <= upper"],
        "hints": ["Use Merge Sort or Segment Tree."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int countRangeSum(int[] nums, int lower, int upper) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def countRangeSum(self, nums: List[int], lower: int, upper: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} lower\n * @param {number} upper\n * @return {number}\n */\nvar countRangeSum = function(nums, lower, upper) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int countRangeSum(vector<int>& nums, int lower, int upper) {\n        return 0;\n    }\n};"
        },
        "function_name": "countRangeSum",
        "examples": [
            {"input": "nums = [-2,5,-1], lower = -2, upper = 2", "output": "3"},
            {"input": "nums = [0], lower = 0, upper = 0", "output": "1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [-2,5,-1], lower: -2, upper: 2 }), "expectedOutput": "3" }
        ]
    }
];
