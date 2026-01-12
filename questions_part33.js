module.exports = [
    {
        "title": "Diameter of Binary Tree",
        "description": "Given the root of a binary tree, return the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root. The length of a path between two nodes is represented by the number of edges between them.",
        "difficulty": "EASY",
        "topics": ["Tree", "DFS", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [1, 10^4].", "-100 <= Node.val <= 100"],
        "hints": ["For every node, length of longest path passing through it is L + R.", "Update global max diameter during DFS."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int diameterOfBinaryTree(TreeNode root) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def diameterOfBinaryTree(self, root: Optional[TreeNode]) -> int:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {number}\n */\nvar diameterOfBinaryTree = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int diameterOfBinaryTree(TreeNode* root) {\n        return 0;\n    }\n};"
        },
        "function_name": "diameterOfBinaryTree",
        "examples": [
            {"input": "root = [1,2,3,4,5]", "output": "3"},
            {"input": "root = [1,2]", "output": "1"}
        ],
        "testCases": []
    },
    {
        "title": "Symmetric Tree",
        "description": "Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).",
        "difficulty": "EASY",
        "topics": ["Tree", "DFS", "BFS", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [1, 1000]."],
        "hints": ["Recursively check if left.left == right.right and left.right == right.left.", "Or use Queue for BFS."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean isSymmetric(TreeNode root) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def isSymmetric(self, root: Optional[TreeNode]) -> bool:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {boolean}\n */\nvar isSymmetric = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool isSymmetric(TreeNode* root) {\n        return false;\n    }\n};"
        },
        "function_name": "isSymmetric",
        "examples": [
            {"input": "root = [1,2,2,3,4,4,3]", "output": "true"},
            {"input": "root = [1,2,2,null,3,null,3]", "output": "false"}
        ],
        "testCases": []
    },
    {
        "title": "Binary Tree Maximum Path Sum",
        "description": "A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root. The path sum is the sum of the node's values in the path. Given the root of a binary tree, return the maximum path sum of any non-empty path.",
        "difficulty": "HARD",
        "topics": ["Tree", "DFS", "DP", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [1, 3 * 10^4].", "-1000 <= Node.val <= 1000"],
        "hints": ["Calculate max gain from left and right subtrees.", "Global max = max(global, left + right + node.val).", "Return node.val + max(left, right)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int maxPathSum(TreeNode root) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def maxPathSum(self, root: Optional[TreeNode]) -> int:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {number}\n */\nvar maxPathSum = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int maxPathSum(TreeNode* root) {\n        return 0;\n    }\n};"
        },
        "function_name": "maxPathSum",
        "examples": [
            {"input": "root = [1,2,3]", "output": "6"},
            {"input": "root = [-10,9,20,null,null,15,7]", "output": "42"}
        ],
        "testCases": []
    },
    {
        "title": "Serialize and Deserialize Binary Tree",
        "description": "Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment. Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.",
        "difficulty": "HARD",
        "topics": ["String", "Tree", "DFS", "BFS", "Design", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [0, 10^4].", "-1000 <= Node.val <= 1000"],
        "hints": ["Use Preorder traversal with special character for null (e.g., 'X')."],
        "boilerplate_code": {
            "java": "public class Codec {\n    public String serialize(TreeNode root) {\n        return \"\";\n    }\n    public TreeNode deserialize(String data) {\n        return null;\n    }\n}",
            "python": "class Codec:\n    def serialize(self, root):\n        pass\n    def deserialize(self, data):\n        pass",
            "javascript": "/**\n * Encodes a tree to a single string.\n *\n * @param {TreeNode} root\n * @return {string}\n */\nvar serialize = function(root) {\n    \n};\n\n/**\n * Decodes your encoded data to tree.\n *\n * @param {string} data\n * @return {TreeNode}\n */\nvar deserialize = function(data) {\n    \n};",
            "cpp": "class Codec {\npublic:\n    string serialize(TreeNode* root) {\n        return \"\";\n    }\n    TreeNode* deserialize(string data) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "serialize",
        "examples": [
            {"input": "root = [1,2,3,null,null,4,5]", "output": "[1,2,3,null,null,4,5]"}
        ],
        "testCases": []
    },
    {
        "title": "Course Schedule",
        "description": "There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai. Return true if you can finish all courses. Otherwise, return false.",
        "difficulty": "MEDIUM",
        "topics": ["DFS", "BFS", "Graph", "Topological Sort"],
        "constraints": ["1 <= numCourses <= 2000", "0 <= prerequisites.length <= 5000"],
        "hints": ["This is a cycle detection problem.", "Use DFS with 3 states (visiting, visited, unvisited) or Kahn's Algorithm (BFS)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean canFinish(int numCourses, int[][] prerequisites) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:\n        pass",
            "javascript": "/**\n * @param {number} numCourses\n * @param {number[][]} prerequisites\n * @return {boolean}\n */\nvar canFinish = function(numCourses, prerequisites) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool canFinish(int numCourses, vector<vector<int>>& prerequisites) {\n        return false;\n    }\n};"
        },
        "function_name": "canFinish",
        "examples": [
            {"input": "numCourses = 2, prerequisites = [[1,0]]", "output": "true"},
            {"input": "numCourses = 2, prerequisites = [[1,0],[0,1]]", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ numCourses: 2, prerequisites: [[1,0]] }), "expectedOutput": "true" }
        ]
    },
    {
        "title": "Course Schedule II",
        "description": "There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai. Return the ordering of courses you should take to finish all courses. If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.",
        "difficulty": "MEDIUM",
        "topics": ["DFS", "BFS", "Graph", "Topological Sort"],
        "constraints": ["1 <= numCourses <= 2000"],
        "hints": ["Use Kahn's Algorithm for Topological Sort.", "If result size < numCourses, cycle exists."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int[] findOrder(int numCourses, int[][] prerequisites) {\n        return new int[]{};\n    }\n}",
            "python": "class Solution:\n    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number} numCourses\n * @param {number[][]} prerequisites\n * @return {number[]}\n */\nvar findOrder = function(numCourses, prerequisites) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> findOrder(int numCourses, vector<vector<int>>& prerequisites) {\n        return {};\n    }\n};"
        },
        "function_name": "findOrder",
        "examples": [
            {"input": "numCourses = 2, prerequisites = [[1,0]]", "output": "[0,1]"},
            {"input": "numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]", "output": "[0,2,1,3]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ numCourses: 2, prerequisites: [[1,0]] }), "expectedOutput": "[0,1]" }
        ]
    }
];
