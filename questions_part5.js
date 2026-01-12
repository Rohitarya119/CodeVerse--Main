module.exports = [
    {
        "title": "Odd Even Linked List",
        "description": "Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list. The first node is considered odd, and the second node is even, and so on. Note that the relative order inside both the even and odd groups should remain as it was in the input.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Linked List"],
        "constraints": ["The number of nodes in the linked list is in the range [0, 10^4].", "-10^6 <= Node.val <= 10^6"],
        "hints": ["Use two pointers, one for odd nodes and one for even nodes.", "Maintain the head of the even list to attach it to the end of the odd list."],
        "boilerplate_code": {
            "java": "/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode oddEvenList(ListNode head) {\n        return null;\n    }\n}",
            "python": "# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def oddEvenList(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar oddEvenList = function(head) {\n    \n};",
            "cpp": "/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* oddEvenList(ListNode* head) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "oddEvenList",
        "examples": [
            {"input": "head = [1,2,3,4,5]", "output": "[1,3,5,2,4]"},
            {"input": "head = [2,1,3,5,6,4,7]", "output": "[2,3,6,7,1,5,4]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ head: [1,2,3,4,5] }), "expectedOutput": `[1,3,5,2,4]` },
            { "input": JSON.stringify({ head: [2,1,3,5,6,4,7] }), "expectedOutput": `[2,3,6,7,1,5,4]` }
        ]
    },
    {
        "title": "Find K Closest Elements",
        "description": "Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array. The result should also be sorted in ascending order. An integer a is closer to x than an integer b if: |a - x| < |b - x|, or |a - x| == |b - x| and a < b.",
        "difficulty": "MEDIUM",
        "topics": ["Two Pointers", "Arrays", "Binary Search", "Sorting"],
        "constraints": ["1 <= k <= arr.length", "1 <= arr.length <= 10^4", "arr is sorted in ascending order."],
        "hints": ["Use binary search to find the closest element.", "Use two pointers to expand outwards from the closest element until k elements are found."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<Integer> findClosestElements(int[] arr, int k, int x) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def findClosestElements(self, arr: List[int], k: int, x: int) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} arr\n * @param {number} k\n * @param {number} x\n * @return {number[]}\n */\nvar findClosestElements = function(arr, k, x) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> findClosestElements(vector<int>& arr, int k, int x) {\n        return {};\n    }\n};"
        },
        "function_name": "findClosestElements",
        "examples": [
            {"input": "arr = [1,2,3,4,5], k = 4, x = 3", "output": "[1,2,3,4]"},
            {"input": "arr = [1,2,3,4,5], k = 4, x = -1", "output": "[1,2,3,4]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ arr: [1,2,3,4,5], k: 4, x: 3 }), "expectedOutput": `[1,2,3,4]` },
            { "input": JSON.stringify({ arr: [1,2,3,4,5], k: 4, x: -1 }), "expectedOutput": `[1,2,3,4]` }
        ]
    },
    {
        "title": "Assign Cookies",
        "description": "Assume you are an awesome parent and want to give your children some cookies. But, you should give each child at most one cookie. Each child i has a greed factor g[i], which is the minimum size of a cookie that the child will be content with; and each cookie j has a size s[j]. If s[j] >= g[i], we can assign the cookie j to the child i, and the child i will be content. Your goal is to maximize the number of your content children and return the maximum number.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Greedy", "Sorting"],
        "constraints": ["1 <= g.length <= 3 * 10^4", "0 <= s.length <= 3 * 10^4"],
        "hints": ["Sort both the greed factors and cookie sizes.", "Use two pointers to match the smallest cookie that satisfies a child's greed."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int findContentChildren(int[] g, int[] s) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def findContentChildren(self, g: List[int], s: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} g\n * @param {number[]} s\n * @return {number}\n */\nvar findContentChildren = function(g, s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int findContentChildren(vector<int>& g, vector<int>& s) {\n        return 0;\n    }\n};"
        },
        "function_name": "findContentChildren",
        "examples": [
            {"input": "g = [1,2,3], s = [1,1]", "output": "1"},
            {"input": "g = [1,2], s = [1,2,3]", "output": "2"}
        ],
        "testCases": [
            { "input": JSON.stringify({ g: [1,2,3], s: [1,1] }), "expectedOutput": "1" },
            { "input": JSON.stringify({ g: [1,2], s: [1,2,3] }), "expectedOutput": "2" }
        ]
    },
    {
        "title": "Leaders in an Array",
        "description": "Given an array A of positive integers. Your task is to find the leaders in the array. An element of array is leader if it is greater than or equal to all the elements to its right side. The rightmost element is always a leader.",
        "difficulty": "EASY",
        "topics": ["Starters", "Arrays"],
        "constraints": ["1 <= n <= 10^7", "0 <= A[i] <= 10^7"],
        "hints": ["Scan from right to left.", "Keep track of the maximum element seen so far from the right."],
        "boilerplate_code": {
            "java": "class Solution {\n    public ArrayList<Integer> leaders(int[] arr, int n) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def leaders(self, arr: List[int], n: int) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} arr\n * @param {number} n\n * @return {number[]}\n */\nvar leaders = function(arr, n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> leaders(vector<int>& arr, int n) {\n        return {};\n    }\n};"
        },
        "function_name": "leaders",
        "examples": [
            {"input": "n = 6, arr = [16,17,4,3,5,2]", "output": "[17,5,2]"},
            {"input": "n = 5, arr = [1,2,3,4,0]", "output": "[4,0]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ n: 6, arr: [16,17,4,3,5,2] }), "expectedOutput": `[17,5,2]` },
            { "input": JSON.stringify({ n: 5, arr: [1,2,3,4,0] }), "expectedOutput": `[4,0]` }
        ]
    },
    {
        "title": "Palindrome Pairs",
        "description": "Given a list of unique words, return all the pairs of the distinct indices (i, j) in the given list, so that the concatenation of the two words words[i] + words[j] is a palindrome.",
        "difficulty": "HARD",
        "topics": ["Two Pointers", "String", "Trie", "Hash Table"],
        "constraints": ["1 <= words.length <= 5000", "0 <= words[i].length <= 300"],
        "hints": ["Use a hash map to store the reverse of each word.", "For each word, check if its prefix or suffix is a palindrome and if the remaining part exists in the map."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<Integer>> palindromePairs(String[] words) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def palindromePairs(self, words: List[str]) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {string[]} words\n * @return {number[][]}\n */\nvar palindromePairs = function(words) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> palindromePairs(vector<string>& words) {\n        return {};\n    }\n};"
        },
        "function_name": "palindromePairs",
        "examples": [
            {"input": "words = [\"abcd\",\"dcba\",\"lls\",\"s\",\"sssll\"]", "output": "[[0,1],[1,0],[3,2],[2,4]]"},
            {"input": "words = [\"bat\",\"tab\",\"cat\"]", "output": "[[0,1],[1,0]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ words: ["abcd","dcba","lls","s","sssll"] }), "expectedOutput": `[[0,1],[1,0],[3,2],[2,4]]` },
            { "input": JSON.stringify({ words: ["bat","tab","cat"] }), "expectedOutput": `[[0,1],[1,0]]` }
        ]
    },
    {
        "title": "Union of Two Sorted Arrays",
        "description": "Given two sorted arrays arr1 and arr2 of size n and m respectively. The task is to find their union. The Union of two arrays can be defined as the common and distinct elements in the two arrays. Return the elements in sorted order.",
        "difficulty": "EASY",
        "topics": ["Two Pointers", "Arrays"],
        "constraints": ["1 <= n, m <= 10^5", "-10^9 <= arr1[i], arr2[i] <= 10^9"],
        "hints": ["Use two pointers similar to merge sort.", "Handle duplicates by skipping them."],
        "boilerplate_code": {
            "java": "class Solution {\n    public ArrayList<Integer> findUnion(int[] arr1, int[] arr2, int n, int m) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def findUnion(self, arr1: List[int], arr2: List[int], n: int, m: int) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} arr1\n * @param {number[]} arr2\n * @param {number} n\n * @param {number} m\n * @return {number[]}\n */\nvar findUnion = function(arr1, arr2, n, m) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> findUnion(vector<int>& arr1, vector<int>& arr2, int n, int m) {\n        return {};\n    }\n};"
        },
        "function_name": "findUnion",
        "examples": [
            {"input": "n = 5, arr1 = [1, 2, 3, 4, 5], m = 3, arr2 = [1, 2, 3]", "output": "[1, 2, 3, 4, 5]"},
            {"input": "n = 2, arr1 = [2, 2], m = 1, arr2 = [1]", "output": "[1, 2]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ n: 5, arr1: [1, 2, 3, 4, 5], m: 3, arr2: [1, 2, 3] }), "expectedOutput": `[1,2,3,4,5]` },
            { "input": JSON.stringify({ n: 2, arr1: [2, 2], m: 1, arr2: [1] }), "expectedOutput": `[1,2]` }
        ]
    }
];
