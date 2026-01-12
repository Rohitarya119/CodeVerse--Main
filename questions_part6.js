module.exports = [
   {
        "title": "Kth Element of Two Sorted Arrays",
        "description": "Given two sorted arrays arr1 and arr2 of size N and M respectively and an element K. The task is to find the element that would be at the kth position of the final sorted array.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Binary Search"],
        "constraints": ["1 <= N, M <= 10^5", "1 <= K <= N + M", "0 <= arr1[i], arr2[i] <= 10^9"],
        "hints": ["Use two pointers to simulate merge sort steps until you reach the Kth element.", "Or use binary search for a more optimal solution."],
        "boilerplate_code": {
            "java": "class Solution {\n    public long kthElement(int arr1[], int arr2[], int n, int m, int k) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def kthElement(self, arr1: List[int], arr2: List[int], n: int, m: int, k: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} arr1\n * @param {number[]} arr2\n * @param {number} n\n * @param {number} m\n * @param {number} k\n * @return {number}\n */\nvar kthElement = function(arr1, arr2, n, m, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    long long kthElement(int arr1[], int arr2[], int n, int m, int k) {\n        return 0;\n    }\n};"
        },
        "function_name": "kthElement",
        "examples": [
            {"input": "arr1 = [2, 3, 6, 7, 9], arr2 = [1, 4, 8, 10], k = 5", "output": "6"},
            {"input": "arr1 = [100, 112, 256, 349, 770], arr2 = [72, 86, 113, 119, 265, 445, 892], k = 7", "output": "256"}
        ],
        "testCases": [
            { "input": JSON.stringify({ arr1: [2, 3, 6, 7, 9], arr2: [1, 4, 8, 10], n: 5, m: 4, k: 5 }), "expectedOutput": "6" },
            { "input": JSON.stringify({ arr1: [100, 112, 256, 349, 770], arr2: [72, 86, 113, 119, 265, 445, 892], n: 5, m: 7, k: 7 }), "expectedOutput": "256" }
        ]
    },
    {
        "title": "Remove Duplicates from Unsorted Linked List",
        "description": "Given the head of a linked list, find all the values that appear more than once in the list and delete the nodes that have any of those values. Return the linked list after the deletions.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Linked List", "Hash Table"],
        "constraints": ["The number of nodes in the list is in the range [1, 10^5].", "-10^5 <= Node.val <= 10^5"],
        "hints": ["Use a hash set to store values encountered so far.", "If a value is already in the set, skip the current node."],
        "boilerplate_code": {
            "java": "/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) { val = x; }\n * }\n */\nclass Solution {\n    public ListNode deleteDuplicatesUnsorted(ListNode head) {\n        return null;\n    }\n}",
            "python": "# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def deleteDuplicatesUnsorted(self, head: ListNode) -> ListNode:\n        pass",
            "javascript": "/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar deleteDuplicatesUnsorted = function(head) {\n    \n};",
            "cpp": "/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* deleteDuplicatesUnsorted(ListNode* head) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "deleteDuplicatesUnsorted",
        "examples": [
            {"input": "head = [1,2,3,2]", "output": "[1,3]"},
            {"input": "head = [2,1,1,2]", "output": "[]"}
        ],
        "testCases": [
             { "input": JSON.stringify({ head: [1,2,3,2] }), "expectedOutput": `[1,3]` },
             { "input": JSON.stringify({ head: [2,1,1,2] }), "expectedOutput": `[]` }
        ]
    },
    {
        "title": "Rotate Doubly Linked List",
        "description": "Given a doubly linked list and an integer P, rotate the list by P nodes (counter-clockwise).",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Linked List"],
        "constraints": ["1 <= N <= 100", "1 <= P <= N"],
        "hints": ["Similar to singly linked list rotation.", "Ensure both next and prev pointers are updated correctly."],
        "boilerplate_code": {
            "java": "/*\nclass Node {\n    int data;\n    Node prev, next;\n    Node(int data) {\n        this.data = data;\n        prev = null;\n        next = null;\n    }\n}\n*/\nclass Solution {\n    public Node rotateP(Node head, int p) {\n        return null;\n    }\n}",
            "python": "\"\"\"\nclass Node:\n    def __init__(self, data):\n        self.data = data\n        self.prev = None\n        self.next = None\n\"\"\"\nclass Solution:\n    def rotateP(self, head, p):\n        pass",
            "javascript": "/**\n * @param {Node} head\n * @param {number} p\n * @return {Node}\n */\nvar rotateP = function(head, p) {\n    \n};",
            "cpp": "/*\nstruct Node {\n    int data;\n    struct Node* next, *prev;\n};\n*/\nclass Solution {\npublic:\n    Node* rotateP(Node* head, int p) {\n        return NULL;\n    }\n};"
        },
        "function_name": "rotateP",
        "examples": [
            {"input": "head = [1,2,3,4,5,6], p = 2", "output": "[3,4,5,6,1,2]"},
            {"input": "head = [1,2,3], p = 1", "output": "[2,3,1]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ head: [1,2,3,4,5,6], p: 2 }), "expectedOutput": `[3,4,5,6,1,2]` },
            { "input": JSON.stringify({ head: [1,2,3], p: 1 }), "expectedOutput": `[2,3,1]` }
        ]
    },
     {
        "title": "Pairs with Given Sum in Doubly Linked List",
        "description": "Given a sorted doubly linked list of positive distinct elements, the task is to find pairs in the doubly linked list whose sum is equal to a given value x.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Linked List"],
        "constraints": ["1 <= N <= 10^4", "1 <= x <= 10^9"],
        "hints": ["Use two pointers, one at head and one at tail.", "Move them towards each other based on sum comparison with x."],
        "boilerplate_code": {
            "java": "class Solution {\n    public static ArrayList<ArrayList<Integer>> findPairsWithGivenSum(Node head, int target) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def findPairsWithGivenSum(self, head, target):\n        pass",
            "javascript": "/**\n * @param {Node} head\n * @param {number} target\n * @return {number[][]}\n */\nvar findPairsWithGivenSum = function(head, target) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<pair<int, int>> findPairsWithGivenSum(Node *head, int target) {\n        return {};\n    }\n};"
        },
        "function_name": "findPairsWithGivenSum",
        "examples": [
            {"input": "list = [1,2,4,5,6,8,9], target = 7", "output": "[[1,6],[2,5]]"},
            {"input": "list = [1,5,6], target = 6", "output": "[[1,5]]"}
        ],
        "testCases": [
             { "input": JSON.stringify({ head: [1,2,4,5,6,8,9], target: 7 }), "expectedOutput": `[[1,6],[2,5]]` },
             { "input": JSON.stringify({ head: [1,5,6], target: 6 }), "expectedOutput": `[[1,5]]` }
        ]
    }
];
