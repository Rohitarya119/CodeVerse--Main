module.exports = [
    {
        "title": "Symmetric Tree",
        "description": "Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).",
        "difficulty": "EASY",
        "topics": ["Tree", "DFS", "BFS"],
        "constraints": ["The number of nodes in the tree is in the range [1, 1000].", "-100 <= Node.val <= 100"],
        "hints": ["Compare left subtree's left child with right subtree's right child.", "Recursively check mirror property."],
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
        "testCases": [
            { "input": JSON.stringify({ root: [1,2,2,3,4,4,3] }), "expectedOutput": "true" }
        ]
    },
    {
        "title": "Lowest Common Ancestor of a Binary Tree",
        "description": "Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.",
        "difficulty": "MEDIUM",
        "topics": ["Tree", "DFS"],
        "constraints": ["The number of nodes in the tree is in the range [2, 10^5].", "-10^9 <= Node.val <= 10^9", "All Node.val are unique.", "p != q", "p and q will exist in the tree."],
        "hints": ["If root matches p or q, return root.", "Recursively search left and right. If both return non-null, root is LCA."],
        "boilerplate_code": {
            "java": "class Solution {\n    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {\n        return null;\n    }\n}",
            "python": "class Solution:\n    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @param {TreeNode} p\n * @param {TreeNode} q\n * @return {TreeNode}\n */\nvar lowestCommonAncestor = function(root, p, q) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "lowestCommonAncestor",
        "examples": [
            {"input": "root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1", "output": "3"},
            {"input": "root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4", "output": "5"}
        ],
        "testCases": [
            { "input": JSON.stringify({ root: [3,5,1,6,2,0,8,null,null,7,4], p: 5, q: 1 }), "expectedOutput": "3" }
        ]
    },
    {
        "title": "Binary Tree Right Side View",
        "description": "Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.",
        "difficulty": "MEDIUM",
        "topics": ["Tree", "DFS", "BFS"],
        "constraints": ["The number of nodes in the tree is in the range [0, 100].", "-100 <= Node.val <= 100"],
        "hints": ["Use BFS (Level Order). The last element of each level is visible."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<Integer> rightSideView(TreeNode root) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def rightSideView(self, root: Optional[TreeNode]) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {number[]}\n */\nvar rightSideView = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> rightSideView(TreeNode* root) {\n        return {};\n    }\n};"
        },
        "function_name": "rightSideView",
        "examples": [
            {"input": "root = [1,2,3,null,5,null,4]", "output": "[1,3,4]"},
            {"input": "root = [1,null,3]", "output": "[1,3]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ root: [1,2,3,null,5,null,4] }), "expectedOutput": "[1,3,4]" }
        ]
    },
    {
        "title": "Vertical Order Traversal of a Binary Tree",
        "description": "Given the root of a binary tree, calculate the vertical order traversal of the binary tree. For each node at position (row, col), its left and right children will be at positions (row + 1, col - 1) and (row + 1, col + 1) respectively. The root of the tree is at (0, 0).",
        "difficulty": "HARD",
        "topics": ["Tree", "DFS", "BFS", "Sorting"],
        "constraints": ["The number of nodes in the tree is in the range [1, 1000].", "-1000 <= Node.val <= 1000"],
        "hints": ["Store nodes as (col, row, val). Sort by col, then row, then val."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<Integer>> verticalTraversal(TreeNode root) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def verticalTraversal(self, root: Optional[TreeNode]) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {number[][]}\n */\nvar verticalTraversal = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> verticalTraversal(TreeNode* root) {\n        return {};\n    }\n};"
        },
        "function_name": "verticalTraversal",
        "examples": [
            {"input": "root = [3,9,20,null,null,15,7]", "output": "[[9],[3,15],[20],[7]]"},
            {"input": "root = [1,2,3,4,5,6,7]", "output": "[[4],[2],[1,5,6],[3],[7]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ root: [3,9,20,null,null,15,7] }), "expectedOutput": "[[9],[3,15],[20],[7]]" }
        ]
    },
    {
        "title": "Binary Tree Zigzag Level Order Traversal",
        "description": "Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).",
        "difficulty": "MEDIUM",
        "topics": ["Tree", "BFS"],
        "constraints": ["The number of nodes in the tree is in the range [0, 2000].", "-100 <= Node.val <= 100"],
        "hints": ["Standard Level Order traversal using a deque/queue.", "Reverse the order for alternating levels."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<Integer>> zigzagLevelOrder(TreeNode root) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def zigzagLevelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {number[][]}\n */\nvar zigzagLevelOrder = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> zigzagLevelOrder(TreeNode* root) {\n        return {};\n    }\n};"
        },
        "function_name": "zigzagLevelOrder",
        "examples": [
            {"input": "root = [3,9,20,null,null,15,7]", "output": "[[3],[20,9],[15,7]]"},
            {"input": "root = [1]", "output": "[[1]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ root: [3,9,20,null,null,15,7] }), "expectedOutput": "[[3],[20,9],[15,7]]" }
        ]
    },
    {
        "title": "Path Sum",
        "description": "Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.",
        "difficulty": "EASY",
        "topics": ["Tree", "DFS"],
        "constraints": ["The number of nodes in the tree is in the range [0, 5000].", "-1000 <= Node.val <= 1000", "-1000 <= targetSum <= 1000"],
        "hints": ["Recursively check if (targetSum - root.val) can be found in left or right subtree.", "Base case: leaf node check."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean hasPathSum(TreeNode root, int targetSum) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def hasPathSum(self, root: Optional[TreeNode], targetSum: int) -> bool:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @param {number} targetSum\n * @return {boolean}\n */\nvar hasPathSum = function(root, targetSum) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool hasPathSum(TreeNode* root, int targetSum) {\n        return false;\n    }\n};"
        },
        "function_name": "hasPathSum",
        "examples": [
            {"input": "root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22", "output": "true"},
            {"input": "root = [1,2,3], targetSum = 5", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ root: [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum: 22 }), "expectedOutput": "true" }
        ]
    },
    {
        "title": "Count Complete Tree Nodes",
        "description": "Given the root of a complete binary tree, return the number of the nodes in the tree.",
        "difficulty": "MEDIUM",
        "topics": ["Tree", "DFS", "Binary Search"],
        "constraints": ["The number of nodes in the tree is in the range [0, 5 * 10^4].", "0 <= Node.val <= 5 * 10^4", "The tree is guaranteed to be complete."],
        "hints": ["Compare depth of left and right subtrees.", "If equal, left is full; recurse on right. Else recurse on left."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int countNodes(TreeNode root) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def countNodes(self, root: Optional[TreeNode]) -> int:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {number}\n */\nvar countNodes = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int countNodes(TreeNode* root) {\n        return 0;\n    }\n};"
        },
        "function_name": "countNodes",
        "examples": [
            {"input": "root = [1,2,3,4,5,6]", "output": "6"}
        ],
        "testCases": [
            { "input": JSON.stringify({ root: [1,2,3,4,5,6] }), "expectedOutput": "6" }
        ]
    }
];
