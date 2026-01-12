module.exports = [
    {
        "title": "Odd Even Linked List",
        "description": "Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list. The first node is considered odd, and the second node is even, and so on. Note that the relative order inside both the even and odd groups should remain as it was in the input. You must solve the problem in O(1) extra space complexity and O(n) time complexity.",
        "difficulty": "MEDIUM",
        "topics": ["Linked List"],
        "constraints": ["The number of nodes in the linked list is in the range [0, 10^4].", "-10^6 <= Node.val <= 10^6"],
        "hints": ["Maintain two pointers: odd and even. Connect odd->next to even->next and vice-versa."],
        "boilerplate_code": {
            "java": "class Solution {\n    public ListNode oddEvenList(ListNode head) {\n        return null;\n    }\n}",
            "python": "class Solution:\n    def oddEvenList(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar oddEvenList = function(head) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    ListNode* oddEvenList(ListNode* head) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "oddEvenList",
        "examples": [
            {"input": "head = [1,2,3,4,5]", "output": "[1,3,5,2,4]"},
            {"input": "head = [2,1,3,5,6,4,7]", "output": "[2,3,6,7,1,5,4]"}
        ],
        "testCases": []
    },
    {
        "title": "Palindrome Linked List",
        "description": "Given the head of a singly linked list, return true if it is a palindrome or false otherwise.",
        "difficulty": "EASY",
        "topics": ["Linked List", "Two Pointers", "Stack"],
        "constraints": ["The number of nodes in the list is in the range [1, 10^5].", "0 <= Node.val <= 9"],
        "hints": ["Find middle, reverse second half, compare."],
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
        "testCases": []
    },
    {
        "title": "Intersection of Two Linked Lists",
        "description": "Given the heads of two singly linked-lists headA and headB, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return null.",
        "difficulty": "EASY",
        "topics": ["Linked List", "Two Pointers"],
        "constraints": ["The number of nodes of listA is in the m.", "The number of nodes of listB is in the n.", "1 <= m, n <= 3 * 10^4", "1 <= Node.val <= 10^5"],
        "hints": ["Run two pointers. When one reaches end, switch to other list's head."],
        "boilerplate_code": {
            "java": "public class Solution {\n    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {\n        return null;\n    }\n}",
            "python": "class Solution:\n    def getIntersectionNode(self, headA: ListNode, headB: ListNode) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * @param {ListNode} headA\n * @param {ListNode} headB\n * @return {ListNode}\n */\nvar getIntersectionNode = function(headA, headB) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "getIntersectionNode",
        "examples": [
            {"input": "intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5]", "output": "Intersected at '8'"}
        ],
        "testCases": []
    },
    {
        "title": "Remove Duplicates from Sorted List II",
        "description": "Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list sorted as well.",
        "difficulty": "MEDIUM",
        "topics": ["Linked List", "Two Pointers"],
        "constraints": ["The number of nodes in the list is in the range [0, 300].", "-100 <= Node.val <= 100", "The list is guaranteed to be sorted in ascending order."],
        "hints": ["Use a dummy head. Pointer 'prev' tracks last valid node."],
        "boilerplate_code": {
            "java": "class Solution {\n    public ListNode deleteDuplicates(ListNode head) {\n        return null;\n    }\n}",
            "python": "class Solution:\n    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar deleteDuplicates = function(head) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    ListNode* deleteDuplicates(ListNode* head) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "deleteDuplicates",
        "examples": [
            {"input": "head = [1,2,3,3,4,4,5]", "output": "[1,2,5]"},
            {"input": "head = [1,1,1,2,3]", "output": "[2,3]"}
        ],
        "testCases": []
    },
    {
        "title": "Rotate List",
        "description": "Given the head of a linked list, rotate the list to the right by k places.",
        "difficulty": "MEDIUM",
        "topics": ["Linked List", "Two Pointers"],
        "constraints": ["The number of nodes in the list is in the range [0, 500].", "-100 <= Node.val <= 100", "0 <= k <= 2 * 10^9"],
        "hints": ["Make it a circle, find length, then break at length - (k % length)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public ListNode rotateRight(ListNode head, int k) {\n        return null;\n    }\n}",
            "python": "class Solution:\n    def rotateRight(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * @param {ListNode} head\n * @param {number} k\n * @return {ListNode}\n */\nvar rotateRight = function(head, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    ListNode* rotateRight(ListNode* head, int k) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "rotateRight",
        "examples": [
            {"input": "head = [1,2,3,4,5], k = 2", "output": "[4,5,1,2,3]"},
            {"input": "head = [0,1,2], k = 4", "output": "[2,0,1]"}
        ],
        "testCases": []
    }
];
