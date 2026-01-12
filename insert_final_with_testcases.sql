
-- Clean up existing data to allow clean re-insertion
-- First delete test cases for the problems we are about to insert (to match by title if IDs shift)
-- But since we can't easily join on title for delete in one go without complex subqueries,
-- we'll rely on cascading or manual cleanup.
-- Safest is to just drop these specific titles if they exist.


DO $$
DECLARE
    r RECORD;
BEGIN
    -- Delete test cases for problems with these titles
    FOR r IN SELECT id FROM problems WHERE title IN ('Reverse String', 'Squares of a Sorted Array', '3Sum', 'Move Zeroes', 'Remove Duplicates from Sorted Array', 'Trapping Rain Water', 'Sort Colors', '4Sum', 'Intersection of Two Arrays', 'Merge Sorted Array', '3Sum Closest', 'Remove Element', 'Reverse Words in a String', 'Valid Triangle Number', 'Boats to Save People', 'Bag of Tokens', 'Rotate Array', 'Palindromic Substrings', 'Median of Two Sorted Arrays', 'Remove Duplicates from Sorted List', 'Two Sum II - Input Array Is Sorted', 'Container With Most Water', 'Longest Substring Without Repeating Characters', 'Minimum Size Subarray Sum', 'Permutation in String', 'Longest Repeating Character Replacement', 'Max Consecutive Ones III', 'Fruit Into Baskets', 'Find the Duplicate Number', 'Linked List Cycle', 'Count Pairs with Sum', 'Rearrange Array Alternately', 'Valid Palindrome', 'Sort Array of 0s and 1s', 'Closet Pair from Two Sorted Arrays', 'Pair with Given Difference', '3Sum Smaller', 'Interval List Intersections', 'Rotate List', 'Odd Even Linked List', 'Find K Closest Elements', 'Assign Cookies', 'Leaders in an Array', 'Palindrome Pairs', 'Union of Two Sorted Arrays', 'Kth Element of Two Sorted Arrays', 'Remove Duplicates from Unsorted Linked List', 'Rotate Doubly Linked List', 'Pairs with Given Sum in Doubly Linked List') LOOP
        DELETE FROM test_cases WHERE problem_id = r.id;
    END LOOP;

    -- Delete the problems themselves
    DELETE FROM problems WHERE title IN ('Reverse String', 'Squares of a Sorted Array', '3Sum', 'Move Zeroes', 'Remove Duplicates from Sorted Array', 'Trapping Rain Water', 'Sort Colors', '4Sum', 'Intersection of Two Arrays', 'Merge Sorted Array', '3Sum Closest', 'Remove Element', 'Reverse Words in a String', 'Valid Triangle Number', 'Boats to Save People', 'Bag of Tokens', 'Rotate Array', 'Palindromic Substrings', 'Median of Two Sorted Arrays', 'Remove Duplicates from Sorted List', 'Two Sum II - Input Array Is Sorted', 'Container With Most Water', 'Longest Substring Without Repeating Characters', 'Minimum Size Subarray Sum', 'Permutation in String', 'Longest Repeating Character Replacement', 'Max Consecutive Ones III', 'Fruit Into Baskets', 'Find the Duplicate Number', 'Linked List Cycle', 'Count Pairs with Sum', 'Rearrange Array Alternately', 'Valid Palindrome', 'Sort Array of 0s and 1s', 'Closet Pair from Two Sorted Arrays', 'Pair with Given Difference', '3Sum Smaller', 'Interval List Intersections', 'Rotate List', 'Odd Even Linked List', 'Find K Closest Elements', 'Assign Cookies', 'Leaders in an Array', 'Palindrome Pairs', 'Union of Two Sorted Arrays', 'Kth Element of Two Sorted Arrays', 'Remove Duplicates from Unsorted Linked List', 'Rotate Doubly Linked List', 'Pairs with Given Sum in Doubly Linked List');
END $$;



DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Reverse String',
        'Write a function that reverses a string. The input string is given as an array of characters s. You must do this by modifying the input array in-place with O(1) extra memory.',
        'EASY',
        '["Two Pointers","String"]'::jsonb,
        '["1 <= s.length <= 10^5","s[i] is a printable ascii character"]'::jsonb,
        '["Use two pointers, one at the beginning and one at the end of the string.","Swap the characters at the two pointers and move them towards the center."]'::jsonb,
        '{"java":"class Solution {\n    public void reverseString(char[] s) {\n        \n    }\n}","python":"class Solution:\n    def reverseString(self, s: List[str]) -> None:\n        \"\"\"\n        Do not return anything, modify s in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {character[]} s\n * @return {void} Do not return anything, modify s in-place instead.\n */\nvar reverseString = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    void reverseString(vector<char>& s) {\n        \n    }\n};"}'::jsonb,
        'reverseString',
        '[{"input":"s = [\"h\",\"e\",\"l\",\"l\",\"o\"]","output":"[\"o\",\"l\",\"l\",\"e\",\"h\"]"},{"input":"s = [\"H\",\"a\",\"n\",\"n\",\"a\",\"h\"]","output":"[\"h\",\"a\",\"n\",\"n\",\"a\",\"H\"]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":["h","e","l","l","o"]}', '["o","l","l","e","h"]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":["H","a","n","n","a","h"]}', '["h","a","n","n","a","H"]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Squares of a Sorted Array',
        'Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.',
        'EASY',
        '["Two Pointers","Arrays","Sorting"]'::jsonb,
        '["1 <= nums.length <= 10^4","-10^4 <= nums[i] <= 10^4","nums is sorted in non-decreasing order"]'::jsonb,
        '["The largest square will be either at the start or the end of the array.","Use two pointers to compare absolute values at both ends and fill the result array from the back."]'::jsonb,
        '{"java":"class Solution {\n    public int[] sortedSquares(int[] nums) {\n        return new int[0];\n    }\n}","python":"class Solution:\n    def sortedSquares(self, nums: List[int]) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number[]}\n */\nvar sortedSquares = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> sortedSquares(vector<int>& nums) {\n        return {};\n    }\n};"}'::jsonb,
        'sortedSquares',
        '[{"input":"nums = [-4,-1,0,3,10]","output":"[0,1,9,16,100]"},{"input":"nums = [-7,-3,2,3,11]","output":"[4,9,9,49,121]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-4,-1,0,3,10]}', '[0,1,9,16,100]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-7,-3,2,3,11]}', '[4,9,9,49,121]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        '3Sum',
        'Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0. Notice that the solution set must not contain duplicate triplets.',
        'MEDIUM',
        '["Two Pointers","Arrays","Sorting"]'::jsonb,
        '["3 <= nums.length <= 3000","-10^5 <= nums[i] <= 10^5"]'::jsonb,
        '["Sort the array first to handle duplicates and make the two-pointer approach easier.","Iterate through the array with one pointer, and for each element, use two pointers to find the other two numbers that sum to zero."]'::jsonb,
        '{"java":"class Solution {\n    public List<List<Integer>> threeSum(int[] nums) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def threeSum(self, nums: List[int]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number[][]}\n */\nvar threeSum = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> threeSum(vector<int>& nums) {\n        return {};\n    }\n};"}'::jsonb,
        'threeSum',
        '[{"input":"nums = [-1,0,1,2,-1,-4]","output":"[[-1,-1,2],[-1,0,1]]"},{"input":"nums = [0,1,1]","output":"[]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-1,0,1,2,-1,-4]}', '[[-1,-1,2],[-1,0,1]]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,1,1]}', '[]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,0,0]}', '[[0,0,0]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Move Zeroes',
        'Given an integer array nums, move all 0s to the end of it while maintaining the relative order of the non-zero elements. Note that you must do this in-place without making a copy of the array.',
        'EASY',
        '["Two Pointers","Arrays"]'::jsonb,
        '["1 <= nums.length <= 10^4","-2^31 <= nums[i] <= 2^31 - 1"]'::jsonb,
        '["Keep a pointer for the position of the next non-zero element.","Iterate through the array and swap non-zero elements to the position indicated by the pointer."]'::jsonb,
        '{"java":"class Solution {\n    public void moveZeroes(int[] nums) {\n        \n    }\n}","python":"class Solution:\n    def moveZeroes(self, nums: List[int]) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {void} Do not return anything, modify nums in-place instead.\n */\nvar moveZeroes = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    void moveZeroes(vector<int>& nums) {\n        \n    }\n};"}'::jsonb,
        'moveZeroes',
        '[{"input":"nums = [0,1,0,3,12]","output":"[1,3,12,0,0]"},{"input":"nums = [0]","output":"[0]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,1,0,3,12]}', '[1,3,12,0,0]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0]}', '[0]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Remove Duplicates from Sorted Array',
        'Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Return k after placing the final result in the first k slots of nums.',
        'EASY',
        '["Two Pointers","Arrays"]'::jsonb,
        '["1 <= nums.length <= 3 * 10^4","-100 <= nums[i] <= 100","nums is sorted in non-decreasing order"]'::jsonb,
        '["Use a slow pointer to track the position of unique elements.","Use a fast pointer to iterate through the array considering each element."]'::jsonb,
        '{"java":"class Solution {\n    public int removeDuplicates(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def removeDuplicates(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar removeDuplicates = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int removeDuplicates(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb,
        'removeDuplicates',
        '[{"input":"nums = [1,1,2]","output":"2, nums = [1,2,_]"},{"input":"nums = [0,0,1,1,1,2,2,3,3,4]","output":"5, nums = [0,1,2,3,4,_,_,_,_,_]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,1,2]}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,0,1,1,1,2,2,3,3,4]}', '5');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Trapping Rain Water',
        'Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.',
        'HARD',
        '["Two Pointers","Arrays","Dynamic Programming","Stack"]'::jsonb,
        '["n == height.length","1 <= n <= 2 * 10^4","0 <= height[i] <= 10^5"]'::jsonb,
        '["For each element, the water it can trap depends on the maximum height to its left and to its right.","Use two pointers starting from both ends to maintain the left max and right max."]'::jsonb,
        '{"java":"class Solution {\n    public int trap(int[] height) {\n        return 0;\n    }\n}","python":"class Solution:\n    def trap(self, height: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} height\n * @return {number}\n */\nvar trap = function(height) {\n    \n};","cpp":"class Solution {\npublic:\n    int trap(vector<int>& height) {\n        return 0;\n    }\n};"}'::jsonb,
        'trap',
        '[{"input":"height = [0,1,0,2,1,0,1,3,2,1,2,1]","output":"6"},{"input":"height = [4,2,0,3,2,5]","output":"9"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"height":[0,1,0,2,1,0,1,3,2,1,2,1]}', '6');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"height":[4,2,0,3,2,5]}', '9');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Sort Colors',
        'Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue. We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.',
        'MEDIUM',
        '["Two Pointers","Arrays","Sorting"]'::jsonb,
        '["n == nums.length","1 <= n <= 300","nums[i] is either 0, 1, or 2"]'::jsonb,
        '["Use three pointers: low (for 0s), mid (for 1s), and high (for 2s).","Swap elements to move 0s to the beginning and 2s to the end, while iterating with mid."]'::jsonb,
        '{"java":"class Solution {\n    public void sortColors(int[] nums) {\n        \n    }\n}","python":"class Solution:\n    def sortColors(self, nums: List[int]) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {void} Do not return anything, modify nums in-place instead.\n */\nvar sortColors = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    void sortColors(vector<int>& nums) {\n        \n    }\n};"}'::jsonb,
        'sortColors',
        '[{"input":"nums = [2,0,2,1,1,0]","output":"[0,0,1,1,2,2]"},{"input":"nums = [2,0,1]","output":"[0,1,2]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[2,0,2,1,1,0]}', '[0,0,1,1,2,2]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[2,0,1]}', '[0,1,2]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        '4Sum',
        'Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that 0 <= a, b, c, d < n and a, b, c, d are distinct and nums[a] + nums[b] + nums[c] + nums[d] == target.',
        'MEDIUM',
        '["Two Pointers","Arrays","Sorting"]'::jsonb,
        '["1 <= nums.length <= 200","-10^9 <= nums[i] <= 10^9","-10^9 <= target <= 10^9"]'::jsonb,
        '["Sort the array first.","Use nested loops for the first two numbers and then use the two-pointer approach for the remaining two numbers."]'::jsonb,
        '{"java":"class Solution {\n    public List<List<Integer>> fourSum(int[] nums, int target) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number[][]}\n */\nvar fourSum = function(nums, target) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> fourSum(vector<int>& nums, int target) {\n        return {};\n    }\n};"}'::jsonb,
        'fourSum',
        '[{"input":"nums = [1,0,-1,0,-2,2], target = 0","output":"[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]"},{"input":"nums = [2,2,2,2,2], target = 8","output":"[[2,2,2,2]]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,0,-1,0,-2,2],"target":0}', '[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[2,2,2,2,2],"target":8}', '[[2,2,2,2]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Intersection of Two Arrays',
        'Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must be unique and you may return the result in any order.',
        'EASY',
        '["Two Pointers","Arrays","Hash Table"]'::jsonb,
        '["1 <= nums1.length, nums2.length <= 1000","0 <= nums1[i], nums2[i] <= 1000"]'::jsonb,
        '["Sort both arrays.","Use two pointers to iterate through both arrays and find common elements."]'::jsonb,
        '{"java":"class Solution {\n    public int[] intersection(int[] nums1, int[] nums2) {\n        return new int[0];\n    }\n}","python":"class Solution:\n    def intersection(self, nums1: List[int], nums2: List[int]) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} nums1\n * @param {number[]} nums2\n * @return {number[]}\n */\nvar intersection = function(nums1, nums2) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> intersection(vector<int>& nums1, vector<int>& nums2) {\n        return {};\n    }\n};"}'::jsonb,
        'intersection',
        '[{"input":"nums1 = [1,2,2,1], nums2 = [2,2]","output":"[2]"},{"input":"nums1 = [4,9,5], nums2 = [9,4,9,8,4]","output":"[9,4]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums1":[1,2,2,1],"nums2":[2,2]}', '[2]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums1":[4,9,5],"nums2":[9,4,9,8,4]}', '[9,4]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Merge Sorted Array',
        'You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively. Merge nums1 and nums2 into a single array sorted in non-decreasing order. The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n.',
        'EASY',
        '["Two Pointers","Arrays","Sorting"]'::jsonb,
        '["nums1.length == m + n","nums2.length == n","0 <= m, n <= 200"]'::jsonb,
        '["Fill nums1 from the back.","Compare elements from the end of valid parts of nums1 and nums2 and place the larger one at the end of nums1."]'::jsonb,
        '{"java":"class Solution {\n    public void merge(int[] nums1, int m, int[] nums2, int n) {\n        \n    }\n}","python":"class Solution:\n    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:\n        \"\"\"\n        Do not return anything, modify nums1 in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[]} nums1\n * @param {number} m\n * @param {number[]} nums2\n * @param {number} n\n * @return {void} Do not return anything, modify nums1 in-place instead.\n */\nvar merge = function(nums1, m, nums2, n) {\n    \n};","cpp":"class Solution {\npublic:\n    void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {\n        \n    }\n};"}'::jsonb,
        'merge',
        '[{"input":"nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3","output":"[1,2,2,3,5,6]"},{"input":"nums1 = [1], m = 1, nums2 = [], n = 0","output":"[1]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums1":[1,2,3,0,0,0],"m":3,"nums2":[2,5,6],"n":3}', '[1,2,2,3,5,6]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums1":[1],"m":1,"nums2":[],"n":0}', '[1]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        '3Sum Closest',
        'Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.',
        'MEDIUM',
        '["Two Pointers","Arrays","Sorting"]'::jsonb,
        '["3 <= nums.length <= 500","-1000 <= nums[i] <= 1000","-10^4 <= target <= 10^4"]'::jsonb,
        '["Similar to 3Sum, sort the array first.","Iterate and use two pointers to find the pair that minimizes the difference with the target."]'::jsonb,
        '{"java":"class Solution {\n    public int threeSumClosest(int[] nums, int target) {\n        return 0;\n    }\n}","python":"class Solution:\n    def threeSumClosest(self, nums: List[int], target: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar threeSumClosest = function(nums, target) {\n    \n};","cpp":"class Solution {\npublic:\n    int threeSumClosest(vector<int>& nums, int target) {\n        return 0;\n    }\n};"}'::jsonb,
        'threeSumClosest',
        '[{"input":"nums = [-1,2,1,-4], target = 1","output":"2"},{"input":"nums = [0,0,0], target = 1","output":"0"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-1,2,1,-4],"target":1}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,0,0],"target":1}', '0');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Remove Element',
        'Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The order of the elements may be changed. Then return the number of elements in nums which are not equal to val.',
        'EASY',
        '["Two Pointers","Arrays"]'::jsonb,
        '["0 <= nums.length <= 100","0 <= nums[i] <= 50","0 <= val <= 100"]'::jsonb,
        '["Use one pointer to iterate and another to mark the position for valid elements.","Overwrite elements equal to val with valid elements."]'::jsonb,
        '{"java":"class Solution {\n    public int removeElement(int[] nums, int val) {\n        return 0;\n    }\n}","python":"class Solution:\n    def removeElement(self, nums: List[int], val: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} val\n * @return {number}\n */\nvar removeElement = function(nums, val) {\n    \n};","cpp":"class Solution {\npublic:\n    int removeElement(vector<int>& nums, int val) {\n        return 0;\n    }\n};"}'::jsonb,
        'removeElement',
        '[{"input":"nums = [3,2,2,3], val = 3","output":"2, nums = [2,2,_,_]"},{"input":"nums = [0,1,2,2,3,0,4,2], val = 2","output":"5, nums = [0,1,3,0,4,_,_,_]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[3,2,2,3],"val":3}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,1,2,2,3,0,4,2],"val":2}', '5');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Reverse Words in a String',
        'Given an input string s, reverse the order of the words. A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space. Return a string of the words in reverse order concatenated by a single space.',
        'MEDIUM',
        '["Two Pointers","String"]'::jsonb,
        '["1 <= s.length <= 10^4","s contains English letters (upper-case and lower-case), digits, and spaces '' ''.","There is at least one word in s."]'::jsonb,
        '["First, trim leading/trailing spaces and reduce multiple spaces to one.","Reverse the entire string, then reverse each individual word."]'::jsonb,
        '{"java":"class Solution {\n    public String reverseWords(String s) {\n        return \"\";\n    }\n}","python":"class Solution:\n    def reverseWords(self, s: str) -> str:\n        pass","javascript":"/**\n * @param {string} s\n * @return {string}\n */\nvar reverseWords = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    string reverseWords(string s) {\n        return \"\";\n    }\n};"}'::jsonb,
        'reverseWords',
        '[{"input":"s = \"the sky is blue\"","output":"\"blue is sky the\""},{"input":"s = \"  hello world  \"","output":"\"world hello\""}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"the sky is blue"}', '"blue is sky the"');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"  hello world  "}', '"world hello"');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Valid Triangle Number',
        'Given an integer array nums, return the number of triplets chosen from the array that can make triangles if we take them as side lengths of a triangle.',
        'MEDIUM',
        '["Two Pointers","Arrays","Sorting","Greedy"]'::jsonb,
        '["1 <= nums.length <= 1000","0 <= nums[i] <= 1000"]'::jsonb,
        '["Sort the array.","Fix the largest side (c) and use two pointers to find pairs (a, b) such that a + b > c."]'::jsonb,
        '{"java":"class Solution {\n    public int triangleNumber(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def triangleNumber(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar triangleNumber = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int triangleNumber(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb,
        'triangleNumber',
        '[{"input":"nums = [2,2,3,4]","output":"3"},{"input":"nums = [4,2,3,4]","output":"4"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[2,2,3,4]}', '3');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[4,2,3,4]}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Boats to Save People',
        'You are given an array people where people[i] is the weight of the ith person, and an infinite number of boats where each boat can carry a maximum weight of limit. Each boat carries at most two people at the same time, provided the sum of the weight of those people is at most limit. Return the minimum number of boats to carry every given person.',
        'MEDIUM',
        '["Two Pointers","Arrays","Greedy","Sorting"]'::jsonb,
        '["1 <= people.length <= 5 * 10^4","1 <= people[i] <= limit <= 3 * 10^4"]'::jsonb,
        '["Sort the people by weight.","Try to pair the heaviest person with the lightest person. If they fit, put them in a boat. otherwise, the heaviest person goes alone."]'::jsonb,
        '{"java":"class Solution {\n    public int numRescueBoats(int[] people, int limit) {\n        return 0;\n    }\n}","python":"class Solution:\n    def numRescueBoats(self, people: List[int], limit: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} people\n * @param {number} limit\n * @return {number}\n */\nvar numRescueBoats = function(people, limit) {\n    \n};","cpp":"class Solution {\npublic:\n    int numRescueBoats(vector<int>& people, int limit) {\n        return 0;\n    }\n};"}'::jsonb,
        'numRescueBoats',
        '[{"input":"people = [1,2], limit = 3","output":"1"},{"input":"people = [3,2,2,1], limit = 3","output":"3"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"people":[1,2],"limit":3}', '1');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"people":[3,2,2,1],"limit":3}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Bag of Tokens',
        'You have an initial power of power and an initial score of 0. You are given a bag of tokens where tokens[i] is the value of the ith token. Your goal is to maximize your total score by potentially playing each token in one of two ways: Face-up (loose power, gain score) or Face-down (gain power, loose score). Return the maximum possible score you can achieve after playing any number of tokens.',
        'MEDIUM',
        '["Two Pointers","Arrays","Greedy","Sorting"]'::jsonb,
        '["0 <= tokens.length <= 1000","0 <= tokens[i], power <= 10^4"]'::jsonb,
        '["Sort the tokens.","Buy tokens (Face-up) with the smallest value to save power, and sell tokens (Face-down) with the largest value to gain power."]'::jsonb,
        '{"java":"class Solution {\n    public int bagOfTokensScore(int[] tokens, int power) {\n        return 0;\n    }\n}","python":"class Solution:\n    def bagOfTokensScore(self, tokens: List[int], power: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} tokens\n * @param {number} power\n * @return {number}\n */\nvar bagOfTokensScore = function(tokens, power) {\n    \n};","cpp":"class Solution {\npublic:\n    int bagOfTokensScore(vector<int>& tokens, int power) {\n        return 0;\n    }\n};"}'::jsonb,
        'bagOfTokensScore',
        '[{"input":"tokens = [100], power = 50","output":"0"},{"input":"tokens = [100,200], power = 150","output":"1"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"tokens":[100],"power":50}', '0');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"tokens":[100,200],"power":150}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Rotate Array',
        'Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.',
        'MEDIUM',
        '["Two Pointers","Arrays","Math"]'::jsonb,
        '["1 <= nums.length <= 10^5","-2^31 <= nums[i] <= 2^31 - 1","0 <= k <= 10^5"]'::jsonb,
        '["Reverse the entire array.","Reverse the first k elements and then reverse the rest."]'::jsonb,
        '{"java":"class Solution {\n    public void rotate(int[] nums, int k) {\n        \n    }\n}","python":"class Solution:\n    def rotate(self, nums: List[int], k: int) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} k\n * @return {void} Do not return anything, modify nums in-place instead.\n */\nvar rotate = function(nums, k) {\n    \n};","cpp":"class Solution {\npublic:\n    void rotate(vector<int>& nums, int k) {\n        \n    }\n};"}'::jsonb,
        'rotate',
        '[{"input":"nums = [1,2,3,4,5,6,7], k = 3","output":"[5,6,7,1,2,3,4]"},{"input":"nums = [-1,-100,3,99], k = 2","output":"[3,99,-1,-100]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,2,3,4,5,6,7],"k":3}', '[5,6,7,1,2,3,4]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-1,-100,3,99],"k":2}', '[3,99,-1,-100]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Palindromic Substrings',
        'Given a string s, return the number of palindromic substrings in it. A string is a palindrome when it reads the same backward as forward. A substring is a contiguous sequence of characters within the string.',
        'MEDIUM',
        '["Two Pointers","String","Dynamic Programming"]'::jsonb,
        '["1 <= s.length <= 1000","s consists of lowercase English letters."]'::jsonb,
        '["Expand around the center for each character (and between characters) to find palindromes.","Count the valid palindromes found during expansion."]'::jsonb,
        '{"java":"class Solution {\n    public int countSubstrings(String s) {\n        return 0;\n    }\n}","python":"class Solution:\n    def countSubstrings(self, s: str) -> int:\n        pass","javascript":"/**\n * @param {string} s\n * @return {number}\n */\nvar countSubstrings = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    int countSubstrings(string s) {\n        return 0;\n    }\n};"}'::jsonb,
        'countSubstrings',
        '[{"input":"s = \"abc\"","output":"3"},{"input":"s = \"aaa\"","output":"6"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"abc"}', '3');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"aaa"}', '6');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Median of Two Sorted Arrays',
        'Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).',
        'HARD',
        '["Two Pointers","Arrays","Binary Search","Divide and Conquer"]'::jsonb,
        '["nums1.length == m","nums2.length == n","0 <= m, n <= 1000","1 <= m + n <= 2000"]'::jsonb,
        '["Try to partition both arrays such that elements on the left are smaller than elements on the right.","Use binary search on the smaller array to find the correct partition."]'::jsonb,
        '{"java":"class Solution {\n    public double findMedianSortedArrays(int[] nums1, int[] nums2) {\n        return 0.0;\n    }\n}","python":"class Solution:\n    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:\n        pass","javascript":"/**\n * @param {number[]} nums1\n * @param {number[]} nums2\n * @return {number}\n */\nvar findMedianSortedArrays = function(nums1, nums2) {\n    \n};","cpp":"class Solution {\npublic:\n    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {\n        return 0.0;\n    }\n};"}'::jsonb,
        'findMedianSortedArrays',
        '[{"input":"nums1 = [1,3], nums2 = [2]","output":"2.0"},{"input":"nums1 = [1,2], nums2 = [3,4]","output":"2.5"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums1":[1,3],"nums2":[2]}', '2.0');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums1":[1,2],"nums2":[3,4]}', '2.5');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Remove Duplicates from Sorted List',
        'Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.',
        'EASY',
        '["Two Pointers","Linked List"]'::jsonb,
        '["The number of nodes in the list is in the range [0, 300].","-100 <= Node.val <= 100","The list is guaranteed to be sorted in ascending order."]'::jsonb,
        '["Use a pointer to traverse carefully.","If current node''s value is same as next node''s value, skip the next node."]'::jsonb,
        '{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode deleteDuplicates(ListNode head) {\n        return null;\n    }\n}","python":"# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass","javascript":"/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar deleteDuplicates = function(head) {\n    \n};","cpp":"/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* deleteDuplicates(ListNode* head) {\n        return nullptr;\n    }\n};"}'::jsonb,
        'deleteDuplicates',
        '[{"input":"head = [1,1,2]","output":"[1,2]"},{"input":"head = [1,1,2,3,3]","output":"[1,2,3]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,1,2]}', '[1,2]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,1,2,3,3]}', '[1,2,3]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Two Sum II - Input Array Is Sorted',
        'Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.',
        'MEDIUM',
        '["Two Pointers","Arrays","Binary Search"]'::jsonb,
        '["2 <= numbers.length <= 3 * 10^4","-1000 <= numbers[i] <= 1000","numbers is sorted in non-decreasing order"]'::jsonb,
        '["Use two pointers, one at the start and one at the end.","If the sum is greater than target, decrease the right pointer. If less, increase the left pointer."]'::jsonb,
        '{"java":"class Solution {\n    public int[] twoSum(int[] numbers, int target) {\n        return new int[0];\n    }\n}","python":"class Solution:\n    def twoSum(self, numbers: List[int], target: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} numbers\n * @param {number} target\n * @return {number[]}\n */\nvar twoSum = function(numbers, target) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> twoSum(vector<int>& numbers, int target) {\n        return {};\n    }\n};"}'::jsonb,
        'twoSum',
        '[{"input":"numbers = [2,7,11,15], target = 9","output":"[1,2]"},{"input":"numbers = [2,3,4], target = 6","output":"[1,3]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"numbers":[2,7,11,15],"target":9}', '[1,2]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"numbers":[2,3,4],"target":6}', '[1,3]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Container With Most Water',
        'You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]). Find two lines that together with the x-axis form a container, such that the container contains the most water. Return the maximum amount of water a container can store.',
        'MEDIUM',
        '["Two Pointers","Arrays","Greedy"]'::jsonb,
        '["n == height.length","2 <= n <= 10^5","0 <= height[i] <= 10^4"]'::jsonb,
        '["Start with the widest container (pointers at both ends).","Move the shorter line inwards to potentially find a taller line that compensates for the reduced width."]'::jsonb,
        '{"java":"class Solution {\n    public int maxArea(int[] height) {\n        return 0;\n    }\n}","python":"class Solution:\n    def maxArea(self, height: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} height\n * @return {number}\n */\nvar maxArea = function(height) {\n    \n};","cpp":"class Solution {\npublic:\n    int maxArea(vector<int>& height) {\n        return 0;\n    }\n};"}'::jsonb,
        'maxArea',
        '[{"input":"height = [1,8,6,2,5,4,8,3,7]","output":"49"},{"input":"height = [1,1]","output":"1"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"height":[1,8,6,2,5,4,8,3,7]}', '49');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"height":[1,1]}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Longest Substring Without Repeating Characters',
        'Given a string s, find the length of the longest substring without repeating characters.',
        'MEDIUM',
        '["Two Pointers","String","Hash Table","Sliding Window"]'::jsonb,
        '["0 <= s.length <= 5 * 10^4","s consists of English letters, digits, symbols and spaces."]'::jsonb,
        '["Use a sliding window with two pointers.","Keep track of characters in the current window using a hash set or map."]'::jsonb,
        '{"java":"class Solution {\n    public int lengthOfLongestSubstring(String s) {\n        return 0;\n    }\n}","python":"class Solution:\n    def lengthOfLongestSubstring(self, s: str) -> int:\n        pass","javascript":"/**\n * @param {string} s\n * @return {number}\n */\nvar lengthOfLongestSubstring = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    int lengthOfLongestSubstring(string s) {\n        return 0;\n    }\n};"}'::jsonb,
        'lengthOfLongestSubstring',
        '[{"input":"s = \"abcabcbb\"","output":"3"},{"input":"s = \"bbbbb\"","output":"1"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"abcabcbb"}', '3');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"bbbbb"}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Minimum Size Subarray Sum',
        'Given an array of positive integers nums and a positive integer target, return the minimal length of a subarray whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.',
        'MEDIUM',
        '["Two Pointers","Arrays","Binary Search","Sliding Window"]'::jsonb,
        '["1 <= target <= 10^9","1 <= nums.length <= 10^5"]'::jsonb,
        '["Use two pointers to maintain a window.","Expand the window until the sum is >= target, then shrink it from the left to minimize length."]'::jsonb,
        '{"java":"class Solution {\n    public int minSubArrayLen(int target, int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def minSubArrayLen(self, target: int, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number} target\n * @param {number[]} nums\n * @return {number}\n */\nvar minSubArrayLen = function(target, nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int minSubArrayLen(int target, vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb,
        'minSubArrayLen',
        '[{"input":"target = 7, nums = [2,3,1,2,4,3]","output":"2"},{"input":"target = 4, nums = [1,4,4]","output":"1"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"target":7,"nums":[2,3,1,2,4,3]}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"target":4,"nums":[1,4,4]}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Permutation in String',
        'Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise. In other words, return true if one of s1''s permutations is the substring of s2.',
        'MEDIUM',
        '["Two Pointers","String","Sliding Window","Hash Table"]'::jsonb,
        '["1 <= s1.length, s2.length <= 10^4","s1 and s2 consist of lowercase English letters."]'::jsonb,
        '["Use a sliding window of size equal to s1.length.","Compare key counts of the window in s2 with key counts of s1."]'::jsonb,
        '{"java":"class Solution {\n    public boolean checkInclusion(String s1, String s2) {\n        return false;\n    }\n}","python":"class Solution:\n    def checkInclusion(self, s1: str, s2: str) -> bool:\n        pass","javascript":"/**\n * @param {string} s1\n * @param {string} s2\n * @return {boolean}\n */\nvar checkInclusion = function(s1, s2) {\n    \n};","cpp":"class Solution {\npublic:\n    bool checkInclusion(string s1, string s2) {\n        return false;\n    }\n};"}'::jsonb,
        'checkInclusion',
        '[{"input":"s1 = \"ab\", s2 = \"eidbaooo\"","output":"true"},{"input":"s1 = \"ab\", s2 = \"eidboaoo\"","output":"false"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s1":"ab","s2":"eidbaooo"}', 'true');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s1":"ab","s2":"eidboaoo"}', 'false');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Longest Repeating Character Replacement',
        'You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times. Return the length of the longest substring containing the same letter you can get after performing the above operations.',
        'MEDIUM',
        '["Two Pointers","String","Sliding Window"]'::jsonb,
        '["1 <= s.length <= 10^5","s consists of only uppercase English letters.","0 <= k <= s.length"]'::jsonb,
        '["Use a sliding window. Maintain the count of the most frequent character in the current window.","If window length - max count > k, shrink the window."]'::jsonb,
        '{"java":"class Solution {\n    public int characterReplacement(String s, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def characterReplacement(self, s: str, k: int) -> int:\n        pass","javascript":"/**\n * @param {string} s\n * @param {number} k\n * @return {number}\n */\nvar characterReplacement = function(s, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int characterReplacement(string s, int k) {\n        return 0;\n    }\n};"}'::jsonb,
        'characterReplacement',
        '[{"input":"s = \"ABAB\", k = 2","output":"4"},{"input":"s = \"AABABBA\", k = 1","output":"4"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"ABAB","k":2}', '4');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"AABABBA","k":1}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Max Consecutive Ones III',
        'Given a binary array nums and an integer k, return the maximum number of consecutive 1s in the array if you can flip at most k 0s.',
        'MEDIUM',
        '["Two Pointers","Arrays","Sliding Window"]'::jsonb,
        '["1 <= nums.length <= 10^5","nums[i] is either 0 or 1.","0 <= k <= nums.length"]'::jsonb,
        '["Similar to character replacement, use a sliding window.","Count the number of 0s in the window. if count > k, shrink window."]'::jsonb,
        '{"java":"class Solution {\n    public int longestOnes(int[] nums, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def longestOnes(self, nums: List[int], k: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar longestOnes = function(nums, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int longestOnes(vector<int>& nums, int k) {\n        return 0;\n    }\n};"}'::jsonb,
        'longestOnes',
        '[{"input":"nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2","output":"6"},{"input":"nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3","output":"10"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,1,1,0,0,0,1,1,1,1,0],"k":2}', '6');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1],"k":3}', '10');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Fruit Into Baskets',
        'You are visiting a farm that has a single row of fruit trees arranged from left to right. The trees are represented by an integer array fruits where fruits[i] is the type of fruit the ith tree produces. You want to collect as much fruit as possible. However, the owner has some strict rules: You have two baskets, and each basket can only hold a single type of fruit. There is no limit on the amount of fruit each basket can hold. Starting from any tree of your choice, you must pick exactly one fruit from every tree (including the start tree) while moving to the right. The picked fruits must fit in one of your baskets. Once you reach a tree with fruit that cannot fit in your baskets, you must stop. Given the integer array fruits, return the maximum number of fruits you can pick.',
        'MEDIUM',
        '["Two Pointers","Arrays","Sliding Window","Hash Table"]'::jsonb,
        '["1 <= fruits.length <= 10^5","0 <= fruits[i] < fruits.length"]'::jsonb,
        '["This is finding the longest subarray with at most 2 distinct elements.","Use a sliding window and a hash map to count distinct elements."]'::jsonb,
        '{"java":"class Solution {\n    public int totalFruit(int[] fruits) {\n        return 0;\n    }\n}","python":"class Solution:\n    def totalFruit(self, fruits: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} fruits\n * @return {number}\n */\nvar totalFruit = function(fruits) {\n    \n};","cpp":"class Solution {\npublic:\n    int totalFruit(vector<int>& fruits) {\n        return 0;\n    }\n};"}'::jsonb,
        'totalFruit',
        '[{"input":"fruits = [1,2,1]","output":"3"},{"input":"fruits = [0,1,2,2]","output":"3"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"fruits":[1,2,1]}', '3');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"fruits":[0,1,2,2]}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Find the Duplicate Number',
        'Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive. There is only one repeated number in nums, return this repeated number. You must solve the problem without modifying the array nums and uses only constant extra space.',
        'MEDIUM',
        '["Two Pointers","Arrays","Binary Search","Bit Manipulation"]'::jsonb,
        '["1 <= n <= 10^5","nums.length == n + 1","1 <= nums[i] <= n"]'::jsonb,
        '["This can be modeled as a linked list cycle detection problem.","Use Floyd''s Cycle Detection algorithm (Tortoise and Hare)."]'::jsonb,
        '{"java":"class Solution {\n    public int findDuplicate(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findDuplicate(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar findDuplicate = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int findDuplicate(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb,
        'findDuplicate',
        '[{"input":"nums = [1,3,4,2,2]","output":"2"},{"input":"nums = [3,1,3,4,2]","output":"3"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,3,4,2,2]}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[3,1,3,4,2]}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Linked List Cycle',
        'Given head, the head of a linked list, determine if the linked list has a cycle in it. There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail''s next pointer is connected to. Note that pos is not passed as a parameter. Return true if there is a cycle in the linked list. Otherwise, return false.',
        'EASY',
        '["Two Pointers","Linked List","Hash Table"]'::jsonb,
        '["The number of the nodes in the list is in the range [0, 10^4].","-10^5 <= Node.val <= 10^5","pos is -1 or a valid index in the linked-list."]'::jsonb,
        '["Use two pointers, slow and fast.","Slow moves 1 step, fast moves 2 steps. If they collide, there is a cycle."]'::jsonb,
        '{"java":"/**\n * Definition for singly-linked list.\n * class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) {\n *         val = x;\n *         next = null;\n *     }\n * }\n */\npublic class Solution {\n    public boolean hasCycle(ListNode head) {\n        return false;\n    }\n}","python":"# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, x):\n#         self.val = x\n#         self.next = None\n\nclass Solution:\n    def hasCycle(self, head: Optional[ListNode]) -> bool:\n        return False","javascript":"/**\n * Definition for singly-linked list.\n * function ListNode(val) {\n *     this.val = val;\n *     this.next = null;\n * }\n */\n\n/**\n * @param {ListNode} head\n * @return {boolean}\n */\nvar hasCycle = function(head) {\n    \n};","cpp":"/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode(int x) : val(x), next(NULL) {}\n * };\n */\nclass Solution {\npublic:\n    bool hasCycle(ListNode *head) {\n        return false;\n    }\n};"}'::jsonb,
        'hasCycle',
        '[{"input":"head = [3,2,0,-4], pos = 1","output":"true"},{"input":"head = [1,2], pos = 0","output":"true"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[3,2,0,-4],"pos":1}', 'true');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2],"pos":0}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Count Pairs with Sum',
        'Given an array of integers and an integer k, find the number of pairs of elements in the array whose sum is equal to k.',
        'EASY',
        '["Two Pointers","Arrays","Hash Table"]'::jsonb,
        '["1 <= nums.length <= 10^5","1 <= k <= 10^9"]'::jsonb,
        '["Use a hash map to store frequencies of elements.","Or sort the array and use two pointers if O(N log N) is acceptable."]'::jsonb,
        '{"java":"class Solution {\n    public int countPairs(int[] nums, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def countPairs(self, nums: List[int], k: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar countPairs = function(nums, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int countPairs(vector<int>& nums, int k) {\n        return 0;\n    }\n};"}'::jsonb,
        'countPairs',
        '[{"input":"nums = [1, 5, 7, 1], k = 6","output":"2"},{"input":"nums = [1, 1, 1, 1], k = 2","output":"6"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,5,7,1],"k":6}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,1,1,1],"k":2}', '6');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Rearrange Array Alternately',
        'Given a sorted array of positive integers, rearrange the array elements alternatively i.e first element should be the maximum value, second should be the minimum value, third should be the second maximum, fourth should be the second minimum and so on. Modify the array in-place.',
        'MEDIUM',
        '["Two Pointers","Arrays"]'::jsonb,
        '["1 <= nums.length <= 10^5","1 <= nums[i] <= 10^7"]'::jsonb,
        '["Use the fact that the array is sorted.","Two pointers: one at start (min), one at end (max)."]'::jsonb,
        '{"java":"class Solution {\n    public void rearrange(int[] nums) {\n        \n    }\n}","python":"class Solution:\n    def rearrange(self, nums: List[int]) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {void}\n */\nvar rearrange = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    void rearrange(vector<int>& nums) {\n        \n    }\n};"}'::jsonb,
        'rearrange',
        '[{"input":"nums = [1,2,3,4,5,6]","output":"[6,1,5,2,4,3]"},{"input":"nums = [10,20,30,40,50,60]","output":"[60,10,50,20,40,30]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,2,3,4,5,6]}', '[6,1,5,2,4,3]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[10,20,30,40,50,60]}', '[60,10,50,20,40,30]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Valid Palindrome',
        'A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers. Given a string s, return true if it is a palindrome, or false otherwise.',
        'EASY',
        '["Two Pointers","String"]'::jsonb,
        '["1 <= s.length <= 2 * 10^5","s consists only of printable ASCII characters."]'::jsonb,
        '["Use two pointers, one at start and one at end.","Skip non-alphanumeric characters and compare."]'::jsonb,
        '{"java":"class Solution {\n    public boolean isPalindrome(String s) {\n        return false;\n    }\n}","python":"class Solution:\n    def isPalindrome(self, s: str) -> bool:\n        pass","javascript":"/**\n * @param {string} s\n * @return {boolean}\n */\nvar isPalindrome = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    bool isPalindrome(string s) {\n        return false;\n    }\n};"}'::jsonb,
        'isPalindrome',
        '[{"input":"s = \"A man, a plan, a canal: Panama\"","output":"true"},{"input":"s = \"race a car\"","output":"false"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"A man, a plan, a canal: Panama"}', 'true');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"race a car"}', 'false');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Sort Array of 0s and 1s',
        'Given an array of 0s and 1s, sort the array in ascending order. You should typically do this in a single pass.',
        'EASY',
        '["Two Pointers","Arrays"]'::jsonb,
        '["1 <= nums.length <= 10^5","nums[i] is 0 or 1"]'::jsonb,
        '["Count 0s and 1s.","Or use two pointers: increment left if 0, decrement right if 1, swap if violation."]'::jsonb,
        '{"java":"class Solution {\n    public void sort01(int[] nums) {\n        \n    }\n}","python":"class Solution:\n    def sort01(self, nums: List[int]) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {void}\n */\nvar sort01 = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    void sort01(vector<int>& nums) {\n        \n    }\n};"}'::jsonb,
        'sort01',
        '[{"input":"nums = [1,0,1,1,0]","output":"[0,0,1,1,1]"},{"input":"nums = [1,1,1]","output":"[1,1,1]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,0,1,1,0]}', '[0,0,1,1,1]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,1,1]}', '[1,1,1]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Closet Pair from Two Sorted Arrays',
        'Given two sorted arrays and a number x, find a pair (one element from each array) such that their sum is closest to x.',
        'MEDIUM',
        '["Two Pointers","Arrays","Binary Search"]'::jsonb,
        '["1 <= arr1.length, arr2.length <= 10^5","1 <= x <= 10^9"]'::jsonb,
        '["Initialize left pointer for first array and right pointer for second array.","Calculate sum. If sum < x, move left pointer. If sum > x, move right pointer. Update closest."]'::jsonb,
        '{"java":"class Solution {\n    public int[] closestPair(int[] arr1, int[] arr2, int x) {\n        return new int[0];\n    }\n}","python":"class Solution:\n    def closestPair(self, arr1: List[int], arr2: List[int], x: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} arr1\n * @param {number[]} arr2\n * @param {number} x\n * @return {number[]}\n */\nvar closestPair = function(arr1, arr2, x) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> closestPair(vector<int>& arr1, vector<int>& arr2, int x) {\n        return {};\n    }\n};"}'::jsonb,
        'closestPair',
        '[{"input":"arr1 = [1, 4, 5, 7], arr2 = [10, 20, 30, 40], x = 32","output":"[1, 30]"},{"input":"arr1 = [1, 4, 5, 7], arr2 = [10, 20, 30, 40], x = 50","output":"[7, 40]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr1":[1,4,5,7],"arr2":[10,20,30,40],"x":32}', '[1,30]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr1":[1,4,5,7],"arr2":[10,20,30,40],"x":50}', '[7,40]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Pair with Given Difference',
        'Given an array of integers `nums` and an integer `k`, return the number of unique K-diff pairs in the array. A k-diff pair is an integer pair (nums[i], nums[j]) where i != j and |nums[i] - nums[j]| == k.',
        'MEDIUM',
        '["Two Pointers","Arrays","Sorting"]'::jsonb,
        '["1 <= nums.length <= 10^4","0 <= k <= 10^7"]'::jsonb,
        '["Sort the array.","Use two pointers. Maintain the difference k between them."]'::jsonb,
        '{"java":"class Solution {\n    public int findPairs(int[] nums, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findPairs(self, nums: List[int], k: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar findPairs = function(nums, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int findPairs(vector<int>& nums, int k) {\n        return 0;\n    }\n};"}'::jsonb,
        'findPairs',
        '[{"input":"nums = [3,1,4,1,5], k = 2","output":"2"},{"input":"nums = [1,2,3,4,5], k = 1","output":"4"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[3,1,4,1,5],"k":2}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,2,3,4,5],"k":1}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        '3Sum Smaller',
        'Given an array of n integers nums and an integer target, find the number of index triplets i, j, k with 0 <= i < j < k < n that satisfy the condition nums[i] + nums[j] + nums[k] < target.',
        'MEDIUM',
        '["Two Pointers","Arrays","Sorting"]'::jsonb,
        '["n == nums.length","0 <= n <= 3500","-100 <= nums[i] <= 100","-100 <= target <= 100"]'::jsonb,
        '["Sort the array.","Fix the first element, then use two pointers to find valid pairs for the other two."]'::jsonb,
        '{"java":"class Solution {\n    public int threeSumSmaller(int[] nums, int target) {\n        return 0;\n    }\n}","python":"class Solution:\n    def threeSumSmaller(self, nums: List[int], target: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar threeSumSmaller = function(nums, target) {\n    \n};","cpp":"class Solution {\npublic:\n    int threeSumSmaller(vector<int>& nums, int target) {\n        return 0;\n    }\n};"}'::jsonb,
        'threeSumSmaller',
        '[{"input":"nums = [-2,0,1,3], target = 2","output":"2"},{"input":"nums = [], target = 0","output":"0"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-2,0,1,3],"target":2}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[],"target":0}', '0');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Interval List Intersections',
        'You are given two lists of closed intervals, firstList and secondList, where firstList[i] = [start_i, end_i] and secondList[j] = [start_j, end_j]. Each list of intervals is pairwise disjoint and in sorted order. Return the intersection of these two interval lists.',
        'MEDIUM',
        '["Two Pointers","Arrays"]'::jsonb,
        '["0 <= firstList.length, secondList.length <= 1000","0 <= start_i < end_i <= 10^9"]'::jsonb,
        '["Use two pointers, one for each list.","The intersection of two intervals is [max(start1, start2), min(end1, end2)]."]'::jsonb,
        '{"java":"class Solution {\n    public int[][] intervalIntersection(int[][] firstList, int[][] secondList) {\n        return new int[0][0];\n    }\n}","python":"class Solution:\n    def intervalIntersection(self, firstList: List[List[int]], secondList: List[List[int]]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[][]} firstList\n * @param {number[][]} secondList\n * @return {number[][]}\n */\nvar intervalIntersection = function(firstList, secondList) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> intervalIntersection(vector<vector<int>>& firstList, vector<vector<int>>& secondList) {\n        return {};\n    }\n};"}'::jsonb,
        'intervalIntersection',
        '[{"input":"firstList = [[0,2],[5,10],[13,23],[24,25]], secondList = [[1,5],[8,12],[15,24],[25,26]]","output":"[[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]"},{"input":"firstList = [[1,3],[5,9]], secondList = []","output":"[]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"firstList":[[0,2],[5,10],[13,23],[24,25]],"secondList":[[1,5],[8,12],[15,24],[25,26]]}', '[[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"firstList":[[1,3],[5,9]],"secondList":[]}', '[]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Rotate List',
        'Given the head of a linked list, rotate the list to the right by k places.',
        'MEDIUM',
        '["Two Pointers","Linked List"]'::jsonb,
        '["The number of nodes in the list is in the range [0, 500].","-100 <= Node.val <= 100","0 <= k <= 2 * 10^9"]'::jsonb,
        '["Connect the tail to the head to make it a circle.","Identify the new tail and break the circle."]'::jsonb,
        '{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode rotateRight(ListNode head, int k) {\n        return null;\n    }\n}","python":"# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def rotateRight(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:\n        pass","javascript":"/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @param {number} k\n * @return {ListNode}\n */\nvar rotateRight = function(head, k) {\n    \n};","cpp":"/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* rotateRight(ListNode* head, int k) {\n        return nullptr;\n    }\n};"}'::jsonb,
        'rotateRight',
        '[{"input":"head = [1,2,3,4,5], k = 2","output":"[4,5,1,2,3]"},{"input":"head = [0,1,2], k = 4","output":"[2,0,1]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,4,5],"k":2}', '[4,5,1,2,3]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[0,1,2],"k":4}', '[2,0,1]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Odd Even Linked List',
        'Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list. The first node is considered odd, and the second node is even, and so on. Note that the relative order inside both the even and odd groups should remain as it was in the input.',
        'MEDIUM',
        '["Two Pointers","Linked List"]'::jsonb,
        '["The number of nodes in the linked list is in the range [0, 10^4].","-10^6 <= Node.val <= 10^6"]'::jsonb,
        '["Use two pointers, one for odd nodes and one for even nodes.","Maintain the head of the even list to attach it to the end of the odd list."]'::jsonb,
        '{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode oddEvenList(ListNode head) {\n        return null;\n    }\n}","python":"# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def oddEvenList(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass","javascript":"/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar oddEvenList = function(head) {\n    \n};","cpp":"/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* oddEvenList(ListNode* head) {\n        return nullptr;\n    }\n};"}'::jsonb,
        'oddEvenList',
        '[{"input":"head = [1,2,3,4,5]","output":"[1,3,5,2,4]"},{"input":"head = [2,1,3,5,6,4,7]","output":"[2,3,6,7,1,5,4]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,4,5]}', '[1,3,5,2,4]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[2,1,3,5,6,4,7]}', '[2,3,6,7,1,5,4]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Find K Closest Elements',
        'Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array. The result should also be sorted in ascending order. An integer a is closer to x than an integer b if: |a - x| < |b - x|, or |a - x| == |b - x| and a < b.',
        'MEDIUM',
        '["Two Pointers","Arrays","Binary Search","Sorting"]'::jsonb,
        '["1 <= k <= arr.length","1 <= arr.length <= 10^4","arr is sorted in ascending order."]'::jsonb,
        '["Use binary search to find the closest element.","Use two pointers to expand outwards from the closest element until k elements are found."]'::jsonb,
        '{"java":"class Solution {\n    public List<Integer> findClosestElements(int[] arr, int k, int x) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def findClosestElements(self, arr: List[int], k: int, x: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} arr\n * @param {number} k\n * @param {number} x\n * @return {number[]}\n */\nvar findClosestElements = function(arr, k, x) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> findClosestElements(vector<int>& arr, int k, int x) {\n        return {};\n    }\n};"}'::jsonb,
        'findClosestElements',
        '[{"input":"arr = [1,2,3,4,5], k = 4, x = 3","output":"[1,2,3,4]"},{"input":"arr = [1,2,3,4,5], k = 4, x = -1","output":"[1,2,3,4]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr":[1,2,3,4,5],"k":4,"x":3}', '[1,2,3,4]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr":[1,2,3,4,5],"k":4,"x":-1}', '[1,2,3,4]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Assign Cookies',
        'Assume you are an awesome parent and want to give your children some cookies. But, you should give each child at most one cookie. Each child i has a greed factor g[i], which is the minimum size of a cookie that the child will be content with; and each cookie j has a size s[j]. If s[j] >= g[i], we can assign the cookie j to the child i, and the child i will be content. Your goal is to maximize the number of your content children and return the maximum number.',
        'EASY',
        '["Two Pointers","Greedy","Sorting"]'::jsonb,
        '["1 <= g.length <= 3 * 10^4","0 <= s.length <= 3 * 10^4"]'::jsonb,
        '["Sort both the greed factors and cookie sizes.","Use two pointers to match the smallest cookie that satisfies a child''s greed."]'::jsonb,
        '{"java":"class Solution {\n    public int findContentChildren(int[] g, int[] s) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findContentChildren(self, g: List[int], s: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} g\n * @param {number[]} s\n * @return {number}\n */\nvar findContentChildren = function(g, s) {\n    \n};","cpp":"class Solution {\npublic:\n    int findContentChildren(vector<int>& g, vector<int>& s) {\n        return 0;\n    }\n};"}'::jsonb,
        'findContentChildren',
        '[{"input":"g = [1,2,3], s = [1,1]","output":"1"},{"input":"g = [1,2], s = [1,2,3]","output":"2"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"g":[1,2,3],"s":[1,1]}', '1');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"g":[1,2],"s":[1,2,3]}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Leaders in an Array',
        'Given an array A of positive integers. Your task is to find the leaders in the array. An element of array is leader if it is greater than or equal to all the elements to its right side. The rightmost element is always a leader.',
        'EASY',
        '["Starters","Arrays"]'::jsonb,
        '["1 <= n <= 10^7","0 <= A[i] <= 10^7"]'::jsonb,
        '["Scan from right to left.","Keep track of the maximum element seen so far from the right."]'::jsonb,
        '{"java":"class Solution {\n    public ArrayList<Integer> leaders(int[] arr, int n) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def leaders(self, arr: List[int], n: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} arr\n * @param {number} n\n * @return {number[]}\n */\nvar leaders = function(arr, n) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> leaders(vector<int>& arr, int n) {\n        return {};\n    }\n};"}'::jsonb,
        'leaders',
        '[{"input":"n = 6, arr = [16,17,4,3,5,2]","output":"[17,5,2]"},{"input":"n = 5, arr = [1,2,3,4,0]","output":"[4,0]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":6,"arr":[16,17,4,3,5,2]}', '[17,5,2]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":5,"arr":[1,2,3,4,0]}', '[4,0]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Palindrome Pairs',
        'Given a list of unique words, return all the pairs of the distinct indices (i, j) in the given list, so that the concatenation of the two words words[i] + words[j] is a palindrome.',
        'HARD',
        '["Two Pointers","String","Trie","Hash Table"]'::jsonb,
        '["1 <= words.length <= 5000","0 <= words[i].length <= 300"]'::jsonb,
        '["Use a hash map to store the reverse of each word.","For each word, check if its prefix or suffix is a palindrome and if the remaining part exists in the map."]'::jsonb,
        '{"java":"class Solution {\n    public List<List<Integer>> palindromePairs(String[] words) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def palindromePairs(self, words: List[str]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {string[]} words\n * @return {number[][]}\n */\nvar palindromePairs = function(words) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> palindromePairs(vector<string>& words) {\n        return {};\n    }\n};"}'::jsonb,
        'palindromePairs',
        '[{"input":"words = [\"abcd\",\"dcba\",\"lls\",\"s\",\"sssll\"]","output":"[[0,1],[1,0],[3,2],[2,4]]"},{"input":"words = [\"bat\",\"tab\",\"cat\"]","output":"[[0,1],[1,0]]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"words":["abcd","dcba","lls","s","sssll"]}', '[[0,1],[1,0],[3,2],[2,4]]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"words":["bat","tab","cat"]}', '[[0,1],[1,0]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Union of Two Sorted Arrays',
        'Given two sorted arrays arr1 and arr2 of size n and m respectively. The task is to find their union. The Union of two arrays can be defined as the common and distinct elements in the two arrays. Return the elements in sorted order.',
        'EASY',
        '["Two Pointers","Arrays"]'::jsonb,
        '["1 <= n, m <= 10^5","-10^9 <= arr1[i], arr2[i] <= 10^9"]'::jsonb,
        '["Use two pointers similar to merge sort.","Handle duplicates by skipping them."]'::jsonb,
        '{"java":"class Solution {\n    public ArrayList<Integer> findUnion(int[] arr1, int[] arr2, int n, int m) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def findUnion(self, arr1: List[int], arr2: List[int], n: int, m: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} arr1\n * @param {number[]} arr2\n * @param {number} n\n * @param {number} m\n * @return {number[]}\n */\nvar findUnion = function(arr1, arr2, n, m) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> findUnion(vector<int>& arr1, vector<int>& arr2, int n, int m) {\n        return {};\n    }\n};"}'::jsonb,
        'findUnion',
        '[{"input":"n = 5, arr1 = [1, 2, 3, 4, 5], m = 3, arr2 = [1, 2, 3]","output":"[1, 2, 3, 4, 5]"},{"input":"n = 2, arr1 = [2, 2], m = 1, arr2 = [1]","output":"[1, 2]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":5,"arr1":[1,2,3,4,5],"m":3,"arr2":[1,2,3]}', '[1,2,3,4,5]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":2,"arr1":[2,2],"m":1,"arr2":[1]}', '[1,2]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Kth Element of Two Sorted Arrays',
        'Given two sorted arrays arr1 and arr2 of size N and M respectively and an element K. The task is to find the element that would be at the kth position of the final sorted array.',
        'MEDIUM',
        '["Two Pointers","Arrays","Binary Search"]'::jsonb,
        '["1 <= N, M <= 10^5","1 <= K <= N + M","0 <= arr1[i], arr2[i] <= 10^9"]'::jsonb,
        '["Use two pointers to simulate merge sort steps until you reach the Kth element.","Or use binary search for a more optimal solution."]'::jsonb,
        '{"java":"class Solution {\n    public long kthElement(int arr1[], int arr2[], int n, int m, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def kthElement(self, arr1: List[int], arr2: List[int], n: int, m: int, k: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} arr1\n * @param {number[]} arr2\n * @param {number} n\n * @param {number} m\n * @param {number} k\n * @return {number}\n */\nvar kthElement = function(arr1, arr2, n, m, k) {\n    \n};","cpp":"class Solution {\npublic:\n    long long kthElement(int arr1[], int arr2[], int n, int m, int k) {\n        return 0;\n    }\n};"}'::jsonb,
        'kthElement',
        '[{"input":"arr1 = [2, 3, 6, 7, 9], arr2 = [1, 4, 8, 10], k = 5","output":"6"},{"input":"arr1 = [100, 112, 256, 349, 770], arr2 = [72, 86, 113, 119, 265, 445, 892], k = 7","output":"256"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr1":[2,3,6,7,9],"arr2":[1,4,8,10],"n":5,"m":4,"k":5}', '6');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr1":[100,112,256,349,770],"arr2":[72,86,113,119,265,445,892],"n":5,"m":7,"k":7}', '256');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Remove Duplicates from Unsorted Linked List',
        'Given the head of a linked list, find all the values that appear more than once in the list and delete the nodes that have any of those values. Return the linked list after the deletions.',
        'MEDIUM',
        '["Two Pointers","Linked List","Hash Table"]'::jsonb,
        '["The number of nodes in the list is in the range [1, 10^5].","-10^5 <= Node.val <= 10^5"]'::jsonb,
        '["Use a hash set to store values encountered so far.","If a value is already in the set, skip the current node."]'::jsonb,
        '{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) { val = x; }\n * }\n */\nclass Solution {\n    public ListNode deleteDuplicatesUnsorted(ListNode head) {\n        return null;\n    }\n}","python":"# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def deleteDuplicatesUnsorted(self, head: ListNode) -> ListNode:\n        pass","javascript":"/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar deleteDuplicatesUnsorted = function(head) {\n    \n};","cpp":"/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* deleteDuplicatesUnsorted(ListNode* head) {\n        return nullptr;\n    }\n};"}'::jsonb,
        'deleteDuplicatesUnsorted',
        '[{"input":"head = [1,2,3,2]","output":"[1,3]"},{"input":"head = [2,1,1,2]","output":"[]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,2]}', '[1,3]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[2,1,1,2]}', '[]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Rotate Doubly Linked List',
        'Given a doubly linked list and an integer P, rotate the list by P nodes (counter-clockwise).',
        'MEDIUM',
        '["Two Pointers","Linked List"]'::jsonb,
        '["1 <= N <= 100","1 <= P <= N"]'::jsonb,
        '["Similar to singly linked list rotation.","Ensure both next and prev pointers are updated correctly."]'::jsonb,
        '{"java":"/*\nclass Node {\n    int data;\n    Node prev, next;\n    Node(int data) {\n        this.data = data;\n        prev = null;\n        next = null;\n    }\n}\n*/\nclass Solution {\n    public Node rotateP(Node head, int p) {\n        return null;\n    }\n}","python":"\"\"\"\nclass Node:\n    def __init__(self, data):\n        self.data = data\n        self.prev = None\n        self.next = None\n\"\"\"\nclass Solution:\n    def rotateP(self, head, p):\n        pass","javascript":"/**\n * @param {Node} head\n * @param {number} p\n * @return {Node}\n */\nvar rotateP = function(head, p) {\n    \n};","cpp":"/*\nstruct Node {\n    int data;\n    struct Node* next, *prev;\n};\n*/\nclass Solution {\npublic:\n    Node* rotateP(Node* head, int p) {\n        return NULL;\n    }\n};"}'::jsonb,
        'rotateP',
        '[{"input":"head = [1,2,3,4,5,6], p = 2","output":"[3,4,5,6,1,2]"},{"input":"head = [1,2,3], p = 1","output":"[2,3,1]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,4,5,6],"p":2}', '[3,4,5,6,1,2]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3],"p":1}', '[2,3,1]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        'Pairs with Given Sum in Doubly Linked List',
        'Given a sorted doubly linked list of positive distinct elements, the task is to find pairs in the doubly linked list whose sum is equal to a given value x.',
        'EASY',
        '["Two Pointers","Linked List"]'::jsonb,
        '["1 <= N <= 10^4","1 <= x <= 10^9"]'::jsonb,
        '["Use two pointers, one at head and one at tail.","Move them towards each other based on sum comparison with x."]'::jsonb,
        '{"java":"class Solution {\n    public static ArrayList<ArrayList<Integer>> findPairsWithGivenSum(Node head, int target) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def findPairsWithGivenSum(self, head, target):\n        pass","javascript":"/**\n * @param {Node} head\n * @param {number} target\n * @return {number[][]}\n */\nvar findPairsWithGivenSum = function(head, target) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<pair<int, int>> findPairsWithGivenSum(Node *head, int target) {\n        return {};\n    }\n};"}'::jsonb,
        'findPairsWithGivenSum',
        '[{"input":"list = [1,2,4,5,6,8,9], target = 7","output":"[[1,6],[2,5]]"},{"input":"list = [1,5,6], target = 6","output":"[[1,5]]"}]'::jsonb
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,4,5,6,8,9],"target":7}', '[[1,6],[2,5]]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,5,6],"target":6}', '[[1,5]]');
END $$;

