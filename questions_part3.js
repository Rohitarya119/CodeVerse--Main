module.exports = [
    {
        "title": "Two Sum II - Input Array Is Sorted",
        "description": "Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Binary Search"],
        "constraints": ["2 <= numbers.length <= 3 * 10^4", "-1000 <= numbers[i] <= 1000", "numbers is sorted in non-decreasing order"],
        "hints": ["Use two pointers, one at the start and one at the end.", "If the sum is greater than target, decrease the right pointer. If less, increase the left pointer."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] twoSum(int[] numbers, int target) {\n        return new int[0];\n    }\n}",
            "python": "class Solution:\n    def twoSum(self, numbers: List[int], target: int) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} numbers\n * @param {number} target\n * @return {number[]}\n */\nvar twoSum = function(numbers, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> twoSum(vector<int>& numbers, int target) {\n        return {};\n    }\n};"
        },
        "function_name": "twoSum",
        "examples": [
            {"input": "numbers = [2,7,11,15], target = 9", "output": "[1,2]"},
            {"input": "numbers = [2,3,4], target = 6", "output": "[1,3]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ numbers: [2,7,11,15], target: 9 }), "expectedOutput": `[1,2]` },
            { "input": JSON.stringify({ numbers: [2,3,4], target: 6 }), "expectedOutput": `[1,3]` }
        ]
    },
    {
        "title": "Container With Most Water",
        "description": "You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]). Find two lines that together with the x-axis form a container, such that the container contains the most water. Return the maximum amount of water a container can store.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Greedy"],
        "constraints": ["n == height.length", "2 <= n <= 10^5", "0 <= height[i] <= 10^4"],
        "hints": ["Start with the widest container (pointers at both ends).", "Move the shorter line inwards to potentially find a taller line that compensates for the reduced width."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int maxArea(int[] height) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def maxArea(self, height: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} height\n * @return {number}\n */\nvar maxArea = function(height) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int maxArea(vector<int>& height) {\n        return 0;\n    }\n};"
        },
        "function_name": "maxArea",
        "examples": [
            {"input": "height = [1,8,6,2,5,4,8,3,7]", "output": "49"},
            {"input": "height = [1,1]", "output": "1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ height: [1,8,6,2,5,4,8,3,7] }), "expectedOutput": "49" },
            { "input": JSON.stringify({ height: [1,1] }), "expectedOutput": "1" }
        ]
    },
    {
        "title": "Longest Substring Without Repeating Characters",
        "description": "Given a string s, find the length of the longest substring without repeating characters.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "String", "Hash Table", "Sliding Window"],
        "constraints": ["0 <= s.length <= 5 * 10^4", "s consists of English letters, digits, symbols and spaces."],
        "hints": ["Use a sliding window with two pointers.", "Keep track of characters in the current window using a hash set or map."],
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
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "abcabcbb" }), "expectedOutput": "3" },
            { "input": JSON.stringify({ s: "bbbbb" }), "expectedOutput": "1" }
        ]
    },
    {
        "title": "Minimum Size Subarray Sum",
        "description": "Given an array of positive integers nums and a positive integer target, return the minimal length of a subarray whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Binary Search", "Sliding Window"],
        "constraints": ["1 <= target <= 10^9", "1 <= nums.length <= 10^5"],
        "hints": ["Use two pointers to maintain a window.", "Expand the window until the sum is >= target, then shrink it from the left to minimize length."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int minSubArrayLen(int target, int[] nums) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def minSubArrayLen(self, target: int, nums: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number} target\n * @param {number[]} nums\n * @return {number}\n */\nvar minSubArrayLen = function(target, nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int minSubArrayLen(int target, vector<int>& nums) {\n        return 0;\n    }\n};"
        },
        "function_name": "minSubArrayLen",
        "examples": [
            {"input": "target = 7, nums = [2,3,1,2,4,3]", "output": "2"},
            {"input": "target = 4, nums = [1,4,4]", "output": "1"}
        ],
        "testCases": [
            { "input": JSON.stringify({ target: 7, nums: [2,3,1,2,4,3] }), "expectedOutput": "2" },
            { "input": JSON.stringify({ target: 4, nums: [1,4,4] }), "expectedOutput": "1" }
        ]
    },
    {
        "title": "Permutation in String",
        "description": "Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise. In other words, return true if one of s1's permutations is the substring of s2.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "String", "Sliding Window", "Hash Table"],
        "constraints": ["1 <= s1.length, s2.length <= 10^4", "s1 and s2 consist of lowercase English letters."],
        "hints": ["Use a sliding window of size equal to s1.length.", "Compare key counts of the window in s2 with key counts of s1."],
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
        "title": "Longest Repeating Character Replacement",
        "description": "You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times. Return the length of the longest substring containing the same letter you can get after performing the above operations.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "String", "Sliding Window"],
        "constraints": ["1 <= s.length <= 10^5", "s consists of only uppercase English letters.", "0 <= k <= s.length"],
        "hints": ["Use a sliding window. Maintain the count of the most frequent character in the current window.", "If window length - max count > k, shrink the window."],
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
    },
    {
        "title": "Max Consecutive Ones III",
        "description": "Given a binary array nums and an integer k, return the maximum number of consecutive 1s in the array if you can flip at most k 0s.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Sliding Window"],
        "constraints": ["1 <= nums.length <= 10^5", "nums[i] is either 0 or 1.", "0 <= k <= nums.length"],
        "hints": ["Similar to character replacement, use a sliding window.", "Count the number of 0s in the window. if count > k, shrink window."],
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
        "title": "Fruit Into Baskets",
        "description": "You are visiting a farm that has a single row of fruit trees arranged from left to right. The trees are represented by an integer array fruits where fruits[i] is the type of fruit the ith tree produces. You want to collect as much fruit as possible. However, the owner has some strict rules: You have two baskets, and each basket can only hold a single type of fruit. There is no limit on the amount of fruit each basket can hold. Starting from any tree of your choice, you must pick exactly one fruit from every tree (including the start tree) while moving to the right. The picked fruits must fit in one of your baskets. Once you reach a tree with fruit that cannot fit in your baskets, you must stop. Given the integer array fruits, return the maximum number of fruits you can pick.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Sliding Window", "Hash Table"],
        "constraints": ["1 <= fruits.length <= 10^5", "0 <= fruits[i] < fruits.length"],
        "hints": ["This is finding the longest subarray with at most 2 distinct elements.", "Use a sliding window and a hash map to count distinct elements."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int totalFruit(int[] fruits) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def totalFruit(self, fruits: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} fruits\n * @return {number}\n */\nvar totalFruit = function(fruits) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int totalFruit(vector<int>& fruits) {\n        return 0;\n    }\n};"
        },
        "function_name": "totalFruit",
        "examples": [
            {"input": "fruits = [1,2,1]", "output": "3"},
            {"input": "fruits = [0,1,2,2]", "output": "3"}
        ],
        "testCases": [
            { "input": JSON.stringify({ fruits: [1,2,1] }), "expectedOutput": "3" },
            { "input": JSON.stringify({ fruits: [0,1,2,2] }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Find the Duplicate Number",
        "description": "Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive. There is only one repeated number in nums, return this repeated number. You must solve the problem without modifying the array nums and uses only constant extra space.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Binary Search", "Bit Manipulation"],
        "constraints": ["1 <= n <= 10^5", "nums.length == n + 1", "1 <= nums[i] <= n"],
        "hints": ["This can be modeled as a linked list cycle detection problem.", "Use Floyd's Cycle Detection algorithm (Tortoise and Hare)."],
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
        "testCases": [
            { "input": JSON.stringify({ nums: [1,3,4,2,2] }), "expectedOutput": "2" },
            { "input": JSON.stringify({ nums: [3,1,3,4,2] }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Linked List Cycle",
        "description": "Given head, the head of a linked list, determine if the linked list has a cycle in it. There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter. Return true if there is a cycle in the linked list. Otherwise, return false.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Linked List", "Hash Table"],
        "constraints": ["The number of the nodes in the list is in the range [0, 10^4].", "-10^5 <= Node.val <= 10^5", "pos is -1 or a valid index in the linked-list."],
        "hints": ["Use two pointers, slow and fast.", "Slow moves 1 step, fast moves 2 steps. If they collide, there is a cycle."],
        "boilerplate_code": {
            "java": "/**\n * Definition for singly-linked list.\n * class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) {\n *         val = x;\n *         next = null;\n *     }\n * }\n */\npublic class Solution {\n    public boolean hasCycle(ListNode head) {\n        return false;\n    }\n}",
            "python": "# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, x):\n#         self.val = x\n#         self.next = None\n\nclass Solution:\n    def hasCycle(self, head: Optional[ListNode]) -> bool:\n        return False",
            "javascript": "/**\n * Definition for singly-linked list.\n * function ListNode(val) {\n *     this.val = val;\n *     this.next = null;\n * }\n */\n\n/**\n * @param {ListNode} head\n * @return {boolean}\n */\nvar hasCycle = function(head) {\n    \n};",
            "cpp": "/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode(int x) : val(x), next(NULL) {}\n * };\n */\nclass Solution {\npublic:\n    bool hasCycle(ListNode *head) {\n        return false;\n    }\n};"
        },
        "function_name": "hasCycle",
        "examples": [
            {"input": "head = [3,2,0,-4], pos = 1", "output": "true"},
            {"input": "head = [1,2], pos = 0", "output": "true"}
        ],
        "testCases": [
            // Linked list cycle inputs are trickier to represent in JSON for direct construction
            // Usually the driver code logic handles "pos" and constructs the cycle.
            // We pass the raw structure data.
            { "input": JSON.stringify({ head: [3,2,0,-4], pos: 1 }), "expectedOutput": "true" },
            { "input": JSON.stringify({ head: [1,2], pos: 0 }), "expectedOutput": "true" }
        ]
    }
];
