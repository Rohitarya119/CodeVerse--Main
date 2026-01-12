module.exports = [
    {
        "title": "Intersection of Two Linked Lists",
        "description": "Given the heads of two singly linked-lists headA and headB, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return null.",
        "difficulty": "EASY",
        "topics": ["Linked List", "Two Pointers"],
        "constraints": ["The number of nodes of listA is in the m.", "The number of nodes of listB is in the n.", "1 <= m, n <= 3 * 10^4", "1 <= Node.val <= 10^5"],
        "hints": ["Traverse both lists. When one reaches the end, redirect it to the head of the other list.", "If they intersect, they will meet at the intersection point."],
        "boilerplate_code": {
            "java": "class Solution {\n    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {\n        return null;\n    }\n}",
            "python": "class Solution:\n    def getIntersectionNode(self, headA: ListNode, headB: ListNode) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * @param {ListNode} headA\n * @param {ListNode} headB\n * @return {ListNode}\n */\nvar getIntersectionNode = function(headA, headB) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "getIntersectionNode",
        "examples": [
            {"input": "intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5]", "output": "Intersected at '8'"},
            {"input": "intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4]", "output": "Intersected at '2'"}
        ],
        "testCases": [
            { "input": JSON.stringify({ headA: [4,1,8,4,5], headB: [5,6,1,8,4,5], intersectVal: 8 }), "expectedOutput": "Intersected at '8'" }
        ]
    },
    {
        "title": "Check if Linked List is Circular",
        "description": "Given head, the head of a singly linked list, check if the linked list is circular or not. A linked list is called circular if it is not NULL terminated and all nodes are connected in the form of a cycle.",
        "difficulty": "EASY",
        "topics": ["Linked List", "Two Pointers"],
        "constraints": ["1 <= Number of nodes <= 100"],
        "hints": ["Use a temporary pointer to traverse the list.", "If we reach NULL, valid. If we reach head again, it's circular."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean isCircular(ListNode head) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def isCircular(self, head: Optional[ListNode]) -> bool:\n        pass",
            "javascript": "/**\n * @param {ListNode} head\n * @return {boolean}\n */\nvar isCircular = function(head) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool isCircular(ListNode* head) {\n        return false;\n    }\n};"
        },
        "function_name": "isCircular",
        "examples": [
            {"input": "head = [1,2,3,4,5]", "output": "false"},
            {"input": "head = [1,2,3,4,1] (circular)", "output": "true"}
        ],
        "testCases": [
            { "input": JSON.stringify({ head: [1,2,3,4,5] }), "expectedOutput": "false" }
        ]
    },
    {
        "title": "Find the Duplicate Number",
        "description": "Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive. There is only one repeated number in nums, return this repeated number. You must solve the problem without modifying the array nums and uses only constant extra space.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Two Pointers", "Binary Search"],
        "constraints": ["1 <= n <= 10^5", "nums.length == n + 1", "1 <= nums[i] <= n"],
        "hints": ["Treat the array as a linked list: index i -> nums[i].", "Use Floyd's Cycle Detection algorithm (Tortoise and Hare)."],
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
        "title": "Circular Array Loop",
        "description": "You are playing a game involving a circular array of non-zero integers nums. Each nums[i] denotes the number of indices forward/backward you must move if you are located at index i. Determine if there is a cycle in this array.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Hash Table", "Two Pointers"],
        "constraints": ["1 <= nums.length <= 5000", "-1000 <= nums[i] <= 1000", "nums[i] != 0"],
        "hints": ["Use Fast & Slow pointers for each index.", "Handle directions carefully (should be single direction)."],
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
        "testCases": [
            { "input": JSON.stringify({ nums: [2,-1,1,2,2] }), "expectedOutput": "true" },
            { "input": JSON.stringify({ nums: [-1,2] }), "expectedOutput": "false" }
        ]
    },
    {
        "title": "Linked List Cycle II",
        "description": "Given the head of a linked list, return the node where the cycle begins. If there is no cycle, return null. There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer.",
        "difficulty": "MEDIUM",
        "topics": ["Linked List", "Two Pointers"],
        "constraints": ["number of nodes is in range [0, 10^4]", "-10^5 <= Node.val <= 10^5"],
        "hints": ["Use Floyd's Cycle Detection.", "Once slow matches fast, move slow to head. Move both one step until they meet."],
        "boilerplate_code": {
            "java": "class Solution {\n    public ListNode detectCycle(ListNode head) {\n        return null;\n    }\n}",
            "python": "class Solution:\n    def detectCycle(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar detectCycle = function(head) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    ListNode *detectCycle(ListNode *head) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "detectCycle",
        "examples": [
            {"input": "head = [3,2,0,-4], pos = 1", "output": "tail connects to node index 1"},
            {"input": "head = [1,2], pos = 0", "output": "tail connects to node index 0"}
        ],
        "testCases": [
            { "input": JSON.stringify({ head: [3,2,0,-4], pos: 1 }), "expectedOutput": "tail connects to node index 1" }
        ]
    }
];
