module.exports = [
    {
        "title": "Decode Ways",
        "description": "A message containing letters from A-Z can be encoded into numbers using the following mapping: 'A' -> \"1\", 'B' -> \"2\", ... 'Z' -> \"26\". To decode an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above (there may be multiple ways). Given a string s containing only digits, return the number of ways to decode it.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Dynamic Programming"],
        "constraints": ["1 <= s.length <= 100", "s contains only digits and may contain leading zero(s)."],
        "hints": ["dp[i] = dp[i-1] (if s[i] valid) + dp[i-2] (if s[i-1:i+1] valid)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int numDecodings(String s) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def numDecodings(self, s: str) -> int:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {number}\n */\nvar numDecodings = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int numDecodings(string s) {\n        return 0;\n    }\n};"
        },
        "function_name": "numDecodings",
        "examples": [
            {"input": "s = \"12\"", "output": "2"},
            {"input": "s = \"226\"", "output": "3"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "12" }), "expectedOutput": "2" }
        ]
    },
    {
        "title": "Word Break",
        "description": "Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words. Note that the same word in the dictionary may be reused multiple times in the segmentation.",
        "difficulty": "MEDIUM",
        "topics": ["HashTable", "String", "Dynamic Programming", "Trie", "Memoization"],
        "constraints": ["1 <= s.length <= 300", "1 <= wordDict.length <= 1000"],
        "hints": ["dp[i] is true if s[0...i] can be segmented."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean wordBreak(String s, List<String> wordDict) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def wordBreak(self, s: str, wordDict: List[str]) -> bool:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @param {string[]} wordDict\n * @return {boolean}\n */\nvar wordBreak = function(s, wordDict) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool wordBreak(string s, vector<string>& wordDict) {\n        return false;\n    }\n};"
        },
        "function_name": "wordBreak",
        "examples": [
            {"input": "s = \"leetcode\", wordDict = [\"leet\",\"code\"]", "output": "true"},
            {"input": "s = \"applepenapple\", wordDict = [\"apple\",\"pen\"]", "output": "true"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "leetcode", wordDict: ["leet","code"] }), "expectedOutput": "true" }
        ]
    },
    {
        "title": "Word Break II",
        "description": "Given a string s and a dictionary of strings wordDict, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences in any order. Note that the same word in the dictionary may be reused multiple times in the segmentation.",
        "difficulty": "HARD",
        "topics": ["HashTable", "String", "Dynamic Programming", "Backtracking", "Trie"],
        "constraints": ["1 <= s.length <= 20", "1 <= wordDict.length <= 1000"],
        "hints": ["Backtracking with Memoization."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<String> wordBreak(String s, List<String> wordDict) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def wordBreak(self, s: str, wordDict: List[str]) -> List[str]:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @param {string[]} wordDict\n * @return {string[]}\n */\nvar wordBreak = function(s, wordDict) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<string> wordBreak(string s, vector<string>& wordDict) {\n        return {};\n    }\n};"
        },
        "function_name": "wordBreak",
        "examples": [
            {"input": "s = \"catsanddog\", wordDict = [\"cat\",\"cats\",\"and\",\"sand\",\"dog\"]", "output": "[\"cats and dog\",\"cat sand dog\"]"}
        ],
        "testCases": []
    },
    {
        "title": "Palindrome Partitioning",
        "description": "Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Dynamic Programming", "Backtracking"],
        "constraints": ["1 <= s.length <= 16", "s contains only lowercase English letters."],
        "hints": ["Backtracking. For each prefix that is palindrome, recurse on remainder."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<String>> partition(String s) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def partition(self, s: str) -> List[List[str]]:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {string[][]}\n */\nvar partition = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<string>> partition(string s) {\n        return {};\n    }\n};"
        },
        "function_name": "partition",
        "examples": [
            {"input": "s = \"aab\"", "output": "[[\"a\",\"a\",\"b\"],[\"aa\",\"b\"]]"},
            {"input": "s = \"a\"", "output": "[[\"a\"]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "aab" }), "expectedOutput": "[[\"a\",\"a\",\"b\"],[\"aa\",\"b\"]]" }
        ]
    },
    {
        "title": "Restore IP Addresses",
        "description": "A valid IP address consists of exactly four integers separated by single dots. Each integer is between 0 and 255 (inclusive) and cannot have leading zeros. Given a string s containing only digits, return all possible valid IP addresses that can be formed by inserting dots into s. You are not allowed to reorder or remove any digits in s. You may return the valid IP addresses in any order.",
        "difficulty": "MEDIUM",
        "topics": ["String", "Backtracking"],
        "constraints": ["1 <= s.length <= 20", "s consists of digits only."],
        "hints": ["Backtracking. Try placing dot after 1, 2, or 3 digits."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<String> restoreIpAddresses(String s) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def restoreIpAddresses(self, s: str) -> List[str]:\n        pass",
            "javascript": "/**\n * @param {string} s\n * @return {string[]}\n */\nvar restoreIpAddresses = function(s) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<string> restoreIpAddresses(string s) {\n        return {};\n    }\n};"
        },
        "function_name": "restoreIpAddresses",
        "examples": [
            {"input": "s = \"25525511135\"", "output": "[\"255.255.11.135\",\"255.255.111.35\"]"},
            {"input": "s = \"0000\"", "output": "[\"0.0.0.0\"]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ s: "25525511135" }), "expectedOutput": "[\"255.255.11.135\",\"255.255.111.35\"]" }
        ]
    }
];
