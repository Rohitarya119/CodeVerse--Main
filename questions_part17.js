module.exports = [
    {
        "title": "Binary Tree Inorder Traversal",
        "description": "Given the root of a binary tree, return the inorder traversal of its nodes' values.",
        "difficulty": "EASY",
        "topics": ["Tree", "DFS", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [0, 100].", "-100 <= Node.val <= 100"],
        "hints": ["Use recursion or a stack.", "Left -> Root -> Right."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<Integer> inorderTraversal(TreeNode root) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def inorderTraversal(self, root: Optional[TreeNode]) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {number[]}\n */\nvar inorderTraversal = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> inorderTraversal(TreeNode* root) {\n        return {};\n    }\n};"
        },
        "function_name": "inorderTraversal",
        "examples": [
            {"input": "root = [1,null,2,3]", "output": "[1,3,2]"},
            {"input": "root = []", "output": "[]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ root: [1,null,2,3] }), "expectedOutput": "[1,3,2]" }
        ]
    },
    {
        "title": "Binary Tree Preorder Traversal",
        "description": "Given the root of a binary tree, return the preorder traversal of its nodes' values.",
        "difficulty": "EASY",
        "topics": ["Tree", "DFS", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [0, 100].", "-100 <= Node.val <= 100"],
        "hints": ["Root -> Left -> Right."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<Integer> preorderTraversal(TreeNode root) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def preorderTraversal(self, root: Optional[TreeNode]) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {number[]}\n */\nvar preorderTraversal = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> preorderTraversal(TreeNode* root) {\n        return {};\n    }\n};"
        },
        "function_name": "preorderTraversal",
        "examples": [
            {"input": "root = [1,null,2,3]", "output": "[1,2,3]"},
            {"input": "root = []", "output": "[]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ root: [1,null,2,3] }), "expectedOutput": "[1,2,3]" }
        ]
    },
    {
        "title": "Binary Tree Postorder Traversal",
        "description": "Given the root of a binary tree, return the postorder traversal of its nodes' values.",
        "difficulty": "EASY",
        "topics": ["Tree", "DFS", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [0, 100].", "-100 <= Node.val <= 100"],
        "hints": ["Left -> Right -> Root."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<Integer> postorderTraversal(TreeNode root) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def postorderTraversal(self, root: Optional[TreeNode]) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {number[]}\n */\nvar postorderTraversal = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> postorderTraversal(TreeNode* root) {\n        return {};\n    }\n};"
        },
        "function_name": "postorderTraversal",
        "examples": [
            {"input": "root = [1,null,2,3]", "output": "[3,2,1]"},
            {"input": "root = []", "output": "[]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ root: [1,null,2,3] }), "expectedOutput": "[3,2,1]" }
        ]
    },
    {
        "title": "Binary Tree Level Order Traversal",
        "description": "Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).",
        "difficulty": "MEDIUM",
        "topics": ["Tree", "BFS", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [0, 2000].", "-1000 <= Node.val <= 1000"],
        "hints": ["Use a queue for BFS.", "Process nodes level by level."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<Integer>> levelOrder(TreeNode root) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {number[][]}\n */\nvar levelOrder = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> levelOrder(TreeNode* root) {\n        return {};\n    }\n};"
        },
        "function_name": "levelOrder",
        "examples": [
            {"input": "root = [3,9,20,null,null,15,7]", "output": "[[3],[9,20],[15,7]]"},
            {"input": "root = [1]", "output": "[[1]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ root: [3,9,20,null,null,15,7] }), "expectedOutput": "[[3],[9,20],[15,7]]" }
        ]
    },
    {
        "title": "Maximum Depth of Binary Tree",
        "description": "Given the root of a binary tree, return its maximum depth. A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.",
        "difficulty": "EASY",
        "topics": ["Tree", "DFS", "BFS"],
        "constraints": ["The number of nodes in the tree is in the range [0, 10^4].", "-100 <= Node.val <= 100"],
        "hints": ["Recursively find depth of left and right subtrees.", "Return 1 + max(left, right)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int maxDepth(TreeNode root) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def maxDepth(self, root: Optional[TreeNode]) -> int:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {number}\n */\nvar maxDepth = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int maxDepth(TreeNode* root) {\n        return 0;\n    }\n};"
        },
        "function_name": "maxDepth",
        "examples": [
            {"input": "root = [3,9,20,null,null,15,7]", "output": "3"},
            {"input": "root = [1,null,2]", "output": "2"}
        ],
        "testCases": [
            { "input": JSON.stringify({ root: [3,9,20,null,null,15,7] }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Diameter of Binary Tree",
        "description": "Given the root of a binary tree, return the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.",
        "difficulty": "EASY",
        "topics": ["Tree", "DFS", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [1, 10^4].", "-100 <= Node.val <= 100"],
        "hints": ["For every node, length of longest path passing through it is L+R.", "Update max diameter during traversal."],
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
        "testCases": [
            { "input": JSON.stringify({ root: [1,2,3,4,5] }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Balanced Binary Tree",
        "description": "Given a binary tree, determine if it is height-balanced. A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.",
        "difficulty": "EASY",
        "topics": ["Tree", "DFS", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [0, 5000].", "-10^4 <= Node.val <= 10^4"],
        "hints": ["Check height of left and right subtrees.", "If |left - right| > 1, return false/error value."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean isBalanced(TreeNode root) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def isBalanced(self, root: Optional[TreeNode]) -> bool:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {boolean}\n */\nvar isBalanced = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool isBalanced(TreeNode* root) {\n        return false;\n    }\n};"
        },
        "function_name": "isBalanced",
        "examples": [
            {"input": "root = [3,9,20,null,null,15,7]", "output": "true"},
            {"input": "root = [1,2,2,3,3,null,null,4,4]", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ root: [3,9,20,null,null,15,7] }), "expectedOutput": "true" }
        ]
    },
    {
        "title": "Binary Tree Maximum Path Sum",
        "description": "A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root. The path sum is the sum of the node's values in the path. Given the root of a binary tree, return the maximum path sum of any non-empty path.",
        "difficulty": "HARD",
        "topics": ["Tree", "DFS", "Dynamic Programming"],
        "constraints": ["The number of nodes in the tree is in the range [1, 3 * 10^4].", "-1000 <= Node.val <= 1000"],
        "hints": ["For each node, calculate max gain from left and right subtrees.", "Max path through node = node.val + max(leftGain, 0) + max(rightGain, 0)."],
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
        "testCases": [
            { "input": JSON.stringify({ root: [1,2,3] }), "expectedOutput": "6" },
            { "input": JSON.stringify({ root: [-10,9,20,null,null,15,7] }), "expectedOutput": "42" }
        ]
    }
];
