module.exports = [
    {
        "title": "Implement Trie (Prefix Tree)",
        "description": "A trie (pronounced as \"try\") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker. Implement the Trie class.",
        "difficulty": "MEDIUM",
        "topics": ["Hash Table", "String", "Design", "Trie"],
        "constraints": ["1 <= word.length <= 2000", "word consists of lowercase English letters.", "At most 3 * 10^4 calls."],
        "hints": ["Use an array of size 26 or a Map for children.", "Mark end of word with a boolean flag."],
        "boilerplate_code": {
            "java": "class Trie {\n    public Trie() {\n        \n    }\n    public void insert(String word) {\n        \n    }\n    public boolean search(String word) {\n        return false;\n    }\n    public boolean startsWith(String prefix) {\n        return false;\n    }\n}",
            "python": "class Trie:\n    def __init__(self):\n        pass\n    def insert(self, word: str) -> None:\n        pass\n    def search(self, word: str) -> bool:\n        pass\n    def startsWith(self, prefix: str) -> bool:\n        pass",
            "javascript": "\nvar Trie = function() {\n    \n};\n\n/** \n * @param {string} word\n * @return {void}\n */\nTrie.prototype.insert = function(word) {\n    \n};\n\n/** \n * @param {string} word\n * @return {boolean}\n */\nTrie.prototype.search = function(word) {\n    \n};\n\n/** \n * @param {string} prefix\n * @return {boolean}\n */\nTrie.prototype.startsWith = function(prefix) {\n    \n};\n",
            "cpp": "class Trie {\npublic:\n    Trie() {\n        \n    }\n    \n    void insert(string word) {\n        \n    }\n    \n    bool search(string word) {\n        return false;\n    }\n    \n    bool startsWith(string prefix) {\n        return false;\n    }\n};"
        },
        "function_name": "insert",
        "examples": [
            {"input": "Trie trie = new Trie(); trie.insert(\"apple\"); trie.search(\"apple\");   // return True", "output": "null"}
        ],
        "testCases": []
    },
    {
        "title": "Design Add and Search Words Data Structure",
        "description": "Design a data structure that supports adding new words and finding if a string matches any previously added string. Implement the WordDictionary class. The search function supports '.' as a wildcard character.",
        "difficulty": "MEDIUM",
        "topics": ["String", "DFS", "Design", "Trie"],
        "constraints": ["1 <= word.length <= 25", "At most 10^4 calls."],
        "hints": ["Use Trie.", "For '.', recurse on all possible children."],
        "boilerplate_code": {
            "java": "class WordDictionary {\n    public WordDictionary() {\n        \n    }\n    public void addWord(String word) {\n        \n    }\n    public boolean search(String word) {\n        return false;\n    }\n}",
            "python": "class WordDictionary:\n    def __init__(self):\n        pass\n    def addWord(self, word: str) -> None:\n        pass\n    def search(self, word: str) -> bool:\n        pass",
            "javascript": "\nvar WordDictionary = function() {\n    \n};\n\n/** \n * @param {string} word\n * @return {void}\n */\nWordDictionary.prototype.addWord = function(word) {\n    \n};\n\n/** \n * @param {string} word\n * @return {boolean}\n */\nWordDictionary.prototype.search = function(word) {\n    \n};\n",
            "cpp": "class WordDictionary {\npublic:\n    WordDictionary() {\n        \n    }\n    \n    void addWord(string word) {\n        \n    }\n    \n    bool search(string word) {\n        return false;\n    }\n};"
        },
        "function_name": "addWord",
        "examples": [
            {"input": "wordDictionary.addWord(\"bad\"); wordDictionary.search(\".ad\"); // return True", "output": "null"}
        ],
        "testCases": []
    }
];
