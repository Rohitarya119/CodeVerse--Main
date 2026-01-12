module.exports = [
    {
        "title": "Aggressive Cows",
        "description": "You are given an array `stalls` of size `n` representing the positions of stalls on a line, and an integer `k` representing the number of cows. You want to place the `k` cows in the stalls such that the minimum distance between any two cows is as large as possible. Return the largest possible minimum distance.",
        "difficulty": "MEDIUM",
        "topics": ["Binary Search", "Array", "Greedy"],
        "constraints": ["2 <= n <= 10^5", "2 <= k <= n", "0 <= stalls[i] <= 10^9"],
        "hints": ["Binary search on the answer (distance). Range [1, max_position - min_position].", "Check if it's possible to place k cows with at least `mid` distance."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int aggressiveCows(int[] stalls, int k) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def aggressiveCows(self, stalls: List[int], k: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} stalls\n * @param {number} k\n * @return {number}\n */\nvar aggressiveCows = function(stalls, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int aggressiveCows(vector<int>& stalls, int k) {\n        return 0;\n    }\n};"
        },
        "function_name": "aggressiveCows",
        "examples": [
            {"input": "stalls = [1, 2, 8, 4, 9], k = 3", "output": "3"},
            {"input": "stalls = [0, 3, 4, 7, 10, 9], k = 4", "output": "3"}
        ],
        "testCases": [
            { "input": JSON.stringify({ stalls: [1, 2, 8, 4, 9], k: 3 }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Allocate Minimum Pages",
        "description": "You are given an array of integers `A` and an integer `M`. `A[i]` represents the number of pages in the `i`-th book. There are `M` students. You need to allocate all the books to `M` students such that: 1. Each student gets at least one book. 2. Each student gets a contiguous sequence of books. 3. The maximum number of pages assigned to a student is minimized. Return the minimum possible maximum pages. If allocation is not possible, return -1.",
        "difficulty": "HARD",
        "topics": ["Binary Search", "Array"],
        "constraints": ["1 <= N <= 10^5", "1 <= A[i] <= 10^9", "1 <= M <= N"],
        "hints": ["Binary search on the max pages. Range [max(A), sum(A)].", "Check function: Greedily assign books."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int findPages(int[] A, int M) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def findPages(self, A: List[int], M: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} A\n * @param {number} M\n * @return {number}\n */\nvar findPages = function(A, M) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int findPages(vector<int>& A, int M) {\n        return -1;\n    }\n};"
        },
        "function_name": "findPages",
        "examples": [
            {"input": "A = [12, 34, 67, 90], M = 2", "output": "113"}
        ],
        "testCases": [
            { "input": JSON.stringify({ A: [12, 34, 67, 90], M: 2 }), "expectedOutput": "113" }
        ]
    },
    {
        "title": "Painter's Partition Problem",
        "description": "Given `k` painters and an array `boards` where `boards[i]` is the length of the `i`-th board. Each painter takes 1 unit of time to paint 1 unit of length. The problem is to verify if it is possible to paint all boards under time `T`. minimize `T`.",
        "difficulty": "HARD",
        "topics": ["Binary Search", "Array"],
        "constraints": ["Same logic as Allocate Minimum Pages.", "1 <= k <= 10^5"],
        "hints": ["Identical to Allocate Minimum Pages / Split Array Largest Sum."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int paint(int k, int[] boards) {\n        return -1;\n    }\n}",
            "python": "class Solution:\n    def paint(self, k: int, boards: List[int]) -> int:\n        pass",
            "javascript": "/**\n * @param {number} k\n * @param {number[]} boards\n * @return {number}\n */\nvar paint = function(k, boards) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int paint(int k, vector<int>& boards) {\n        return -1;\n    }\n};"
        },
        "function_name": "paint",
        "examples": [
            {"input": "k = 2, boards = [5, 10, 30, 20, 15]", "output": "35"}
        ],
        "testCases": [
            { "input": JSON.stringify({ k: 2, boards: [5, 10, 30, 20, 15] }), "expectedOutput": "35" }
        ]
    },
    {
        "title": "Sqrt(x)",
        "description": "Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well. You must not use any built-in exponent function or operator.",
        "difficulty": "EASY",
        "topics": ["Math", "Binary Search"],
        "constraints": ["0 <= x <= 2^31 - 1"],
        "hints": ["Binary search between 0 and x.", "Check mid * mid <= x."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int mySqrt(int x) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def mySqrt(self, x: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number} x\n * @return {number}\n */\nvar mySqrt = function(x) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int mySqrt(int x) {\n        return 0;\n    }\n};"
        },
        "function_name": "mySqrt",
        "examples": [
            {"input": "x = 4", "output": "2"},
            {"input": "x = 8", "output": "2"}
        ],
        "testCases": [
            { "input": JSON.stringify({ x: 4 }), "expectedOutput": "2" }
        ]
    },
    {
        "title": "Median of Two Sorted Arrays",
        "description": "Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).",
        "difficulty": "HARD",
        "topics": ["Array", "Binary Search", "Divide and Conquer"],
        "constraints": ["nums1.length == m", "nums2.length == n", "0 <= m <= 1000", "0 <= n <= 1000", "1 <= m + n <= 2000"],
        "hints": ["Partition both arrays s.t. left halves and right halves have equal elements.", "Binary search on the smaller array partition."],
        "boilerplate_code": {
            "java": "class Solution {\n    public double findMedianSortedArrays(int[] nums1, int[] nums2) {\n        return 0.0;\n    }\n}",
            "python": "class Solution:\n    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:\n        pass",
            "javascript": "/**\n * @param {number[]} nums1\n * @param {number[]} nums2\n * @return {number}\n */\nvar findMedianSortedArrays = function(nums1, nums2) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {\n        return 0.0;\n    }\n};"
        },
        "function_name": "findMedianSortedArrays",
        "examples": [
            {"input": "nums1 = [1,3], nums2 = [2]", "output": "2.00000"},
            {"input": "nums1 = [1,2], nums2 = [3,4]", "output": "2.50000"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums1: [1,3], nums2: [2] }), "expectedOutput": "2.0" }
        ]
    },
    {
        "title": "Search in a Sorted Array of Unknown Size",
        "description": "You have a sorted array of unique elements and an unknown size. You do not have access to the array but can use the `ArrayReader` interface to access it. You can call `ArrayReader.get(i)` that returns the value at the ith index (0-indexed). If you access an index out of bounds, it returns `2^31 - 1`. Return the index of `target` or -1 if not found.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Binary Search", "Interactive"],
        "constraints": ["1 <= secret.length <= 10^4"],
        "hints": ["Find bounds by exponentially increasing index: 1, 2, 4, 8... until get(i) > target.", "Then standard binary search."],
        "boilerplate_code": {
            "java": "/**\n * // This is ArrayReader's API interface.\n * // You should not implement it, or speculate about its implementation\n * interface ArrayReader {\n *     public int get(int index) {}\n * }\n */\n\nclass Solution {\n    public int search(ArrayReader reader, int target) {\n        return -1;\n    }\n}",
            "python": "# \"\"\"\n# This is ArrayReader's API interface.\n# You should not implement it, or speculate about its implementation\n# \"\"\"\n#class ArrayReader:\n#    def get(self, index: int) -> int:\n\nclass Solution:\n    def search(self, reader: 'ArrayReader', target: int) -> int:\n        pass",
            "javascript": "/**\n * // This is the ArrayReader's API interface.\n * // You should not implement it, or speculate about its implementation\n * // function ArrayReader() {\n * //     this.get = function(index) {};\n * // };\n */\n\n/**\n * @param {ArrayReader} reader\n * @param {number} target\n * @return {number}\n */\nvar search = function(reader, target) {\n    \n};",
            "cpp": "/**\n * // This is the ArrayReader's API interface.\n * // You should not implement it, or speculate about its implementation\n * class ArrayReader {\n *   public:\n *     int get(int index);\n * };\n */\n\nclass Solution {\npublic:\n    int search(const ArrayReader& reader, int target) {\n        return -1;\n    }\n};"
        },
        "function_name": "search",
        "examples": [
            {"input": "array = [-1,0,3,5,9,12], target = 9", "output": "4"}
        ],
        "testCases": []
    }
];
