module.exports = [
    {
        "title": "Happy Number",
        "description": "Write an algorithm to determine if a number n is happy. A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits. Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy. Return true if n is a happy number, and false if not.",
        "difficulty": "EASY",
        "topics": ["HashTable", "Math", "Two Pointers"],
        "constraints": ["1 <= n <= 2^31 - 1"],
        "hints": ["Floyd's Cycle Detection (Fast/Slow pointers)."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean isHappy(int n) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def isHappy(self, n: int) -> bool:\n        pass",
            "javascript": "/**\n * @param {number} n\n * @return {boolean}\n */\nvar isHappy = function(n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool isHappy(int n) {\n        return false;\n    }\n};"
        },
        "function_name": "isHappy",
        "examples": [
            {"input": "n = 19", "output": "true"},
            {"input": "n = 2", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ n: 19 }), "expectedOutput": "true" }
        ]
    },
    {
        "title": "Pow(x, n)",
        "description": "Implement pow(x, n), which calculates x raised to the power n (i.e., x^n).",
        "difficulty": "MEDIUM",
        "topics": ["Math", "Recursion"],
        "constraints": ["-100.0 < x < 100.0", "-2^31 <= n <= 2^31-1", "-10^4 <= x^n <= 10^4"],
        "hints": ["Binary Exponentiation. Recursive or Iterative."],
        "boilerplate_code": {
            "java": "class Solution {\n    public double myPow(double x, int n) {\n        return 0.0;\n    }\n}",
            "python": "class Solution:\n    def myPow(self, x: float, n: int) -> float:\n        pass",
            "javascript": "/**\n * @param {number} x\n * @param {number} n\n * @return {number}\n */\nvar myPow = function(x, n) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    double myPow(double x, int n) {\n        return 0.0;\n    }\n};"
        },
        "function_name": "myPow",
        "examples": [
            {"input": "x = 2.00000, n = 10", "output": "1024.00000"},
            {"input": "x = 2.10000, n = 3", "output": "9.26100"}
        ],
        "testCases": [
            { "input": JSON.stringify({ x: 2.0, n: 10 }), "expectedOutput": "1024.0" }
        ]
    },
    {
        "title": "Multiply Strings",
        "description": "Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string. Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.",
        "difficulty": "MEDIUM",
        "topics": ["Math", "String", "Simulation"],
        "constraints": ["1 <= num1.length, num2.length <= 200"],
        "hints": ["Start from right to left, perform multiplication like in elementary school."],
        "boilerplate_code": {
            "java": "class Solution {\n    public String multiply(String num1, String num2) {\n        return \"\";\n    }\n}",
            "python": "class Solution:\n    def multiply(self, num1: str, num2: str) -> str:\n        pass",
            "javascript": "/**\n * @param {string} num1\n * @param {string} num2\n * @return {string}\n */\nvar multiply = function(num1, num2) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    string multiply(string num1, string num2) {\n        return \"\";\n    }\n};"
        },
        "function_name": "multiply",
        "examples": [
            {"input": "num1 = \"2\", num2 = \"3\"", "output": "\"6\""},
            {"input": "num1 = \"123\", num2 = \"456\"", "output": "\"56088\""}
        ],
        "testCases": [
            { "input": JSON.stringify({ num1: "2", num2: "3" }), "expectedOutput": "6" }
        ]
    },
    {
        "title": "Robot Bounded In Circle",
        "description": "On an infinite plane, a robot initially stands at (0, 0) and faces north. The robot can receive one of three instructions: \"G\": go straight 1 unit; \"L\": turn 90 degrees to the left; \"R\": turn 90 degrees to the right. The robot performs the instructions given in order, and repeats them forever. Return true if and only if there exists a circle in the plane such that the robot never leaves the circle.",
        "difficulty": "MEDIUM",
        "topics": ["Math", "Simulation", "String"],
        "constraints": ["1 <= instructions.length <= 100"],
        "hints": ["It's a circle if final pos is (0,0) OR final direction is NOT North."],
        "boilerplate_code": {
            "java": "class Solution {\n    public boolean isRobotBounded(String instructions) {\n        return false;\n    }\n}",
            "python": "class Solution:\n    def isRobotBounded(self, instructions: str) -> bool:\n        pass",
            "javascript": "/**\n * @param {string} instructions\n * @return {boolean}\n */\nvar isRobotBounded = function(instructions) {\n    \n};",
            "cpp": "class Solution {\npublic:\n    bool isRobotBounded(string instructions) {\n        return false;\n    }\n};"
        },
        "function_name": "isRobotBounded",
        "examples": [
            {"input": "instructions = \"GGLLGG\"", "output": "true"},
            {"input": "instructions = \"GG\"", "output": "false"}
        ],
        "testCases": [
            { "input": JSON.stringify({ instructions: "GGLLGG" }), "expectedOutput": "true" }
        ]
    }
];
