module.exports = [
    {
        "title": "Bag of Tokens",
        "description": "You have an initial power of power, an initial score of 0, and a bag of tokens where tokens[i] is the value of the ith token (0-indexed). Your goal is to maximize your total score by potentially playing each token in one of two ways: If your current power is at least tokens[i], you may play the ith token face up, losing tokens[i] power and gaining 1 score. If your current score is at least 1, you may play the ith token face down, gaining tokens[i] power and losing 1 score. Each token may be played at most once and in any order. You do not have to play all the tokens. Return the largest possible score you can achieve after playing any number of tokens.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Greedy", "Two Pointers", "Sorting"],
        "constraints": ["0 <= tokens.length <= 1000", "0 <= tokens[i], power < 10^4"],
        "hints": ["Sort tokens. Buy cheapest (smallest) to gain score. Sell most expensive (largest) to gain power."],
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
        ],
        "testCases": []
    },
    {
        "title": "Boats to Save People",
        "description": "You are given an array people where people[i] is the weight of the ith person, and an infinite number of boats where each boat can carry a maximum weight of limit. Each boat carries at most two people at the same time, provided the sum of the weight of those people is at most limit. Return the minimum number of boats to carry every given person.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Two Pointers", "Greedy", "Sorting"],
        "constraints": ["1 <= people.length <= 5 * 10^4", "1 <= people[i] <= limit <= 3 * 10^4"],
        "hints": ["Sort people. Pair lightest with heaviest. If sum <= limit, both go. Else heaviest goes alone."],
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
        ],
        "testCases": []
    },
    {
        "title": "Circular Array Loop",
        "description": "You are playing a game involving a circular array of non-zero integers nums. Each nums[i] denotes the number of indices forward/backward you must move if you are located at index i. Determine if there is a cycle in nums that consists of k elements (k > 1) and all movements are either strictly forward or strictly backward.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "HashTable", "Two Pointers"],
        "constraints": ["1 <= nums.length <= 5000", "-1000 <= nums[i] <= 1000", "nums[i] != 0"],
        "hints": ["Use Fast and Slow Pointers for cycle detection. Ensure cycle length > 1 and direction consistently positive or negative."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean circularArrayLoop(int[] nums) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def circularArrayLoop(self, nums: List[int]) -> bool:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {boolean}\n */\nvar circularArrayLoop = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool circularArrayLoop(vector<int>& nums) {\n        return false;\n    }\n};"
        },
        "function_name": "circularArrayLoop",
        "examples": [
            {"input": "nums = [2,-1,1,2,2]", "output": "true"},
            {"input": "nums = [-1,2]", "output": "false"}
        ],
        "testCases": []
    },
    {
        "title": "Find the Duplicate Number",
        "description": "Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive. There is only one repeated number in nums, return this repeated number. You must solve the problem without modifying the array nums and uses only constant extra space.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Two Pointers", "Binary Search", "Bit Manipulation"],
        "constraints": ["1 <= n <= 10^5", "nums.length == n + 1", "1 <= nums[i] <= n"],
        "hints": ["Floyd's Cycle Detection (Tortoise and Hare). Convert array to linked list idea: index i -> nums[i]."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int findDuplicate(int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def findDuplicate(self, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {number}\n */\nvar findDuplicate = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int findDuplicate(vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "findDuplicate",
        "examples": [
            {"input": "nums = [1,3,4,2,2]", "output": "2"},
            {"input": "nums = [3,1,3,4,2]", "output": "3"}
        ],
        "testCases": []
    },
    {
        "title": "Longest Repeating Character Replacement",
        "description": "You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times. Return the length of the longest substring containing the same letter you can get after performing the above operations.",
        "difficulty": "MEDIUM",
        "topics": ["HashTable", "String", "Sliding Window"],
        "constraints": ["1 <= s.length <= 10^5", "s consists of only uppercase English letters.", "0 <= k <= s.length"],
        "hints": ["Sliding Window. Maintain count of most frequent char in window. If (len - maxFreq) > k, shrink window."],
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
        "testCases": []
    }
];
