module.exports = [
    {
        "title": "Flatten Binary Tree to Linked List",
        "description": "Given the root of a binary tree, flatten the tree into a \"linked list\": The \"linked list\" should use the same TreeNode class where the right child pointer points to the next node in the list and the left child pointer is always null. The \"linked list\" should be in the same order as a pre-order traversal of the binary tree.",
        "difficulty": "MEDIUM",
        "topics": ["Linked List", "Stack", "Tree", "DFS", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [0, 2000].", "-100 <= Node.val <= 100"],
        "hints": ["Use Morris Traversal or recursive post-order (right, left, root)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void flatten(TreeNode root) {\n        \n    }\n}",
            "python": "class Solution:\n    def flatten(self, root: Optional[TreeNode]) -> None:\n        \"\"\"\n        Do not return anything, modify root in-place.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @return {void} Do not return anything, modify root in-place.\n */\nvar flatten = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void flatten(TreeNode* root) {\n        \n    }\n};"
        },
        "function_name": "flatten",
        "examples": [
            {"input": "root = [1,2,5,3,4,null,6]", "output": "[1,null,2,null,3,null,4,null,5,null,6]"}
        ],
        "testCases": []
    },
    {
        "title": "Populating Next Right Pointers in Each Node",
        "description": "You are given a perfect binary tree where all leaves are on the same level, and every parent has two children. Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL. Initially, all next pointers are set to NULL.",
        "difficulty": "MEDIUM",
        "topics": ["Tree", "DFS", "BFS", "Binary Tree"],
        "constraints": ["The number of nodes is in the range [0, 2^12 - 1].", "-1000 <= Node.val <= 1000"],
        "hints": ["Level order traversal (BFS). Or rely on the fact that if a node has left child, it has right child. Connect left->next = right. Connect right->next = next->left."],
        "boilerplate_code": {
            "java": "class Solution {\n    public Node connect(Node root) {\n        return null;\n    }\n}",
            "python": "class Solution:\n    def connect(self, root: 'Optional[Node]') -> 'Optional[Node]':\n        pass",
            "javascript": "/**\n * @param {Node} root\n * @return {Node}\n */\nvar connect = function(root) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    Node* connect(Node* root) {\n        return nullptr;\n    }\n};"
        },
        "function_name": "connect",
        "examples": [
            {"input": "root = [1,2,3,4,5,6,7]", "output": "[1,#,2,3,#,4,5,6,7,#]"}
        ],
        "testCases": []
    },
    {
        "title": "Path Sum II",
        "description": "Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where the sum of the node values in the path equals targetSum. Each path should be returned as a list of the node values, not node references. A root-to-leaf path is a path starting from the root and ending at any leaf node. A leaf is a node with no children.",
        "difficulty": "MEDIUM",
        "topics": ["Backtracking", "Tree", "DFS", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [0, 5000].", "-1000 <= Node.val <= 1000", "-1000 <= targetSum <= 1000"],
        "hints": ["DFS keeping track of current path and current sum."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<List<Integer>> pathSum(TreeNode root, int targetSum) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def pathSum(self, root: Optional[TreeNode], targetSum: int) -> List[List[int]]:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @param {number} targetSum\n * @return {number[][]}\n */\nvar pathSum = function(root, targetSum) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<vector<int>> pathSum(TreeNode* root, int targetSum) {\n        return {};\n    }\n};"
        },
        "function_name": "pathSum",
        "examples": [
            {"input": "root = [5,4,8,11,null,13,4,7,2,5,1], targetSum = 22", "output": "[[5,4,11,2],[5,8,4,5]]"}
        ],
        "testCases": []
    },
    {
        "title": "Path Sum III",
        "description": "Given the root of a binary tree and an integer targetSum, return the number of paths where the sum of the values along the path equals targetSum. The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).",
        "difficulty": "MEDIUM",
        "topics": ["Tree", "DFS", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [0, 1000].", "-10^9 <= Node.val <= 10^9", "-1000 <= targetSum <= 1000"],
        "hints": ["Use Prefix Sum HashMap to store path sums encountered so far."],
        "boilerplate_code": {
            "java": "class Solution {\n    public int pathSum(TreeNode root, int targetSum) {\n        return 0;\n    }\n}",
            "python": "class Solution:\n    def pathSum(self, root: Optional[TreeNode], targetSum: int) -> int:\n        pass",
            "javascript": "/**\n * @param {TreeNode} root\n * @param {number} targetSum\n * @return {number}\n */\nvar pathSum = function(root, targetSum) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    int pathSum(TreeNode* root, int targetSum) {\n        return 0;\n    }\n};"
        },
        "function_name": "pathSum",
        "examples": [
            {"input": "root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8", "output": "3"}
        ],
        "testCases": []
    },
    {
        "title": "Lowest Common Ancestor of a Binary Tree",
        "description": "Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.",
        "difficulty": "MEDIUM",
        "topics": ["Tree", "DFS", "Binary Tree"],
        "constraints": ["The number of nodes in the tree is in the range [2, 10^5].", "-10^9 <= Node.val <= 10^9", "All Node.val are unique.", "p != q", "p and q will exist in the tree."],
        "hints": ["Bottom-up recursion. If root matches p or q, return root. If both left and right return non-null, root is LCA."],
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
        "testCases": []
    }
];
