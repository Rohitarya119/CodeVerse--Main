module.exports = [
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
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [-1,2,1,-4], target: 1 }), "expectedOutput": "2" },
            { "input": JSON.stringify({ nums: [0,0,0], target: 1 }), "expectedOutput": "0" }
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
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [3,2,2,3], val: 3 }), "expectedOutput": "2" },
            { "input": JSON.stringify({ nums: [0,1,2,2,3,0,4,2], val: 2 }), "expectedOutput": "5" }
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
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "the sky is blue" }), "expectedOutput": `"blue is sky the"` },
            { "input": JSON.stringify({ s: "  hello world  " }), "expectedOutput": `"world hello"` }
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
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [2,2,3,4] }), "expectedOutput": "3" },
            { "input": JSON.stringify({ nums: [4,2,3,4] }), "expectedOutput": "4" }
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
        ],
        "testCases": [
            { "input": JSON.stringify({ people: [1,2], limit: 3 }), "expectedOutput": "1" },
            { "input": JSON.stringify({ people: [3,2,2,1], limit: 3 }), "expectedOutput": "3" }
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
        ],
        "testCases": [
            { "input": JSON.stringify({ tokens: [100], power: 50 }), "expectedOutput": "0" },
            { "input": JSON.stringify({ tokens: [100,200], power: 150 }), "expectedOutput": "1" }
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
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,2,3,4,5,6,7], k: 3 }), "expectedOutput": `[5,6,7,1,2,3,4]` },
            { "input": JSON.stringify({ nums: [-1,-100,3,99], k: 2 }), "expectedOutput": `[3,99,-1,-100]` }
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
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "abc" }), "expectedOutput": "3" },
            { "input": JSON.stringify({ s: "aaa" }), "expectedOutput": "6" }
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
        ],
        "testCases": [
            { "input": JSON.stringify({ nums1: [1,3], nums2: [2] }), "expectedOutput": "2.0" },
            { "input": JSON.stringify({ nums1: [1,2], nums2: [3,4] }), "expectedOutput": "2.5" }
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
        ],
        "testCases": [
            { "input": JSON.stringify({ head: [1,1,2] }), "expectedOutput": `[1,2]` },
            { "input": JSON.stringify({ head: [1,1,2,3,3] }), "expectedOutput": `[1,2,3]` }
        ]
    }
];
