module.exports = [
    {
        "title": "Kth Largest Element in an Array",
        "description": "Given an integer array nums and an integer k, return the kth largest element in the array. Note that it is the kth largest element in the sorted order, not the kth distinct element. Can you solve it without sorting?",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Divide and Conquer", "Sorting", "Heap", "Priority Queue", "Quickselect"],
        "constraints": ["1 <= k <= nums.length <= 10^5", "-10^4 <= nums[i] <= 10^4"],
        "hints": ["Sorting takes O(N log N).", "Min-Heap of size k takes O(N log K).", "Quickselect takes O(N) average."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int findKthLargest(int[] nums, int k) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def findKthLargest(self, nums: List[int], k: int) -> int:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar findKthLargest = function(nums, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int findKthLargest(vector<int>& nums, int k) {\n        return 0;\n    }\n};"
        },
        "function_name": "findKthLargest",
        "examples": [
            {"input": "nums = [3,2,1,5,6,4], k = 2", "output": "5"},
            {"input": "nums = [3,2,3,1,2,4,5,5,6], k = 4", "output": "4"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [3,2,1,5,6,4], k: 2 }), "expectedOutput": "5" }
        ]
    },
    {
        "title": "Top K Frequent Elements",
        "description": "Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Hash Table", "Divide and Conquer", "Sorting", "Heap", "Priority Queue", "Bucket Sort"],
        "constraints": ["1 <= nums.length <= 10^5", "k is in the range [1, the number of unique elements in the array].", "It is guaranteed that the answer is unique."],
        "hints": ["Count frequencies map.", "Use Min-Heap of size k based on frequency.", "Or Bucket Sort since max freq is N."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] topKFrequent(int[] nums, int k) {\n        return new int[]{};\n    }\n}",
            "python": "class Solution:\n    def topKFrequent(self, nums: List[int], k: int) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number[]}\n */\nvar topKFrequent = function(nums, k) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> topKFrequent(vector<int>& nums, int k) {\n        return {};\n    }\n};"
        },
        "function_name": "topKFrequent",
        "examples": [
            {"input": "nums = [1,1,1,2,2,3], k = 2", "output": "[1,2]"},
            {"input": "nums = [1], k = 1", "output": "[1]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ nums: [1,1,1,2,2,3], k: 2 }), "expectedOutput": "[1,2]" }
        ]
    },
    {
        "title": "Find Median from Data Stream",
        "description": "The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values. Implement the MedianFinder class: MedianFinder() initializes the MedianFinder object. void addNum(int num) adds the integer num from the data stream to the data structure. double findMedian() returns the median of all elements so far.",
        "difficulty": "HARD",
        "topics": ["Two Pointers", "Design", "Sorting", "Heap", "Priority Queue", "Data Stream"],
        "constraints": ["At most 5 * 10^4 calls.", "Value range -10^5 to 10^5."],
        "hints": ["Maintain two heaps: Max-Heap for lower half, Min-Heap for upper half.", "Balance sizes to differ by at most 1."],
        "boilerplate_code": {
            "java": "class MedianFinder {\n    public MedianFinder() {\n        \n    }\n    public void addNum(int num) {\n        \n    }\n    public double findMedian() {\n        return 0.0;\n    }\n}",
            "python": "class MedianFinder:\n    def __init__(self):\n        pass\n    def addNum(self, num: int) -> None:\n        pass\n    def findMedian(self) -> float:\n        pass",
            "javascript": "\nvar MedianFinder = function() {\n    \n};\n\n/** \n * @param {number} num\n * @return {void}\n */\nMedianFinder.prototype.addNum = function(num) {\n    \n};\n\n/**\n * @return {number}\n */\nMedianFinder.prototype.findMedian = function() {\n    \n};\n",
            "cpp": "class MedianFinder {\npublic:\n    MedianFinder() {\n        \n    }\n    \n    void addNum(int num) {\n        \n    }\n    \n    double findMedian() {\n        return 0.0;\n    }\n};"
        },
        "function_name": "addNum",
        "examples": [
            {"input": "obj.addNum(1); obj.addNum(2); obj.findMedian(); // 1.5", "output": "null"}
        ],
        "testCases": []
    },
    {
        "title": "Merge k Sorted Lists",
        "description": "You are given an array of k linked-lists lists, each linked-list is sorted in ascending order. Merge all the linked-lists into one sorted linked-list and return it.",
        "difficulty": "HARD",
        "topics": ["Linked List", "Divide and Conquer", "Heap", "Priority Queue", "Merge Sort"],
        "constraints": ["k == lists.length", "0 <= k <= 10^4", "0 <= lists[i].length <= 500"],
        "hints": ["Use Min-Heap to keep track of the smallest current node from each list.", "Extract min and add next node from that list to heap."],
        "boilerplate_code": {
            "java": "class Solution {\n    public ListNode mergeKLists(ListNode[] lists) {\n        return null;\n    }\n}",
            "python": "class Solution:\n    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:\n        pass",
            "javascript": "/**\n * @param {ListNode[]} lists\n * @return {ListNode}\n */\nvar mergeKLists = function(lists) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    ListNode* mergeKLists(vector<ListNode*>& lists) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "mergeKLists",
        "examples": [
            {"input": "lists = [[1,4,5],[1,3,4],[2,6]]", "output": "[1,1,2,3,4,4,5,6]"}
        ],
        "testCases": []
    },
    {
        "title": "Task Scheduler",
        "description": "Given a characters array tasks, representing the tasks a CPU needs to do, where each letter represents a different task. Tasks could be done in any order. Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle. However, there is a non-negative integer n that represents the cooldown period between two same tasks (the same letter in the array), that is that there must be at least n units of time between any two same tasks. Return the least number of units of times that the CPU will take to finish all the given tasks.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Hash Table", "Greedy", "Sorting", "Heap", "Priority Queue", "Counting"],
        "constraints": ["1 <= tasks.length <= 10^4", "tasks[i] is upper-case English letter.", "0 <= n <= 100"],
        "hints": ["Greedy: schedule max frequency tasks first.", "Formula based approach: (maxFreq - 1) * (n + 1) + countOfMaxFreq."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int leastInterval(char[] tasks, int n) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def leastInterval(self, tasks: List[str], n: int) -> int:\n        pass",
            "javascript": "/**\n * @param {character[]} tasks\n * @param {number} n\n * @return {number}\n */\nvar leastInterval = function(tasks, n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int leastInterval(vector<char>& tasks, int n) {\n        return 0;\n    }\n};"
        },
        "function_name": "leastInterval",
        "examples": [
            {"input": "tasks = [\"A\",\"A\",\"A\",\"B\",\"B\",\"B\"], n = 2", "output": "8"},
            {"input": "tasks = [\"A\",\"A\",\"A\",\"B\",\"B\",\"B\"], n = 0", "output": "6"}
        ],
        "testCases": [
            { "input": JSON.stringify({ tasks: ["A","A","A","B","B","B"], n: 2 }), "expectedOutput": "8" }
        ]
    }
];
