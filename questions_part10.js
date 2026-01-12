module.exports = [
    {
        "title": "Middle of the Linked List",
        "description": "Given the head of a singly linked list, return the middle node of the linked list. If there are two middle nodes, return the second middle node.",
        "difficulty": "EASY",
        "topics": ["Linked List", "Two Pointers"],
        "constraints": ["The number of nodes in the list is in the range [1, 100].", "1 <= Node.val <= 100"],
        "hints": ["Use two pointers: slow and fast.", "Move slow one step and fast two steps.", "When fast reaches the end, slow will be at the middle."],
        "boilerplate_code": {
            "java": "class Solution {\n    public ListNode middleNode(ListNode head) {\n        return null;\n    }\n}",
            "python": "class Solution:\n    def middleNode(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar middleNode = function(head) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    ListNode* middleNode(ListNode* head) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "middleNode",
        "examples": [
            {"input": "head = [1,2,3,4,5]", "output": "[3,4,5]"},
            {"input": "head = [1,2,3,4,5,6]", "output": "[4,5,6]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ head: [1,2,3,4,5] }), "expectedOutput": `[3,4,5]` },
            { "input": JSON.stringify({ head: [1,2,3,4,5,6] }), "expectedOutput": `[4,5,6]` }
        ]
    },
    {
        "title": "Remove Nth Node From End of List",
        "description": "Given the head of a linked list, remove the nth node from the end of the list and return its head.",
        "difficulty": "MEDIUM",
        "topics": ["Linked List", "Two Pointers"],
        "constraints": ["The number of nodes in the list is sz.", "1 <= sz <= 30", "0 <= Node.val <= 100", "1 <= n <= sz"],
        "hints": ["Maintain two pointers separated by n nodes.", "Move both until the second pointer reaches the end."],
        "boilerplate_code": {
            "java": "class Solution {\n    public ListNode removeNthFromEnd(ListNode head, int n) {\n        return null;\n    }\n}",
            "python": "class Solution:\n    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * @param {ListNode} head\n * @param {number} n\n * @return {ListNode}\n */\nvar removeNthFromEnd = function(head, n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    ListNode* removeNthFromEnd(ListNode* head, int n) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "removeNthFromEnd",
        "examples": [
            {"input": "head = [1,2,3,4,5], n = 2", "output": "[1,2,3,5]"},
            {"input": "head = [1], n = 1", "output": "[]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ head: [1,2,3,4,5], n: 2 }), "expectedOutput": `[1,2,3,5]` },
            { "input": JSON.stringify({ head: [1], n: 1 }), "expectedOutput": `[]` }
        ]
    },
    {
        "title": "Happy Number",
        "description": "Write an algorithm to determine if a number n is happy. A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits. Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy.",
        "difficulty": "EASY",
        "topics": ["Hash Table", "Math", "Two Pointers"],
        "constraints": ["1 <= n <= 2^31 - 1"],
        "hints": ["Use Fast & Slow pointers to detect a cycle in the sequence of sums.", "If fast pointer reaches 1, it's happy."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean isHappy(int n) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def isHappy(self, n: int) -> bool:\n        pass",
            "javascript": "/**\n * @param {number} n\n * @return {boolean}\n */\nvar isHappy = function(n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool isHappy(int n) {\n        return false;\n    }\n};"
        },
        "function_name": "isHappy",
        "examples": [
            {"input": "n = 19", "output": "true"},
            {"input": "n = 2", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ n: 19 }), "expectedOutput": "true" },
            { "input": JSON.stringify({ n: 2 }), "expectedOutput": "false" }
        ]
    },
    {
        "title": "Palindrome Linked List",
        "description": "Given the head of a singly linked list, return true if it is a palindrome or false otherwise.",
        "difficulty": "EASY",
        "topics": ["Linked List", "Two Pointers", "Stack"],
        "constraints": ["The number of nodes in the list is in the range [1, 10^5].", "0 <= Node.val <= 9"],
        "hints": ["Use Fast & Slow pointers to find the middle.", "Reverse the second half of the list.", "Compare the first half with the reversed second half."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean isPalindrome(ListNode head) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def isPalindrome(self, head: Optional[ListNode]) -> bool:\n        pass",
            "javascript": "/**\n * @param {ListNode} head\n * @return {boolean}\n */\nvar isPalindrome = function(head) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool isPalindrome(ListNode* head) {\n        return false;\n    }\n};"
        },
        "function_name": "isPalindrome",
        "examples": [
            {"input": "head = [1,2,2,1]", "output": "true"},
            {"input": "head = [1,2]", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ head: [1,2,2,1] }), "expectedOutput": "true" },
            { "input": JSON.stringify({ head: [1,2] }), "expectedOutput": "false" }
        ]
    },
    {
        "title": "Reorder List",
        "description": "You are given the head of a singly linked-list. The list can be represented as: L0 -> L1 -> ... -> Ln - 1 -> Ln. Reorder the list to be on the following form: L0 -> Ln -> L1 -> Ln - 1 -> L2 -> Ln - 2 -> ...",
        "difficulty": "MEDIUM",
        "topics": ["Linked List", "Two Pointers", "Stack"],
        "constraints": ["The number of nodes in the list is in the range [1, 5 * 10^4].", "1 <= Node.val <= 1000"],
        "hints": ["Find the middle node.", "Reverse the second part of the list.", "Merge the two sorted lists."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void reorderList(ListNode head) {\n        \n    }\n}",
            "python": "class Solution:\n    def reorderList(self, head: Optional[ListNode]) -> None:\n        \"\"\"\n        Do not return anything, modify head in-place instead.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {ListNode} head\n * @return {void} Do not return anything, modify head in-place instead.\n */\nvar reorderList = function(head) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void reorderList(ListNode* head) {\n        \n    }\n};"
        },
        "function_name": "reorderList",
        "examples": [
            {"input": "head = [1,2,3,4]", "output": "[1,4,2,3]"},
            {"input": "head = [1,2,3,4,5]", "output": "[1,5,2,4,3]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ head: [1,2,3,4] }), "expectedOutput": `[1,4,2,3]` },
            { "input": JSON.stringify({ head: [1,2,3,4,5] }), "expectedOutput": `[1,5,2,4,3]` }
        ]
    }
];
