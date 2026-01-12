module.exports = [
    {
        "title": "Count Pairs with Sum",
        "description": "Given an array of integers and an integer k, find the number of pairs of elements in the array whose sum is equal to k.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Arrays", "Hash Table"],
        "constraints": ["1 <= nums.length <= 10^5", "1 <= k <= 10^9"],
        "hints": ["Use a hash map to store frequencies of elements.", "Or sort the array and use two pointers if O(N log N) is acceptable."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int countPairs(int[] nums, int k) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def countPairs(self, nums: List[int], k: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar countPairs = function(nums, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int countPairs(vector<int>& nums, int k) {\n        return 0;\n    }\n};"
        },
        "function_name": "countPairs",
        "examples": [
            {"input": "nums = [1, 5, 7, 1], k = 6", "output": "2"},
            {"input": "nums = [1, 1, 1, 1], k = 2", "output": "6"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1, 5, 7, 1], k: 6 }), "expectedOutput": "2" },
            { "input": JSON.stringify({ nums: [1, 1, 1, 1], k: 2 }), "expectedOutput": "6" }
        ]
    },
    {
        "title": "Rearrange Array Alternately",
        "description": "Given a sorted array of positive integers, rearrange the array elements alternatively i.e first element should be the maximum value, second should be the minimum value, third should be the second maximum, fourth should be the second minimum and so on. Modify the array in-place.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays"],
        "constraints": ["1 <= nums.length <= 10^5", "1 <= nums[i] <= 10^7"],
        "hints": ["Use the fact that the array is sorted.", "Two pointers: one at start (min), one at end (max)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void rearrange(int[] nums) {\n        \n    }\n}",
            "python": "class Solution:\n    def rearrange(self, nums: List[int]) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {void}\n */\nvar rearrange = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void rearrange(vector<int>& nums) {\n        \n    }\n};"
        },
        "function_name": "rearrange",
        "examples": [
            {"input": "nums = [1,2,3,4,5,6]", "output": "[6,1,5,2,4,3]"},
            {"input": "nums = [10,20,30,40,50,60]", "output": "[60,10,50,20,40,30]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,2,3,4,5,6] }), "expectedOutput": `[6,1,5,2,4,3]` },
            { "input": JSON.stringify({ nums: [10,20,30,40,50,60] }), "expectedOutput": `[60,10,50,20,40,30]` }
        ]
    },
    {
        "title": "Valid Palindrome",
        "description": "A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers. Given a string s, return true if it is a palindrome, or false otherwise.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "String"],
        "constraints": ["1 <= s.length <= 2 * 10^5", "s consists only of printable ASCII characters."],
        "hints": ["Use two pointers, one at start and one at end.", "Skip non-alphanumeric characters and compare."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean isPalindrome(String s) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def isPalindrome(self, s: str) -> bool:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {boolean}\n */\nvar isPalindrome = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool isPalindrome(string s) {\n        return false;\n    }\n};"
        },
        "function_name": "isPalindrome",
        "examples": [
            {"input": "s = \"A man, a plan, a canal: Panama\"", "output": "true"},
            {"input": "s = \"race a car\"", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "A man, a plan, a canal: Panama" }), "expectedOutput": "true" },
            { "input": JSON.stringify({ s: "race a car" }), "expectedOutput": "false" }
        ]
    },
    {
        "title": "Sort Array of 0s and 1s",
        "description": "Given an array of 0s and 1s, sort the array in ascending order. You should typically do this in a single pass.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Arrays"],
        "constraints": ["1 <= nums.length <= 10^5", "nums[i] is 0 or 1"],
        "hints": ["Count 0s and 1s.", "Or use two pointers: increment left if 0, decrement right if 1, swap if violation."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void sort01(int[] nums) {\n        \n    }\n}",
            "python": "class Solution:\n    def sort01(self, nums: List[int]) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @return {void}\n */\nvar sort01 = function(nums) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void sort01(vector<int>& nums) {\n        \n    }\n};"
        },
        "function_name": "sort01",
        "examples": [
            {"input": "nums = [1,0,1,1,0]", "output": "[0,0,1,1,1]"},
            {"input": "nums = [1,1,1]", "output": "[1,1,1]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,0,1,1,0] }), "expectedOutput": `[0,0,1,1,1]` },
            { "input": JSON.stringify({ nums: [1,1,1] }), "expectedOutput": `[1,1,1]` }
        ]
    },
    {
        "title": "Closet Pair from Two Sorted Arrays",
        "description": "Given two sorted arrays and a number x, find a pair (one element from each array) such that their sum is closest to x.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Binary Search"],
        "constraints": ["1 <= arr1.length, arr2.length <= 10^5", "1 <= x <= 10^9"],
        "hints": ["Initialize left pointer for first array and right pointer for second array.", "Calculate sum. If sum < x, move left pointer. If sum > x, move right pointer. Update closest."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] closestPair(int[] arr1, int[] arr2, int x) {\n        return new int[0];\n    }\n}",
            "python": "class Solution:\n    def closestPair(self, arr1: List[int], arr2: List[int], x: int) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} arr1\n * @param {number[]} arr2\n * @param {number} x\n * @return {number[]}\n */\nvar closestPair = function(arr1, arr2, x) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> closestPair(vector<int>& arr1, vector<int>& arr2, int x) {\n        return {};\n    }\n};"
        },
        "function_name": "closestPair",
        "examples": [
            {"input": "arr1 = [1, 4, 5, 7], arr2 = [10, 20, 30, 40], x = 32", "output": "[1, 30]"},
            {"input": "arr1 = [1, 4, 5, 7], arr2 = [10, 20, 30, 40], x = 50", "output": "[7, 40]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ arr1: [1, 4, 5, 7], arr2: [10, 20, 30, 40], x: 32 }), "expectedOutput": `[1,30]` },
            { "input": JSON.stringify({ arr1: [1, 4, 5, 7], arr2: [10, 20, 30, 40], x: 50 }), "expectedOutput": `[7,40]` }
        ]
    },
    {
        "title": "Pair with Given Difference",
        "description": "Given an array of integers `nums` and an integer `k`, return the number of unique K-diff pairs in the array. A k-diff pair is an integer pair (nums[i], nums[j]) where i != j and |nums[i] - nums[j]| == k.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Sorting"],
        "constraints": ["1 <= nums.length <= 10^4", "0 <= k <= 10^7"],
        "hints": ["Sort the array.", "Use two pointers. Maintain the difference k between them."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int findPairs(int[] nums, int k) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def findPairs(self, nums: List[int], k: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar findPairs = function(nums, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int findPairs(vector<int>& nums, int k) {\n        return 0;\n    }\n};"
        },
        "function_name": "findPairs",
        "examples": [
            {"input": "nums = [3,1,4,1,5], k = 2", "output": "2"},
            {"input": "nums = [1,2,3,4,5], k = 1", "output": "4"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [3,1,4,1,5], k: 2 }), "expectedOutput": "2" },
            { "input": JSON.stringify({ nums: [1,2,3,4,5], k: 1 }), "expectedOutput": "4" }
        ]
    },
    {
        "title": "3Sum Smaller",
        "description": "Given an array of n integers nums and an integer target, find the number of index triplets i, j, k with 0 <= i < j < k < n that satisfy the condition nums[i] + nums[j] + nums[k] < target.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Sorting"],
        "constraints": ["n == nums.length", "0 <= n <= 3500", "-100 <= nums[i] <= 100", "-100 <= target <= 100"],
        "hints": ["Sort the array.", "Fix the first element, then use two pointers to find valid pairs for the other two."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int threeSumSmaller(int[] nums, int target) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def threeSumSmaller(self, nums: List[int], target: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar threeSumSmaller = function(nums, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int threeSumSmaller(vector<int>& nums, int target) {\n        return 0;\n    }\n};"
        },
        "function_name": "threeSumSmaller",
        "examples": [
            {"input": "nums = [-2,0,1,3], target = 2", "output": "2"},
            {"input": "nums = [], target = 0", "output": "0"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [-2,0,1,3], target: 2 }), "expectedOutput": "2" },
            { "input": JSON.stringify({ nums: [], target: 0 }), "expectedOutput": "0" }
        ]
    },
    {
        "title": "Interval List Intersections",
        "description": "You are given two lists of closed intervals, firstList and secondList, where firstList[i] = [start_i, end_i] and secondList[j] = [start_j, end_j]. Each list of intervals is pairwise disjoint and in sorted order. Return the intersection of these two interval lists.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays"],
        "constraints": ["0 <= firstList.length, secondList.length <= 1000", "0 <= start_i < end_i <= 10^9"],
        "hints": ["Use two pointers, one for each list.", "The intersection of two intervals is [max(start1, start2), min(end1, end2)]."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[][] intervalIntersection(int[][] firstList, int[][] secondList) {\n        return new int[0][0];\n    }\n}",
            "python": "class Solution:\n    def intervalIntersection(self, firstList: List[List[int]], secondList: List[List[int]]) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {number[][]} firstList\n * @param {number[][]} secondList\n * @return {number[][]}\n */\nvar intervalIntersection = function(firstList, secondList) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> intervalIntersection(vector<vector<int>>& firstList, vector<vector<int>>& secondList) {\n        return {};\n    }\n};"
        },
        "function_name": "intervalIntersection",
        "examples": [
            {"input": "firstList = [[0,2],[5,10],[13,23],[24,25]], secondList = [[1,5],[8,12],[15,24],[25,26]]", "output": "[[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]"},
            {"input": "firstList = [[1,3],[5,9]], secondList = []", "output": "[]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ firstList: [[0,2],[5,10],[13,23],[24,25]], secondList: [[1,5],[8,12],[15,24],[25,26]] }), "expectedOutput": `[[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]` },
            { "input": JSON.stringify({ firstList: [[1,3],[5,9]], secondList: [] }), "expectedOutput": `[]` }
        ]
    },
    {
        "title": "Rotate List",
        "description": "Given the head of a linked list, rotate the list to the right by k places.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Linked List"],
        "constraints": ["The number of nodes in the list is in the range [0, 500].", "-100 <= Node.val <= 100", "0 <= k <= 2 * 10^9"],
        "hints": ["Connect the tail to the head to make it a circle.", "Identify the new tail and break the circle."],
        "boilerplate_code": {
            "java": "/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode rotateRight(ListNode head, int k) {\n        return null;\n    }\n}",
            "python": "# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def rotateRight(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @param {number} k\n * @return {ListNode}\n */\nvar rotateRight = function(head, k) {\n    \n};",
            "cpp": "/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* rotateRight(ListNode* head, int k) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "rotateRight",
        "examples": [
            {"input": "head = [1,2,3,4,5], k = 2", "output": "[4,5,1,2,3]"},
            {"input": "head = [0,1,2], k = 4", "output": "[2,0,1]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ head: [1,2,3,4,5], k: 2 }), "expectedOutput": `[4,5,1,2,3]` },
            { "input": JSON.stringify({ head: [0,1,2], k: 4 }), "expectedOutput": `[2,0,1]` }
        ]
    }
];
