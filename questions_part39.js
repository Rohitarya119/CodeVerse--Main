module.exports = [
    {
        "title": "Spiral Matrix",
        "description": "Given an m x n matrix, return all elements of the matrix in spiral order.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Matrix", "Simulation"],
        "constraints": ["m == matrix.length", "n == matrix[i].length", "1 <= m, n <= 10", "-100 <= matrix[i][j] <= 100"],
        "hints": ["Simulate the process with 4 boundaries: top, bottom, left, right."],
        "boilerplate_code": {
            "java": "class Solution {\n    public List<Integer> spiralOrder(int[][] matrix) {\n        return new ArrayList<>();\n    }\n}",
            "python": "class Solution:\n    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:\n        pass",
            "javascript": "/**\n * @param {number[][]} matrix\n * @return {number[]}\n */\nvar spiralOrder = function(matrix) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    vector<int> spiralOrder(vector<vector<int>>& matrix) {\n        return {};\n    }\n};"
        },
        "function_name": "spiralOrder",
        "examples": [
            {"input": "matrix = [[1,2,3],[4,5,6],[7,8,9]]", "output": "[1,2,3,6,9,8,7,4,5]"},
            {"input": "matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]", "output": "[1,2,3,4,8,12,11,10,9,5,6,7]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ matrix: [[1,2,3],[4,5,6],[7,8,9]] }), "expectedOutput": "[1,2,3,6,9,8,7,4,5]" }
        ]
    },
    {
        "title": "Rotate Image",
        "description": "You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise). You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Math", "Matrix"],
        "constraints": ["n == matrix.length == matrix[i].length", "1 <= n <= 20", "-1000 <= matrix[i][j] <= 1000"],
        "hints": ["Transpose the matrix, then reverse each row."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void rotate(int[][] matrix) {\n        \n    }\n}",
            "python": "class Solution:\n    def rotate(self, matrix: List[List[int]]) -> None:\n        \"\"\"\n        Do not return anything, modify matrix in-place.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {number[][]} matrix\n * @return {void} Do not return anything, modify matrix in-place.\n */\nvar rotate = function(matrix) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void rotate(vector<vector<int>>& matrix) {\n        \n    }\n};"
        },
        "function_name": "rotate",
        "examples": [
            {"input": "matrix = [[1,2,3],[4,5,6],[7,8,9]]", "output": "[[7,4,1],[8,5,2],[9,6,3]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ matrix: [[1,2,3],[4,5,6],[7,8,9]] }), "expectedOutput": "[[7,4,1],[8,5,2],[9,6,3]]" }
        ]
    },
    {
        "title": "Set Matrix Zeroes",
        "description": "Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's. You must do it in place.",
        "difficulty": "MEDIUM",
        "topics": ["Array", "Hash Table", "Matrix"],
        "constraints": ["m == matrix.length", "n == matrix[0].length", "1 <= m, n <= 200"],
        "hints": ["Use the first row and first column as markers to store states."],
        "boilerplate_code": {
            "java": "class Solution {\n    public void setZeroes(int[][] matrix) {\n        \n    }\n}",
            "python": "class Solution:\n    def setZeroes(self, matrix: List[List[int]]) -> None:\n        \"\"\"\n        Do not return anything, modify matrix in-place.\n        \"\"\"\n        pass",
            "javascript": "/**\n * @param {number[][]} matrix\n * @return {void} Do not return anything, modify matrix in-place.\n */\nvar setZeroes = function(matrix) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    void setZeroes(vector<vector<int>>& matrix) {\n        \n    }\n};"
        },
        "function_name": "setZeroes",
        "examples": [
            {"input": "matrix = [[1,1,1],[1,0,1],[1,1,1]]", "output": "[[1,0,1],[0,0,0],[1,0,1]]"}
        ],
        "testCases": [
            { "input": JSON.stringify({ matrix: [[1,1,1],[1,0,1],[1,1,1]] }), "expectedOutput": "[[1,0,1],[0,0,0],[1,0,1]]" }
        ]
    }
];
