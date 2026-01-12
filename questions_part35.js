module.exports = [
    {
        "title": "Partition Labels",
        "description": "You are given a string s. We want to partition the string into as many parts as possible so that each letter appears in at most one part. Note that the partition is done so that after concatenating all the parts in order, the resultant string should be s. Return a list of integers representing the size of these parts.",
        "difficulty": "MEDIUM",
        "topics": ["Hash Table", "Two Pointers", "String", "Greedy"],
        "constraints": ["1 <= s.length <= 500", "s consists of lowercase English letters."],
        "hints": ["Precompute last occurrence of each char.", "Iterate and extend 'end' of current part to max(end, last[char])."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<Integer> partitionLabels(String s) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def partitionLabels(self, s: str) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {number[]}\n */\nvar partitionLabels = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> partitionLabels(string s) {\n        return {};\n    }\n};"
        },
        "function_name": "partitionLabels",
        "examples": [
            {"input": "s = \"ababcbacadefegdehijhklij\"", "output": "[9,7,8]"},
            {"input": "s = \"eccbbbbdec\"", "output": "[10]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "ababcbacadefegdehijhklij" }), "expectedOutput": "[9,7,8]" }
        ]
    },
    {
        "title": "Minimum Number of Arrows to Burst Balloons",
        "description": "There are some spherical balloons taped onto a flat wall that represents the XY-plane. The balloons are represented as a 2D integer array points where points[i] = [xstart, xend] denotes a balloon whose horizontal diameter stretches between xstart and xend. You do not know the exact y-coordinates of the balloons. Arrows can be shot up directly vertically (in the positive y-direction) from different points along the x-axis. A balloon with xstart and xend is burst by an arrow shot at x if xstart <= x <= xend. There is no limit to the number of arrows that can be shot. A shot arrow keeps traveling up infinitely, bursting any balloons in its path. Given the array points, return the minimum number of arrows that must be shot to burst all balloons.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Greedy", "Sorting"],
        "constraints": ["1 <= points.length <= 10^5", "points[i].length == 2", "-2^31 <= xstart < xend <= 2^31 - 1"],
        "hints": ["Sort by end coordinate.", "Greedy: shoot arrow at end of current balloon, skip all overlapping."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int findMinArrowShots(int[][] points) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def findMinArrowShots(self, points: List[List[int]]) -> int:\n        pass",
            "javascript": "/**\n * @param {number[][]} points\n * @return {number}\n */\nvar findMinArrowShots = function(points) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int findMinArrowShots(vector<vector<int>>& points) {\n        return 0;\n    }\n};"
        },
        "function_name": "findMinArrowShots",
        "examples": [
            {"input": "points = [[10,16],[2,8],[1,6],[7,12]]", "output": "2"},
            {"input": "points = [[1,2],[3,4],[5,6],[7,8]]", "output": "4"}
        ],
        "testCases": [
            { "input": JSON.stringify({ points: [[10,16],[2,8],[1,6],[7,12]] }), "expectedOutput": "2" }
        ]
    },
    {
        "title": "Queue Reconstruction by Height",
        "description": "You are given an array of people, people, which are the attributes of some people in a queue (not necessarily in order). Each people[i] = [hi, ki] represents the ith person of height hi with exactly ki other people in front who have a height greater than or equal to hi. Reconstruct and return the queue that is represented by the input array people. The returned queue should be formatted as an array queue, where queue[j] = [hj, kj] is the attributes of the jth person of the queue (queue[0] is the person at the front of the queue).",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Greedy", "Sorting"],
        "constraints": ["1 <= people.length <= 2000", "0 <= hi <= 10^6", "0 <= ki < people.length"],
        "hints": ["Sort by height desc, k asc.", "Insert into list at index k."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[][] reconstructQueue(int[][] people) {\n        return new int[][]{};\n    }\n}",
            "python": "class Solution:\n    def reconstructQueue(self, people: List[List[int]]) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {number[][]} people\n * @return {number[][]}\n */\nvar reconstructQueue = function(people) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> reconstructQueue(vector<vector<int>>& people) {\n        return {};\n    }\n};"
        },
        "function_name": "reconstructQueue",
        "examples": [
            {"input": "people = [[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]", "output": "[[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ people: [[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]] }), "expectedOutput": "[[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]]" }
        ]
    },
    {
        "title": "Palindrome Pairs",
        "description": "Given a list of unique words, return all the pairs of the distinct indices (i, j) in the given list, so that the concatenation of the two words words[i] + words[j] is a palindrome.",
        "difficulty": "HARD",
        "topics": ["Array", "String", "Trie"],
        "constraints": ["1 <= words.length <= 5000", "0 <= words[i].length <= 300"],
        "hints": ["Use HashMap/Trie to store reverse of words.", "For each word, check splitting points to form palindromes."],
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
            { "input": JSON.stringify({ words: ["bat","tab","cat"] }), "expectedOutput": "[[0,1],[1,0]]" }
        ]
    }
];
