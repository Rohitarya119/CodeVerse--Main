-- CodeVerse Industry Data Population
-- Generated: 2026-01-06T18:39:56.028Z

-- Clean up conflicting data first
DO $$ 
DECLARE
    r RECORD;
BEGIN 
    -- Delete questions that we are about to re-insert (by title)
    DELETE FROM test_cases WHERE problem_id IN (SELECT id FROM problems WHERE title IN (
        'Reverse String', 'Squares of a Sorted Array', '3Sum', 'Move Zeroes', 'Remove Duplicates from Sorted Array', 'Trapping Rain Water', 'Sort Colors', '4Sum', 'Intersection of Two Arrays', 'Merge Sorted Array', '3Sum Closest', 'Remove Element', 'Reverse Words in a String', 'Valid Triangle Number', 'Boats to Save People', 'Bag of Tokens', 'Rotate Array', 'Palindromic Substrings', 'Median of Two Sorted Arrays', 'Remove Duplicates from Sorted List', 'Two Sum II - Input Array Is Sorted', 'Container With Most Water', 'Longest Substring Without Repeating Characters', 'Minimum Size Subarray Sum', 'Permutation in String', 'Longest Repeating Character Replacement', 'Max Consecutive Ones III', 'Fruit Into Baskets', 'Find the Duplicate Number', 'Linked List Cycle', 'Count Pairs with Sum', 'Rearrange Array Alternately', 'Valid Palindrome', 'Sort Array of 0s and 1s', 'Closet Pair from Two Sorted Arrays', 'Pair with Given Difference', '3Sum Smaller', 'Interval List Intersections', 'Rotate List', 'Odd Even Linked List', 'Find K Closest Elements', 'Assign Cookies', 'Leaders in an Array', 'Palindrome Pairs', 'Union of Two Sorted Arrays', 'Kth Element of Two Sorted Arrays', 'Remove Duplicates from Unsorted Linked List', 'Rotate Doubly Linked List', 'Pairs with Given Sum in Doubly Linked List', 'Chocolate Distribution Problem', 'Subarray with Given Sum', 'Longest Subarray with Sum K', 'Minimum Window Substring', 'Subarray Product Less Than K', 'Longest Substring with At Most K Distinct Characters', 'Find All Anagrams in a String', 'Maximum Sum Subarray of Size K', 'First Negative Integer in Every Window of Size K', 'Distinct Elements in Window of size K', 'Minimum Platforms', 'Max Consecutive Ones III', 'Permutation in String', 'Longest Substring with At Most Two Distinct Characters', 'Count Occurrences of Anagrams', 'Longest Repeating Character Replacement', 'Middle of the Linked List', 'Remove Nth Node From End of List', 'Happy Number', 'Palindrome Linked List', 'Reorder List', 'Intersection of Two Linked Lists', 'Check if Linked List is Circular', 'Find the Duplicate Number', 'Circular Array Loop', 'Linked List Cycle II', 'Binary Search', 'Search in Rotated Sorted Array', 'First and Last Position of Element in Sorted Array', 'Find Minimum in Rotated Sorted Array', 'Search a 2D Matrix', 'Peak Element', 'Koko Eating Bananas', 'Capacity To Ship Packages Within D Days', 'Split Array Largest Sum', 'Median of Two Sorted Arrays', 'Square Root', 'Find Smallest Letter Greater Than Target', 'Single Element in a Sorted Array', 'Median of Two Sorted Arrays', 'Aggressive Cows', 'Allocate Minimum Pages / Book Allocation', 'Painter''s Partition Problem', 'Search in Infinite Array', 'Find Floor and Ceiling', 'Count 1s in Binary Sorted Array', 'Minimum Speed to Arrive on Time', 'Find Transition Point', 'Search in Row-Column Sorted Matrix', 'Kth Element of Two Sorted Arrays', 'Binary Tree Inorder Traversal', 'Binary Tree Preorder Traversal', 'Binary Tree Postorder Traversal', 'Binary Tree Level Order Traversal', 'Maximum Depth of Binary Tree', 'Diameter of Binary Tree', 'Balanced Binary Tree', 'Binary Tree Maximum Path Sum', 'Symmetric Tree', 'Lowest Common Ancestor of a Binary Tree', 'Binary Tree Right Side View', 'Vertical Order Traversal of a Binary Tree', 'Binary Tree Zigzag Level Order Traversal', 'Path Sum', 'Count Complete Tree Nodes', 'Number of Islands', 'Number of Provinces', 'Rotting Oranges', '01 Matrix / Distance of Nearest Cell Having 0', 'Clone Graph', 'Is Graph Bipartite?', 'Word Ladder', 'Sliding Puzzle', 'Snakes and Ladders', 'Evaluate Division', 'Climbing Stairs', 'House Robber', 'Longest Increasing Subsequence', 'Longest Common Subsequence', 'Coin Change', 'Edit Distance', 'Unique Paths II', 'Minimum Path Sum', 'Maximum Product Subarray', 'Longest Palindromic Substring', 'Burst Balloons', 'N-Queens', 'Sudoku Solver', 'Permutations', 'Subsets', 'Word Search', 'Partition Equal Subset Sum', 'Generate Parentheses', 'Wildcard Matching', 'Best Time to Buy and Sell Stock III', 'Combination Sum', 'Palindrome Partitioning', 'Target Sum', 'Maximal Square', 'Letter Combinations of a Phone Number', 'Decode Ways', 'Jump Game', 'Gas Station', 'Candy', 'Merge Intervals', 'Non-overlapping Intervals', 'Lemonade Change', 'Next Greater Element I', 'Daily Temperatures', 'Largest Rectangle in Histogram', 'Online Stock Span', 'Trapping Rain Water', 'Redundant Connection', 'Accounts Merge', 'Longest Consecutive Sequence', 'Number of Operations to Make Network Connected', 'Implement Trie (Prefix Tree)', 'Design Add and Search Words Data Structure', 'Kth Largest Element in an Array', 'Top K Frequent Elements', 'Find Median from Data Stream', 'Merge k Sorted Lists', 'Task Scheduler', 'Sort Colors', 'Max Consecutive Ones III', 'Permutation in String', 'Find All Anagrams in a String', 'Longest Substring with At Most K Distinct Characters', 'Subarray Product Less Than K', 'Reverse Words in a String', '4Sum', 'Aggressive Cows', 'Allocate Minimum Pages', 'Painter''s Partition Problem', 'Sqrt(x)', 'Median of Two Sorted Arrays', 'Search in a Sorted Array of Unknown Size', 'Diameter of Binary Tree', 'Symmetric Tree', 'Binary Tree Maximum Path Sum', 'Serialize and Deserialize Binary Tree', 'Course Schedule', 'Course Schedule II', 'Matrix Chain Multiplication', 'Egg Dropping Puzzle', 'Palindrome Partitioning II', 'Minimum Falling Path Sum', 'Cherry Pickup', 'Partition Labels', 'Minimum Number of Arrows to Burst Balloons', 'Queue Reconstruction by Height', 'Palindrome Pairs', 'Split Array Largest Sum', 'Capacity To Ship Packages Within D Days', 'Koko Eating Bananas', 'Minimum Speed to Arrive on Time', 'Find Minimum in Rotated Sorted Array', 'Distinct Subsequences', 'Interleaving String', 'Minimum Path Sum', 'Delete and Earn', 'Network Delay Time', 'Cheapest Flights Within K Stops', 'Is Graph Bipartite?', 'Spiral Matrix', 'Rotate Image', 'Set Matrix Zeroes', 'Reverse Pairs', 'Count of Range Sum', 'Odd Even Linked List', 'Palindrome Linked List', 'Intersection of Two Linked Lists', 'Remove Duplicates from Sorted List II', 'Rotate List', 'Redundant Connection', 'Accounts Merge', 'Number of Operations to Make Network Connected', 'Smallest String With Swaps', 'Evaluate Division', 'Task Scheduler', 'Reorganize String', 'K Closest Points to Origin', 'Top K Frequent Words', 'Single Number', 'Single Number II', 'Single Number III', 'Counting Bits', 'Reverse Bits', 'Happy Number', 'Pow(x, n)', 'Multiply Strings', 'Robot Bounded In Circle', 'Bag of Tokens', 'Boats to Save People', 'Circular Array Loop', 'Find the Duplicate Number', 'Longest Repeating Character Replacement', 'Flatten Binary Tree to Linked List', 'Populating Next Right Pointers in Each Node', 'Path Sum II', 'Path Sum III', 'Lowest Common Ancestor of a Binary Tree', 'Decode Ways', 'Word Break', 'Word Break II', 'Palindrome Partitioning', 'Restore IP Addresses', 'Number of Islands', 'Rotting Oranges', 'Clone Graph', 'Surrounded Regions', 'Word Ladder', 'Trapping Rain Water II', 'Largest Rectangle in Histogram', 'Maximal Rectangle', 'The Skyline Problem', 'Find Median from Data Stream', 'Roman to Integer', 'Longest Common Prefix', 'Valid Parentheses', 'Merge Two Sorted Lists', 'Remove Duplicates from Sorted Array', 'Remove Element', 'Implement strStr()', 'Search Insert Position', 'Length of Last Word', 'Plus One', 'Add Binary', 'Sqrt(x)', 'Climbing Stairs', 'Remove Duplicates from Sorted List', 'Merge Sorted Array', 'Binary Tree Inorder Traversal', 'Same Tree', 'Symmetric Tree', 'Maximum Depth of Binary Tree', 'Sorted Array to BST', 'Balanced Binary Tree', 'Minimum Depth of Binary Tree', 'Path Sum', 'Pascal''s Triangle', 'Pascal''s Triangle II', 'Best Time to Buy and Sell Stock', 'Valid Palindrome', 'Single Number', 'Linked List Cycle', 'Min Stack', 'Intersection of Two Linked Lists', 'Missing Number', 'Move Zeroes', 'Reverse String', 'Intersection of Two Arrays', 'Intersection of Two Arrays II', 'First Unique Character in a String', 'Fizz Buzz', 'Reverse Vowels of a String', 'Third Maximum Number', 'Find All Numbers Disappeared in an Array', 'Hamming Distance', 'Island Perimeter', 'Max Consecutive Ones', 'Construct the Rectangle', 'Teemo Attacking', 'Next Greater Element I', 'Keyboard Row', 'Find Mode in Binary Search Tree', 'Convert BST to Greater Tree', 'Spiral Matrix II', 'Permutation Sequence', 'Partition List', 'Gray Code', 'Subsets II', 'Unique Binary Search Trees', 'Unique Binary Search Trees II', 'Recover Binary Search Tree', 'Triangle', 'Best Time to Buy and Sell Stock with Cooldown', 'Coin Change', 'Longest Increasing Subsequence', 'Additive Number', 'Range Sum Query 2D - Immutable', 'Super Ugly Number', 'Remove Duplicate Letters', 'Bulb Switcher', 'Wiggle Sort II', 'Increasing Triplet Subsequence', 'House Robber III', 'Counting Bits', 'Flatten Nested List Iterator', 'Integer Break', 'Count Numbers with Unique Digits', 'Russian Doll Envelopes', 'Design Twitter', 'Sort Characters By Frequency', 'Queue Reconstruction by Height', 'Arithmetic Slices', 'Partition Equal Subset Sum', 'Pacific Atlantic Water Flow', 'Battleships in a Board', 'Find Right Interval', 'Find All Anagrams in a String', 'Find All Duplicates in an Array', 'String Compression', 'Add Two Numbers II', 'Number of Boomerangs', 'Serialize and Deserialize BST', 'Delete Node in a BST', 'Frequency of the Most Frequent Element', 'Minimum ASCII Delete Sum for Two Strings', 'Subarray Product Less Than K', 'Random Pick with Weight', 'Exam Room', 'Score of Parentheses', 'Mirror Reflection', 'Buddy Strings', 'Lemonade Change', 'All Nodes Distance K in Binary Tree', 'Smallest Subtree with all the Deepest Nodes', 'Score After Flipping Matrix', 'Advantage Shuffle', 'Boats to Save People', 'Spiral Matrix III', 'Possible Bipartition', 'Construct Binary Tree from Preorder and Postorder Traversal', 'Find and Replace Pattern', 'Fruit Into Baskets', 'Snakes and Ladders', 'Online Stock Span', 'RLE Iterator', 'Minimum Add to Make Parentheses Valid', 'Sort Array By Parity', '3Sum With Multiplicity', 'Shortest Bridge', 'Knight Dialer', 'Reorder Data in Log Files', 'Range Sum of BST', 'Minimum Area Rectangle', 'Longest Arithmetic Subsequence', 'Maximum Binary Tree II', 'Vowel Spellchecker', 'Pancake Sorting', 'Powerful Integers', 'Flip Binary Tree To Match Preorder Traversal', 'Interval List Intersections', 'Verifying an Alien Dictionary', 'Array of Doubled Pairs', 'Longest Turbulent Subarray', 'Distribute Coins in Binary Tree', 'Maximize Sum Of Array After K Negations', 'Clumsy Factorial', 'Minimum Domino Rotations For Equal Row', 'Construct Binary Search Tree from Preorder Traversal', 'Binary Prefix Divisible By 5', 'Next Greater Node In Linked List', 'Partition Array Into Three Parts With Equal Sum', 'Best Sightseeing Pair', 'Binary String With Substrings Representing 1 To N', 'Implement Trie (Prefix Tree)', 'Design Add and Search Words Data Structure', 'Word Search II', 'Map Sum Pairs', 'Replace Words', 'Top K Frequent Elements', 'Kth Largest Element in an Array', 'Find K Pairs with Smallest Sums', 'Kth Smallest Element in a Sorted Matrix', 'Split Array into Consecutive Subsequences', 'Reorganize String', 'Cheapest Flights Within K Stops', 'Range Module', 'Falling Squares', 'Rectangle Area II', 'Count of Range Sum', 'Reverse Pairs', 'Count Items Matching a Rule', 'Check if the Sentence Is Pangram', 'Sum of Unique Elements', 'Shuffle String', 'Count Good Triplets', 'Kth Missing Positive Number', 'Matrix Diagonal Sum', 'Maximum Product Difference Between Two Pairs', 'Build Array from Permutation', 'Concatenation of Array', 'Count of Matches in Tournament', 'Check if the Sentence Is Pangram', 'Sorting the Sentence', 'N-Queens', 'N-Queens II', 'Sudoku Solver', 'Scramble String', 'Dungeon Game', 'Best Time to Buy and Sell Stock IV', 'Max Points on a Line', 'Palindrome Pairs', 'Concatenated Words', 'Smallest Good Base', 'Freedom Trail', 'Super Washing Machines', 'Student Attendance Record II', 'K Inverse Pairs Array', 'Course Schedule III', 'Cut Off Trees for Golf Event', '24 Game', 'Stickers to Spell Word', 'Redundant Connection II', 'Cracking the Safe', 'Couples Holding Hands', 'Reaching Points', 'Transform to Chessboard', 'Basic Calculator III', 'Max Chunks To Make Sorted II', 'Sliding Puzzle', 'Swim in Rising Water', 'Race Car', 'Making A Large Island', 'Sum of Distances in Tree', 'Distinct Subsequences II', 'Number of Music Playlists', 'Minimize Malibu', 'Three Equal Parts', 'Cat and Mouse', 'Number of Atoms', 'Reach a Number', 'Partition to K Equal Sum Subsets', 'Shortest Path Visiting All Nodes', 'Prime Palindrome', 'Reconstruct Itinerary', 'Largest Component Size by Common Factor', 'Least Operators to Express Number', 'Tallest Billboard', 'Binary Tree Cameras', 'Vertical Order Traversal of a Binary Tree', 'Triples with Bitwise AND Equal To Zero', 'Minimum Cost to Merge Stones', 'Number of Squareful Arrays', 'Stream of Characters', 'Longest Duplicate Substring', 'Recover a Tree From Preorder Traversal', 'Last Stone Weight II', 'Shortest Common Supersequence', 'Parsing A Boolean Expression', 'Critical Connections in a Network', 'Remove Invalid Parentheses', 'First Missing Positive', 'Trapping Rain Water', 'Wildcard Matching', 'Binary Tree Maximum Path Sum', 'Longest Increasing Path in a Matrix', 'Palindrome Partitioning II', 'Word Break II', 'Regular Expression Matching', 'Distinct Subsequences', 'Burst Balloons', 'Strange Printer', 'Create Maximum Number', 'Russian Doll Envelopes', 'Frog Jump', 'Split Array Largest Sum', 'Poor Pigs', 'Zuma Game', 'Remove Boxes', 'Super Egg Drop', 'Profitable Schemes', 'Numbers At Most N Given Digit Set', 'Valid Permutations for DI Sequence', 'Tallest Billboard', 'Minimum Cost to Merge Stones', 'Number of Squareful Arrays', 'Orderly Queue', 'Reverse Subarray To Maximize Array Value', 'Minimum Number of Tap to Open to Water a Garden', 'Jump Game IV', 'Reducing Dishes', 'Stone Game III', 'Max Dot Product of Two Subsequences', 'Minimum Number of Days to Disconnect Island', 'Kth Smallest Instructions', 'Minimum Initial Energy to Finish Tasks', 'Check If Two Expression Trees are Equivalent', 'Minimize Deviation in Array', 'Delivering Boxes from Storage to Ports', 'Maximum Number of Non-Overlapping Substrings', 'Minimum Operations to Make a Subsequence', 'Number of Restricted Paths From First to Last Node', 'Maximum Score from Performing Multiplication Operations', 'Longest Valid Parentheses', 'Candy', 'Best Time to Buy and Sell Stock III', 'Maximal Rectangle', 'Interleaving String', 'Word Ledger', 'Minimum Window Substring', 'Text Justification', 'Substring with Concatenation of All Words', 'Reverse Nodes in k-Group', 'Merge k Sorted Lists', 'Median of Two Sorted Arrays', 'Sum of Subarray Minimums', 'Super Palindromes', 'Find the Closest Palindrome', 'Tag Validator', 'Remove Comments', 'Special Binary String', 'Parse Lisp Expression', 'My Calendar III', 'Cherry Pickup', 'Self Crossing', 'Patching Array', 'Create Sorted Array through Instructions', 'Maximize Grid Happiness', 'Rank Transform of a Matrix', 'Maximum Height by Stacking Cuboids', 'Find Minimum in Rotated Sorted Array II', 'Search in Rotated Sorted Array II', 'Contains Duplicate III', 'Word Search', 'Combinations', 'Subsets', 'Permutations', 'Permutations II', 'Combination Sum', 'Combination Sum II', 'Combination Sum III', 'Letter Combinations of a Phone Number', 'Generate Parentheses', 'Target Sum', 'Partition Equal Subset Sum', 'Ones and Zeroes', 'Coin Change II', 'Unique Paths', 'Unique Paths II', 'Minimum Path Sum', 'Climbing Stairs', 'Fibonacci Number', 'N-th Tribonacci Number', 'Pascals Triangle', 'Count Odd Numbers in an Interval Range', 'Average Salary Excluding the Minimum and Maximum Salary', 'Lemonade Change', 'Largest Perimeter Triangle', 'Check if One String Swap Can Make Strings Equal', 'Sign of the Product of an Array', 'Can Make Arithmetic Progression From Sequence', 'Happy Number', 'Find the Difference', 'Reshape the Matrix', 'Convert Binary Number in a Linked List to Integer', 'Middle of the Linked List', 'Subtract the Product and Sum of Digits of an Integer', 'Richest Customer Wealth', 'Thinking About a Matrix', 'Verifying an Alien Dictionary', 'Decrypt String from Alphabet to Integer Mapping', 'To Lower Case', 'Matrix Block Sum', 'Sum of All Odd Length Subarrays', 'Range Sum Query - Immutable', 'Sum of Left Leaves', 'Binary Tree Paths', 'First Bad Version', 'Guess Number Higher or Lower'
    ));
    DELETE FROM user_solved_problem WHERE problem_id IN (SELECT id FROM problems WHERE title IN (
        'Reverse String', 'Squares of a Sorted Array', '3Sum', 'Move Zeroes', 'Remove Duplicates from Sorted Array', 'Trapping Rain Water', 'Sort Colors', '4Sum', 'Intersection of Two Arrays', 'Merge Sorted Array', '3Sum Closest', 'Remove Element', 'Reverse Words in a String', 'Valid Triangle Number', 'Boats to Save People', 'Bag of Tokens', 'Rotate Array', 'Palindromic Substrings', 'Median of Two Sorted Arrays', 'Remove Duplicates from Sorted List', 'Two Sum II - Input Array Is Sorted', 'Container With Most Water', 'Longest Substring Without Repeating Characters', 'Minimum Size Subarray Sum', 'Permutation in String', 'Longest Repeating Character Replacement', 'Max Consecutive Ones III', 'Fruit Into Baskets', 'Find the Duplicate Number', 'Linked List Cycle', 'Count Pairs with Sum', 'Rearrange Array Alternately', 'Valid Palindrome', 'Sort Array of 0s and 1s', 'Closet Pair from Two Sorted Arrays', 'Pair with Given Difference', '3Sum Smaller', 'Interval List Intersections', 'Rotate List', 'Odd Even Linked List', 'Find K Closest Elements', 'Assign Cookies', 'Leaders in an Array', 'Palindrome Pairs', 'Union of Two Sorted Arrays', 'Kth Element of Two Sorted Arrays', 'Remove Duplicates from Unsorted Linked List', 'Rotate Doubly Linked List', 'Pairs with Given Sum in Doubly Linked List', 'Chocolate Distribution Problem', 'Subarray with Given Sum', 'Longest Subarray with Sum K', 'Minimum Window Substring', 'Subarray Product Less Than K', 'Longest Substring with At Most K Distinct Characters', 'Find All Anagrams in a String', 'Maximum Sum Subarray of Size K', 'First Negative Integer in Every Window of Size K', 'Distinct Elements in Window of size K', 'Minimum Platforms', 'Max Consecutive Ones III', 'Permutation in String', 'Longest Substring with At Most Two Distinct Characters', 'Count Occurrences of Anagrams', 'Longest Repeating Character Replacement', 'Middle of the Linked List', 'Remove Nth Node From End of List', 'Happy Number', 'Palindrome Linked List', 'Reorder List', 'Intersection of Two Linked Lists', 'Check if Linked List is Circular', 'Find the Duplicate Number', 'Circular Array Loop', 'Linked List Cycle II', 'Binary Search', 'Search in Rotated Sorted Array', 'First and Last Position of Element in Sorted Array', 'Find Minimum in Rotated Sorted Array', 'Search a 2D Matrix', 'Peak Element', 'Koko Eating Bananas', 'Capacity To Ship Packages Within D Days', 'Split Array Largest Sum', 'Median of Two Sorted Arrays', 'Square Root', 'Find Smallest Letter Greater Than Target', 'Single Element in a Sorted Array', 'Median of Two Sorted Arrays', 'Aggressive Cows', 'Allocate Minimum Pages / Book Allocation', 'Painter''s Partition Problem', 'Search in Infinite Array', 'Find Floor and Ceiling', 'Count 1s in Binary Sorted Array', 'Minimum Speed to Arrive on Time', 'Find Transition Point', 'Search in Row-Column Sorted Matrix', 'Kth Element of Two Sorted Arrays', 'Binary Tree Inorder Traversal', 'Binary Tree Preorder Traversal', 'Binary Tree Postorder Traversal', 'Binary Tree Level Order Traversal', 'Maximum Depth of Binary Tree', 'Diameter of Binary Tree', 'Balanced Binary Tree', 'Binary Tree Maximum Path Sum', 'Symmetric Tree', 'Lowest Common Ancestor of a Binary Tree', 'Binary Tree Right Side View', 'Vertical Order Traversal of a Binary Tree', 'Binary Tree Zigzag Level Order Traversal', 'Path Sum', 'Count Complete Tree Nodes', 'Number of Islands', 'Number of Provinces', 'Rotting Oranges', '01 Matrix / Distance of Nearest Cell Having 0', 'Clone Graph', 'Is Graph Bipartite?', 'Word Ladder', 'Sliding Puzzle', 'Snakes and Ladders', 'Evaluate Division', 'Climbing Stairs', 'House Robber', 'Longest Increasing Subsequence', 'Longest Common Subsequence', 'Coin Change', 'Edit Distance', 'Unique Paths II', 'Minimum Path Sum', 'Maximum Product Subarray', 'Longest Palindromic Substring', 'Burst Balloons', 'N-Queens', 'Sudoku Solver', 'Permutations', 'Subsets', 'Word Search', 'Partition Equal Subset Sum', 'Generate Parentheses', 'Wildcard Matching', 'Best Time to Buy and Sell Stock III', 'Combination Sum', 'Palindrome Partitioning', 'Target Sum', 'Maximal Square', 'Letter Combinations of a Phone Number', 'Decode Ways', 'Jump Game', 'Gas Station', 'Candy', 'Merge Intervals', 'Non-overlapping Intervals', 'Lemonade Change', 'Next Greater Element I', 'Daily Temperatures', 'Largest Rectangle in Histogram', 'Online Stock Span', 'Trapping Rain Water', 'Redundant Connection', 'Accounts Merge', 'Longest Consecutive Sequence', 'Number of Operations to Make Network Connected', 'Implement Trie (Prefix Tree)', 'Design Add and Search Words Data Structure', 'Kth Largest Element in an Array', 'Top K Frequent Elements', 'Find Median from Data Stream', 'Merge k Sorted Lists', 'Task Scheduler', 'Sort Colors', 'Max Consecutive Ones III', 'Permutation in String', 'Find All Anagrams in a String', 'Longest Substring with At Most K Distinct Characters', 'Subarray Product Less Than K', 'Reverse Words in a String', '4Sum', 'Aggressive Cows', 'Allocate Minimum Pages', 'Painter''s Partition Problem', 'Sqrt(x)', 'Median of Two Sorted Arrays', 'Search in a Sorted Array of Unknown Size', 'Diameter of Binary Tree', 'Symmetric Tree', 'Binary Tree Maximum Path Sum', 'Serialize and Deserialize Binary Tree', 'Course Schedule', 'Course Schedule II', 'Matrix Chain Multiplication', 'Egg Dropping Puzzle', 'Palindrome Partitioning II', 'Minimum Falling Path Sum', 'Cherry Pickup', 'Partition Labels', 'Minimum Number of Arrows to Burst Balloons', 'Queue Reconstruction by Height', 'Palindrome Pairs', 'Split Array Largest Sum', 'Capacity To Ship Packages Within D Days', 'Koko Eating Bananas', 'Minimum Speed to Arrive on Time', 'Find Minimum in Rotated Sorted Array', 'Distinct Subsequences', 'Interleaving String', 'Minimum Path Sum', 'Delete and Earn', 'Network Delay Time', 'Cheapest Flights Within K Stops', 'Is Graph Bipartite?', 'Spiral Matrix', 'Rotate Image', 'Set Matrix Zeroes', 'Reverse Pairs', 'Count of Range Sum', 'Odd Even Linked List', 'Palindrome Linked List', 'Intersection of Two Linked Lists', 'Remove Duplicates from Sorted List II', 'Rotate List', 'Redundant Connection', 'Accounts Merge', 'Number of Operations to Make Network Connected', 'Smallest String With Swaps', 'Evaluate Division', 'Task Scheduler', 'Reorganize String', 'K Closest Points to Origin', 'Top K Frequent Words', 'Single Number', 'Single Number II', 'Single Number III', 'Counting Bits', 'Reverse Bits', 'Happy Number', 'Pow(x, n)', 'Multiply Strings', 'Robot Bounded In Circle', 'Bag of Tokens', 'Boats to Save People', 'Circular Array Loop', 'Find the Duplicate Number', 'Longest Repeating Character Replacement', 'Flatten Binary Tree to Linked List', 'Populating Next Right Pointers in Each Node', 'Path Sum II', 'Path Sum III', 'Lowest Common Ancestor of a Binary Tree', 'Decode Ways', 'Word Break', 'Word Break II', 'Palindrome Partitioning', 'Restore IP Addresses', 'Number of Islands', 'Rotting Oranges', 'Clone Graph', 'Surrounded Regions', 'Word Ladder', 'Trapping Rain Water II', 'Largest Rectangle in Histogram', 'Maximal Rectangle', 'The Skyline Problem', 'Find Median from Data Stream', 'Roman to Integer', 'Longest Common Prefix', 'Valid Parentheses', 'Merge Two Sorted Lists', 'Remove Duplicates from Sorted Array', 'Remove Element', 'Implement strStr()', 'Search Insert Position', 'Length of Last Word', 'Plus One', 'Add Binary', 'Sqrt(x)', 'Climbing Stairs', 'Remove Duplicates from Sorted List', 'Merge Sorted Array', 'Binary Tree Inorder Traversal', 'Same Tree', 'Symmetric Tree', 'Maximum Depth of Binary Tree', 'Sorted Array to BST', 'Balanced Binary Tree', 'Minimum Depth of Binary Tree', 'Path Sum', 'Pascal''s Triangle', 'Pascal''s Triangle II', 'Best Time to Buy and Sell Stock', 'Valid Palindrome', 'Single Number', 'Linked List Cycle', 'Min Stack', 'Intersection of Two Linked Lists', 'Missing Number', 'Move Zeroes', 'Reverse String', 'Intersection of Two Arrays', 'Intersection of Two Arrays II', 'First Unique Character in a String', 'Fizz Buzz', 'Reverse Vowels of a String', 'Third Maximum Number', 'Find All Numbers Disappeared in an Array', 'Hamming Distance', 'Island Perimeter', 'Max Consecutive Ones', 'Construct the Rectangle', 'Teemo Attacking', 'Next Greater Element I', 'Keyboard Row', 'Find Mode in Binary Search Tree', 'Convert BST to Greater Tree', 'Spiral Matrix II', 'Permutation Sequence', 'Partition List', 'Gray Code', 'Subsets II', 'Unique Binary Search Trees', 'Unique Binary Search Trees II', 'Recover Binary Search Tree', 'Triangle', 'Best Time to Buy and Sell Stock with Cooldown', 'Coin Change', 'Longest Increasing Subsequence', 'Additive Number', 'Range Sum Query 2D - Immutable', 'Super Ugly Number', 'Remove Duplicate Letters', 'Bulb Switcher', 'Wiggle Sort II', 'Increasing Triplet Subsequence', 'House Robber III', 'Counting Bits', 'Flatten Nested List Iterator', 'Integer Break', 'Count Numbers with Unique Digits', 'Russian Doll Envelopes', 'Design Twitter', 'Sort Characters By Frequency', 'Queue Reconstruction by Height', 'Arithmetic Slices', 'Partition Equal Subset Sum', 'Pacific Atlantic Water Flow', 'Battleships in a Board', 'Find Right Interval', 'Find All Anagrams in a String', 'Find All Duplicates in an Array', 'String Compression', 'Add Two Numbers II', 'Number of Boomerangs', 'Serialize and Deserialize BST', 'Delete Node in a BST', 'Frequency of the Most Frequent Element', 'Minimum ASCII Delete Sum for Two Strings', 'Subarray Product Less Than K', 'Random Pick with Weight', 'Exam Room', 'Score of Parentheses', 'Mirror Reflection', 'Buddy Strings', 'Lemonade Change', 'All Nodes Distance K in Binary Tree', 'Smallest Subtree with all the Deepest Nodes', 'Score After Flipping Matrix', 'Advantage Shuffle', 'Boats to Save People', 'Spiral Matrix III', 'Possible Bipartition', 'Construct Binary Tree from Preorder and Postorder Traversal', 'Find and Replace Pattern', 'Fruit Into Baskets', 'Snakes and Ladders', 'Online Stock Span', 'RLE Iterator', 'Minimum Add to Make Parentheses Valid', 'Sort Array By Parity', '3Sum With Multiplicity', 'Shortest Bridge', 'Knight Dialer', 'Reorder Data in Log Files', 'Range Sum of BST', 'Minimum Area Rectangle', 'Longest Arithmetic Subsequence', 'Maximum Binary Tree II', 'Vowel Spellchecker', 'Pancake Sorting', 'Powerful Integers', 'Flip Binary Tree To Match Preorder Traversal', 'Interval List Intersections', 'Verifying an Alien Dictionary', 'Array of Doubled Pairs', 'Longest Turbulent Subarray', 'Distribute Coins in Binary Tree', 'Maximize Sum Of Array After K Negations', 'Clumsy Factorial', 'Minimum Domino Rotations For Equal Row', 'Construct Binary Search Tree from Preorder Traversal', 'Binary Prefix Divisible By 5', 'Next Greater Node In Linked List', 'Partition Array Into Three Parts With Equal Sum', 'Best Sightseeing Pair', 'Binary String With Substrings Representing 1 To N', 'Implement Trie (Prefix Tree)', 'Design Add and Search Words Data Structure', 'Word Search II', 'Map Sum Pairs', 'Replace Words', 'Top K Frequent Elements', 'Kth Largest Element in an Array', 'Find K Pairs with Smallest Sums', 'Kth Smallest Element in a Sorted Matrix', 'Split Array into Consecutive Subsequences', 'Reorganize String', 'Cheapest Flights Within K Stops', 'Range Module', 'Falling Squares', 'Rectangle Area II', 'Count of Range Sum', 'Reverse Pairs', 'Count Items Matching a Rule', 'Check if the Sentence Is Pangram', 'Sum of Unique Elements', 'Shuffle String', 'Count Good Triplets', 'Kth Missing Positive Number', 'Matrix Diagonal Sum', 'Maximum Product Difference Between Two Pairs', 'Build Array from Permutation', 'Concatenation of Array', 'Count of Matches in Tournament', 'Check if the Sentence Is Pangram', 'Sorting the Sentence', 'N-Queens', 'N-Queens II', 'Sudoku Solver', 'Scramble String', 'Dungeon Game', 'Best Time to Buy and Sell Stock IV', 'Max Points on a Line', 'Palindrome Pairs', 'Concatenated Words', 'Smallest Good Base', 'Freedom Trail', 'Super Washing Machines', 'Student Attendance Record II', 'K Inverse Pairs Array', 'Course Schedule III', 'Cut Off Trees for Golf Event', '24 Game', 'Stickers to Spell Word', 'Redundant Connection II', 'Cracking the Safe', 'Couples Holding Hands', 'Reaching Points', 'Transform to Chessboard', 'Basic Calculator III', 'Max Chunks To Make Sorted II', 'Sliding Puzzle', 'Swim in Rising Water', 'Race Car', 'Making A Large Island', 'Sum of Distances in Tree', 'Distinct Subsequences II', 'Number of Music Playlists', 'Minimize Malibu', 'Three Equal Parts', 'Cat and Mouse', 'Number of Atoms', 'Reach a Number', 'Partition to K Equal Sum Subsets', 'Shortest Path Visiting All Nodes', 'Prime Palindrome', 'Reconstruct Itinerary', 'Largest Component Size by Common Factor', 'Least Operators to Express Number', 'Tallest Billboard', 'Binary Tree Cameras', 'Vertical Order Traversal of a Binary Tree', 'Triples with Bitwise AND Equal To Zero', 'Minimum Cost to Merge Stones', 'Number of Squareful Arrays', 'Stream of Characters', 'Longest Duplicate Substring', 'Recover a Tree From Preorder Traversal', 'Last Stone Weight II', 'Shortest Common Supersequence', 'Parsing A Boolean Expression', 'Critical Connections in a Network', 'Remove Invalid Parentheses', 'First Missing Positive', 'Trapping Rain Water', 'Wildcard Matching', 'Binary Tree Maximum Path Sum', 'Longest Increasing Path in a Matrix', 'Palindrome Partitioning II', 'Word Break II', 'Regular Expression Matching', 'Distinct Subsequences', 'Burst Balloons', 'Strange Printer', 'Create Maximum Number', 'Russian Doll Envelopes', 'Frog Jump', 'Split Array Largest Sum', 'Poor Pigs', 'Zuma Game', 'Remove Boxes', 'Super Egg Drop', 'Profitable Schemes', 'Numbers At Most N Given Digit Set', 'Valid Permutations for DI Sequence', 'Tallest Billboard', 'Minimum Cost to Merge Stones', 'Number of Squareful Arrays', 'Orderly Queue', 'Reverse Subarray To Maximize Array Value', 'Minimum Number of Tap to Open to Water a Garden', 'Jump Game IV', 'Reducing Dishes', 'Stone Game III', 'Max Dot Product of Two Subsequences', 'Minimum Number of Days to Disconnect Island', 'Kth Smallest Instructions', 'Minimum Initial Energy to Finish Tasks', 'Check If Two Expression Trees are Equivalent', 'Minimize Deviation in Array', 'Delivering Boxes from Storage to Ports', 'Maximum Number of Non-Overlapping Substrings', 'Minimum Operations to Make a Subsequence', 'Number of Restricted Paths From First to Last Node', 'Maximum Score from Performing Multiplication Operations', 'Longest Valid Parentheses', 'Candy', 'Best Time to Buy and Sell Stock III', 'Maximal Rectangle', 'Interleaving String', 'Word Ledger', 'Minimum Window Substring', 'Text Justification', 'Substring with Concatenation of All Words', 'Reverse Nodes in k-Group', 'Merge k Sorted Lists', 'Median of Two Sorted Arrays', 'Sum of Subarray Minimums', 'Super Palindromes', 'Find the Closest Palindrome', 'Tag Validator', 'Remove Comments', 'Special Binary String', 'Parse Lisp Expression', 'My Calendar III', 'Cherry Pickup', 'Self Crossing', 'Patching Array', 'Create Sorted Array through Instructions', 'Maximize Grid Happiness', 'Rank Transform of a Matrix', 'Maximum Height by Stacking Cuboids', 'Find Minimum in Rotated Sorted Array II', 'Search in Rotated Sorted Array II', 'Contains Duplicate III', 'Word Search', 'Combinations', 'Subsets', 'Permutations', 'Permutations II', 'Combination Sum', 'Combination Sum II', 'Combination Sum III', 'Letter Combinations of a Phone Number', 'Generate Parentheses', 'Target Sum', 'Partition Equal Subset Sum', 'Ones and Zeroes', 'Coin Change II', 'Unique Paths', 'Unique Paths II', 'Minimum Path Sum', 'Climbing Stairs', 'Fibonacci Number', 'N-th Tribonacci Number', 'Pascals Triangle', 'Count Odd Numbers in an Interval Range', 'Average Salary Excluding the Minimum and Maximum Salary', 'Lemonade Change', 'Largest Perimeter Triangle', 'Check if One String Swap Can Make Strings Equal', 'Sign of the Product of an Array', 'Can Make Arithmetic Progression From Sequence', 'Happy Number', 'Find the Difference', 'Reshape the Matrix', 'Convert Binary Number in a Linked List to Integer', 'Middle of the Linked List', 'Subtract the Product and Sum of Digits of an Integer', 'Richest Customer Wealth', 'Thinking About a Matrix', 'Verifying an Alien Dictionary', 'Decrypt String from Alphabet to Integer Mapping', 'To Lower Case', 'Matrix Block Sum', 'Sum of All Odd Length Subarrays', 'Range Sum Query - Immutable', 'Sum of Left Leaves', 'Binary Tree Paths', 'First Bad Version', 'Guess Number Higher or Lower'
    ));
    DELETE FROM problems WHERE title IN (
        'Reverse String', 'Squares of a Sorted Array', '3Sum', 'Move Zeroes', 'Remove Duplicates from Sorted Array', 'Trapping Rain Water', 'Sort Colors', '4Sum', 'Intersection of Two Arrays', 'Merge Sorted Array', '3Sum Closest', 'Remove Element', 'Reverse Words in a String', 'Valid Triangle Number', 'Boats to Save People', 'Bag of Tokens', 'Rotate Array', 'Palindromic Substrings', 'Median of Two Sorted Arrays', 'Remove Duplicates from Sorted List', 'Two Sum II - Input Array Is Sorted', 'Container With Most Water', 'Longest Substring Without Repeating Characters', 'Minimum Size Subarray Sum', 'Permutation in String', 'Longest Repeating Character Replacement', 'Max Consecutive Ones III', 'Fruit Into Baskets', 'Find the Duplicate Number', 'Linked List Cycle', 'Count Pairs with Sum', 'Rearrange Array Alternately', 'Valid Palindrome', 'Sort Array of 0s and 1s', 'Closet Pair from Two Sorted Arrays', 'Pair with Given Difference', '3Sum Smaller', 'Interval List Intersections', 'Rotate List', 'Odd Even Linked List', 'Find K Closest Elements', 'Assign Cookies', 'Leaders in an Array', 'Palindrome Pairs', 'Union of Two Sorted Arrays', 'Kth Element of Two Sorted Arrays', 'Remove Duplicates from Unsorted Linked List', 'Rotate Doubly Linked List', 'Pairs with Given Sum in Doubly Linked List', 'Chocolate Distribution Problem', 'Subarray with Given Sum', 'Longest Subarray with Sum K', 'Minimum Window Substring', 'Subarray Product Less Than K', 'Longest Substring with At Most K Distinct Characters', 'Find All Anagrams in a String', 'Maximum Sum Subarray of Size K', 'First Negative Integer in Every Window of Size K', 'Distinct Elements in Window of size K', 'Minimum Platforms', 'Max Consecutive Ones III', 'Permutation in String', 'Longest Substring with At Most Two Distinct Characters', 'Count Occurrences of Anagrams', 'Longest Repeating Character Replacement', 'Middle of the Linked List', 'Remove Nth Node From End of List', 'Happy Number', 'Palindrome Linked List', 'Reorder List', 'Intersection of Two Linked Lists', 'Check if Linked List is Circular', 'Find the Duplicate Number', 'Circular Array Loop', 'Linked List Cycle II', 'Binary Search', 'Search in Rotated Sorted Array', 'First and Last Position of Element in Sorted Array', 'Find Minimum in Rotated Sorted Array', 'Search a 2D Matrix', 'Peak Element', 'Koko Eating Bananas', 'Capacity To Ship Packages Within D Days', 'Split Array Largest Sum', 'Median of Two Sorted Arrays', 'Square Root', 'Find Smallest Letter Greater Than Target', 'Single Element in a Sorted Array', 'Median of Two Sorted Arrays', 'Aggressive Cows', 'Allocate Minimum Pages / Book Allocation', 'Painter''s Partition Problem', 'Search in Infinite Array', 'Find Floor and Ceiling', 'Count 1s in Binary Sorted Array', 'Minimum Speed to Arrive on Time', 'Find Transition Point', 'Search in Row-Column Sorted Matrix', 'Kth Element of Two Sorted Arrays', 'Binary Tree Inorder Traversal', 'Binary Tree Preorder Traversal', 'Binary Tree Postorder Traversal', 'Binary Tree Level Order Traversal', 'Maximum Depth of Binary Tree', 'Diameter of Binary Tree', 'Balanced Binary Tree', 'Binary Tree Maximum Path Sum', 'Symmetric Tree', 'Lowest Common Ancestor of a Binary Tree', 'Binary Tree Right Side View', 'Vertical Order Traversal of a Binary Tree', 'Binary Tree Zigzag Level Order Traversal', 'Path Sum', 'Count Complete Tree Nodes', 'Number of Islands', 'Number of Provinces', 'Rotting Oranges', '01 Matrix / Distance of Nearest Cell Having 0', 'Clone Graph', 'Is Graph Bipartite?', 'Word Ladder', 'Sliding Puzzle', 'Snakes and Ladders', 'Evaluate Division', 'Climbing Stairs', 'House Robber', 'Longest Increasing Subsequence', 'Longest Common Subsequence', 'Coin Change', 'Edit Distance', 'Unique Paths II', 'Minimum Path Sum', 'Maximum Product Subarray', 'Longest Palindromic Substring', 'Burst Balloons', 'N-Queens', 'Sudoku Solver', 'Permutations', 'Subsets', 'Word Search', 'Partition Equal Subset Sum', 'Generate Parentheses', 'Wildcard Matching', 'Best Time to Buy and Sell Stock III', 'Combination Sum', 'Palindrome Partitioning', 'Target Sum', 'Maximal Square', 'Letter Combinations of a Phone Number', 'Decode Ways', 'Jump Game', 'Gas Station', 'Candy', 'Merge Intervals', 'Non-overlapping Intervals', 'Lemonade Change', 'Next Greater Element I', 'Daily Temperatures', 'Largest Rectangle in Histogram', 'Online Stock Span', 'Trapping Rain Water', 'Redundant Connection', 'Accounts Merge', 'Longest Consecutive Sequence', 'Number of Operations to Make Network Connected', 'Implement Trie (Prefix Tree)', 'Design Add and Search Words Data Structure', 'Kth Largest Element in an Array', 'Top K Frequent Elements', 'Find Median from Data Stream', 'Merge k Sorted Lists', 'Task Scheduler', 'Sort Colors', 'Max Consecutive Ones III', 'Permutation in String', 'Find All Anagrams in a String', 'Longest Substring with At Most K Distinct Characters', 'Subarray Product Less Than K', 'Reverse Words in a String', '4Sum', 'Aggressive Cows', 'Allocate Minimum Pages', 'Painter''s Partition Problem', 'Sqrt(x)', 'Median of Two Sorted Arrays', 'Search in a Sorted Array of Unknown Size', 'Diameter of Binary Tree', 'Symmetric Tree', 'Binary Tree Maximum Path Sum', 'Serialize and Deserialize Binary Tree', 'Course Schedule', 'Course Schedule II', 'Matrix Chain Multiplication', 'Egg Dropping Puzzle', 'Palindrome Partitioning II', 'Minimum Falling Path Sum', 'Cherry Pickup', 'Partition Labels', 'Minimum Number of Arrows to Burst Balloons', 'Queue Reconstruction by Height', 'Palindrome Pairs', 'Split Array Largest Sum', 'Capacity To Ship Packages Within D Days', 'Koko Eating Bananas', 'Minimum Speed to Arrive on Time', 'Find Minimum in Rotated Sorted Array', 'Distinct Subsequences', 'Interleaving String', 'Minimum Path Sum', 'Delete and Earn', 'Network Delay Time', 'Cheapest Flights Within K Stops', 'Is Graph Bipartite?', 'Spiral Matrix', 'Rotate Image', 'Set Matrix Zeroes', 'Reverse Pairs', 'Count of Range Sum', 'Odd Even Linked List', 'Palindrome Linked List', 'Intersection of Two Linked Lists', 'Remove Duplicates from Sorted List II', 'Rotate List', 'Redundant Connection', 'Accounts Merge', 'Number of Operations to Make Network Connected', 'Smallest String With Swaps', 'Evaluate Division', 'Task Scheduler', 'Reorganize String', 'K Closest Points to Origin', 'Top K Frequent Words', 'Single Number', 'Single Number II', 'Single Number III', 'Counting Bits', 'Reverse Bits', 'Happy Number', 'Pow(x, n)', 'Multiply Strings', 'Robot Bounded In Circle', 'Bag of Tokens', 'Boats to Save People', 'Circular Array Loop', 'Find the Duplicate Number', 'Longest Repeating Character Replacement', 'Flatten Binary Tree to Linked List', 'Populating Next Right Pointers in Each Node', 'Path Sum II', 'Path Sum III', 'Lowest Common Ancestor of a Binary Tree', 'Decode Ways', 'Word Break', 'Word Break II', 'Palindrome Partitioning', 'Restore IP Addresses', 'Number of Islands', 'Rotting Oranges', 'Clone Graph', 'Surrounded Regions', 'Word Ladder', 'Trapping Rain Water II', 'Largest Rectangle in Histogram', 'Maximal Rectangle', 'The Skyline Problem', 'Find Median from Data Stream', 'Roman to Integer', 'Longest Common Prefix', 'Valid Parentheses', 'Merge Two Sorted Lists', 'Remove Duplicates from Sorted Array', 'Remove Element', 'Implement strStr()', 'Search Insert Position', 'Length of Last Word', 'Plus One', 'Add Binary', 'Sqrt(x)', 'Climbing Stairs', 'Remove Duplicates from Sorted List', 'Merge Sorted Array', 'Binary Tree Inorder Traversal', 'Same Tree', 'Symmetric Tree', 'Maximum Depth of Binary Tree', 'Sorted Array to BST', 'Balanced Binary Tree', 'Minimum Depth of Binary Tree', 'Path Sum', 'Pascal''s Triangle', 'Pascal''s Triangle II', 'Best Time to Buy and Sell Stock', 'Valid Palindrome', 'Single Number', 'Linked List Cycle', 'Min Stack', 'Intersection of Two Linked Lists', 'Missing Number', 'Move Zeroes', 'Reverse String', 'Intersection of Two Arrays', 'Intersection of Two Arrays II', 'First Unique Character in a String', 'Fizz Buzz', 'Reverse Vowels of a String', 'Third Maximum Number', 'Find All Numbers Disappeared in an Array', 'Hamming Distance', 'Island Perimeter', 'Max Consecutive Ones', 'Construct the Rectangle', 'Teemo Attacking', 'Next Greater Element I', 'Keyboard Row', 'Find Mode in Binary Search Tree', 'Convert BST to Greater Tree', 'Spiral Matrix II', 'Permutation Sequence', 'Partition List', 'Gray Code', 'Subsets II', 'Unique Binary Search Trees', 'Unique Binary Search Trees II', 'Recover Binary Search Tree', 'Triangle', 'Best Time to Buy and Sell Stock with Cooldown', 'Coin Change', 'Longest Increasing Subsequence', 'Additive Number', 'Range Sum Query 2D - Immutable', 'Super Ugly Number', 'Remove Duplicate Letters', 'Bulb Switcher', 'Wiggle Sort II', 'Increasing Triplet Subsequence', 'House Robber III', 'Counting Bits', 'Flatten Nested List Iterator', 'Integer Break', 'Count Numbers with Unique Digits', 'Russian Doll Envelopes', 'Design Twitter', 'Sort Characters By Frequency', 'Queue Reconstruction by Height', 'Arithmetic Slices', 'Partition Equal Subset Sum', 'Pacific Atlantic Water Flow', 'Battleships in a Board', 'Find Right Interval', 'Find All Anagrams in a String', 'Find All Duplicates in an Array', 'String Compression', 'Add Two Numbers II', 'Number of Boomerangs', 'Serialize and Deserialize BST', 'Delete Node in a BST', 'Frequency of the Most Frequent Element', 'Minimum ASCII Delete Sum for Two Strings', 'Subarray Product Less Than K', 'Random Pick with Weight', 'Exam Room', 'Score of Parentheses', 'Mirror Reflection', 'Buddy Strings', 'Lemonade Change', 'All Nodes Distance K in Binary Tree', 'Smallest Subtree with all the Deepest Nodes', 'Score After Flipping Matrix', 'Advantage Shuffle', 'Boats to Save People', 'Spiral Matrix III', 'Possible Bipartition', 'Construct Binary Tree from Preorder and Postorder Traversal', 'Find and Replace Pattern', 'Fruit Into Baskets', 'Snakes and Ladders', 'Online Stock Span', 'RLE Iterator', 'Minimum Add to Make Parentheses Valid', 'Sort Array By Parity', '3Sum With Multiplicity', 'Shortest Bridge', 'Knight Dialer', 'Reorder Data in Log Files', 'Range Sum of BST', 'Minimum Area Rectangle', 'Longest Arithmetic Subsequence', 'Maximum Binary Tree II', 'Vowel Spellchecker', 'Pancake Sorting', 'Powerful Integers', 'Flip Binary Tree To Match Preorder Traversal', 'Interval List Intersections', 'Verifying an Alien Dictionary', 'Array of Doubled Pairs', 'Longest Turbulent Subarray', 'Distribute Coins in Binary Tree', 'Maximize Sum Of Array After K Negations', 'Clumsy Factorial', 'Minimum Domino Rotations For Equal Row', 'Construct Binary Search Tree from Preorder Traversal', 'Binary Prefix Divisible By 5', 'Next Greater Node In Linked List', 'Partition Array Into Three Parts With Equal Sum', 'Best Sightseeing Pair', 'Binary String With Substrings Representing 1 To N', 'Implement Trie (Prefix Tree)', 'Design Add and Search Words Data Structure', 'Word Search II', 'Map Sum Pairs', 'Replace Words', 'Top K Frequent Elements', 'Kth Largest Element in an Array', 'Find K Pairs with Smallest Sums', 'Kth Smallest Element in a Sorted Matrix', 'Split Array into Consecutive Subsequences', 'Reorganize String', 'Cheapest Flights Within K Stops', 'Range Module', 'Falling Squares', 'Rectangle Area II', 'Count of Range Sum', 'Reverse Pairs', 'Count Items Matching a Rule', 'Check if the Sentence Is Pangram', 'Sum of Unique Elements', 'Shuffle String', 'Count Good Triplets', 'Kth Missing Positive Number', 'Matrix Diagonal Sum', 'Maximum Product Difference Between Two Pairs', 'Build Array from Permutation', 'Concatenation of Array', 'Count of Matches in Tournament', 'Check if the Sentence Is Pangram', 'Sorting the Sentence', 'N-Queens', 'N-Queens II', 'Sudoku Solver', 'Scramble String', 'Dungeon Game', 'Best Time to Buy and Sell Stock IV', 'Max Points on a Line', 'Palindrome Pairs', 'Concatenated Words', 'Smallest Good Base', 'Freedom Trail', 'Super Washing Machines', 'Student Attendance Record II', 'K Inverse Pairs Array', 'Course Schedule III', 'Cut Off Trees for Golf Event', '24 Game', 'Stickers to Spell Word', 'Redundant Connection II', 'Cracking the Safe', 'Couples Holding Hands', 'Reaching Points', 'Transform to Chessboard', 'Basic Calculator III', 'Max Chunks To Make Sorted II', 'Sliding Puzzle', 'Swim in Rising Water', 'Race Car', 'Making A Large Island', 'Sum of Distances in Tree', 'Distinct Subsequences II', 'Number of Music Playlists', 'Minimize Malibu', 'Three Equal Parts', 'Cat and Mouse', 'Number of Atoms', 'Reach a Number', 'Partition to K Equal Sum Subsets', 'Shortest Path Visiting All Nodes', 'Prime Palindrome', 'Reconstruct Itinerary', 'Largest Component Size by Common Factor', 'Least Operators to Express Number', 'Tallest Billboard', 'Binary Tree Cameras', 'Vertical Order Traversal of a Binary Tree', 'Triples with Bitwise AND Equal To Zero', 'Minimum Cost to Merge Stones', 'Number of Squareful Arrays', 'Stream of Characters', 'Longest Duplicate Substring', 'Recover a Tree From Preorder Traversal', 'Last Stone Weight II', 'Shortest Common Supersequence', 'Parsing A Boolean Expression', 'Critical Connections in a Network', 'Remove Invalid Parentheses', 'First Missing Positive', 'Trapping Rain Water', 'Wildcard Matching', 'Binary Tree Maximum Path Sum', 'Longest Increasing Path in a Matrix', 'Palindrome Partitioning II', 'Word Break II', 'Regular Expression Matching', 'Distinct Subsequences', 'Burst Balloons', 'Strange Printer', 'Create Maximum Number', 'Russian Doll Envelopes', 'Frog Jump', 'Split Array Largest Sum', 'Poor Pigs', 'Zuma Game', 'Remove Boxes', 'Super Egg Drop', 'Profitable Schemes', 'Numbers At Most N Given Digit Set', 'Valid Permutations for DI Sequence', 'Tallest Billboard', 'Minimum Cost to Merge Stones', 'Number of Squareful Arrays', 'Orderly Queue', 'Reverse Subarray To Maximize Array Value', 'Minimum Number of Tap to Open to Water a Garden', 'Jump Game IV', 'Reducing Dishes', 'Stone Game III', 'Max Dot Product of Two Subsequences', 'Minimum Number of Days to Disconnect Island', 'Kth Smallest Instructions', 'Minimum Initial Energy to Finish Tasks', 'Check If Two Expression Trees are Equivalent', 'Minimize Deviation in Array', 'Delivering Boxes from Storage to Ports', 'Maximum Number of Non-Overlapping Substrings', 'Minimum Operations to Make a Subsequence', 'Number of Restricted Paths From First to Last Node', 'Maximum Score from Performing Multiplication Operations', 'Longest Valid Parentheses', 'Candy', 'Best Time to Buy and Sell Stock III', 'Maximal Rectangle', 'Interleaving String', 'Word Ledger', 'Minimum Window Substring', 'Text Justification', 'Substring with Concatenation of All Words', 'Reverse Nodes in k-Group', 'Merge k Sorted Lists', 'Median of Two Sorted Arrays', 'Sum of Subarray Minimums', 'Super Palindromes', 'Find the Closest Palindrome', 'Tag Validator', 'Remove Comments', 'Special Binary String', 'Parse Lisp Expression', 'My Calendar III', 'Cherry Pickup', 'Self Crossing', 'Patching Array', 'Create Sorted Array through Instructions', 'Maximize Grid Happiness', 'Rank Transform of a Matrix', 'Maximum Height by Stacking Cuboids', 'Find Minimum in Rotated Sorted Array II', 'Search in Rotated Sorted Array II', 'Contains Duplicate III', 'Word Search', 'Combinations', 'Subsets', 'Permutations', 'Permutations II', 'Combination Sum', 'Combination Sum II', 'Combination Sum III', 'Letter Combinations of a Phone Number', 'Generate Parentheses', 'Target Sum', 'Partition Equal Subset Sum', 'Ones and Zeroes', 'Coin Change II', 'Unique Paths', 'Unique Paths II', 'Minimum Path Sum', 'Climbing Stairs', 'Fibonacci Number', 'N-th Tribonacci Number', 'Pascals Triangle', 'Count Odd Numbers in an Interval Range', 'Average Salary Excluding the Minimum and Maximum Salary', 'Lemonade Change', 'Largest Perimeter Triangle', 'Check if One String Swap Can Make Strings Equal', 'Sign of the Product of an Array', 'Can Make Arithmetic Progression From Sequence', 'Happy Number', 'Find the Difference', 'Reshape the Matrix', 'Convert Binary Number in a Linked List to Integer', 'Middle of the Linked List', 'Subtract the Product and Sum of Digits of an Integer', 'Richest Customer Wealth', 'Thinking About a Matrix', 'Verifying an Alien Dictionary', 'Decrypt String from Alphabet to Integer Mapping', 'To Lower Case', 'Matrix Block Sum', 'Sum of All Odd Length Subarrays', 'Range Sum Query - Immutable', 'Sum of Left Leaves', 'Binary Tree Paths', 'First Bad Version', 'Guess Number Higher or Lower'
    );
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reverse String', 'Write a function that reverses a string. The input string is given as an array of characters s. You must do this by modifying the input array in-place with O(1) extra memory.', 'EASY', '["Two Pointers","String"]'::jsonb, '["Microsoft","Netflix","Facebook","Target"]'::jsonb,
        61, 2682, 479, 16092, 5666,
        '["1 <= s.length <= 10^5","s[i] is a printable ascii character"]'::jsonb, '["Use two pointers, one at the beginning and one at the end of the string.","Swap the characters at the two pointers and move them towards the center."]'::jsonb, '{"java":"class Solution {\n    public void reverseString(char[] s) {\n        \n    }\n}","python":"class Solution:\n    def reverseString(self, s: List[str]) -> None:\n        \"\"\"\n        Do not return anything, modify s in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {character[]} s\n * @return {void} Do not return anything, modify s in-place instead.\n */\nvar reverseString = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    void reverseString(vector<char>& s) {\n        \n    }\n};"}'::jsonb, 'reverseString', '[{"input":"s = [\"h\",\"e\",\"l\",\"l\",\"o\"]","output":"[\"o\",\"l\",\"l\",\"e\",\"h\"]"},{"input":"s = [\"H\",\"a\",\"n\",\"n\",\"a\",\"h\"]","output":"[\"h\",\"a\",\"n\",\"n\",\"a\",\"H\"]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":["h","e","l","l","o"]}', '["o","l","l","e","h"]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":["H","a","n","n","a","h"]}', '["h","a","n","n","a","H"]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Squares of a Sorted Array', 'Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.', 'EASY', '["Two Pointers","Arrays","Sorting"]'::jsonb, '["Tesla","Shopify","SpaceX"]'::jsonb,
        20, 1001, 154, 2002, 1114,
        '["1 <= nums.length <= 10^4","-10^4 <= nums[i] <= 10^4","nums is sorted in non-decreasing order"]'::jsonb, '["The largest square will be either at the start or the end of the array.","Use two pointers to compare absolute values at both ends and fill the result array from the back."]'::jsonb, '{"java":"class Solution {\n    public int[] sortedSquares(int[] nums) {\n        return new int[0];\n    }\n}","python":"class Solution:\n    def sortedSquares(self, nums: List[int]) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number[]}\n */\nvar sortedSquares = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> sortedSquares(vector<int>& nums) {\n        return {};\n    }\n};"}'::jsonb, 'sortedSquares', '[{"input":"nums = [-4,-1,0,3,10]","output":"[0,1,9,16,100]"},{"input":"nums = [-7,-3,2,3,11]","output":"[4,9,9,49,121]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-4,-1,0,3,10]}', '[0,1,9,16,100]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-7,-3,2,3,11]}', '[4,9,9,49,121]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        '3Sum', 'Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0. Notice that the solution set must not contain duplicate triplets.', 'MEDIUM', '["Two Pointers","Arrays","Sorting"]'::jsonb, '["Microsoft","Oracle"]'::jsonb,
        38, 3293, 650, 19758, 8216,
        '["3 <= nums.length <= 3000","-10^5 <= nums[i] <= 10^5"]'::jsonb, '["Sort the array first to handle duplicates and make the two-pointer approach easier.","Iterate through the array with one pointer, and for each element, use two pointers to find the other two numbers that sum to zero."]'::jsonb, '{"java":"class Solution {\n    public List<List<Integer>> threeSum(int[] nums) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def threeSum(self, nums: List[int]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number[][]}\n */\nvar threeSum = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> threeSum(vector<int>& nums) {\n        return {};\n    }\n};"}'::jsonb, 'threeSum', '[{"input":"nums = [-1,0,1,2,-1,-4]","output":"[[-1,-1,2],[-1,0,1]]"},{"input":"nums = [0,1,1]","output":"[]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-1,0,1,2,-1,-4]}', '[[-1,-1,2],[-1,0,1]]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,1,1]}', '[]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,0,0]}', '[[0,0,0]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Move Zeroes', 'Given an integer array nums, move all 0s to the end of it while maintaining the relative order of the non-zero elements. Note that you must do this in-place without making a copy of the array.', 'EASY', '["Two Pointers","Arrays"]'::jsonb, '["ByteDance"]'::jsonb,
        46, 1763, 66, 10578, 6962,
        '["1 <= nums.length <= 10^4","-2^31 <= nums[i] <= 2^31 - 1"]'::jsonb, '["Keep a pointer for the position of the next non-zero element.","Iterate through the array and swap non-zero elements to the position indicated by the pointer."]'::jsonb, '{"java":"class Solution {\n    public void moveZeroes(int[] nums) {\n        \n    }\n}","python":"class Solution:\n    def moveZeroes(self, nums: List[int]) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {void} Do not return anything, modify nums in-place instead.\n */\nvar moveZeroes = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    void moveZeroes(vector<int>& nums) {\n        \n    }\n};"}'::jsonb, 'moveZeroes', '[{"input":"nums = [0,1,0,3,12]","output":"[1,3,12,0,0]"},{"input":"nums = [0]","output":"[0]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,1,0,3,12]}', '[1,3,12,0,0]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0]}', '[0]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Remove Duplicates from Sorted Array', 'Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Return k after placing the final result in the first k slots of nums.', 'EASY', '["Two Pointers","Arrays"]'::jsonb, '["LinkedIn","Microsoft","Twitter"]'::jsonb,
        80, 2968, 246, 11872, 6287,
        '["1 <= nums.length <= 3 * 10^4","-100 <= nums[i] <= 100","nums is sorted in non-decreasing order"]'::jsonb, '["Use a slow pointer to track the position of unique elements.","Use a fast pointer to iterate through the array considering each element."]'::jsonb, '{"java":"class Solution {\n    public int removeDuplicates(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def removeDuplicates(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar removeDuplicates = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int removeDuplicates(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'removeDuplicates', '[{"input":"nums = [1,1,2]","output":"2, nums = [1,2,_]"},{"input":"nums = [0,0,1,1,1,2,2,3,3,4]","output":"5, nums = [0,1,2,3,4,_,_,_,_,_]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,1,2]}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,0,1,1,1,2,2,3,3,4]}', '5');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Trapping Rain Water', 'Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.', 'HARD', '["Two Pointers","Arrays","Dynamic Programming","Stack"]'::jsonb, '["Twitter"]'::jsonb,
        39, 3415, 16, 17075, 10622,
        '["n == height.length","1 <= n <= 2 * 10^4","0 <= height[i] <= 10^5"]'::jsonb, '["For each element, the water it can trap depends on the maximum height to its left and to its right.","Use two pointers starting from both ends to maintain the left max and right max."]'::jsonb, '{"java":"class Solution {\n    public int trap(int[] height) {\n        return 0;\n    }\n}","python":"class Solution:\n    def trap(self, height: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} height\n * @return {number}\n */\nvar trap = function(height) {\n    \n};","cpp":"class Solution {\npublic:\n    int trap(vector<int>& height) {\n        return 0;\n    }\n};"}'::jsonb, 'trap', '[{"input":"height = [0,1,0,2,1,0,1,3,2,1,2,1]","output":"6"},{"input":"height = [4,2,0,3,2,5]","output":"9"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"height":[0,1,0,2,1,0,1,3,2,1,2,1]}', '6');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"height":[4,2,0,3,2,5]}', '9');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sort Colors', 'Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue. We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.', 'MEDIUM', '["Two Pointers","Arrays","Sorting"]'::jsonb, '["Twitter","Microsoft"]'::jsonb,
        25, 2053, 395, 8212, 2884,
        '["n == nums.length","1 <= n <= 300","nums[i] is either 0, 1, or 2"]'::jsonb, '["Use three pointers: low (for 0s), mid (for 1s), and high (for 2s).","Swap elements to move 0s to the beginning and 2s to the end, while iterating with mid."]'::jsonb, '{"java":"class Solution {\n    public void sortColors(int[] nums) {\n        \n    }\n}","python":"class Solution:\n    def sortColors(self, nums: List[int]) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {void} Do not return anything, modify nums in-place instead.\n */\nvar sortColors = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    void sortColors(vector<int>& nums) {\n        \n    }\n};"}'::jsonb, 'sortColors', '[{"input":"nums = [2,0,2,1,1,0]","output":"[0,0,1,1,2,2]"},{"input":"nums = [2,0,1]","output":"[0,1,2]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[2,0,2,1,1,0]}', '[0,0,1,1,2,2]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[2,0,1]}', '[0,1,2]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        '4Sum', 'Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that 0 <= a, b, c, d < n and a, b, c, d are distinct and nums[a] + nums[b] + nums[c] + nums[d] == target.', 'MEDIUM', '["Two Pointers","Arrays","Sorting"]'::jsonb, '["Morgan Stanley","Facebook"]'::jsonb,
        89, 64, 2, 384, 149,
        '["1 <= nums.length <= 200","-10^9 <= nums[i] <= 10^9","-10^9 <= target <= 10^9"]'::jsonb, '["Sort the array first.","Use nested loops for the first two numbers and then use the two-pointer approach for the remaining two numbers."]'::jsonb, '{"java":"class Solution {\n    public List<List<Integer>> fourSum(int[] nums, int target) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number[][]}\n */\nvar fourSum = function(nums, target) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> fourSum(vector<int>& nums, int target) {\n        return {};\n    }\n};"}'::jsonb, 'fourSum', '[{"input":"nums = [1,0,-1,0,-2,2], target = 0","output":"[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]"},{"input":"nums = [2,2,2,2,2], target = 8","output":"[[2,2,2,2]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,0,-1,0,-2,2],"target":0}', '[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[2,2,2,2,2],"target":8}', '[[2,2,2,2]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Intersection of Two Arrays', 'Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must be unique and you may return the result in any order.', 'EASY', '["Two Pointers","Arrays","Hash Table"]'::jsonb, '["Cisco","Spotify","Shopify"]'::jsonb,
        59, 1902, 303, 5706, 3276,
        '["1 <= nums1.length, nums2.length <= 1000","0 <= nums1[i], nums2[i] <= 1000"]'::jsonb, '["Sort both arrays.","Use two pointers to iterate through both arrays and find common elements."]'::jsonb, '{"java":"class Solution {\n    public int[] intersection(int[] nums1, int[] nums2) {\n        return new int[0];\n    }\n}","python":"class Solution:\n    def intersection(self, nums1: List[int], nums2: List[int]) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} nums1\n * @param {number[]} nums2\n * @return {number[]}\n */\nvar intersection = function(nums1, nums2) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> intersection(vector<int>& nums1, vector<int>& nums2) {\n        return {};\n    }\n};"}'::jsonb, 'intersection', '[{"input":"nums1 = [1,2,2,1], nums2 = [2,2]","output":"[2]"},{"input":"nums1 = [4,9,5], nums2 = [9,4,9,8,4]","output":"[9,4]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums1":[1,2,2,1],"nums2":[2,2]}', '[2]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums1":[4,9,5],"nums2":[9,4,9,8,4]}', '[9,4]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Merge Sorted Array', 'You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively. Merge nums1 and nums2 into a single array sorted in non-decreasing order. The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n.', 'EASY', '["Two Pointers","Arrays","Sorting"]'::jsonb, '["Stripe","Shopify","Netflix","SpaceX"]'::jsonb,
        35, 4774, 895, 28644, 16284,
        '["nums1.length == m + n","nums2.length == n","0 <= m, n <= 200"]'::jsonb, '["Fill nums1 from the back.","Compare elements from the end of valid parts of nums1 and nums2 and place the larger one at the end of nums1."]'::jsonb, '{"java":"class Solution {\n    public void merge(int[] nums1, int m, int[] nums2, int n) {\n        \n    }\n}","python":"class Solution:\n    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:\n        \"\"\"\n        Do not return anything, modify nums1 in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[]} nums1\n * @param {number} m\n * @param {number[]} nums2\n * @param {number} n\n * @return {void} Do not return anything, modify nums1 in-place instead.\n */\nvar merge = function(nums1, m, nums2, n) {\n    \n};","cpp":"class Solution {\npublic:\n    void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {\n        \n    }\n};"}'::jsonb, 'merge', '[{"input":"nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3","output":"[1,2,2,3,5,6]"},{"input":"nums1 = [1], m = 1, nums2 = [], n = 0","output":"[1]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums1":[1,2,3,0,0,0],"m":3,"nums2":[2,5,6],"n":3}', '[1,2,2,3,5,6]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums1":[1],"m":1,"nums2":[],"n":0}', '[1]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        '3Sum Closest', 'Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.', 'MEDIUM', '["Two Pointers","Arrays","Sorting"]'::jsonb, '["Goldman Sachs","Nvidia","Tesla"]'::jsonb,
        56, 1767, 228, 10602, 5554,
        '["3 <= nums.length <= 500","-1000 <= nums[i] <= 1000","-10^4 <= target <= 10^4"]'::jsonb, '["Similar to 3Sum, sort the array first.","Iterate and use two pointers to find the pair that minimizes the difference with the target."]'::jsonb, '{"java":"class Solution {\n    public int threeSumClosest(int[] nums, int target) {\n        return 0;\n    }\n}","python":"class Solution:\n    def threeSumClosest(self, nums: List[int], target: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar threeSumClosest = function(nums, target) {\n    \n};","cpp":"class Solution {\npublic:\n    int threeSumClosest(vector<int>& nums, int target) {\n        return 0;\n    }\n};"}'::jsonb, 'threeSumClosest', '[{"input":"nums = [-1,2,1,-4], target = 1","output":"2"},{"input":"nums = [0,0,0], target = 1","output":"0"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-1,2,1,-4],"target":1}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,0,0],"target":1}', '0');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Remove Element', 'Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The order of the elements may be changed. Then return the number of elements in nums which are not equal to val.', 'EASY', '["Two Pointers","Arrays"]'::jsonb, '["Shopify"]'::jsonb,
        74, 4524, 38, 18096, 6251,
        '["0 <= nums.length <= 100","0 <= nums[i] <= 50","0 <= val <= 100"]'::jsonb, '["Use one pointer to iterate and another to mark the position for valid elements.","Overwrite elements equal to val with valid elements."]'::jsonb, '{"java":"class Solution {\n    public int removeElement(int[] nums, int val) {\n        return 0;\n    }\n}","python":"class Solution:\n    def removeElement(self, nums: List[int], val: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} val\n * @return {number}\n */\nvar removeElement = function(nums, val) {\n    \n};","cpp":"class Solution {\npublic:\n    int removeElement(vector<int>& nums, int val) {\n        return 0;\n    }\n};"}'::jsonb, 'removeElement', '[{"input":"nums = [3,2,2,3], val = 3","output":"2, nums = [2,2,_,_]"},{"input":"nums = [0,1,2,2,3,0,4,2], val = 2","output":"5, nums = [0,1,3,0,4,_,_,_]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[3,2,2,3],"val":3}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,1,2,2,3,0,4,2],"val":2}', '5');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reverse Words in a String', 'Given an input string s, reverse the order of the words. A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space. Return a string of the words in reverse order concatenated by a single space.', 'MEDIUM', '["Two Pointers","String"]'::jsonb, '["AMD"]'::jsonb,
        25, 1394, 100, 8364, 4477,
        '["1 <= s.length <= 10^4","s contains English letters (upper-case and lower-case), digits, and spaces '' ''.","There is at least one word in s."]'::jsonb, '["First, trim leading/trailing spaces and reduce multiple spaces to one.","Reverse the entire string, then reverse each individual word."]'::jsonb, '{"java":"class Solution {\n    public String reverseWords(String s) {\n        return \"\";\n    }\n}","python":"class Solution:\n    def reverseWords(self, s: str) -> str:\n        pass","javascript":"/**\n * @param {string} s\n * @return {string}\n */\nvar reverseWords = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    string reverseWords(string s) {\n        return \"\";\n    }\n};"}'::jsonb, 'reverseWords', '[{"input":"s = \"the sky is blue\"","output":"\"blue is sky the\""},{"input":"s = \"  hello world  \"","output":"\"world hello\""}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"the sky is blue"}', '"blue is sky the"');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"  hello world  "}', '"world hello"');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Valid Triangle Number', 'Given an integer array nums, return the number of triplets chosen from the array that can make triangles if we take them as side lengths of a triangle.', 'MEDIUM', '["Two Pointers","Arrays","Sorting","Greedy"]'::jsonb, '["Salesforce","Tesla","Adobe","LinkedIn"]'::jsonb,
        40, 2144, 402, 12864, 4225,
        '["1 <= nums.length <= 1000","0 <= nums[i] <= 1000"]'::jsonb, '["Sort the array.","Fix the largest side (c) and use two pointers to find pairs (a, b) such that a + b > c."]'::jsonb, '{"java":"class Solution {\n    public int triangleNumber(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def triangleNumber(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar triangleNumber = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int triangleNumber(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'triangleNumber', '[{"input":"nums = [2,2,3,4]","output":"3"},{"input":"nums = [4,2,3,4]","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[2,2,3,4]}', '3');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[4,2,3,4]}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Boats to Save People', 'You are given an array people where people[i] is the weight of the ith person, and an infinite number of boats where each boat can carry a maximum weight of limit. Each boat carries at most two people at the same time, provided the sum of the weight of those people is at most limit. Return the minimum number of boats to carry every given person.', 'MEDIUM', '["Two Pointers","Arrays","Greedy","Sorting"]'::jsonb, '["Nvidia","ByteDance","Twitter","Walmart"]'::jsonb,
        91, 3867, 12, 7734, 3741,
        '["1 <= people.length <= 5 * 10^4","1 <= people[i] <= limit <= 3 * 10^4"]'::jsonb, '["Sort the people by weight.","Try to pair the heaviest person with the lightest person. If they fit, put them in a boat. otherwise, the heaviest person goes alone."]'::jsonb, '{"java":"class Solution {\n    public int numRescueBoats(int[] people, int limit) {\n        return 0;\n    }\n}","python":"class Solution:\n    def numRescueBoats(self, people: List[int], limit: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} people\n * @param {number} limit\n * @return {number}\n */\nvar numRescueBoats = function(people, limit) {\n    \n};","cpp":"class Solution {\npublic:\n    int numRescueBoats(vector<int>& people, int limit) {\n        return 0;\n    }\n};"}'::jsonb, 'numRescueBoats', '[{"input":"people = [1,2], limit = 3","output":"1"},{"input":"people = [3,2,2,1], limit = 3","output":"3"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"people":[1,2],"limit":3}', '1');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"people":[3,2,2,1],"limit":3}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Bag of Tokens', 'You have an initial power of power and an initial score of 0. You are given a bag of tokens where tokens[i] is the value of the ith token. Your goal is to maximize your total score by potentially playing each token in one of two ways: Face-up (loose power, gain score) or Face-down (gain power, loose score). Return the maximum possible score you can achieve after playing any number of tokens.', 'MEDIUM', '["Two Pointers","Arrays","Greedy","Sorting"]'::jsonb, '["Nvidia","Walmart"]'::jsonb,
        77, 3897, 623, 15588, 7112,
        '["0 <= tokens.length <= 1000","0 <= tokens[i], power <= 10^4"]'::jsonb, '["Sort the tokens.","Buy tokens (Face-up) with the smallest value to save power, and sell tokens (Face-down) with the largest value to gain power."]'::jsonb, '{"java":"class Solution {\n    public int bagOfTokensScore(int[] tokens, int power) {\n        return 0;\n    }\n}","python":"class Solution:\n    def bagOfTokensScore(self, tokens: List[int], power: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} tokens\n * @param {number} power\n * @return {number}\n */\nvar bagOfTokensScore = function(tokens, power) {\n    \n};","cpp":"class Solution {\npublic:\n    int bagOfTokensScore(vector<int>& tokens, int power) {\n        return 0;\n    }\n};"}'::jsonb, 'bagOfTokensScore', '[{"input":"tokens = [100], power = 50","output":"0"},{"input":"tokens = [100,200], power = 150","output":"1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"tokens":[100],"power":50}', '0');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"tokens":[100,200],"power":150}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Rotate Array', 'Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.', 'MEDIUM', '["Two Pointers","Arrays","Math"]'::jsonb, '["Shopify","ByteDance","Nvidia","Goldman Sachs"]'::jsonb,
        32, 327, 55, 1962, 768,
        '["1 <= nums.length <= 10^5","-2^31 <= nums[i] <= 2^31 - 1","0 <= k <= 10^5"]'::jsonb, '["Reverse the entire array.","Reverse the first k elements and then reverse the rest."]'::jsonb, '{"java":"class Solution {\n    public void rotate(int[] nums, int k) {\n        \n    }\n}","python":"class Solution:\n    def rotate(self, nums: List[int], k: int) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} k\n * @return {void} Do not return anything, modify nums in-place instead.\n */\nvar rotate = function(nums, k) {\n    \n};","cpp":"class Solution {\npublic:\n    void rotate(vector<int>& nums, int k) {\n        \n    }\n};"}'::jsonb, 'rotate', '[{"input":"nums = [1,2,3,4,5,6,7], k = 3","output":"[5,6,7,1,2,3,4]"},{"input":"nums = [-1,-100,3,99], k = 2","output":"[3,99,-1,-100]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,2,3,4,5,6,7],"k":3}', '[5,6,7,1,2,3,4]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-1,-100,3,99],"k":2}', '[3,99,-1,-100]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Palindromic Substrings', 'Given a string s, return the number of palindromic substrings in it. A string is a palindrome when it reads the same backward as forward. A substring is a contiguous sequence of characters within the string.', 'MEDIUM', '["Two Pointers","String","Dynamic Programming"]'::jsonb, '["Netflix","Shopify"]'::jsonb,
        90, 1516, 290, 6064, 3475,
        '["1 <= s.length <= 1000","s consists of lowercase English letters."]'::jsonb, '["Expand around the center for each character (and between characters) to find palindromes.","Count the valid palindromes found during expansion."]'::jsonb, '{"java":"class Solution {\n    public int countSubstrings(String s) {\n        return 0;\n    }\n}","python":"class Solution:\n    def countSubstrings(self, s: str) -> int:\n        pass","javascript":"/**\n * @param {string} s\n * @return {number}\n */\nvar countSubstrings = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    int countSubstrings(string s) {\n        return 0;\n    }\n};"}'::jsonb, 'countSubstrings', '[{"input":"s = \"abc\"","output":"3"},{"input":"s = \"aaa\"","output":"6"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"abc"}', '3');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"aaa"}', '6');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Median of Two Sorted Arrays', 'Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).', 'HARD', '["Two Pointers","Arrays","Binary Search","Divide and Conquer"]'::jsonb, '["Twitter"]'::jsonb,
        47, 3653, 429, 7306, 4823,
        '["nums1.length == m","nums2.length == n","0 <= m, n <= 1000","1 <= m + n <= 2000"]'::jsonb, '["Try to partition both arrays such that elements on the left are smaller than elements on the right.","Use binary search on the smaller array to find the correct partition."]'::jsonb, '{"java":"class Solution {\n    public double findMedianSortedArrays(int[] nums1, int[] nums2) {\n        return 0.0;\n    }\n}","python":"class Solution:\n    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:\n        pass","javascript":"/**\n * @param {number[]} nums1\n * @param {number[]} nums2\n * @return {number}\n */\nvar findMedianSortedArrays = function(nums1, nums2) {\n    \n};","cpp":"class Solution {\npublic:\n    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {\n        return 0.0;\n    }\n};"}'::jsonb, 'findMedianSortedArrays', '[{"input":"nums1 = [1,3], nums2 = [2]","output":"2.0"},{"input":"nums1 = [1,2], nums2 = [3,4]","output":"2.5"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums1":[1,3],"nums2":[2]}', '2.0');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums1":[1,2],"nums2":[3,4]}', '2.5');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Remove Duplicates from Sorted List', 'Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.', 'EASY', '["Two Pointers","Linked List"]'::jsonb, '["Uber","Oracle","Morgan Stanley","Twitter"]'::jsonb,
        26, 902, 29, 1804, 1156,
        '["The number of nodes in the list is in the range [0, 300].","-100 <= Node.val <= 100","The list is guaranteed to be sorted in ascending order."]'::jsonb, '["Use a pointer to traverse carefully.","If current node''s value is same as next node''s value, skip the next node."]'::jsonb, '{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode deleteDuplicates(ListNode head) {\n        return null;\n    }\n}","python":"# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass","javascript":"/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar deleteDuplicates = function(head) {\n    \n};","cpp":"/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* deleteDuplicates(ListNode* head) {\n        return nullptr;\n    }\n};"}'::jsonb, 'deleteDuplicates', '[{"input":"head = [1,1,2]","output":"[1,2]"},{"input":"head = [1,1,2,3,3]","output":"[1,2,3]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,1,2]}', '[1,2]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,1,2,3,3]}', '[1,2,3]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Two Sum II - Input Array Is Sorted', 'Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.', 'MEDIUM', '["Two Pointers","Arrays","Binary Search"]'::jsonb, '["Walmart","SpaceX"]'::jsonb,
        36, 4881, 854, 29286, 17531,
        '["2 <= numbers.length <= 3 * 10^4","-1000 <= numbers[i] <= 1000","numbers is sorted in non-decreasing order"]'::jsonb, '["Use two pointers, one at the start and one at the end.","If the sum is greater than target, decrease the right pointer. If less, increase the left pointer."]'::jsonb, '{"java":"class Solution {\n    public int[] twoSum(int[] numbers, int target) {\n        return new int[0];\n    }\n}","python":"class Solution:\n    def twoSum(self, numbers: List[int], target: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} numbers\n * @param {number} target\n * @return {number[]}\n */\nvar twoSum = function(numbers, target) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> twoSum(vector<int>& numbers, int target) {\n        return {};\n    }\n};"}'::jsonb, 'twoSum', '[{"input":"numbers = [2,7,11,15], target = 9","output":"[1,2]"},{"input":"numbers = [2,3,4], target = 6","output":"[1,3]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"numbers":[2,7,11,15],"target":9}', '[1,2]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"numbers":[2,3,4],"target":6}', '[1,3]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Container With Most Water', 'You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]). Find two lines that together with the x-axis form a container, such that the container contains the most water. Return the maximum amount of water a container can store.', 'MEDIUM', '["Two Pointers","Arrays","Greedy"]'::jsonb, '["Oracle","Netflix"]'::jsonb,
        14, 4734, 51, 14202, 6307,
        '["n == height.length","2 <= n <= 10^5","0 <= height[i] <= 10^4"]'::jsonb, '["Start with the widest container (pointers at both ends).","Move the shorter line inwards to potentially find a taller line that compensates for the reduced width."]'::jsonb, '{"java":"class Solution {\n    public int maxArea(int[] height) {\n        return 0;\n    }\n}","python":"class Solution:\n    def maxArea(self, height: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} height\n * @return {number}\n */\nvar maxArea = function(height) {\n    \n};","cpp":"class Solution {\npublic:\n    int maxArea(vector<int>& height) {\n        return 0;\n    }\n};"}'::jsonb, 'maxArea', '[{"input":"height = [1,8,6,2,5,4,8,3,7]","output":"49"},{"input":"height = [1,1]","output":"1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"height":[1,8,6,2,5,4,8,3,7]}', '49');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"height":[1,1]}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Substring Without Repeating Characters', 'Given a string s, find the length of the longest substring without repeating characters.', 'MEDIUM', '["Two Pointers","String","Hash Table","Sliding Window"]'::jsonb, '["Amazon","Tesla","Oracle"]'::jsonb,
        50, 3341, 245, 6682, 3628,
        '["0 <= s.length <= 5 * 10^4","s consists of English letters, digits, symbols and spaces."]'::jsonb, '["Use a sliding window with two pointers.","Keep track of characters in the current window using a hash set or map."]'::jsonb, '{"java":"class Solution {\n    public int lengthOfLongestSubstring(String s) {\n        return 0;\n    }\n}","python":"class Solution:\n    def lengthOfLongestSubstring(self, s: str) -> int:\n        pass","javascript":"/**\n * @param {string} s\n * @return {number}\n */\nvar lengthOfLongestSubstring = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    int lengthOfLongestSubstring(string s) {\n        return 0;\n    }\n};"}'::jsonb, 'lengthOfLongestSubstring', '[{"input":"s = \"abcabcbb\"","output":"3"},{"input":"s = \"bbbbb\"","output":"1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"abcabcbb"}', '3');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"bbbbb"}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Size Subarray Sum', 'Given an array of positive integers nums and a positive integer target, return the minimal length of a subarray whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.', 'MEDIUM', '["Two Pointers","Arrays","Binary Search","Sliding Window"]'::jsonb, '["LinkedIn","Adobe"]'::jsonb,
        53, 3514, 622, 10542, 3550,
        '["1 <= target <= 10^9","1 <= nums.length <= 10^5"]'::jsonb, '["Use two pointers to maintain a window.","Expand the window until the sum is >= target, then shrink it from the left to minimize length."]'::jsonb, '{"java":"class Solution {\n    public int minSubArrayLen(int target, int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def minSubArrayLen(self, target: int, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number} target\n * @param {number[]} nums\n * @return {number}\n */\nvar minSubArrayLen = function(target, nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int minSubArrayLen(int target, vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'minSubArrayLen', '[{"input":"target = 7, nums = [2,3,1,2,4,3]","output":"2"},{"input":"target = 4, nums = [1,4,4]","output":"1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"target":7,"nums":[2,3,1,2,4,3]}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"target":4,"nums":[1,4,4]}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Permutation in String', 'Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise. In other words, return true if one of s1''s permutations is the substring of s2.', 'MEDIUM', '["Two Pointers","String","Sliding Window","Hash Table"]'::jsonb, '["Cisco","Intel","AMD","Facebook"]'::jsonb,
        93, 519, 86, 1557, 891,
        '["1 <= s1.length, s2.length <= 10^4","s1 and s2 consist of lowercase English letters."]'::jsonb, '["Use a sliding window of size equal to s1.length.","Compare key counts of the window in s2 with key counts of s1."]'::jsonb, '{"java":"class Solution {\n    public boolean checkInclusion(String s1, String s2) {\n        return false;\n    }\n}","python":"class Solution:\n    def checkInclusion(self, s1: str, s2: str) -> bool:\n        pass","javascript":"/**\n * @param {string} s1\n * @param {string} s2\n * @return {boolean}\n */\nvar checkInclusion = function(s1, s2) {\n    \n};","cpp":"class Solution {\npublic:\n    bool checkInclusion(string s1, string s2) {\n        return false;\n    }\n};"}'::jsonb, 'checkInclusion', '[{"input":"s1 = \"ab\", s2 = \"eidbaooo\"","output":"true"},{"input":"s1 = \"ab\", s2 = \"eidboaoo\"","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s1":"ab","s2":"eidbaooo"}', 'true');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s1":"ab","s2":"eidboaoo"}', 'false');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Repeating Character Replacement', 'You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times. Return the length of the longest substring containing the same letter you can get after performing the above operations.', 'MEDIUM', '["Two Pointers","String","Sliding Window"]'::jsonb, '["Intel","Morgan Stanley","Google"]'::jsonb,
        11, 2426, 46, 14556, 5436,
        '["1 <= s.length <= 10^5","s consists of only uppercase English letters.","0 <= k <= s.length"]'::jsonb, '["Use a sliding window. Maintain the count of the most frequent character in the current window.","If window length - max count > k, shrink the window."]'::jsonb, '{"java":"class Solution {\n    public int characterReplacement(String s, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def characterReplacement(self, s: str, k: int) -> int:\n        pass","javascript":"/**\n * @param {string} s\n * @param {number} k\n * @return {number}\n */\nvar characterReplacement = function(s, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int characterReplacement(string s, int k) {\n        return 0;\n    }\n};"}'::jsonb, 'characterReplacement', '[{"input":"s = \"ABAB\", k = 2","output":"4"},{"input":"s = \"AABABBA\", k = 1","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"ABAB","k":2}', '4');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"AABABBA","k":1}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Max Consecutive Ones III', 'Given a binary array nums and an integer k, return the maximum number of consecutive 1s in the array if you can flip at most k 0s.', 'MEDIUM', '["Two Pointers","Arrays","Sliding Window"]'::jsonb, '["AMD"]'::jsonb,
        74, 2380, 167, 9520, 6450,
        '["1 <= nums.length <= 10^5","nums[i] is either 0 or 1.","0 <= k <= nums.length"]'::jsonb, '["Similar to character replacement, use a sliding window.","Count the number of 0s in the window. if count > k, shrink window."]'::jsonb, '{"java":"class Solution {\n    public int longestOnes(int[] nums, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def longestOnes(self, nums: List[int], k: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar longestOnes = function(nums, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int longestOnes(vector<int>& nums, int k) {\n        return 0;\n    }\n};"}'::jsonb, 'longestOnes', '[{"input":"nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2","output":"6"},{"input":"nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3","output":"10"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,1,1,0,0,0,1,1,1,1,0],"k":2}', '6');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1],"k":3}', '10');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Fruit Into Baskets', 'You are visiting a farm that has a single row of fruit trees arranged from left to right. The trees are represented by an integer array fruits where fruits[i] is the type of fruit the ith tree produces. You want to collect as much fruit as possible. However, the owner has some strict rules: You have two baskets, and each basket can only hold a single type of fruit. There is no limit on the amount of fruit each basket can hold. Starting from any tree of your choice, you must pick exactly one fruit from every tree (including the start tree) while moving to the right. The picked fruits must fit in one of your baskets. Once you reach a tree with fruit that cannot fit in your baskets, you must stop. Given the integer array fruits, return the maximum number of fruits you can pick.', 'MEDIUM', '["Two Pointers","Arrays","Sliding Window","Hash Table"]'::jsonb, '["Spotify"]'::jsonb,
        30, 3568, 267, 14272, 5307,
        '["1 <= fruits.length <= 10^5","0 <= fruits[i] < fruits.length"]'::jsonb, '["This is finding the longest subarray with at most 2 distinct elements.","Use a sliding window and a hash map to count distinct elements."]'::jsonb, '{"java":"class Solution {\n    public int totalFruit(int[] fruits) {\n        return 0;\n    }\n}","python":"class Solution:\n    def totalFruit(self, fruits: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} fruits\n * @return {number}\n */\nvar totalFruit = function(fruits) {\n    \n};","cpp":"class Solution {\npublic:\n    int totalFruit(vector<int>& fruits) {\n        return 0;\n    }\n};"}'::jsonb, 'totalFruit', '[{"input":"fruits = [1,2,1]","output":"3"},{"input":"fruits = [0,1,2,2]","output":"3"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"fruits":[1,2,1]}', '3');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"fruits":[0,1,2,2]}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find the Duplicate Number', 'Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive. There is only one repeated number in nums, return this repeated number. You must solve the problem without modifying the array nums and uses only constant extra space.', 'MEDIUM', '["Two Pointers","Arrays","Binary Search","Bit Manipulation"]'::jsonb, '["Spotify","LinkedIn","Stripe"]'::jsonb,
        76, 692, 132, 4152, 1727,
        '["1 <= n <= 10^5","nums.length == n + 1","1 <= nums[i] <= n"]'::jsonb, '["This can be modeled as a linked list cycle detection problem.","Use Floyd''s Cycle Detection algorithm (Tortoise and Hare)."]'::jsonb, '{"java":"class Solution {\n    public int findDuplicate(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findDuplicate(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar findDuplicate = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int findDuplicate(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'findDuplicate', '[{"input":"nums = [1,3,4,2,2]","output":"2"},{"input":"nums = [3,1,3,4,2]","output":"3"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,3,4,2,2]}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[3,1,3,4,2]}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Linked List Cycle', 'Given head, the head of a linked list, determine if the linked list has a cycle in it. There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail''s next pointer is connected to. Note that pos is not passed as a parameter. Return true if there is a cycle in the linked list. Otherwise, return false.', 'EASY', '["Two Pointers","Linked List","Hash Table"]'::jsonb, '["Intel"]'::jsonb,
        65, 3986, 283, 11958, 3973,
        '["The number of the nodes in the list is in the range [0, 10^4].","-10^5 <= Node.val <= 10^5","pos is -1 or a valid index in the linked-list."]'::jsonb, '["Use two pointers, slow and fast.","Slow moves 1 step, fast moves 2 steps. If they collide, there is a cycle."]'::jsonb, '{"java":"/**\n * Definition for singly-linked list.\n * class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) {\n *         val = x;\n *         next = null;\n *     }\n * }\n */\npublic class Solution {\n    public boolean hasCycle(ListNode head) {\n        return false;\n    }\n}","python":"# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, x):\n#         self.val = x\n#         self.next = None\n\nclass Solution:\n    def hasCycle(self, head: Optional[ListNode]) -> bool:\n        return False","javascript":"/**\n * Definition for singly-linked list.\n * function ListNode(val) {\n *     this.val = val;\n *     this.next = null;\n * }\n */\n\n/**\n * @param {ListNode} head\n * @return {boolean}\n */\nvar hasCycle = function(head) {\n    \n};","cpp":"/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode(int x) : val(x), next(NULL) {}\n * };\n */\nclass Solution {\npublic:\n    bool hasCycle(ListNode *head) {\n        return false;\n    }\n};"}'::jsonb, 'hasCycle', '[{"input":"head = [3,2,0,-4], pos = 1","output":"true"},{"input":"head = [1,2], pos = 0","output":"true"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[3,2,0,-4],"pos":1}', 'true');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2],"pos":0}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Count Pairs with Sum', 'Given an array of integers and an integer k, find the number of pairs of elements in the array whose sum is equal to k.', 'EASY', '["Two Pointers","Arrays","Hash Table"]'::jsonb, '["Tesla"]'::jsonb,
        14, 3141, 388, 6282, 4085,
        '["1 <= nums.length <= 10^5","1 <= k <= 10^9"]'::jsonb, '["Use a hash map to store frequencies of elements.","Or sort the array and use two pointers if O(N log N) is acceptable."]'::jsonb, '{"java":"class Solution {\n    public int countPairs(int[] nums, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def countPairs(self, nums: List[int], k: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar countPairs = function(nums, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int countPairs(vector<int>& nums, int k) {\n        return 0;\n    }\n};"}'::jsonb, 'countPairs', '[{"input":"nums = [1, 5, 7, 1], k = 6","output":"2"},{"input":"nums = [1, 1, 1, 1], k = 2","output":"6"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,5,7,1],"k":6}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,1,1,1],"k":2}', '6');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Rearrange Array Alternately', 'Given a sorted array of positive integers, rearrange the array elements alternatively i.e first element should be the maximum value, second should be the minimum value, third should be the second maximum, fourth should be the second minimum and so on. Modify the array in-place.', 'MEDIUM', '["Two Pointers","Arrays"]'::jsonb, '["Uber","ByteDance"]'::jsonb,
        87, 3644, 356, 18220, 5784,
        '["1 <= nums.length <= 10^5","1 <= nums[i] <= 10^7"]'::jsonb, '["Use the fact that the array is sorted.","Two pointers: one at start (min), one at end (max)."]'::jsonb, '{"java":"class Solution {\n    public void rearrange(int[] nums) {\n        \n    }\n}","python":"class Solution:\n    def rearrange(self, nums: List[int]) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {void}\n */\nvar rearrange = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    void rearrange(vector<int>& nums) {\n        \n    }\n};"}'::jsonb, 'rearrange', '[{"input":"nums = [1,2,3,4,5,6]","output":"[6,1,5,2,4,3]"},{"input":"nums = [10,20,30,40,50,60]","output":"[60,10,50,20,40,30]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,2,3,4,5,6]}', '[6,1,5,2,4,3]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[10,20,30,40,50,60]}', '[60,10,50,20,40,30]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Valid Palindrome', 'A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers. Given a string s, return true if it is a palindrome, or false otherwise.', 'EASY', '["Two Pointers","String"]'::jsonb, '["Facebook"]'::jsonb,
        26, 12, 0, 72, 40,
        '["1 <= s.length <= 2 * 10^5","s consists only of printable ASCII characters."]'::jsonb, '["Use two pointers, one at start and one at end.","Skip non-alphanumeric characters and compare."]'::jsonb, '{"java":"class Solution {\n    public boolean isPalindrome(String s) {\n        return false;\n    }\n}","python":"class Solution:\n    def isPalindrome(self, s: str) -> bool:\n        pass","javascript":"/**\n * @param {string} s\n * @return {boolean}\n */\nvar isPalindrome = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    bool isPalindrome(string s) {\n        return false;\n    }\n};"}'::jsonb, 'isPalindrome', '[{"input":"s = \"A man, a plan, a canal: Panama\"","output":"true"},{"input":"s = \"race a car\"","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"A man, a plan, a canal: Panama"}', 'true');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"race a car"}', 'false');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sort Array of 0s and 1s', 'Given an array of 0s and 1s, sort the array in ascending order. You should typically do this in a single pass.', 'EASY', '["Two Pointers","Arrays"]'::jsonb, '["Apple","LinkedIn","Cisco"]'::jsonb,
        39, 574, 58, 3444, 1907,
        '["1 <= nums.length <= 10^5","nums[i] is 0 or 1"]'::jsonb, '["Count 0s and 1s.","Or use two pointers: increment left if 0, decrement right if 1, swap if violation."]'::jsonb, '{"java":"class Solution {\n    public void sort01(int[] nums) {\n        \n    }\n}","python":"class Solution:\n    def sort01(self, nums: List[int]) -> None:\n        \"\"\"\n        Do not return anything, modify nums in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {void}\n */\nvar sort01 = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    void sort01(vector<int>& nums) {\n        \n    }\n};"}'::jsonb, 'sort01', '[{"input":"nums = [1,0,1,1,0]","output":"[0,0,1,1,1]"},{"input":"nums = [1,1,1]","output":"[1,1,1]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,0,1,1,0]}', '[0,0,1,1,1]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,1,1]}', '[1,1,1]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Closet Pair from Two Sorted Arrays', 'Given two sorted arrays and a number x, find a pair (one element from each array) such that their sum is closest to x.', 'MEDIUM', '["Two Pointers","Arrays","Binary Search"]'::jsonb, '["Target","Intel","Cisco","Uber"]'::jsonb,
        54, 450, 75, 1800, 1179,
        '["1 <= arr1.length, arr2.length <= 10^5","1 <= x <= 10^9"]'::jsonb, '["Initialize left pointer for first array and right pointer for second array.","Calculate sum. If sum < x, move left pointer. If sum > x, move right pointer. Update closest."]'::jsonb, '{"java":"class Solution {\n    public int[] closestPair(int[] arr1, int[] arr2, int x) {\n        return new int[0];\n    }\n}","python":"class Solution:\n    def closestPair(self, arr1: List[int], arr2: List[int], x: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} arr1\n * @param {number[]} arr2\n * @param {number} x\n * @return {number[]}\n */\nvar closestPair = function(arr1, arr2, x) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> closestPair(vector<int>& arr1, vector<int>& arr2, int x) {\n        return {};\n    }\n};"}'::jsonb, 'closestPair', '[{"input":"arr1 = [1, 4, 5, 7], arr2 = [10, 20, 30, 40], x = 32","output":"[1, 30]"},{"input":"arr1 = [1, 4, 5, 7], arr2 = [10, 20, 30, 40], x = 50","output":"[7, 40]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr1":[1,4,5,7],"arr2":[10,20,30,40],"x":32}', '[1,30]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr1":[1,4,5,7],"arr2":[10,20,30,40],"x":50}', '[7,40]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Pair with Given Difference', 'Given an array of integers `nums` and an integer `k`, return the number of unique K-diff pairs in the array. A k-diff pair is an integer pair (nums[i], nums[j]) where i != j and |nums[i] - nums[j]| == k.', 'MEDIUM', '["Two Pointers","Arrays","Sorting"]'::jsonb, '["Amazon"]'::jsonb,
        21, 3654, 327, 21924, 14544,
        '["1 <= nums.length <= 10^4","0 <= k <= 10^7"]'::jsonb, '["Sort the array.","Use two pointers. Maintain the difference k between them."]'::jsonb, '{"java":"class Solution {\n    public int findPairs(int[] nums, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findPairs(self, nums: List[int], k: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar findPairs = function(nums, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int findPairs(vector<int>& nums, int k) {\n        return 0;\n    }\n};"}'::jsonb, 'findPairs', '[{"input":"nums = [3,1,4,1,5], k = 2","output":"2"},{"input":"nums = [1,2,3,4,5], k = 1","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[3,1,4,1,5],"k":2}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,2,3,4,5],"k":1}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        '3Sum Smaller', 'Given an array of n integers nums and an integer target, find the number of index triplets i, j, k with 0 <= i < j < k < n that satisfy the condition nums[i] + nums[j] + nums[k] < target.', 'MEDIUM', '["Two Pointers","Arrays","Sorting"]'::jsonb, '["Netflix","Airbnb","Goldman Sachs"]'::jsonb,
        51, 3643, 338, 21858, 15070,
        '["n == nums.length","0 <= n <= 3500","-100 <= nums[i] <= 100","-100 <= target <= 100"]'::jsonb, '["Sort the array.","Fix the first element, then use two pointers to find valid pairs for the other two."]'::jsonb, '{"java":"class Solution {\n    public int threeSumSmaller(int[] nums, int target) {\n        return 0;\n    }\n}","python":"class Solution:\n    def threeSumSmaller(self, nums: List[int], target: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar threeSumSmaller = function(nums, target) {\n    \n};","cpp":"class Solution {\npublic:\n    int threeSumSmaller(vector<int>& nums, int target) {\n        return 0;\n    }\n};"}'::jsonb, 'threeSumSmaller', '[{"input":"nums = [-2,0,1,3], target = 2","output":"2"},{"input":"nums = [], target = 0","output":"0"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-2,0,1,3],"target":2}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[],"target":0}', '0');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Interval List Intersections', 'You are given two lists of closed intervals, firstList and secondList, where firstList[i] = [start_i, end_i] and secondList[j] = [start_j, end_j]. Each list of intervals is pairwise disjoint and in sorted order. Return the intersection of these two interval lists.', 'MEDIUM', '["Two Pointers","Arrays"]'::jsonb, '["Apple","Shopify"]'::jsonb,
        77, 1023, 51, 3069, 1052,
        '["0 <= firstList.length, secondList.length <= 1000","0 <= start_i < end_i <= 10^9"]'::jsonb, '["Use two pointers, one for each list.","The intersection of two intervals is [max(start1, start2), min(end1, end2)]."]'::jsonb, '{"java":"class Solution {\n    public int[][] intervalIntersection(int[][] firstList, int[][] secondList) {\n        return new int[0][0];\n    }\n}","python":"class Solution:\n    def intervalIntersection(self, firstList: List[List[int]], secondList: List[List[int]]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[][]} firstList\n * @param {number[][]} secondList\n * @return {number[][]}\n */\nvar intervalIntersection = function(firstList, secondList) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> intervalIntersection(vector<vector<int>>& firstList, vector<vector<int>>& secondList) {\n        return {};\n    }\n};"}'::jsonb, 'intervalIntersection', '[{"input":"firstList = [[0,2],[5,10],[13,23],[24,25]], secondList = [[1,5],[8,12],[15,24],[25,26]]","output":"[[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]"},{"input":"firstList = [[1,3],[5,9]], secondList = []","output":"[]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"firstList":[[0,2],[5,10],[13,23],[24,25]],"secondList":[[1,5],[8,12],[15,24],[25,26]]}', '[[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"firstList":[[1,3],[5,9]],"secondList":[]}', '[]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Rotate List', 'Given the head of a linked list, rotate the list to the right by k places.', 'MEDIUM', '["Two Pointers","Linked List"]'::jsonb, '["Google"]'::jsonb,
        34, 2464, 275, 9856, 4747,
        '["The number of nodes in the list is in the range [0, 500].","-100 <= Node.val <= 100","0 <= k <= 2 * 10^9"]'::jsonb, '["Connect the tail to the head to make it a circle.","Identify the new tail and break the circle."]'::jsonb, '{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode rotateRight(ListNode head, int k) {\n        return null;\n    }\n}","python":"# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def rotateRight(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:\n        pass","javascript":"/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @param {number} k\n * @return {ListNode}\n */\nvar rotateRight = function(head, k) {\n    \n};","cpp":"/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* rotateRight(ListNode* head, int k) {\n        return nullptr;\n    }\n};"}'::jsonb, 'rotateRight', '[{"input":"head = [1,2,3,4,5], k = 2","output":"[4,5,1,2,3]"},{"input":"head = [0,1,2], k = 4","output":"[2,0,1]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,4,5],"k":2}', '[4,5,1,2,3]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[0,1,2],"k":4}', '[2,0,1]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Odd Even Linked List', 'Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list. The first node is considered odd, and the second node is even, and so on. Note that the relative order inside both the even and odd groups should remain as it was in the input.', 'MEDIUM', '["Two Pointers","Linked List"]'::jsonb, '["Cisco","Oracle"]'::jsonb,
        90, 4194, 485, 8388, 3183,
        '["The number of nodes in the linked list is in the range [0, 10^4].","-10^6 <= Node.val <= 10^6"]'::jsonb, '["Use two pointers, one for odd nodes and one for even nodes.","Maintain the head of the even list to attach it to the end of the odd list."]'::jsonb, '{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode oddEvenList(ListNode head) {\n        return null;\n    }\n}","python":"# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def oddEvenList(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass","javascript":"/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar oddEvenList = function(head) {\n    \n};","cpp":"/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* oddEvenList(ListNode* head) {\n        return nullptr;\n    }\n};"}'::jsonb, 'oddEvenList', '[{"input":"head = [1,2,3,4,5]","output":"[1,3,5,2,4]"},{"input":"head = [2,1,3,5,6,4,7]","output":"[2,3,6,7,1,5,4]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,4,5]}', '[1,3,5,2,4]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[2,1,3,5,6,4,7]}', '[2,3,6,7,1,5,4]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find K Closest Elements', 'Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array. The result should also be sorted in ascending order. An integer a is closer to x than an integer b if: |a - x| < |b - x|, or |a - x| == |b - x| and a < b.', 'MEDIUM', '["Two Pointers","Arrays","Binary Search","Sorting"]'::jsonb, '["Apple","Oracle","Airbnb","LinkedIn"]'::jsonb,
        51, 2674, 485, 13370, 7693,
        '["1 <= k <= arr.length","1 <= arr.length <= 10^4","arr is sorted in ascending order."]'::jsonb, '["Use binary search to find the closest element.","Use two pointers to expand outwards from the closest element until k elements are found."]'::jsonb, '{"java":"class Solution {\n    public List<Integer> findClosestElements(int[] arr, int k, int x) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def findClosestElements(self, arr: List[int], k: int, x: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} arr\n * @param {number} k\n * @param {number} x\n * @return {number[]}\n */\nvar findClosestElements = function(arr, k, x) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> findClosestElements(vector<int>& arr, int k, int x) {\n        return {};\n    }\n};"}'::jsonb, 'findClosestElements', '[{"input":"arr = [1,2,3,4,5], k = 4, x = 3","output":"[1,2,3,4]"},{"input":"arr = [1,2,3,4,5], k = 4, x = -1","output":"[1,2,3,4]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr":[1,2,3,4,5],"k":4,"x":3}', '[1,2,3,4]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr":[1,2,3,4,5],"k":4,"x":-1}', '[1,2,3,4]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Assign Cookies', 'Assume you are an awesome parent and want to give your children some cookies. But, you should give each child at most one cookie. Each child i has a greed factor g[i], which is the minimum size of a cookie that the child will be content with; and each cookie j has a size s[j]. If s[j] >= g[i], we can assign the cookie j to the child i, and the child i will be content. Your goal is to maximize the number of your content children and return the maximum number.', 'EASY', '["Two Pointers","Greedy","Sorting"]'::jsonb, '["Nvidia","Bloomberg","Cisco","Oracle"]'::jsonb,
        31, 783, 145, 1566, 738,
        '["1 <= g.length <= 3 * 10^4","0 <= s.length <= 3 * 10^4"]'::jsonb, '["Sort both the greed factors and cookie sizes.","Use two pointers to match the smallest cookie that satisfies a child''s greed."]'::jsonb, '{"java":"class Solution {\n    public int findContentChildren(int[] g, int[] s) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findContentChildren(self, g: List[int], s: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} g\n * @param {number[]} s\n * @return {number}\n */\nvar findContentChildren = function(g, s) {\n    \n};","cpp":"class Solution {\npublic:\n    int findContentChildren(vector<int>& g, vector<int>& s) {\n        return 0;\n    }\n};"}'::jsonb, 'findContentChildren', '[{"input":"g = [1,2,3], s = [1,1]","output":"1"},{"input":"g = [1,2], s = [1,2,3]","output":"2"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"g":[1,2,3],"s":[1,1]}', '1');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"g":[1,2],"s":[1,2,3]}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Leaders in an Array', 'Given an array A of positive integers. Your task is to find the leaders in the array. An element of array is leader if it is greater than or equal to all the elements to its right side. The rightmost element is always a leader.', 'EASY', '["Starters","Arrays"]'::jsonb, '["Apple"]'::jsonb,
        92, 2658, 198, 5316, 2543,
        '["1 <= n <= 10^7","0 <= A[i] <= 10^7"]'::jsonb, '["Scan from right to left.","Keep track of the maximum element seen so far from the right."]'::jsonb, '{"java":"class Solution {\n    public ArrayList<Integer> leaders(int[] arr, int n) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def leaders(self, arr: List[int], n: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} arr\n * @param {number} n\n * @return {number[]}\n */\nvar leaders = function(arr, n) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> leaders(vector<int>& arr, int n) {\n        return {};\n    }\n};"}'::jsonb, 'leaders', '[{"input":"n = 6, arr = [16,17,4,3,5,2]","output":"[17,5,2]"},{"input":"n = 5, arr = [1,2,3,4,0]","output":"[4,0]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":6,"arr":[16,17,4,3,5,2]}', '[17,5,2]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":5,"arr":[1,2,3,4,0]}', '[4,0]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Palindrome Pairs', 'Given a list of unique words, return all the pairs of the distinct indices (i, j) in the given list, so that the concatenation of the two words words[i] + words[j] is a palindrome.', 'HARD', '["Two Pointers","String","Trie","Hash Table"]'::jsonb, '["LinkedIn"]'::jsonb,
        88, 847, 58, 4235, 1658,
        '["1 <= words.length <= 5000","0 <= words[i].length <= 300"]'::jsonb, '["Use a hash map to store the reverse of each word.","For each word, check if its prefix or suffix is a palindrome and if the remaining part exists in the map."]'::jsonb, '{"java":"class Solution {\n    public List<List<Integer>> palindromePairs(String[] words) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def palindromePairs(self, words: List[str]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {string[]} words\n * @return {number[][]}\n */\nvar palindromePairs = function(words) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> palindromePairs(vector<string>& words) {\n        return {};\n    }\n};"}'::jsonb, 'palindromePairs', '[{"input":"words = [\"abcd\",\"dcba\",\"lls\",\"s\",\"sssll\"]","output":"[[0,1],[1,0],[3,2],[2,4]]"},{"input":"words = [\"bat\",\"tab\",\"cat\"]","output":"[[0,1],[1,0]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"words":["abcd","dcba","lls","s","sssll"]}', '[[0,1],[1,0],[3,2],[2,4]]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"words":["bat","tab","cat"]}', '[[0,1],[1,0]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Union of Two Sorted Arrays', 'Given two sorted arrays arr1 and arr2 of size n and m respectively. The task is to find their union. The Union of two arrays can be defined as the common and distinct elements in the two arrays. Return the elements in sorted order.', 'EASY', '["Two Pointers","Arrays"]'::jsonb, '["Intel"]'::jsonb,
        78, 4989, 138, 19956, 8051,
        '["1 <= n, m <= 10^5","-10^9 <= arr1[i], arr2[i] <= 10^9"]'::jsonb, '["Use two pointers similar to merge sort.","Handle duplicates by skipping them."]'::jsonb, '{"java":"class Solution {\n    public ArrayList<Integer> findUnion(int[] arr1, int[] arr2, int n, int m) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def findUnion(self, arr1: List[int], arr2: List[int], n: int, m: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} arr1\n * @param {number[]} arr2\n * @param {number} n\n * @param {number} m\n * @return {number[]}\n */\nvar findUnion = function(arr1, arr2, n, m) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> findUnion(vector<int>& arr1, vector<int>& arr2, int n, int m) {\n        return {};\n    }\n};"}'::jsonb, 'findUnion', '[{"input":"n = 5, arr1 = [1, 2, 3, 4, 5], m = 3, arr2 = [1, 2, 3]","output":"[1, 2, 3, 4, 5]"},{"input":"n = 2, arr1 = [2, 2], m = 1, arr2 = [1]","output":"[1, 2]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":5,"arr1":[1,2,3,4,5],"m":3,"arr2":[1,2,3]}', '[1,2,3,4,5]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":2,"arr1":[2,2],"m":1,"arr2":[1]}', '[1,2]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Kth Element of Two Sorted Arrays', 'Given two sorted arrays arr1 and arr2 of size N and M respectively and an element K. The task is to find the element that would be at the kth position of the final sorted array.', 'MEDIUM', '["Two Pointers","Arrays","Binary Search"]'::jsonb, '["Tesla","Goldman Sachs"]'::jsonb,
        51, 1685, 185, 8425, 3857,
        '["1 <= N, M <= 10^5","1 <= K <= N + M","0 <= arr1[i], arr2[i] <= 10^9"]'::jsonb, '["Use two pointers to simulate merge sort steps until you reach the Kth element.","Or use binary search for a more optimal solution."]'::jsonb, '{"java":"class Solution {\n    public long kthElement(int arr1[], int arr2[], int n, int m, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def kthElement(self, arr1: List[int], arr2: List[int], n: int, m: int, k: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} arr1\n * @param {number[]} arr2\n * @param {number} n\n * @param {number} m\n * @param {number} k\n * @return {number}\n */\nvar kthElement = function(arr1, arr2, n, m, k) {\n    \n};","cpp":"class Solution {\npublic:\n    long long kthElement(int arr1[], int arr2[], int n, int m, int k) {\n        return 0;\n    }\n};"}'::jsonb, 'kthElement', '[{"input":"arr1 = [2, 3, 6, 7, 9], arr2 = [1, 4, 8, 10], k = 5","output":"6"},{"input":"arr1 = [100, 112, 256, 349, 770], arr2 = [72, 86, 113, 119, 265, 445, 892], k = 7","output":"256"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr1":[2,3,6,7,9],"arr2":[1,4,8,10],"n":5,"m":4,"k":5}', '6');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr1":[100,112,256,349,770],"arr2":[72,86,113,119,265,445,892],"n":5,"m":7,"k":7}', '256');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Remove Duplicates from Unsorted Linked List', 'Given the head of a linked list, find all the values that appear more than once in the list and delete the nodes that have any of those values. Return the linked list after the deletions.', 'MEDIUM', '["Two Pointers","Linked List","Hash Table"]'::jsonb, '["Bloomberg","Amazon"]'::jsonb,
        21, 4474, 211, 22370, 8736,
        '["The number of nodes in the list is in the range [1, 10^5].","-10^5 <= Node.val <= 10^5"]'::jsonb, '["Use a hash set to store values encountered so far.","If a value is already in the set, skip the current node."]'::jsonb, '{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) { val = x; }\n * }\n */\nclass Solution {\n    public ListNode deleteDuplicatesUnsorted(ListNode head) {\n        return null;\n    }\n}","python":"# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def deleteDuplicatesUnsorted(self, head: ListNode) -> ListNode:\n        pass","javascript":"/**\n * Definition for singly-linked list.\n * function ListNode(val, next) {\n *     this.val = (val===undefined ? 0 : val)\n *     this.next = (next===undefined ? null : next)\n * }\n */\n/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar deleteDuplicatesUnsorted = function(head) {\n    \n};","cpp":"/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(int x) : val(x), next(nullptr) {}\n *     ListNode(int x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* deleteDuplicatesUnsorted(ListNode* head) {\n        return nullptr;\n    }\n};"}'::jsonb, 'deleteDuplicatesUnsorted', '[{"input":"head = [1,2,3,2]","output":"[1,3]"},{"input":"head = [2,1,1,2]","output":"[]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,2]}', '[1,3]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[2,1,1,2]}', '[]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Rotate Doubly Linked List', 'Given a doubly linked list and an integer P, rotate the list by P nodes (counter-clockwise).', 'MEDIUM', '["Two Pointers","Linked List"]'::jsonb, '["Cisco","JPMorgan"]'::jsonb,
        59, 2949, 336, 5898, 2014,
        '["1 <= N <= 100","1 <= P <= N"]'::jsonb, '["Similar to singly linked list rotation.","Ensure both next and prev pointers are updated correctly."]'::jsonb, '{"java":"/*\nclass Node {\n    int data;\n    Node prev, next;\n    Node(int data) {\n        this.data = data;\n        prev = null;\n        next = null;\n    }\n}\n*/\nclass Solution {\n    public Node rotateP(Node head, int p) {\n        return null;\n    }\n}","python":"\"\"\"\nclass Node:\n    def __init__(self, data):\n        self.data = data\n        self.prev = None\n        self.next = None\n\"\"\"\nclass Solution:\n    def rotateP(self, head, p):\n        pass","javascript":"/**\n * @param {Node} head\n * @param {number} p\n * @return {Node}\n */\nvar rotateP = function(head, p) {\n    \n};","cpp":"/*\nstruct Node {\n    int data;\n    struct Node* next, *prev;\n};\n*/\nclass Solution {\npublic:\n    Node* rotateP(Node* head, int p) {\n        return NULL;\n    }\n};"}'::jsonb, 'rotateP', '[{"input":"head = [1,2,3,4,5,6], p = 2","output":"[3,4,5,6,1,2]"},{"input":"head = [1,2,3], p = 1","output":"[2,3,1]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,4,5,6],"p":2}', '[3,4,5,6,1,2]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3],"p":1}', '[2,3,1]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Pairs with Given Sum in Doubly Linked List', 'Given a sorted doubly linked list of positive distinct elements, the task is to find pairs in the doubly linked list whose sum is equal to a given value x.', 'EASY', '["Two Pointers","Linked List"]'::jsonb, '["Cisco","Shopify","Spotify"]'::jsonb,
        19, 3926, 753, 23556, 11088,
        '["1 <= N <= 10^4","1 <= x <= 10^9"]'::jsonb, '["Use two pointers, one at head and one at tail.","Move them towards each other based on sum comparison with x."]'::jsonb, '{"java":"class Solution {\n    public static ArrayList<ArrayList<Integer>> findPairsWithGivenSum(Node head, int target) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def findPairsWithGivenSum(self, head, target):\n        pass","javascript":"/**\n * @param {Node} head\n * @param {number} target\n * @return {number[][]}\n */\nvar findPairsWithGivenSum = function(head, target) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<pair<int, int>> findPairsWithGivenSum(Node *head, int target) {\n        return {};\n    }\n};"}'::jsonb, 'findPairsWithGivenSum', '[{"input":"list = [1,2,4,5,6,8,9], target = 7","output":"[[1,6],[2,5]]"},{"input":"list = [1,5,6], target = 6","output":"[[1,5]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,4,5,6,8,9],"target":7}', '[[1,6],[2,5]]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,5,6],"target":6}', '[[1,5]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Chocolate Distribution Problem', 'Given an array A[ ] of positive integers of size N, where each value represents the number of chocolates in a packet. Each packet can have a variable number of chocolates. There are M students, the task is to distribute chocolate packets among M students such that: 1. Each student gets exactly one packet. 2. The difference between maximum number of chocolates given to a student and minimum number of chocolates given to a student is minimum.', 'EASY', '["Arrays","Sorting","Sliding Window"]'::jsonb, '["Morgan Stanley","Oracle","IBM"]'::jsonb,
        44, 782, 85, 4692, 2337,
        '["1 <= N <= 10^5","1 <= A[i] <= 10^9","1 <= M <= N"]'::jsonb, '["Sort the array.","Use a sliding window of size M to find the minimum difference between A[i+M-1] and A[i]."]'::jsonb, '{"java":"class Solution {\n    public long findMinDiff(ArrayList<Integer> a, int n, int m) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findMinDiff(self, a: List[int], n: int, m: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} a\n * @param {number} n\n * @param {number} m\n * @return {number}\n */\nvar findMinDiff = function(a, n, m) {\n    \n};","cpp":"class Solution {\npublic:\n    long long findMinDiff(vector<long long> a, long long n, long long m) {\n        return 0;\n    }\n};"}'::jsonb, 'findMinDiff', '[{"input":"a = [3, 4, 1, 9, 56, 7, 9, 12], n = 8, m = 5","output":"6"},{"input":"a = [7, 3, 2, 4, 9, 12, 56], n = 7, m = 3","output":"2"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"a":[3,4,1,9,56,7,9,12],"n":8,"m":5}', '6');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"a":[7,3,2,4,9,12,56],"n":7,"m":3}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Subarray with Given Sum', 'Given an unsorted array A of size N that contains only non-negative integers, find a continuous sub-array which adds to a given number S. Return the left and right indexes (1-based index) of that subarray.', 'MEDIUM', '["Arrays","Two Pointers","Sliding Window"]'::jsonb, '["Intel","Bloomberg","SpaceX"]'::jsonb,
        8, 2927, 500, 8781, 3448,
        '["1 <= N <= 10^5","0 <= A[i] <= 10^9","0 <= S <= 10^9"]'::jsonb, '["Use a sliding window. Add elements to variable ''currentSum''.","While ''currentSum'' > S, remove elements from the start."]'::jsonb, '{"java":"class Solution {\n    public ArrayList<Integer> subarraySum(int[] arr, int n, int s) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def subarraySum(self, arr: List[int], n: int, s: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} arr\n * @param {number} n\n * @param {number} s\n * @return {number[]}\n */\nvar subarraySum = function(arr, n, s) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> subarraySum(vector<int> arr, int n, long long s) {\n        return {};\n    }\n};"}'::jsonb, 'subarraySum', '[{"input":"n = 5, s = 12, arr = [1,2,3,7,5]","output":"[2,4]"},{"input":"n = 10, s = 15, arr = [1,2,3,4,5,6,7,8,9,10]","output":"[1,5]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr":[1,2,3,7,5],"n":5,"s":12}', '[2,4]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr":[1,2,3,4,5,6,7,8,9,10],"n":10,"s":15}', '[1,5]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Subarray with Sum K', 'Given an array containing N integers and an integer K, your task is to find the length of the longest Sub-Array with the sum of the elements equal to the given value K.', 'MEDIUM', '["Arrays","Hash Table","Prefix Sum"]'::jsonb, '["Bloomberg","Tesla","Cisco"]'::jsonb,
        20, 1648, 220, 9888, 6747,
        '["1 <= N <= 10^5","-10^5 <= A[i] <= 10^5","-10^9 <= K <= 10^9"]'::jsonb, '["This works for negative numbers too, so simple sliding window won''t work.","Use a HashMap to store the prefix sum and its first occurrence index."]'::jsonb, '{"java":"class Solution {\n    public int lenOfLongSubarr(int A[], int N, int K) {\n        return 0;\n    }\n}","python":"class Solution:\n    def lenOfLongSubarr(self, A: List[int], N: int, K: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} A\n * @param {number} N\n * @param {number} K\n * @return {number}\n */\nvar lenOfLongSubarr = function(A, N, K) {\n    \n};","cpp":"class Solution {\npublic:\n    int lenOfLongSubarr(int A[], int N, int K) {\n        return 0;\n    }\n};"}'::jsonb, 'lenOfLongSubarr', '[{"input":"A = [10, 5, 2, 7, 1, 9], K = 15","output":"4"},{"input":"A = [-1, 2, 3], K = 6","output":"0"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"A":[10,5,2,7,1,9],"N":6,"K":15}', '4');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"A":[-1,2,3],"N":3,"K":6}', '0');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Window Substring', 'Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".', 'HARD', '["Strings","Sliding Window","Hash Table"]'::jsonb, '["Target","Adobe"]'::jsonb,
        46, 3183, 189, 19098, 11282,
        '["m == s.length","n == t.length","1 <= m, n <= 10^5","s and t consist of uppercase and lowercase English letters."]'::jsonb, '["Use a sliding window and two hash maps (or arrays) for frequency.","Expand window to satisfy counts. Shrink to minimize length."]'::jsonb, '{"java":"class Solution {\n    public String minWindow(String s, String t) {\n        return \"\";\n    }\n}","python":"class Solution:\n    def minWindow(self, s: str, t: str) -> str:\n        pass","javascript":"/**\n * @param {string} s\n * @param {string} t\n * @return {string}\n */\nvar minWindow = function(s, t) {\n    \n};","cpp":"class Solution {\npublic:\n    string minWindow(string s, string t) {\n        return \"\";\n    }\n};"}'::jsonb, 'minWindow', '[{"input":"s = \"ADOBECODEBANC\", t = \"ABC\"","output":"\"BANC\""},{"input":"s = \"a\", t = \"aa\"","output":"\"\""}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"ADOBECODEBANC","t":"ABC"}', 'BANC');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"a","t":"aa"}', '');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Subarray Product Less Than K', 'Given an array of integers nums and an integer k, return the number of contiguous subarrays where the product of all the elements in the subarray is strictly less than k.', 'MEDIUM', '["Arrays","Sliding Window"]'::jsonb, '["AMD","Cisco","Facebook"]'::jsonb,
        90, 4754, 248, 9508, 3341,
        '["1 <= nums.length <= 3 * 10^4","1 <= nums[i] <= 1000","0 <= k <= 10^6"]'::jsonb, '["Use a sliding window. Maintain the product of elements in the window.","If product >= k, divide by nums[left] and increment left.","Add (right - left + 1) to the count at each step."]'::jsonb, '{"java":"class Solution {\n    public int numSubarrayProductLessThanK(int[] nums, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def numSubarrayProductLessThanK(self, nums: List[int], k: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar numSubarrayProductLessThanK = function(nums, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int numSubarrayProductLessThanK(vector<int>& nums, int k) {\n        return 0;\n    }\n};"}'::jsonb, 'numSubarrayProductLessThanK', '[{"input":"nums = [10,5,2,6], k = 100","output":"8"},{"input":"nums = [1,2,3], k = 0","output":"0"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[10,5,2,6],"k":100}', '8');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,2,3],"k":0}', '0');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Substring with At Most K Distinct Characters', 'Given a string s and an integer k, return the length of the longest substring of s that contains at most k distinct characters.', 'MEDIUM', '["String","Sliding Window","Hash Table"]'::jsonb, '["IBM"]'::jsonb,
        69, 4761, 533, 19044, 8056,
        '["1 <= s.length <= 5 * 10^4","0 <= k <= 50"]'::jsonb, '["Use a sliding window and a hash map to count character frequencies.","If map size > k, shrink the window from the left."]'::jsonb, '{"java":"class Solution {\n    public int lengthOfLongestSubstringKDistinct(String s, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def lengthOfLongestSubstringKDistinct(self, s: str, k: int) -> int:\n        pass","javascript":"/**\n * @param {string} s\n * @param {number} k\n * @return {number}\n */\nvar lengthOfLongestSubstringKDistinct = function(s, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int lengthOfLongestSubstringKDistinct(string s, int k) {\n        return 0;\n    }\n};"}'::jsonb, 'lengthOfLongestSubstringKDistinct', '[{"input":"s = \"eceba\", k = 2","output":"3"},{"input":"s = \"aa\", k = 1","output":"2"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"eceba","k":2}', '3');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"aa","k":1}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find All Anagrams in a String', 'Given two strings s and p, return an array of all the start indices of p''s anagrams in s. You may return the answer in any order. An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.', 'MEDIUM', '["String","Sliding Window","Hash Table"]'::jsonb, '["Goldman Sachs","IBM","AMD"]'::jsonb,
        2, 139, 26, 834, 454,
        '["1 <= s.length, p.length <= 3 * 10^4","s and p consist of lowercase English letters."]'::jsonb, '["Sliding window of size p.length.","Maintain frequency counts of characters in the window and compare with p."]'::jsonb, '{"java":"class Solution {\n    public List<Integer> findAnagrams(String s, String p) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def findAnagrams(self, s: str, p: str) -> List[int]:\n        pass","javascript":"/**\n * @param {string} s\n * @param {string} p\n * @return {number[]}\n */\nvar findAnagrams = function(s, p) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> findAnagrams(string s, string p) {\n        return {};\n    }\n};"}'::jsonb, 'findAnagrams', '[{"input":"s = \"cbaebabacd\", p = \"abc\"","output":"[0,6]"},{"input":"s = \"abab\", p = \"ab\"","output":"[0,1,2]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"cbaebabacd","p":"abc"}', '[0,6]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"abab","p":"ab"}', '[0,1,2]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Maximum Sum Subarray of Size K', 'Given an array of integers Arr of size N and an integer K, find the maximum sum of a subarray of size K.', 'EASY', '["Arrays","Sliding Window"]'::jsonb, '["SpaceX","Oracle","Intel","Twitter"]'::jsonb,
        59, 3606, 475, 18030, 6888,
        '["1 <= K <= N <= 10^5","0 <= Arr[i] <= 10^5"]'::jsonb, '["Compute sum of first K elements.","Slide the window by one element: subtract the element going out, add the element coming in. Update Max."]'::jsonb, '{"java":"class Solution {\n    public long maximumSumSubarray(int K, ArrayList<Integer> Arr, int N) {\n        return 0;\n    }\n}","python":"class Solution:\n    def maximumSumSubarray(self, K: int, Arr: List[int], N: int) -> int:\n        pass","javascript":"/**\n * @param {number} K\n * @param {number[]} Arr\n * @param {number} N\n * @return {number}\n */\nvar maximumSumSubarray = function(K, Arr, N) {\n    \n};","cpp":"class Solution {\npublic:\n    long long maximumSumSubarray(int K, vector<int> &Arr, int N) {\n        return 0;\n    }\n};"}'::jsonb, 'maximumSumSubarray', '[{"input":"N = 4, K = 2, Arr = [100, 200, 300, 400]","output":"700"},{"input":"N = 4, K = 4, Arr = [100, 200, 300, 400]","output":"1000"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"K":2,"Arr":[100,200,300,400],"N":4}', '700');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"K":4,"Arr":[100,200,300,400],"N":4}', '1000');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'First Negative Integer in Every Window of Size K', 'Given an array A of size N and a positive integer K, find the first negative integer for each and every window(contiguous subarray) of size K.', 'MEDIUM', '["Arrays","Sliding Window","Queue"]'::jsonb, '["SpaceX","Nvidia","IBM"]'::jsonb,
        81, 1260, 156, 3780, 1255,
        '["1 <= N <= 10^5","-10^5 <= A[i] <= 10^5","1 <= K <= N"]'::jsonb, '["Use a Deque to store indices of negative integers in the current window.","Or just a simple queue storing the negative numbers themselves."]'::jsonb, '{"java":"class Solution {\n    public long[] printFirstNegativeInteger(long A[], int N, int K) {\n        return new long[0];\n    }\n}","python":"class Solution:\n    def printFirstNegativeInteger(self, A: List[int], N: int, K: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} A\n * @param {number} N\n * @param {number} K\n * @return {number[]}\n */\nvar printFirstNegativeInteger = function(A, N, K) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<long long> printFirstNegativeInteger(long long A[], long long N, long long K) {\n        return {};\n    }\n};"}'::jsonb, 'printFirstNegativeInteger', '[{"input":"N = 5, A = [-8, 2, 3, -6, 10], K = 2","output":"[-8, 0, -6, -6]"},{"input":"N = 8, A = [12, -1, -7, 8, -15, 30, 16, 28], K = 3","output":"[-1, -1, -7, -15, -15, 0]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"A":[-8,2,3,-6,10],"N":5,"K":2}', '[-8,0,-6,-6]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"A":[12,-1,-7,8,-15,30,16,28],"N":8,"K":3}', '[-1,-1,-7,-15,-15,0]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Distinct Elements in Window of size K', 'Given an array of integers and an integer K. Find the count of distinct elements in every window of size K in the array.', 'MEDIUM', '["Arrays","Hash Table","Sliding Window"]'::jsonb, '["Apple","Morgan Stanley"]'::jsonb,
        83, 525, 59, 2100, 1155,
        '["1 <= K <= N <= 10^5","1 <= A[i] <= 10^5"]'::jsonb, '["Use a HashMap to store frequency of elements in the current window.","When sliding, decrease count of outgoing element (remove if 0), increase count of incoming. Map size is answer."]'::jsonb, '{"java":"class Solution {\n    public ArrayList<Integer> countDistinct(int A[], int n, int k) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def countDistinct(self, A: List[int], n: int, k: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} A\n * @param {number} n\n * @param {number} k\n * @return {number[]}\n */\nvar countDistinct = function(A, n, k) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> countDistinct(vector<int> A, int n, int k) {\n        return {};\n    }\n};"}'::jsonb, 'countDistinct', '[{"input":"A = [1, 2, 1, 3, 4, 2, 3], K = 4","output":"[3, 4, 4, 3]"},{"input":"A = [4, 1, 1], K = 2","output":"[2, 1]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"A":[1,2,1,3,4,2,3],"n":7,"k":4}', '[3,4,4,3]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"A":[4,1,1],"n":3,"k":2}', '[2,1]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Platforms', 'Given arrival and departure times of all trains that reach a railway station. Find the minimum number of platforms required for the railway station so that no train is kept waiting. Consider that all the trains arrive on the same day and leave on the same day. Arrival and departure time can never be the same for a train but we can have arrival time of one train equal to departure time of the other. At any given instance of time, same platform can not be used for both departure of a train and arrival of another train. In such cases, we need different platforms.', 'MEDIUM', '["Sorting","Greedy","Two Pointers"]'::jsonb, '["Google","Microsoft"]'::jsonb,
        18, 4165, 781, 16660, 11536,
        '["1 <= n <= 50000","0 <= arr[i] <= dep[i] <= 2359"]'::jsonb, '["Sort both arrival and departure arrays.","Use two pointers. If arrival[i] <= departure[j], we need a platform. Else, a platform is freed."]'::jsonb, '{"java":"class Solution {\n    public int findPlatform(int arr[], int dep[], int n) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findPlatform(self, arr: List[int], dep: List[int], n: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} arr\n * @param {number[]} dep\n * @param {number} n\n * @return {number}\n */\nvar findPlatform = function(arr, dep, n) {\n    \n};","cpp":"class Solution {\npublic:\n    int findPlatform(int arr[], int dep[], int n) {\n        return 0;\n    }\n};"}'::jsonb, 'findPlatform', '[{"input":"n = 6, arr = [0900, 0940, 0950, 1100, 1500, 1800], dep = [0910, 1200, 1120, 1130, 1900, 2000]","output":"3"},{"input":"n = 3, arr = [0900, 1100, 1235], dep = [1000, 1200, 1240]","output":"1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr":[900,940,950,1100,1500,1800],"dep":[910,1200,1120,1130,1900,2000],"n":6}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Substring with At Most Two Distinct Characters', 'Given a string s, return the length of the longest substring that contains at most two distinct characters.', 'MEDIUM', '["String","Sliding Window","Hash Table"]'::jsonb, '["Twitter","Morgan Stanley","Shopify","Airbnb"]'::jsonb,
        46, 2469, 129, 4938, 3388,
        '["1 <= s.length <= 10^5","s consists of English letters."]'::jsonb, '["Sliding window with a hash map to count characters.","If map size > 2, shrink window."]'::jsonb, '{"java":"class Solution {\n    public int lengthOfLongestSubstringTwoDistinct(String s) {\n        return 0;\n    }\n}","python":"class Solution:\n    def lengthOfLongestSubstringTwoDistinct(self, s: str) -> int:\n        pass","javascript":"/**\n * @param {string} s\n * @return {number}\n */\nvar lengthOfLongestSubstringTwoDistinct = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    int lengthOfLongestSubstringTwoDistinct(string s) {\n        return 0;\n    }\n};"}'::jsonb, 'lengthOfLongestSubstringTwoDistinct', '[{"input":"s = \"eceba\"","output":"3"},{"input":"s = \"ccaabbb\"","output":"5"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"eceba"}', '3');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"ccaabbb"}', '5');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Count Occurrences of Anagrams', 'Given a word pat and a text txt. Return the count of the occurrences of anagrams of the word in the text.', 'MEDIUM', '["String","Sliding Window","Hash Table"]'::jsonb, '["JPMorgan"]'::jsonb,
        42, 928, 59, 3712, 1842,
        '["1 <= txt.length <= 10^5","1 <= pat.length <= txt.length"]'::jsonb, '["Sliding window of size pat.length.","Compare frequency maps."]'::jsonb, '{"java":"class Solution {\n    public int search(String pat, String txt) {\n        return 0;\n    }\n}","python":"class Solution:\n    def search(self, pat: str, txt: str) -> int:\n        pass","javascript":"/**\n * @param {string} pat\n * @param {string} txt\n * @return {number}\n */\nvar search = function(pat, txt) {\n    \n};","cpp":"class Solution {\npublic:\n    int search(string pat, string txt) {\n        return 0;\n    }\n};"}'::jsonb, 'search', '[{"input":"txt = \"forxxorfxdofr\", pat = \"for\"","output":"3"},{"input":"txt = \"aabaabaa\", pat = \"aaba\"","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"txt":"forxxorfxdofr","pat":"for"}', '3');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"txt":"aabaabaa","pat":"aaba"}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Middle of the Linked List', 'Given the head of a singly linked list, return the middle node of the linked list. If there are two middle nodes, return the second middle node.', 'EASY', '["Linked List","Two Pointers"]'::jsonb, '["Google"]'::jsonb,
        53, 870, 69, 2610, 1047,
        '["The number of nodes in the list is in the range [1, 100].","1 <= Node.val <= 100"]'::jsonb, '["Use two pointers: slow and fast.","Move slow one step and fast two steps.","When fast reaches the end, slow will be at the middle."]'::jsonb, '{"java":"class Solution {\n    public ListNode middleNode(ListNode head) {\n        return null;\n    }\n}","python":"class Solution:\n    def middleNode(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass","javascript":"/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar middleNode = function(head) {\n    \n};","cpp":"class Solution {\npublic:\n    ListNode* middleNode(ListNode* head) {\n        return nullptr;\n    }\n};"}'::jsonb, 'middleNode', '[{"input":"head = [1,2,3,4,5]","output":"[3,4,5]"},{"input":"head = [1,2,3,4,5,6]","output":"[4,5,6]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,4,5]}', '[3,4,5]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,4,5,6]}', '[4,5,6]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Remove Nth Node From End of List', 'Given the head of a linked list, remove the nth node from the end of the list and return its head.', 'MEDIUM', '["Linked List","Two Pointers"]'::jsonb, '["Walmart"]'::jsonb,
        11, 2277, 261, 11385, 7892,
        '["The number of nodes in the list is sz.","1 <= sz <= 30","0 <= Node.val <= 100","1 <= n <= sz"]'::jsonb, '["Maintain two pointers separated by n nodes.","Move both until the second pointer reaches the end."]'::jsonb, '{"java":"class Solution {\n    public ListNode removeNthFromEnd(ListNode head, int n) {\n        return null;\n    }\n}","python":"class Solution:\n    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:\n        pass","javascript":"/**\n * @param {ListNode} head\n * @param {number} n\n * @return {ListNode}\n */\nvar removeNthFromEnd = function(head, n) {\n    \n};","cpp":"class Solution {\npublic:\n    ListNode* removeNthFromEnd(ListNode* head, int n) {\n        return nullptr;\n    }\n};"}'::jsonb, 'removeNthFromEnd', '[{"input":"head = [1,2,3,4,5], n = 2","output":"[1,2,3,5]"},{"input":"head = [1], n = 1","output":"[]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,4,5],"n":2}', '[1,2,3,5]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1],"n":1}', '[]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Happy Number', 'Write an algorithm to determine if a number n is happy. A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits. Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy.', 'EASY', '["Hash Table","Math","Two Pointers"]'::jsonb, '["Walmart","Netflix","Twitter","Intel"]'::jsonb,
        76, 3018, 80, 18108, 8897,
        '["1 <= n <= 2^31 - 1"]'::jsonb, '["Use Fast & Slow pointers to detect a cycle in the sequence of sums.","If fast pointer reaches 1, it''s happy."]'::jsonb, '{"java":"class Solution {\n    public boolean isHappy(int n) {\n        return false;\n    }\n}","python":"class Solution:\n    def isHappy(self, n: int) -> bool:\n        pass","javascript":"/**\n * @param {number} n\n * @return {boolean}\n */\nvar isHappy = function(n) {\n    \n};","cpp":"class Solution {\npublic:\n    bool isHappy(int n) {\n        return false;\n    }\n};"}'::jsonb, 'isHappy', '[{"input":"n = 19","output":"true"},{"input":"n = 2","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":19}', 'true');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":2}', 'false');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Palindrome Linked List', 'Given the head of a singly linked list, return true if it is a palindrome or false otherwise.', 'EASY', '["Linked List","Two Pointers","Stack"]'::jsonb, '["ByteDance","Amazon","Intel"]'::jsonb,
        40, 2257, 389, 9028, 4589,
        '["The number of nodes in the list is in the range [1, 10^5].","0 <= Node.val <= 9"]'::jsonb, '["Use Fast & Slow pointers to find the middle.","Reverse the second half of the list.","Compare the first half with the reversed second half."]'::jsonb, '{"java":"class Solution {\n    public boolean isPalindrome(ListNode head) {\n        return false;\n    }\n}","python":"class Solution:\n    def isPalindrome(self, head: Optional[ListNode]) -> bool:\n        pass","javascript":"/**\n * @param {ListNode} head\n * @return {boolean}\n */\nvar isPalindrome = function(head) {\n    \n};","cpp":"class Solution {\npublic:\n    bool isPalindrome(ListNode* head) {\n        return false;\n    }\n};"}'::jsonb, 'isPalindrome', '[{"input":"head = [1,2,2,1]","output":"true"},{"input":"head = [1,2]","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,2,1]}', 'true');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2]}', 'false');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reorder List', 'You are given the head of a singly linked-list. The list can be represented as: L0 -> L1 -> ... -> Ln - 1 -> Ln. Reorder the list to be on the following form: L0 -> Ln -> L1 -> Ln - 1 -> L2 -> Ln - 2 -> ...', 'MEDIUM', '["Linked List","Two Pointers","Stack"]'::jsonb, '["Tesla","AMD","Adobe"]'::jsonb,
        42, 3036, 95, 6072, 2065,
        '["The number of nodes in the list is in the range [1, 5 * 10^4].","1 <= Node.val <= 1000"]'::jsonb, '["Find the middle node.","Reverse the second part of the list.","Merge the two sorted lists."]'::jsonb, '{"java":"class Solution {\n    public void reorderList(ListNode head) {\n        \n    }\n}","python":"class Solution:\n    def reorderList(self, head: Optional[ListNode]) -> None:\n        \"\"\"\n        Do not return anything, modify head in-place instead.\n        \"\"\"\n        pass","javascript":"/**\n * @param {ListNode} head\n * @return {void} Do not return anything, modify head in-place instead.\n */\nvar reorderList = function(head) {\n    \n};","cpp":"class Solution {\npublic:\n    void reorderList(ListNode* head) {\n        \n    }\n};"}'::jsonb, 'reorderList', '[{"input":"head = [1,2,3,4]","output":"[1,4,2,3]"},{"input":"head = [1,2,3,4,5]","output":"[1,5,2,4,3]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,4]}', '[1,4,2,3]');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,4,5]}', '[1,5,2,4,3]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Intersection of Two Linked Lists', 'Given the heads of two singly linked-lists headA and headB, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return null.', 'EASY', '["Linked List","Two Pointers"]'::jsonb, '["Morgan Stanley","Bloomberg","JPMorgan"]'::jsonb,
        82, 1979, 187, 3958, 2643,
        '["The number of nodes of listA is in the m.","The number of nodes of listB is in the n.","1 <= m, n <= 3 * 10^4","1 <= Node.val <= 10^5"]'::jsonb, '["Traverse both lists. When one reaches the end, redirect it to the head of the other list.","If they intersect, they will meet at the intersection point."]'::jsonb, '{"java":"class Solution {\n    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {\n        return null;\n    }\n}","python":"class Solution:\n    def getIntersectionNode(self, headA: ListNode, headB: ListNode) -> Optional[ListNode]:\n        pass","javascript":"/**\n * @param {ListNode} headA\n * @param {ListNode} headB\n * @return {ListNode}\n */\nvar getIntersectionNode = function(headA, headB) {\n    \n};","cpp":"class Solution {\npublic:\n    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {\n        return nullptr;\n    }\n};"}'::jsonb, 'getIntersectionNode', '[{"input":"intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5]","output":"Intersected at ''8''"},{"input":"intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4]","output":"Intersected at ''2''"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"headA":[4,1,8,4,5],"headB":[5,6,1,8,4,5],"intersectVal":8}', 'Intersected at ''8''');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Check if Linked List is Circular', 'Given head, the head of a singly linked list, check if the linked list is circular or not. A linked list is called circular if it is not NULL terminated and all nodes are connected in the form of a cycle.', 'EASY', '["Linked List","Two Pointers"]'::jsonb, '["Twitter","Target","Apple","AMD"]'::jsonb,
        59, 2123, 212, 8492, 3141,
        '["1 <= Number of nodes <= 100"]'::jsonb, '["Use a temporary pointer to traverse the list.","If we reach NULL, valid. If we reach head again, it''s circular."]'::jsonb, '{"java":"class Solution {\n    public boolean isCircular(ListNode head) {\n        return false;\n    }\n}","python":"class Solution:\n    def isCircular(self, head: Optional[ListNode]) -> bool:\n        pass","javascript":"/**\n * @param {ListNode} head\n * @return {boolean}\n */\nvar isCircular = function(head) {\n    \n};","cpp":"class Solution {\npublic:\n    bool isCircular(ListNode* head) {\n        return false;\n    }\n};"}'::jsonb, 'isCircular', '[{"input":"head = [1,2,3,4,5]","output":"false"},{"input":"head = [1,2,3,4,1] (circular)","output":"true"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[1,2,3,4,5]}', 'false');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Circular Array Loop', 'You are playing a game involving a circular array of non-zero integers nums. Each nums[i] denotes the number of indices forward/backward you must move if you are located at index i. Determine if there is a cycle in this array.', 'MEDIUM', '["Array","Hash Table","Two Pointers"]'::jsonb, '["Twitter","Goldman Sachs","Intel","Target"]'::jsonb,
        47, 4129, 655, 8258, 4482,
        '["1 <= nums.length <= 5000","-1000 <= nums[i] <= 1000","nums[i] != 0"]'::jsonb, '["Use Fast & Slow pointers for each index.","Handle directions carefully (should be single direction)."]'::jsonb, '{"java":"class Solution {\n    public boolean circularArrayLoop(int[] nums) {\n        return false;\n    }\n}","python":"class Solution:\n    def circularArrayLoop(self, nums: List[int]) -> bool:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {boolean}\n */\nvar circularArrayLoop = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    bool circularArrayLoop(vector<int>& nums) {\n        return false;\n    }\n};"}'::jsonb, 'circularArrayLoop', '[{"input":"nums = [2,-1,1,2,2]","output":"true"},{"input":"nums = [-1,2]","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[2,-1,1,2,2]}', 'true');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-1,2]}', 'false');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Linked List Cycle II', 'Given the head of a linked list, return the node where the cycle begins. If there is no cycle, return null. There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer.', 'MEDIUM', '["Linked List","Two Pointers"]'::jsonb, '["Uber","Netflix","Microsoft","Oracle"]'::jsonb,
        11, 4441, 87, 22205, 7394,
        '["number of nodes is in range [0, 10^4]","-10^5 <= Node.val <= 10^5"]'::jsonb, '["Use Floyd''s Cycle Detection.","Once slow matches fast, move slow to head. Move both one step until they meet."]'::jsonb, '{"java":"class Solution {\n    public ListNode detectCycle(ListNode head) {\n        return null;\n    }\n}","python":"class Solution:\n    def detectCycle(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass","javascript":"/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar detectCycle = function(head) {\n    \n};","cpp":"class Solution {\npublic:\n    ListNode *detectCycle(ListNode *head) {\n        return nullptr;\n    }\n};"}'::jsonb, 'detectCycle', '[{"input":"head = [3,2,0,-4], pos = 1","output":"tail connects to node index 1"},{"input":"head = [1,2], pos = 0","output":"tail connects to node index 0"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"head":[3,2,0,-4],"pos":1}', 'tail connects to node index 1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Binary Search', 'Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.', 'EASY', '["Array","Binary Search"]'::jsonb, '["Microsoft"]'::jsonb,
        22, 4991, 106, 14973, 6457,
        '["1 <= nums.length <= 10^4","-10^4 < nums[i], target < 10^4","All the integers in nums are unique.","nums is sorted in ascending order."]'::jsonb, '["Check the middle element.","If target > mid, search right. If target < mid, search left.","Loop while left <= right."]'::jsonb, '{"java":"class Solution {\n    public int search(int[] nums, int target) {\n        return -1;\n    }\n}","python":"class Solution:\n    def search(self, nums: List[int], target: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar search = function(nums, target) {\n    \n};","cpp":"class Solution {\npublic:\n    int search(vector<int>& nums, int target) {\n        return -1;\n    }\n};"}'::jsonb, 'search', '[{"input":"nums = [-1,0,3,5,9,12], target = 9","output":"4"},{"input":"nums = [-1,0,3,5,9,12], target = 2","output":"-1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-1,0,3,5,9,12],"target":9}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Search in Rotated Sorted Array', 'There is an integer array nums sorted in ascending order (with distinct values). Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length). Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.', 'MEDIUM', '["Array","Binary Search"]'::jsonb, '["Goldman Sachs","Nvidia","Stripe"]'::jsonb,
        95, 1440, 129, 2880, 1713,
        '["1 <= nums.length <= 5000","-10^4 <= nums[i] <= 10^4","All values of nums are unique.","nums is an ascending array that is possibly rotated.","-10^4 <= target <= 10^4"]'::jsonb, '["One half of the array (left or right) will always be sorted.","Check which half is sorted, then check if target lies in that range."]'::jsonb, '{"java":"class Solution {\n    public int search(int[] nums, int target) {\n        return -1;\n    }\n}","python":"class Solution:\n    def search(self, nums: List[int], target: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar search = function(nums, target) {\n    \n};","cpp":"class Solution {\npublic:\n    int search(vector<int>& nums, int target) {\n        return -1;\n    }\n};"}'::jsonb, 'search', '[{"input":"nums = [4,5,6,7,0,1,2], target = 0","output":"4"},{"input":"nums = [4,5,6,7,0,1,2], target = 3","output":"-1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[4,5,6,7,0,1,2],"target":0}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'First and Last Position of Element in Sorted Array', 'Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value. If target is not found in the array, return [-1, -1].', 'MEDIUM', '["Array","Binary Search"]'::jsonb, '["Airbnb","Shopify"]'::jsonb,
        35, 3489, 654, 6978, 2342,
        '["0 <= nums.length <= 10^5","-10^9 <= nums[i] <= 10^9","nums is a non-decreasing array.","-10^9 <= target <= 10^9"]'::jsonb, '["Run binary search twice.","First to find the leftmost index, second to find the rightmost index."]'::jsonb, '{"java":"class Solution {\n    public int[] searchRange(int[] nums, int target) {\n        return new int[]{-1, -1};\n    }\n}","python":"class Solution:\n    def searchRange(self, nums: List[int], target: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number[]}\n */\nvar searchRange = function(nums, target) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> searchRange(vector<int>& nums, int target) {\n        return {-1, -1};\n    }\n};"}'::jsonb, 'searchRange', '[{"input":"nums = [5,7,7,8,8,10], target = 8","output":"[3,4]"},{"input":"nums = [5,7,7,8,8,10], target = 6","output":"[-1,-1]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[5,7,7,8,8,10],"target":8}', '[3,4]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find Minimum in Rotated Sorted Array', 'Suppose an array of length n sorted in ascending order is rotated between 1 and n times. Given the sorted rotated array nums of unique elements, return the minimum element of this array.', 'MEDIUM', '["Array","Binary Search"]'::jsonb, '["AMD"]'::jsonb,
        43, 817, 100, 1634, 949,
        '["n == nums.length","1 <= n <= 5000","-5000 <= nums[i] <= 5000","All the integers of nums are unique.","nums is sorted and rotated."]'::jsonb, '["If mid element > right element, minimum is in the right half.","Otherwise, minimum is in the left half (including mid)."]'::jsonb, '{"java":"class Solution {\n    public int findMin(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findMin(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar findMin = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int findMin(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'findMin', '[{"input":"nums = [3,4,5,1,2]","output":"1"},{"input":"nums = [4,5,6,7,0,1,2]","output":"0"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[3,4,5,1,2]}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Search a 2D Matrix', 'Write an efficient algorithm that searches for a value target in an m x n integer matrix matrix. This matrix has the following properties: Integers in each row are sorted from left to right. The first integer of each row is greater than the last integer of the previous row.', 'MEDIUM', '["Array","Binary Search","Matrix"]'::jsonb, '["Morgan Stanley","AMD","Adobe"]'::jsonb,
        88, 989, 43, 3956, 1761,
        '["m == matrix.length","n == matrix[i].length","1 <= m, n <= 100","-10^4 <= matrix[i][j], target <= 10^4"]'::jsonb, '["Treat the 2D matrix as a flattened 1D sorted array of size m * n.","Index mapping: row = index / n, col = index % n."]'::jsonb, '{"java":"class Solution {\n    public boolean searchMatrix(int[][] matrix, int target) {\n        return false;\n    }\n}","python":"class Solution:\n    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:\n        pass","javascript":"/**\n * @param {number[][]} matrix\n * @param {number} target\n * @return {boolean}\n */\nvar searchMatrix = function(matrix, target) {\n    \n};","cpp":"class Solution {\npublic:\n    bool searchMatrix(vector<vector<int>>& matrix, int target) {\n        return false;\n    }\n};"}'::jsonb, 'searchMatrix', '[{"input":"matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3","output":"true"},{"input":"matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"matrix":[[1,3,5,7],[10,11,16,20],[23,30,34,60]],"target":3}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Peak Element', 'A peak element is an element that is strictly greater than its neighbors. Given a 0-indexed integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.', 'MEDIUM', '["Array","Binary Search"]'::jsonb, '["Airbnb","Stripe","Shopify"]'::jsonb,
        83, 2210, 119, 8840, 3639,
        '["1 <= nums.length <= 1000","-2^31 <= nums[i] <= 2^31 - 1","nums[i] != nums[i + 1] for all valid i."]'::jsonb, '["Binary search. If mid < mid+1, peak is to the right.","Else peak is to the left (or mid itself)."]'::jsonb, '{"java":"class Solution {\n    public int findPeakElement(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findPeakElement(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar findPeakElement = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int findPeakElement(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'findPeakElement', '[{"input":"nums = [1,2,3,1]","output":"2"},{"input":"nums = [1,2,1,3,5,6,4]","output":"5"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,2,3,1]}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Koko Eating Bananas', 'Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours. Koko can decide her bananas-per-hour eating speed of k. Return the minimum integer k such that she can eat all the bananas within h hours.', 'MEDIUM', '["Array","Binary Search"]'::jsonb, '["Nvidia","Uber","Oracle"]'::jsonb,
        86, 3863, 83, 19315, 11612,
        '["1 <= piles.length <= 10^4","piles.length <= h <= 10^9","1 <= piles[i] <= 10^9"]'::jsonb, '["Binary search on the speed k (from 1 to max(piles)).","Check if a speed is feasible by simulating the eating process."]'::jsonb, '{"java":"class Solution {\n    public int minEatingSpeed(int[] piles, int h) {\n        return 0;\n    }\n}","python":"class Solution:\n    def minEatingSpeed(self, piles: List[int], h: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} piles\n * @param {number} h\n * @return {number}\n */\nvar minEatingSpeed = function(piles, h) {\n    \n};","cpp":"class Solution {\npublic:\n    int minEatingSpeed(vector<int>& piles, int h) {\n        return 0;\n    }\n};"}'::jsonb, 'minEatingSpeed', '[{"input":"piles = [3,6,7,11], h = 8","output":"4"},{"input":"piles = [30,11,23,4,20], h = 5","output":"30"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"piles":[3,6,7,11],"h":8}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Capacity To Ship Packages Within D Days', 'A conveyor belt has packages that must be shipped from one port to another within days days. The ith package on the conveyor belt has a weight of weights[i]. Return the least weight capacity of the ship that will result in all the packages on the conveyor belt being shipped within days days.', 'MEDIUM', '["Array","Binary Search"]'::jsonb, '["Shopify","Netflix","Morgan Stanley","Stripe"]'::jsonb,
        78, 4740, 9, 14220, 8877,
        '["1 <= days <= weights.length <= 5 * 10^4","1 <= weights[i] <= 500"]'::jsonb, '["Binary search on capacity. Range [max(weights), sum(weights)].","Check feasibility for a given capacity."]'::jsonb, '{"java":"class Solution {\n    public int shipWithinDays(int[] weights, int days) {\n        return 0;\n    }\n}","python":"class Solution:\n    def shipWithinDays(self, weights: List[int], days: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} weights\n * @param {number} days\n * @return {number}\n */\nvar shipWithinDays = function(weights, days) {\n    \n};","cpp":"class Solution {\npublic:\n    int shipWithinDays(vector<int>& weights, int days) {\n        return 0;\n    }\n};"}'::jsonb, 'shipWithinDays', '[{"input":"weights = [1,2,3,4,5,6,7,8,9,10], days = 5","output":"15"},{"input":"weights = [3,2,2,4,1,4], days = 3","output":"6"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"weights":[1,2,3,4,5,6,7,8,9,10],"days":5}', '15');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Split Array Largest Sum', 'Given an integer array nums and an integer k, split nums into k non-empty subarrays such that the largest sum of any subarray is minimized. Return the minimized largest sum of the split.', 'HARD', '["Array","Binary Search","Dynamic Programming"]'::jsonb, '["Nvidia","Twitter","IBM"]'::jsonb,
        20, 1930, 100, 3860, 2574,
        '["1 <= nums.length <= 1000","1 <= k <= min(50, nums.length)","0 <= nums[i] <= 10^6"]'::jsonb, '["Binary search on the answer (max sum of a subarray).","Determine if a max sum is possible with <= k subarrays."]'::jsonb, '{"java":"class Solution {\n    public int splitArray(int[] nums, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def splitArray(self, nums: List[int], k: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar splitArray = function(nums, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int splitArray(vector<int>& nums, int k) {\n        return 0;\n    }\n};"}'::jsonb, 'splitArray', '[{"input":"nums = [7,2,5,10,8], k = 2","output":"18"},{"input":"nums = [1,2,3,4,5], k = 2","output":"9"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[7,2,5,10,8],"k":2}', '18');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Square Root', 'Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well. You must not use any built-in exponent function or operator.', 'EASY', '["Math","Binary Search"]'::jsonb, '["Apple"]'::jsonb,
        78, 1226, 0, 3678, 2508,
        '["0 <= x <= 2^31 - 1"]'::jsonb, '["Binary search between 0 and x.","Find k such that k*k <= x."]'::jsonb, '{"java":"class Solution {\n    public int mySqrt(int x) {\n        return 0;\n    }\n}","python":"class Solution:\n    def mySqrt(self, x: int) -> int:\n        pass","javascript":"/**\n * @param {number} x\n * @return {number}\n */\nvar mySqrt = function(x) {\n    \n};","cpp":"class Solution {\npublic:\n    int mySqrt(int x) {\n        return 0;\n    }\n};"}'::jsonb, 'mySqrt', '[{"input":"x = 4","output":"2"},{"input":"x = 8","output":"2"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"x":8}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find Smallest Letter Greater Than Target', 'You are given an array of characters letters that is sorted in non-decreasing order, and a character target. There are at least two different characters in letters. Return the smallest character in letters that is lexicographically greater than target. If such a character does not exist, return the first character in letters.', 'EASY', '["Array","Binary Search"]'::jsonb, '["Spotify","Apple","Salesforce"]'::jsonb,
        87, 794, 114, 2382, 1552,
        '["2 <= letters.length <= 10^4","letters[i] is a lowercase English letter.","letters is sorted in non-decreasing order.","target is a lowercase English letter."]'::jsonb, '["Standard binary search to find upper bound.","Wrap around if index equals length."]'::jsonb, '{"java":"class Solution {\n    public char nextGreatestLetter(char[] letters, char target) {\n        return '' '';\n    }\n}","python":"class Solution:\n    def nextGreatestLetter(self, letters: List[str], target: str) -> str:\n        pass","javascript":"/**\n * @param {character[]} letters\n * @param {character} target\n * @return {character}\n */\nvar nextGreatestLetter = function(letters, target) {\n    \n};","cpp":"class Solution {\npublic:\n    char nextGreatestLetter(vector<char>& letters, char target) {\n        return '' '';\n    }\n};"}'::jsonb, 'nextGreatestLetter', '[{"input":"letters = [\"c\",\"f\",\"j\"], target = \"a\"","output":"\"c\""},{"input":"letters = [\"c\",\"f\",\"j\"], target = \"c\"","output":"\"f\""}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"letters":["c","f","j"],"target":"a"}', '"c"');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Single Element in a Sorted Array', 'You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once. Return the single element that appears only once. Your solution must run in O(log n) time and O(1) space.', 'MEDIUM', '["Array","Binary Search"]'::jsonb, '["Netflix","SpaceX","Nvidia","Target"]'::jsonb,
        9, 3753, 639, 15012, 9162,
        '["1 <= nums.length <= 10^5","0 <= nums[i] <= 10^5"]'::jsonb, '["Binary search. Pairs start at even indices.","If nums[mid] == nums[mid^1], pattern holds, move right."]'::jsonb, '{"java":"class Solution {\n    public int singleNonDuplicate(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def singleNonDuplicate(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar singleNonDuplicate = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int singleNonDuplicate(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'singleNonDuplicate', '[{"input":"nums = [1,1,2,3,3,4,4,8,8]","output":"2"},{"input":"nums = [3,3,7,7,10,11,11]","output":"10"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,1,2,3,3,4,4,8,8]}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Aggressive Cows', 'You are given an array of integers stalls representing the positions of stalls on a line, and an integer k representing the number of cows. Arrays stalls is sorted. Find the largest minimum distance between any two cows.', 'MEDIUM', '["Array","Binary Search"]'::jsonb, '["Netflix","Apple","Adobe"]'::jsonb,
        99, 4447, 116, 22235, 12499,
        '["2 <= stalls.length <= 10^5","0 <= stalls[i] <= 10^9","2 <= k <= stalls.length"]'::jsonb, '["Binary search on the answer (distance). Range [1, max(stalls) - min(stalls)].","Greedily place cows to check if distance ''d'' is possible."]'::jsonb, '{"java":"class Solution {\n    public int maxDistance(int[] position, int m) {\n        return 0;\n    }\n}","python":"class Solution:\n    def maxDistance(self, position: List[int], m: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} position\n * @param {number} m\n * @return {number}\n */\nvar maxDistance = function(position, m) {\n    \n};","cpp":"class Solution {\npublic:\n    int maxDistance(vector<int>& position, int m) {\n        return 0;\n    }\n};"}'::jsonb, 'maxDistance', '[{"input":"position = [1,2,3,4,7], m = 3","output":"3"},{"input":"position = [5,4,3,2,1,1000000000], m = 2","output":"999999999"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"position":[1,2,3,4,7],"m":3}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Allocate Minimum Pages / Book Allocation', 'Given an array of integers pages where pages[i] is the number of pages in the ith book, and an integer m representing the number of students. Allocate books to m students such that the maximum number of pages allocated to a student is minimized.', 'HARD', '["Array","Binary Search"]'::jsonb, '["Netflix"]'::jsonb,
        66, 4596, 313, 18384, 7325,
        '["1 <= pages.length <= 10^5","1 <= m <= 10^5"]'::jsonb, '["Binary search on the answer (max pages).","Range [max(pages), sum(pages)]."]'::jsonb, '{"java":"class Solution {\n    public int findPages(int[] A, int N, int M) {\n        return -1;\n    }\n}","python":"class Solution:\n    def findPages(self, A, N, M):\n        pass","javascript":"/**\n * @param {number[]} A\n * @param {number} N\n * @param {number} M\n * @return {number}\n */\nvar findPages = function(A, N, M) {\n    \n};","cpp":"class Solution {\npublic:\n    int findPages(int A[], int N, int M) {\n        return -1;\n    }\n};"}'::jsonb, 'findPages', '[{"input":"A = [12,34,67,90], M = 2","output":"113"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"A":[12,34,67,90],"N":4,"M":2}', '113');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Painter''s Partition Problem', 'Given n boards of different lengths and k painters, find the minimum time required to paint all boards. Each painter takes 1 unit of time to paint 1 unit of board length.', 'HARD', '["Array","Binary Search"]'::jsonb, '["Netflix","Amazon"]'::jsonb,
        90, 177, 21, 354, 168,
        '["1 <= n <= 10^5","1 <= k <= 10^5"]'::jsonb, '["Binary search on time.","Similar to Book Allocation."]'::jsonb, '{"java":"class Solution {\n    public long minTime(int[] arr, int n, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def minTime(self, arr, n, k):\n        pass","javascript":"/**\n * @param {number[]} arr\n * @param {number} n\n * @param {number} k\n * @return {number}\n */\nvar minTime = function(arr, n, k) {\n    \n};","cpp":"class Solution {\npublic:\n    long long minTime(int arr[], int n, int k) {\n        return 0;\n    }\n};"}'::jsonb, 'minTime', '[{"input":"arr = [5,10,30,20,15], k = 3","output":"35"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr":[5,10,30,20,15],"n":5,"k":3}', '35');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Search in Infinite Array', 'Given an infinite sorted array (or an array of unknown size), find if a given target value exists. If it exists, return its index, otherwise return -1. You cannot use array.length.', 'MEDIUM', '["Array","Binary Search"]'::jsonb, '["Airbnb","Goldman Sachs","Google","Tesla"]'::jsonb,
        16, 2595, 3, 15570, 6232,
        '["Array is sorted."]'::jsonb, '["Find the range [start, end] where target might lie by exponentially increasing the range size.","Binary search within that range."]'::jsonb, '{"java":"class Solution {\n    public int searchInfinite(int[] nums, int target) {\n        return -1;\n    }\n}","python":"class Solution:\n    def searchInfinite(self, nums: List[int], target: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar searchInfinite = function(nums, target) {\n    \n};","cpp":"class Solution {\npublic:\n    int searchInfinite(vector<int>& nums, int target) {\n        return -1;\n    }\n};"}'::jsonb, 'searchInfinite', '[{"input":"nums = [1,2,3...], target = 5","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,2,3,4,5,6,7,8,9,10,12,15],"target":5}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find Floor and Ceiling', 'Given a sorted array of distinct integers and a target value x, find the floor and ceiling of x in the array. Floor is the largest element <= x, Ceiling is the smallest element >= x.', 'EASY', '["Array","Binary Search"]'::jsonb, '["ByteDance"]'::jsonb,
        5, 1823, 83, 5469, 2301,
        '["1 <= nums.length <= 10^4"]'::jsonb, '["Standard binary search can find the position.","Return elements at appropriate indices."]'::jsonb, '{"java":"class Solution {\n    public int[] getFloorAndCeil(int[] nums, int x) {\n        return new int[]{-1, -1};\n    }\n}","python":"class Solution:\n    def getFloorAndCeil(self, nums: List[int], x: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} x\n * @return {number[]}\n */\nvar getFloorAndCeil = function(nums, x) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> getFloorAndCeil(vector<int>& nums, int x) {\n        return {-1, -1};\n    }\n};"}'::jsonb, 'getFloorAndCeil', '[{"input":"nums = [1, 2, 8, 10, 10, 12, 19], x = 5","output":"[2, 8]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,2,8,10,10,12,19],"x":5}', '[2, 8]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Count 1s in Binary Sorted Array', 'Given a binary array sorted in non-increasing order (all 1s then 0s), count the number of 1s.', 'EASY', '["Array","Binary Search"]'::jsonb, '["Apple","IBM","Bloomberg"]'::jsonb,
        93, 103, 5, 618, 254,
        '["1 <= nums.length <= 10^5"]'::jsonb, '["Find the last occurrence of 1 using binary search.","Index + 1 is the count."]'::jsonb, '{"java":"class Solution {\n    public int countOnes(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def countOnes(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar countOnes = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int countOnes(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'countOnes', '[{"input":"nums = [1,1,1,1,0,0,0]","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,1,1,1,0,0,0]}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Speed to Arrive on Time', 'You are given a floating-point number hour, representing the amount of time you have to reach the office. To commute to the office, you must take n trains in sequential order. Return the minimum positive integer speed (in km/h) that all the trains must travel at for you to reach the office on time, or -1 if it is impossible.', 'MEDIUM', '["Array","Binary Search"]'::jsonb, '["Walmart","Airbnb","Adobe"]'::jsonb,
        35, 227, 43, 908, 632,
        '["n == dist.length","1 <= n <= 10^5","1 <= dist[i] <= 10^5","1 <= hour <= 10^9"]'::jsonb, '["Binary search on speed.","Time calculation involves ceiling function for integers."]'::jsonb, '{"java":"class Solution {\n    public int minSpeedOnTime(int[] dist, double hour) {\n        return -1;\n    }\n}","python":"class Solution:\n    def minSpeedOnTime(self, dist, hour):\n        pass","javascript":"/**\n * @param {number[]} dist\n * @param {number} hour\n * @return {number}\n */\nvar minSpeedOnTime = function(dist, hour) {\n    \n};","cpp":"class Solution {\npublic:\n    int minSpeedOnTime(vector<int>& dist, double hour) {\n        return -1;\n    }\n};"}'::jsonb, 'minSpeedOnTime', '[{"input":"dist = [1,3,2], hour = 6","output":"1"},{"input":"dist = [1,3,2], hour = 2.7","output":"3"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"dist":[1,3,2],"hour":6}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find Transition Point', 'Given a sorted array containing only 0s and 1s, find the transition point, i.e., the first index where 1 was observed, and before that only 0 was observed. If no 1s are present, return -1.', 'EASY', '["Array","Binary Search"]'::jsonb, '["Nvidia","Goldman Sachs"]'::jsonb,
        35, 3169, 376, 12676, 6460,
        '["1 <= N <= 10^5","0 <= arr[i] <= 1"]'::jsonb, '["Binary search for the first occurrence of 1."]'::jsonb, '{"java":"class Solution {\n    public int transitionPoint(int[] arr, int n) {\n        return -1;\n    }\n}","python":"class Solution:\n    def transitionPoint(self, arr, n):\n        pass","javascript":"/**\n * @param {number[]} arr\n * @param {number} n\n * @return {number}\n */\nvar transitionPoint = function(arr, n) {\n    \n};","cpp":"class Solution {\npublic:\n    int transitionPoint(int arr[], int n) {\n        return -1;\n    }\n};"}'::jsonb, 'transitionPoint', '[{"input":"arr = [0,0,0,1,1]","output":"3"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"arr":[0,0,0,1,1],"n":5}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Search in Row-Column Sorted Matrix', 'Given a matrix where every row and every column is sorted in increasing order, search for a given target.', 'MEDIUM', '["Array","Binary Search","Matrix"]'::jsonb, '["LinkedIn","Amazon"]'::jsonb,
        96, 4137, 178, 8274, 2496,
        '["n x m matrix"]'::jsonb, '["Start from top-right corner.","If current < target, move down. If current > target, move left."]'::jsonb, '{"java":"class Solution {\n    public boolean searchMatrix(int[][] matrix, int target) {\n        return false;\n    }\n}","python":"class Solution:\n    def searchMatrix(self, matrix, target):\n        pass","javascript":"/**\n * @param {number[][]} matrix\n * @param {number} target\n * @return {boolean}\n */\nvar searchMatrix = function(matrix, target) {\n    \n};","cpp":"class Solution {\npublic:\n    bool searchMatrix(vector<vector<int>>& matrix, int target) {\n        return false;\n    }\n};"}'::jsonb, 'searchMatrix', '[{"input":"matrix = [[10,20,30,40],[15,25,35,45],[27,29,37,48],[32,33,39,50]], target = 29","output":"true"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"matrix":[[10,20,30,40],[15,25,35,45],[27,29,37,48],[32,33,39,50]],"target":29}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Binary Tree Inorder Traversal', 'Given the root of a binary tree, return the inorder traversal of its nodes'' values.', 'EASY', '["Tree","DFS","Binary Tree"]'::jsonb, '["IBM","SpaceX","Walmart"]'::jsonb,
        70, 2239, 106, 11195, 5190,
        '["The number of nodes in the tree is in the range [0, 100].","-100 <= Node.val <= 100"]'::jsonb, '["Use recursion or a stack.","Left -> Root -> Right."]'::jsonb, '{"java":"class Solution {\n    public List<Integer> inorderTraversal(TreeNode root) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def inorderTraversal(self, root: Optional[TreeNode]) -> List[int]:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {number[]}\n */\nvar inorderTraversal = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> inorderTraversal(TreeNode* root) {\n        return {};\n    }\n};"}'::jsonb, 'inorderTraversal', '[{"input":"root = [1,null,2,3]","output":"[1,3,2]"},{"input":"root = []","output":"[]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[1,null,2,3]}', '[1,3,2]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Binary Tree Preorder Traversal', 'Given the root of a binary tree, return the preorder traversal of its nodes'' values.', 'EASY', '["Tree","DFS","Binary Tree"]'::jsonb, '["Netflix","Stripe","IBM"]'::jsonb,
        81, 4106, 126, 24636, 14851,
        '["The number of nodes in the tree is in the range [0, 100].","-100 <= Node.val <= 100"]'::jsonb, '["Root -> Left -> Right."]'::jsonb, '{"java":"class Solution {\n    public List<Integer> preorderTraversal(TreeNode root) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def preorderTraversal(self, root: Optional[TreeNode]) -> List[int]:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {number[]}\n */\nvar preorderTraversal = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> preorderTraversal(TreeNode* root) {\n        return {};\n    }\n};"}'::jsonb, 'preorderTraversal', '[{"input":"root = [1,null,2,3]","output":"[1,2,3]"},{"input":"root = []","output":"[]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[1,null,2,3]}', '[1,2,3]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Binary Tree Postorder Traversal', 'Given the root of a binary tree, return the postorder traversal of its nodes'' values.', 'EASY', '["Tree","DFS","Binary Tree"]'::jsonb, '["Shopify","Spotify","Netflix"]'::jsonb,
        13, 744, 37, 1488, 561,
        '["The number of nodes in the tree is in the range [0, 100].","-100 <= Node.val <= 100"]'::jsonb, '["Left -> Right -> Root."]'::jsonb, '{"java":"class Solution {\n    public List<Integer> postorderTraversal(TreeNode root) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def postorderTraversal(self, root: Optional[TreeNode]) -> List[int]:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {number[]}\n */\nvar postorderTraversal = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> postorderTraversal(TreeNode* root) {\n        return {};\n    }\n};"}'::jsonb, 'postorderTraversal', '[{"input":"root = [1,null,2,3]","output":"[3,2,1]"},{"input":"root = []","output":"[]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[1,null,2,3]}', '[3,2,1]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Binary Tree Level Order Traversal', 'Given the root of a binary tree, return the level order traversal of its nodes'' values. (i.e., from left to right, level by level).', 'MEDIUM', '["Tree","BFS","Binary Tree"]'::jsonb, '["Facebook","Tesla"]'::jsonb,
        19, 1390, 14, 8340, 3254,
        '["The number of nodes in the tree is in the range [0, 2000].","-1000 <= Node.val <= 1000"]'::jsonb, '["Use a queue for BFS.","Process nodes level by level."]'::jsonb, '{"java":"class Solution {\n    public List<List<Integer>> levelOrder(TreeNode root) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {number[][]}\n */\nvar levelOrder = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> levelOrder(TreeNode* root) {\n        return {};\n    }\n};"}'::jsonb, 'levelOrder', '[{"input":"root = [3,9,20,null,null,15,7]","output":"[[3],[9,20],[15,7]]"},{"input":"root = [1]","output":"[[1]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[3,9,20,null,null,15,7]}', '[[3],[9,20],[15,7]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Maximum Depth of Binary Tree', 'Given the root of a binary tree, return its maximum depth. A binary tree''s maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.', 'EASY', '["Tree","DFS","BFS"]'::jsonb, '["Walmart","Shopify","Intel","Oracle"]'::jsonb,
        93, 339, 31, 1695, 715,
        '["The number of nodes in the tree is in the range [0, 10^4].","-100 <= Node.val <= 100"]'::jsonb, '["Recursively find depth of left and right subtrees.","Return 1 + max(left, right)."]'::jsonb, '{"java":"class Solution {\n    public int maxDepth(TreeNode root) {\n        return 0;\n    }\n}","python":"class Solution:\n    def maxDepth(self, root: Optional[TreeNode]) -> int:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {number}\n */\nvar maxDepth = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    int maxDepth(TreeNode* root) {\n        return 0;\n    }\n};"}'::jsonb, 'maxDepth', '[{"input":"root = [3,9,20,null,null,15,7]","output":"3"},{"input":"root = [1,null,2]","output":"2"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[3,9,20,null,null,15,7]}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Diameter of Binary Tree', 'Given the root of a binary tree, return the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.', 'EASY', '["Tree","DFS","Binary Tree"]'::jsonb, '["IBM"]'::jsonb,
        35, 4344, 356, 8688, 3330,
        '["The number of nodes in the tree is in the range [1, 10^4].","-100 <= Node.val <= 100"]'::jsonb, '["For every node, length of longest path passing through it is L+R.","Update max diameter during traversal."]'::jsonb, '{"java":"class Solution {\n    public int diameterOfBinaryTree(TreeNode root) {\n        return 0;\n    }\n}","python":"class Solution:\n    def diameterOfBinaryTree(self, root: Optional[TreeNode]) -> int:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {number}\n */\nvar diameterOfBinaryTree = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    int diameterOfBinaryTree(TreeNode* root) {\n        return 0;\n    }\n};"}'::jsonb, 'diameterOfBinaryTree', '[{"input":"root = [1,2,3,4,5]","output":"3"},{"input":"root = [1,2]","output":"1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[1,2,3,4,5]}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Balanced Binary Tree', 'Given a binary tree, determine if it is height-balanced. A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.', 'EASY', '["Tree","DFS","Binary Tree"]'::jsonb, '["Microsoft","Intel","IBM","Facebook"]'::jsonb,
        71, 1038, 98, 6228, 2494,
        '["The number of nodes in the tree is in the range [0, 5000].","-10^4 <= Node.val <= 10^4"]'::jsonb, '["Check height of left and right subtrees.","If |left - right| > 1, return false/error value."]'::jsonb, '{"java":"class Solution {\n    public boolean isBalanced(TreeNode root) {\n        return false;\n    }\n}","python":"class Solution:\n    def isBalanced(self, root: Optional[TreeNode]) -> bool:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {boolean}\n */\nvar isBalanced = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    bool isBalanced(TreeNode* root) {\n        return false;\n    }\n};"}'::jsonb, 'isBalanced', '[{"input":"root = [3,9,20,null,null,15,7]","output":"true"},{"input":"root = [1,2,2,3,3,null,null,4,4]","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[3,9,20,null,null,15,7]}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Binary Tree Maximum Path Sum', 'A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root. The path sum is the sum of the node''s values in the path. Given the root of a binary tree, return the maximum path sum of any non-empty path.', 'HARD', '["Tree","DFS","Dynamic Programming"]'::jsonb, '["Twitter"]'::jsonb,
        26, 300, 52, 600, 414,
        '["The number of nodes in the tree is in the range [1, 3 * 10^4].","-1000 <= Node.val <= 1000"]'::jsonb, '["For each node, calculate max gain from left and right subtrees.","Max path through node = node.val + max(leftGain, 0) + max(rightGain, 0)."]'::jsonb, '{"java":"class Solution {\n    public int maxPathSum(TreeNode root) {\n        return 0;\n    }\n}","python":"class Solution:\n    def maxPathSum(self, root: Optional[TreeNode]) -> int:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {number}\n */\nvar maxPathSum = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    int maxPathSum(TreeNode* root) {\n        return 0;\n    }\n};"}'::jsonb, 'maxPathSum', '[{"input":"root = [1,2,3]","output":"6"},{"input":"root = [-10,9,20,null,null,15,7]","output":"42"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[1,2,3]}', '6');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[-10,9,20,null,null,15,7]}', '42');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Symmetric Tree', 'Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).', 'EASY', '["Tree","DFS","BFS"]'::jsonb, '["LinkedIn"]'::jsonb,
        22, 617, 102, 1851, 1265,
        '["The number of nodes in the tree is in the range [1, 1000].","-100 <= Node.val <= 100"]'::jsonb, '["Compare left subtree''s left child with right subtree''s right child.","Recursively check mirror property."]'::jsonb, '{"java":"class Solution {\n    public boolean isSymmetric(TreeNode root) {\n        return false;\n    }\n}","python":"class Solution:\n    def isSymmetric(self, root: Optional[TreeNode]) -> bool:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {boolean}\n */\nvar isSymmetric = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    bool isSymmetric(TreeNode* root) {\n        return false;\n    }\n};"}'::jsonb, 'isSymmetric', '[{"input":"root = [1,2,2,3,4,4,3]","output":"true"},{"input":"root = [1,2,2,null,3,null,3]","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[1,2,2,3,4,4,3]}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Lowest Common Ancestor of a Binary Tree', 'Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.', 'MEDIUM', '["Tree","DFS"]'::jsonb, '["SpaceX","Salesforce"]'::jsonb,
        48, 26, 4, 156, 51,
        '["The number of nodes in the tree is in the range [2, 10^5].","-10^9 <= Node.val <= 10^9","All Node.val are unique.","p != q","p and q will exist in the tree."]'::jsonb, '["If root matches p or q, return root.","Recursively search left and right. If both return non-null, root is LCA."]'::jsonb, '{"java":"class Solution {\n    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {\n        return null;\n    }\n}","python":"class Solution:\n    def lowestCommonAncestor(self, root: ''TreeNode'', p: ''TreeNode'', q: ''TreeNode'') -> ''TreeNode'':\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @param {TreeNode} p\n * @param {TreeNode} q\n * @return {TreeNode}\n */\nvar lowestCommonAncestor = function(root, p, q) {\n    \n};","cpp":"class Solution {\npublic:\n    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {\n        return nullptr;\n    }\n};"}'::jsonb, 'lowestCommonAncestor', '[{"input":"root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1","output":"3"},{"input":"root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4","output":"5"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[3,5,1,6,2,0,8,null,null,7,4],"p":5,"q":1}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Binary Tree Right Side View', 'Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.', 'MEDIUM', '["Tree","DFS","BFS"]'::jsonb, '["Cisco","Adobe"]'::jsonb,
        6, 1403, 97, 7015, 3751,
        '["The number of nodes in the tree is in the range [0, 100].","-100 <= Node.val <= 100"]'::jsonb, '["Use BFS (Level Order). The last element of each level is visible."]'::jsonb, '{"java":"class Solution {\n    public List<Integer> rightSideView(TreeNode root) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def rightSideView(self, root: Optional[TreeNode]) -> List[int]:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {number[]}\n */\nvar rightSideView = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> rightSideView(TreeNode* root) {\n        return {};\n    }\n};"}'::jsonb, 'rightSideView', '[{"input":"root = [1,2,3,null,5,null,4]","output":"[1,3,4]"},{"input":"root = [1,null,3]","output":"[1,3]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[1,2,3,null,5,null,4]}', '[1,3,4]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Vertical Order Traversal of a Binary Tree', 'Given the root of a binary tree, calculate the vertical order traversal of the binary tree. For each node at position (row, col), its left and right children will be at positions (row + 1, col - 1) and (row + 1, col + 1) respectively. The root of the tree is at (0, 0).', 'HARD', '["Tree","DFS","BFS","Sorting"]'::jsonb, '["Uber","Nvidia","Facebook","Morgan Stanley"]'::jsonb,
        70, 2386, 400, 11930, 5317,
        '["The number of nodes in the tree is in the range [1, 1000].","-1000 <= Node.val <= 1000"]'::jsonb, '["Store nodes as (col, row, val). Sort by col, then row, then val."]'::jsonb, '{"java":"class Solution {\n    public List<List<Integer>> verticalTraversal(TreeNode root) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def verticalTraversal(self, root: Optional[TreeNode]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {number[][]}\n */\nvar verticalTraversal = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> verticalTraversal(TreeNode* root) {\n        return {};\n    }\n};"}'::jsonb, 'verticalTraversal', '[{"input":"root = [3,9,20,null,null,15,7]","output":"[[9],[3,15],[20],[7]]"},{"input":"root = [1,2,3,4,5,6,7]","output":"[[4],[2],[1,5,6],[3],[7]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[3,9,20,null,null,15,7]}', '[[9],[3,15],[20],[7]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Binary Tree Zigzag Level Order Traversal', 'Given the root of a binary tree, return the zigzag level order traversal of its nodes'' values. (i.e., from left to right, then right to left for the next level and alternate between).', 'MEDIUM', '["Tree","BFS"]'::jsonb, '["Facebook","Walmart"]'::jsonb,
        57, 2227, 264, 4454, 1756,
        '["The number of nodes in the tree is in the range [0, 2000].","-100 <= Node.val <= 100"]'::jsonb, '["Standard Level Order traversal using a deque/queue.","Reverse the order for alternating levels."]'::jsonb, '{"java":"class Solution {\n    public List<List<Integer>> zigzagLevelOrder(TreeNode root) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def zigzagLevelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {number[][]}\n */\nvar zigzagLevelOrder = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> zigzagLevelOrder(TreeNode* root) {\n        return {};\n    }\n};"}'::jsonb, 'zigzagLevelOrder', '[{"input":"root = [3,9,20,null,null,15,7]","output":"[[3],[20,9],[15,7]]"},{"input":"root = [1]","output":"[[1]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[3,9,20,null,null,15,7]}', '[[3],[20,9],[15,7]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Path Sum', 'Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.', 'EASY', '["Tree","DFS"]'::jsonb, '["Twitter","Facebook"]'::jsonb,
        3, 3538, 152, 21228, 12201,
        '["The number of nodes in the tree is in the range [0, 5000].","-1000 <= Node.val <= 1000","-1000 <= targetSum <= 1000"]'::jsonb, '["Recursively check if (targetSum - root.val) can be found in left or right subtree.","Base case: leaf node check."]'::jsonb, '{"java":"class Solution {\n    public boolean hasPathSum(TreeNode root, int targetSum) {\n        return false;\n    }\n}","python":"class Solution:\n    def hasPathSum(self, root: Optional[TreeNode], targetSum: int) -> bool:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @param {number} targetSum\n * @return {boolean}\n */\nvar hasPathSum = function(root, targetSum) {\n    \n};","cpp":"class Solution {\npublic:\n    bool hasPathSum(TreeNode* root, int targetSum) {\n        return false;\n    }\n};"}'::jsonb, 'hasPathSum', '[{"input":"root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22","output":"true"},{"input":"root = [1,2,3], targetSum = 5","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[5,4,8,11,null,13,4,7,2,null,null,null,1],"targetSum":22}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Count Complete Tree Nodes', 'Given the root of a complete binary tree, return the number of the nodes in the tree.', 'MEDIUM', '["Tree","DFS","Binary Search"]'::jsonb, '["Spotify","Google","LinkedIn"]'::jsonb,
        83, 3281, 10, 13124, 4903,
        '["The number of nodes in the tree is in the range [0, 5 * 10^4].","0 <= Node.val <= 5 * 10^4","The tree is guaranteed to be complete."]'::jsonb, '["Compare depth of left and right subtrees.","If equal, left is full; recurse on right. Else recurse on left."]'::jsonb, '{"java":"class Solution {\n    public int countNodes(TreeNode root) {\n        return 0;\n    }\n}","python":"class Solution:\n    def countNodes(self, root: Optional[TreeNode]) -> int:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {number}\n */\nvar countNodes = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    int countNodes(TreeNode* root) {\n        return 0;\n    }\n};"}'::jsonb, 'countNodes', '[{"input":"root = [1,2,3,4,5,6]","output":"6"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"root":[1,2,3,4,5,6]}', '6');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Number of Islands', 'Given an m x n 2D binary grid grid which represents a map of ''1''s (land) and ''0''s (water), return the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.', 'MEDIUM', '["Array","DFS","BFS","Union Find","Matrix"]'::jsonb, '["Morgan Stanley","LinkedIn"]'::jsonb,
        59, 4646, 36, 23230, 7533,
        '["m == grid.length","n == grid[i].length","1 <= m, n <= 300","grid[i][j] is ''0'' or ''1''."]'::jsonb, '["Iterate through the grid. When a ''1'' is found, increment count and DFS/BFS to mark all connected ''1''s as visited."]'::jsonb, '{"java":"class Solution {\n    public int numIslands(char[][] grid) {\n        return 0;\n    }\n}","python":"class Solution:\n    def numIslands(self, grid: List[List[str]]) -> int:\n        pass","javascript":"/**\n * @param {character[][]} grid\n * @return {number}\n */\nvar numIslands = function(grid) {\n    \n};","cpp":"class Solution {\npublic:\n    int numIslands(vector<vector<char>>& grid) {\n        return 0;\n    }\n};"}'::jsonb, 'numIslands', '[{"input":"grid = [[\"1\",\"1\",\"1\",\"1\",\"0\"],[\"1\",\"1\",\"0\",\"1\",\"0\"],[\"1\",\"1\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]","output":"1"},{"input":"grid = [[\"1\",\"1\",\"0\",\"0\",\"0\"],[\"1\",\"1\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"1\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"1\",\"1\"]]","output":"3"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"grid":[["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Number of Provinces', 'There are n cities. Some of them are connected, while some are not. If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c. A province is a group of directly or indirectly connected cities and no other cities outside of the group. You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city and the jth city are directly connected, and isConnected[i][j] = 0 otherwise. Return the total number of provinces.', 'MEDIUM', '["DFS","BFS","Union Find","Graph"]'::jsonb, '["Goldman Sachs","Stripe","Tesla","Facebook"]'::jsonb,
        72, 893, 138, 4465, 2925,
        '["1 <= n <= 200","n == isConnected.length","n == isConnected[i].length","isConnected[i][j] is 0 or 1.","isConnected[i][i] == 1","isConnected[i][j] == isConnected[j][i]"]'::jsonb, '["This is finding the number of connected components in a graph.","Use DFS, BFS, or Union-Find."]'::jsonb, '{"java":"class Solution {\n    public int findCircleNum(int[][] isConnected) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findCircleNum(self, isConnected: List[List[int]]) -> int:\n        pass","javascript":"/**\n * @param {number[][]} isConnected\n * @return {number}\n */\nvar findCircleNum = function(isConnected) {\n    \n};","cpp":"class Solution {\npublic:\n    int findCircleNum(vector<vector<int>>& isConnected) {\n        return 0;\n    }\n};"}'::jsonb, 'findCircleNum', '[{"input":"isConnected = [[1,1,0],[1,1,0],[0,0,1]]","output":"2"},{"input":"isConnected = [[1,0,0],[0,1,0],[0,0,1]]","output":"3"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"isConnected":[[1,1,0],[1,1,0],[0,0,1]]}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Rotting Oranges', 'You are given an m x n grid where each cell can have one of three values: 0 (empty), 1 (fresh orange), 2 (rotten orange). Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten. Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.', 'MEDIUM', '["Array","BFS","Matrix"]'::jsonb, '["Adobe","Amazon","Intel","Microsoft"]'::jsonb,
        45, 735, 74, 2940, 1149,
        '["m == grid.length","n == grid[i].length","1 <= m, n <= 10"]'::jsonb, '["Multi-source BFS. Start BFS from all rotten oranges simultaneously.","Track level (minutes) and count fresh oranges."]'::jsonb, '{"java":"class Solution {\n    public int orangesRotting(int[][] grid) {\n        return 0;\n    }\n}","python":"class Solution:\n    def orangesRotting(self, grid: List[List[int]]) -> int:\n        pass","javascript":"/**\n * @param {number[][]} grid\n * @return {number}\n */\nvar orangesRotting = function(grid) {\n    \n};","cpp":"class Solution {\npublic:\n    int orangesRotting(vector<vector<int>>& grid) {\n        return 0;\n    }\n};"}'::jsonb, 'orangesRotting', '[{"input":"grid = [[2,1,1],[1,1,0],[0,1,1]]","output":"4"},{"input":"grid = [[2,1,1],[0,1,1],[1,0,1]]","output":"-1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"grid":[[2,1,1],[1,1,0],[0,1,1]]}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        '01 Matrix / Distance of Nearest Cell Having 0', 'Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell. The distance between two adjacent cells is 1.', 'MEDIUM', '["Array","BFS","Matrix"]'::jsonb, '["Stripe"]'::jsonb,
        50, 4600, 667, 13800, 7699,
        '["m == mat.length","n == mat[i].length","1 <= m, n <= 10^4","mat[i][j] is either 0 or 1.","There is at least one 0 in mat."]'::jsonb, '["Multi-source BFS starting from all 0s.","Initialize non-0 cells with infinity (or -1)."]'::jsonb, '{"java":"class Solution {\n    public int[][] updateMatrix(int[][] mat) {\n        return new int[][]{};\n    }\n}","python":"class Solution:\n    def updateMatrix(self, mat: List[List[int]]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[][]} mat\n * @return {number[][]}\n */\nvar updateMatrix = function(mat) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> updateMatrix(vector<vector<int>>& mat) {\n        return {};\n    }\n};"}'::jsonb, 'updateMatrix', '[{"input":"mat = [[0,0,0],[0,1,0],[0,0,0]]","output":"[[0,0,0],[0,1,0],[0,0,0]]"},{"input":"mat = [[0,0,0],[0,1,0],[1,1,1]]","output":"[[0,0,0],[0,1,0],[1,2,1]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"mat":[[0,0,0],[0,1,0],[1,1,1]]}', '[[0,0,0],[0,1,0],[1,2,1]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Clone Graph', 'Given a reference of a node in a connected undirected graph. Return a deep copy (clone) of the graph.', 'MEDIUM', '["Hash Table","DFS","BFS","Graph"]'::jsonb, '["Bloomberg"]'::jsonb,
        74, 4679, 928, 9358, 5358,
        '["The number of nodes in the graph is in the range [0, 100].","1 <= Node.val <= 100","Node.val is unique for each node."]'::jsonb, '["Use a HashMap to map original nodes to their clones.","DFS or BFS to traverse and clone."]'::jsonb, '{"java":"class Solution {\n    public Node cloneGraph(Node node) {\n        return null;\n    }\n}","python":"class Solution:\n    def cloneGraph(self, node: ''Node'') -> ''Node'':\n        pass","javascript":"/**\n * @param {Node} node\n * @return {Node}\n */\nvar cloneGraph = function(node) {\n    \n};","cpp":"class Solution {\npublic:\n    Node* cloneGraph(Node* node) {\n        return nullptr;\n    }\n};"}'::jsonb, 'cloneGraph', '[{"input":"adjList = [[2,4],[1,3],[2,4],[1,3]]","output":"[[2,4],[1,3],[2,4],[1,3]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"adjList":[[2,4],[1,3],[2,4],[1,3]]}', '[[2,4],[1,3],[2,4],[1,3]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Is Graph Bipartite?', 'There is an undirected graph with n nodes, where each node is numbered between 0 and n - 1. You are given a 2D array graph, where graph[u] is an array of nodes that node u is adjacent to. Return true if and only if it is bipartite.', 'MEDIUM', '["DFS","BFS","Graph","Union Find"]'::jsonb, '["Oracle"]'::jsonb,
        63, 4174, 99, 25044, 13735,
        '["graph.length == n","1 <= n <= 100","0 <= graph[u].length < n","graph[u] does not contain u."]'::jsonb, '["Try to color the graph with 2 colors using BFS or DFS.","If you meet a node that is already colored with the same color as current, traverse fails."]'::jsonb, '{"java":"class Solution {\n    public boolean isBipartite(int[][] graph) {\n        return false;\n    }\n}","python":"class Solution:\n    def isBipartite(self, graph: List[List[int]]) -> bool:\n        pass","javascript":"/**\n * @param {number[][]} graph\n * @return {boolean}\n */\nvar isBipartite = function(graph) {\n    \n};","cpp":"class Solution {\npublic:\n    bool isBipartite(vector<vector<int>>& graph) {\n        return false;\n    }\n};"}'::jsonb, 'isBipartite', '[{"input":"graph = [[1,2,3],[0,2],[0,1,3],[0,2]]","output":"false"},{"input":"graph = [[1,3],[0,2],[1,3],[0,2]]","output":"true"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"graph":[[1,2,3],[0,2],[0,1,3],[0,2]]}', 'false');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Word Ladder', 'A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that every adjacent pair differs by a single letter. Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.', 'HARD', '["Hash Table","String","BFS"]'::jsonb, '["LinkedIn","Oracle","Spotify","Facebook"]'::jsonb,
        33, 4087, 384, 8174, 4950,
        '["1 <= beginWord.length <= 10","endWord.length == beginWord.length","1 <= wordList.length <= 5000"]'::jsonb, '["Standard BFS for shortest path in an unweighted graph.","Preprocess wordList to efficiently find neighbors."]'::jsonb, '{"java":"class Solution {\n    public int ladderLength(String beginWord, String endWord, List<String> wordList) {\n        return 0;\n    }\n}","python":"class Solution:\n    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:\n        pass","javascript":"/**\n * @param {string} beginWord\n * @param {string} endWord\n * @param {string[]} wordList\n * @return {number}\n */\nvar ladderLength = function(beginWord, endWord, wordList) {\n    \n};","cpp":"class Solution {\npublic:\n    int ladderLength(string beginWord, string endWord, vector<string>& wordList) {\n        return 0;\n    }\n};"}'::jsonb, 'ladderLength', '[{"input":"beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\"]","output":"5"},{"input":"beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\"]","output":"0"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"beginWord":"hit","endWord":"cog","wordList":["hot","dot","dog","lot","log","cog"]}', '5');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sliding Puzzle', 'On an 2 x 3 board, there are five tiles labeled from 1 to 5, and an empty square represented by 0. A move consists of choosing 0 and a 4-directionally adjacent number and swapping it. The state of the board is solved if: board = [[1,2,3],[4,5,0]]. Return the least number of moves required so that the state of the board is solved. If it is impossible for the state of the board to be solved, return -1.', 'HARD', '["Array","BFS","Matrix"]'::jsonb, '["Nvidia","Intel"]'::jsonb,
        46, 1242, 75, 6210, 2423,
        '["board.length == 2","board[i].length == 3","0 <= board[i][j] <= 5"]'::jsonb, '["BFS to find the shortest path to target state [[1,2,3],[4,5,0]].","Convert 2D board to string for state tracking."]'::jsonb, '{"java":"class Solution {\n    public int slidingPuzzle(int[][] board) {\n        return -1;\n    }\n}","python":"class Solution:\n    def slidingPuzzle(self, board: List[List[int]]) -> int:\n        pass","javascript":"/**\n * @param {number[][]} board\n * @return {number}\n */\nvar slidingPuzzle = function(board) {\n    \n};","cpp":"class Solution {\npublic:\n    int slidingPuzzle(vector<vector<int>>& board) {\n        return -1;\n    }\n};"}'::jsonb, 'slidingPuzzle', '[{"input":"board = [[1,2,3],[4,0,5]]","output":"1"},{"input":"board = [[1,2,3],[5,4,0]]","output":"-1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"board":[[1,2,3],[4,0,5]]}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Snakes and Ladders', 'You are given an n x n integer matrix board where the cells are labeled from 1 to n^2 in a Boustrophedon style starting from the bottom left of the board (i.e. board[n - 1][0]) and alternating direction each row.  Return the least number of moves required to reach the square n^2. If it is not possible to reach the square, return -1.', 'MEDIUM', '["Array","BFS","Matrix"]'::jsonb, '["Nvidia","Airbnb","Google"]'::jsonb,
        81, 3768, 699, 22608, 10193,
        '["n == board.length == board[i].length","2 <= n <= 20","board[i][j] is either -1 or an integer in the range [1, n^2]."]'::jsonb, '["BFS for shortest path from 1 to n^2.","Map 1D coordinate to 2D grid coordinates."]'::jsonb, '{"java":"class Solution {\n    public int snakesAndLadders(int[][] board) {\n        return -1;\n    }\n}","python":"class Solution:\n    def snakesAndLadders(self, board: List[List[int]]) -> int:\n        pass","javascript":"/**\n * @param {number[][]} board\n * @return {number}\n */\nvar snakesAndLadders = function(board) {\n    \n};","cpp":"class Solution {\npublic:\n    int snakesAndLadders(vector<vector<int>>& board) {\n        return -1;\n    }\n};"}'::jsonb, 'snakesAndLadders', '[{"input":"board = [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"board":[[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Evaluate Division', 'You are given an array of variable pairs equations and an array of real numbers values, where equations[i] = [Ai, Bi] and values[i] represent the equation Ai / Bi = values[i]. Each Ai or Bi is a string that represents a single variable. You are also given some queries, where queries[j] = [Cj, Dj] represents the jth query where you must find the answer for Cj / Dj = ?. Return the answers to all queries.', 'MEDIUM', '["Array","DFS","BFS","Union Find","Graph"]'::jsonb, '["Intel"]'::jsonb,
        4, 3400, 636, 10200, 3722,
        '["1 <= equations.length <= 20","equations[i].length == 2","1 <= values.length <= 20"]'::jsonb, '["Model variables as nodes and equations as weighted edges.","For query (a, b), find path product from a to b."]'::jsonb, '{"java":"class Solution {\n    public double[] calcEquation(List<List<String>> equations, double[] values, List<List<String>> queries) {\n        return new double[]{};\n    }\n}","python":"class Solution:\n    def calcEquation(self, equations: List[List[str]], values: List[float], queries: List[List[str]]) -> List[float]:\n        pass","javascript":"/**\n * @param {string[][]} equations\n * @param {number[]} values\n * @param {string[][]} queries\n * @return {number[]}\n */\nvar calcEquation = function(equations, values, queries) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<double> calcEquation(vector<vector<string>>& equations, vector<double>& values, vector<vector<string>>& queries) {\n        return {};\n    }\n};"}'::jsonb, 'calcEquation', '[{"input":"equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"c\"],[\"b\",\"a\"],[\"a\",\"e\"],[\"a\",\"a\"],[\"x\",\"x\"]]","output":"[6.00000,0.50000,-1.00000,1.00000,-1.00000]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"equations":[["a","b"],["b","c"]],"values":[2,3],"queries":[["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]}', '[6.00000,0.50000,-1.00000,1.00000,-1.00000]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Climbing Stairs', 'You are climbing a staircase. It takes n steps to reach the top. Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?', 'EASY', '["Dynamic Programming","Math"]'::jsonb, '["Nvidia"]'::jsonb,
        4, 407, 54, 2035, 792,
        '["1 <= n <= 45"]'::jsonb, '["This is a classic Fibonacci sequence problem.","dp[i] = dp[i-1] + dp[i-2]"]'::jsonb, '{"java":"class Solution {\n    public int climbStairs(int n) {\n        return 0;\n    }\n}","python":"class Solution:\n    def climbStairs(self, n: int) -> int:\n        pass","javascript":"/**\n * @param {number} n\n * @return {number}\n */\nvar climbStairs = function(n) {\n    \n};","cpp":"class Solution {\npublic:\n    int climbStairs(int n) {\n        return 0;\n    }\n};"}'::jsonb, 'climbStairs', '[{"input":"n = 2","output":"2"},{"input":"n = 3","output":"3"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":2}', '2');
    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":3}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'House Robber', 'You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night. Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.', 'MEDIUM', '["Array","Dynamic Programming"]'::jsonb, '["Walmart"]'::jsonb,
        1, 3978, 447, 7956, 2902,
        '["1 <= nums.length <= 100","0 <= nums[i] <= 400"]'::jsonb, '["dp[i] = max(dp[i-1], dp[i-2] + nums[i])"]'::jsonb, '{"java":"class Solution {\n    public int rob(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def rob(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar rob = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int rob(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'rob', '[{"input":"nums = [1,2,3,1]","output":"4"},{"input":"nums = [2,7,9,3,1]","output":"12"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,2,3,1]}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Increasing Subsequence', 'Given an integer array nums, return the length of the longest strictly increasing subsequence.', 'MEDIUM', '["Array","Binary Search","Dynamic Programming"]'::jsonb, '["AMD"]'::jsonb,
        82, 894, 110, 5364, 2739,
        '["1 <= nums.length <= 2500","-10^4 <= nums[i] <= 10^4"]'::jsonb, '["O(n^2) DP: dp[i] = max(dp[j]) + 1 for j < i and nums[j] < nums[i].","O(n log n) using patience sorting/binary search."]'::jsonb, '{"java":"class Solution {\n    public int lengthOfLIS(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def lengthOfLIS(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar lengthOfLIS = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int lengthOfLIS(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'lengthOfLIS', '[{"input":"nums = [10,9,2,5,3,7,101,18]","output":"4"},{"input":"nums = [0,1,0,3,2,3]","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[10,9,2,5,3,7,101,18]}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Common Subsequence', 'Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.', 'MEDIUM', '["String","Dynamic Programming"]'::jsonb, '["Intel","Airbnb","Google","SpaceX"]'::jsonb,
        99, 4155, 344, 12465, 4562,
        '["1 <= text1.length, text2.length <= 1000","text1 and text2 consist of only lowercase English characters."]'::jsonb, '["2D DP array where dp[i][j] is LCS of text1[0..i] and text2[0..j].","If chars match, 1 + dp[i-1][j-1]. Else max(dp[i-1][j], dp[i][j-1])."]'::jsonb, '{"java":"class Solution {\n    public int longestCommonSubsequence(String text1, String text2) {\n        return 0;\n    }\n}","python":"class Solution:\n    def longestCommonSubsequence(self, text1: str, text2: str) -> int:\n        pass","javascript":"/**\n * @param {string} text1\n * @param {string} text2\n * @return {number}\n */\nvar longestCommonSubsequence = function(text1, text2) {\n    \n};","cpp":"class Solution {\npublic:\n    int longestCommonSubsequence(string text1, string text2) {\n        return 0;\n    }\n};"}'::jsonb, 'longestCommonSubsequence', '[{"input":"text1 = \"abcde\", text2 = \"ace\"","output":"3"},{"input":"text1 = \"abc\", text2 = \"abc\"","output":"3"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"text1":"abcde","text2":"ace"}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Coin Change', 'You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money. Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.', 'MEDIUM', '["Array","Dynamic Programming","BFS"]'::jsonb, '["Facebook","SpaceX","Goldman Sachs","LinkedIn"]'::jsonb,
        1, 2973, 89, 17838, 11867,
        '["1 <= coins.length <= 12","1 <= coins[i] <= 2^31 - 1","0 <= amount <= 10^4"]'::jsonb, '["dp[i] = min(dp[i], dp[i - coin] + 1) for each coin."]'::jsonb, '{"java":"class Solution {\n    public int coinChange(int[] coins, int amount) {\n        return -1;\n    }\n}","python":"class Solution:\n    def coinChange(self, coins: List[int], amount: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} coins\n * @param {number} amount\n * @return {number}\n */\nvar coinChange = function(coins, amount) {\n    \n};","cpp":"class Solution {\npublic:\n    int coinChange(vector<int>& coins, int amount) {\n        return -1;\n    }\n};"}'::jsonb, 'coinChange', '[{"input":"coins = [1,2,5], amount = 11","output":"3"},{"input":"coins = [2], amount = 3","output":"-1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"coins":[1,2,5],"amount":11}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Edit Distance', 'Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2. You have the following three operations permitted on a word: Insert a character, Delete a character, Replace a character.', 'MEDIUM', '["String","Dynamic Programming"]'::jsonb, '["LinkedIn"]'::jsonb,
        47, 3819, 443, 22914, 9226,
        '["0 <= word1.length, word2.length <= 500"]'::jsonb, '["2D DP. dp[i][j] is min operations for word1[0..i] to word2[0..j].","If chars are same, dp[i-1][j-1]. Else 1 + min(insert, delete, replace)."]'::jsonb, '{"java":"class Solution {\n    public int minDistance(String word1, String word2) {\n        return 0;\n    }\n}","python":"class Solution:\n    def minDistance(self, word1: str, word2: str) -> int:\n        pass","javascript":"/**\n * @param {string} word1\n * @param {string} word2\n * @return {number}\n */\nvar minDistance = function(word1, word2) {\n    \n};","cpp":"class Solution {\npublic:\n    int minDistance(string word1, string word2) {\n        return 0;\n    }\n};"}'::jsonb, 'minDistance', '[{"input":"word1 = \"horse\", word2 = \"ros\"","output":"3"},{"input":"word1 = \"intention\", word2 = \"execution\"","output":"5"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"word1":"horse","word2":"ros"}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Unique Paths II', 'You are given an m x n integer array grid. There is a robot initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time. An obstacle and space are marked as 1 or 0 respectively in grid. A path that the robot takes cannot include any square that is an obstacle. Return the number of possible unique paths that the robot can take to reach the bottom-right corner.', 'MEDIUM', '["Array","Dynamic Programming","Matrix"]'::jsonb, '["Intel","Uber","Salesforce","Facebook"]'::jsonb,
        4, 1934, 242, 9670, 5586,
        '["m == obstacleGrid.length","n == obstacleGrid[i].length","1 <= m, n <= 100"]'::jsonb, '["If cell has obstacle, dp[i][j] = 0.","Else dp[i][j] = dp[i-1][j] + dp[i][j-1]."]'::jsonb, '{"java":"class Solution {\n    public int uniquePathsWithObstacles(int[][] obstacleGrid) {\n        return 0;\n    }\n}","python":"class Solution:\n    def uniquePathsWithObstacles(self, obstacleGrid: List[List[int]]) -> int:\n        pass","javascript":"/**\n * @param {number[][]} obstacleGrid\n * @return {number}\n */\nvar uniquePathsWithObstacles = function(obstacleGrid) {\n    \n};","cpp":"class Solution {\npublic:\n    int uniquePathsWithObstacles(vector<vector<int>>& obstacleGrid) {\n        return 0;\n    }\n};"}'::jsonb, 'uniquePathsWithObstacles', '[{"input":"obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]","output":"2"},{"input":"obstacleGrid = [[0,1],[0,0]]","output":"1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"obstacleGrid":[[0,0,0],[0,1,0],[0,0,0]]}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Path Sum', 'Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path. You can only move either down or right at any point in time.', 'MEDIUM', '["Array","Dynamic Programming","Matrix"]'::jsonb, '["Intel","Shopify","AMD"]'::jsonb,
        98, 3572, 268, 21432, 12085,
        '["m == grid.length","n == grid[i].length","1 <= m, n <= 200"]'::jsonb, '["dp[i][j] = grid[i][j] + min(dp[i-1][j], dp[i][j-1])"]'::jsonb, '{"java":"class Solution {\n    public int minPathSum(int[][] grid) {\n        return 0;\n    }\n}","python":"class Solution:\n    def minPathSum(self, grid: List[List[int]]) -> int:\n        pass","javascript":"/**\n * @param {number[][]} grid\n * @return {number}\n */\nvar minPathSum = function(grid) {\n    \n};","cpp":"class Solution {\npublic:\n    int minPathSum(vector<vector<int>>& grid) {\n        return 0;\n    }\n};"}'::jsonb, 'minPathSum', '[{"input":"grid = [[1,3,1],[1,5,1],[4,2,1]]","output":"7"},{"input":"grid = [[1,2,3],[4,5,6]]","output":"12"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"grid":[[1,3,1],[1,5,1],[4,2,1]]}', '7');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Maximum Product Subarray', 'Given an integer array nums, find a subarray that has the largest product, and return the product.', 'MEDIUM', '["Array","Dynamic Programming"]'::jsonb, '["Airbnb","Uber","LinkedIn"]'::jsonb,
        24, 2970, 206, 17820, 8736,
        '["1 <= nums.length <= 2 * 10^4","-10 <= nums[i] <= 10"]'::jsonb, '["Keep track of both max product and min product (because of negative numbers).","Swap max and min if number is negative."]'::jsonb, '{"java":"class Solution {\n    public int maxProduct(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def maxProduct(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar maxProduct = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int maxProduct(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'maxProduct', '[{"input":"nums = [2,3,-2,4]","output":"6"},{"input":"nums = [-2,0,-1]","output":"0"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[2,3,-2,4]}', '6');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Palindromic Substring', 'Given a string s, return the longest palindromic substring in s.', 'MEDIUM', '["String","Dynamic Programming"]'::jsonb, '["Facebook"]'::jsonb,
        81, 2704, 230, 13520, 7914,
        '["1 <= s.length <= 1000","s consist of only digits and English letters."]'::jsonb, '["Expand around center strategy is O(n^2).","DP approach: dp[i][j] is true if s[i..j] is palindrome."]'::jsonb, '{"java":"class Solution {\n    public String longestPalindrome(String s) {\n        return \"\";\n    }\n}","python":"class Solution:\n    def longestPalindrome(self, s: str) -> str:\n        pass","javascript":"/**\n * @param {string} s\n * @return {string}\n */\nvar longestPalindrome = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    string longestPalindrome(string s) {\n        return \"\";\n    }\n};"}'::jsonb, 'longestPalindrome', '[{"input":"s = \"babad\"","output":"\"bab\""},{"input":"s = \"cbbd\"","output":"\"bb\""}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"babad"}', 'bab');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Burst Balloons', 'You are given n balloons, indexed from 0 to n - 1. Each balloon is painted with a number on it represented by an array nums. You are asked to burst all the balloons. If you burst the ith balloon, you will get nums[i - 1] * nums[i] * nums[i + 1] coins. Return the maximum coins you can collect by bursting the balloons wisely.', 'HARD', '["Array","Dynamic Programming"]'::jsonb, '["Microsoft","Spotify","Cisco","Intel"]'::jsonb,
        35, 861, 69, 1722, 995,
        '["n == nums.length","1 <= n <= 300","0 <= nums[i] <= 100"]'::jsonb, '["Work backwards: think about which balloon is burst LAST.","dp[i][j] is max coins for range i to j."]'::jsonb, '{"java":"class Solution {\n    public int maxCoins(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def maxCoins(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar maxCoins = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int maxCoins(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'maxCoins', '[{"input":"nums = [3,1,5,8]","output":"167"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[3,1,5,8]}', '167');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'N-Queens', 'The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other. Given an integer n, return all distinct solutions to the n-queens puzzle. You may return the answer in any order.', 'HARD', '["Backtracking","Array"]'::jsonb, '["Airbnb","Salesforce","AMD"]'::jsonb,
        53, 4247, 38, 16988, 6352,
        '["1 <= n <= 9"]'::jsonb, '["Place queens row by row.","Use arrays/sets to keep track of occupied columns and diagonals."]'::jsonb, '{"java":"class Solution {\n    public List<List<String>> solveNQueens(int n) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def solveNQueens(self, n: int) -> List[List[str]]:\n        pass","javascript":"/**\n * @param {number} n\n * @return {string[][]}\n */\nvar solveNQueens = function(n) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<string>> solveNQueens(int n) {\n        return {};\n    }\n};"}'::jsonb, 'solveNQueens', '[{"input":"n = 4","output":"[[\".Q..\",\"...Q\",\"Q...\",\"..Q.\"],[\"..Q.\",\"Q...\",\"...Q\",\".Q..\"]]"},{"input":"n = 1","output":"[[\"Q\"]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":4}', '[[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sudoku Solver', 'Write a program to solve a Sudoku puzzle by filling the empty cells. A sudoku solution must satisfy all of the following rules: Each of the digits 1-9 must occur exactly once in each row. Each of the digits 1-9 must occur exactly once in each column. Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid. The ''.'' character indicates empty cells.', 'HARD', '["Array","Backtracking","Matrix"]'::jsonb, '["Netflix","Google","SpaceX"]'::jsonb,
        12, 1339, 109, 2678, 1440,
        '["board.length == 9","board[i].length == 9","board[i][j] is a digit or ''.''."]'::jsonb, '["Try filling a cell with 1-9 and recursively check if it leads to a solution.","Backtrack if valid number is not found."]'::jsonb, '{"java":"class Solution {\n    public void solveSudoku(char[][] board) {\n        \n    }\n}","python":"class Solution:\n    def solveSudoku(self, board: List[List[str]]) -> None:\n        \"\"\"\n        Do not return anything, modify board in-place.\n        \"\"\"\n        pass","javascript":"/**\n * @param {character[][]} board\n * @return {void} Do not return anything, modify board in-place.\n */\nvar solveSudoku = function(board) {\n    \n};","cpp":"class Solution {\npublic:\n    void solveSudoku(vector<vector<char>>& board) {\n        \n    }\n};"}'::jsonb, 'solveSudoku', '[{"input":"board = [[\"5\",\"3\",\".\",\".\",\"7\",\".\",\".\",\".\",\".\"],...]","output":"[[\"5\",\"3\",\"4\",\"6\",\"7\",\"8\",\"9\",\"1\",\"2\"],...]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Permutations', 'Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.', 'MEDIUM', '["Array","Backtracking"]'::jsonb, '["Apple","Oracle","Amazon"]'::jsonb,
        65, 4165, 155, 20825, 10323,
        '["1 <= nums.length <= 6","-10 <= nums[i] <= 10","All the integers of nums are unique."]'::jsonb, '["Use backtracking to swap elements.","Or build permutations by adding one element at a time."]'::jsonb, '{"java":"class Solution {\n    public List<List<Integer>> permute(int[] nums) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def permute(self, nums: List[int]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number[][]}\n */\nvar permute = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> permute(vector<int>& nums) {\n        return {};\n    }\n};"}'::jsonb, 'permute', '[{"input":"nums = [1,2,3]","output":"[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]"},{"input":"nums = [0,1]","output":"[[0,1],[1,0]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0,1]}', '[[0,1],[1,0]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Subsets', 'Given an integer array nums of unique elements, return all possible subsets (the power set). The solution set must not contain duplicate subsets. Return the solution in any order.', 'MEDIUM', '["Array","Backtracking","Bit Manipulation"]'::jsonb, '["AMD"]'::jsonb,
        21, 2927, 96, 5854, 2437,
        '["1 <= nums.length <= 10","-10 <= nums[i] <= 10","All the numbers of nums are unique."]'::jsonb, '["For each element, there are 2 choices: include or exclude.","Backtracking or Bitmasking (0 to 2^n - 1)."]'::jsonb, '{"java":"class Solution {\n    public List<List<Integer>> subsets(int[] nums) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def subsets(self, nums: List[int]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number[][]}\n */\nvar subsets = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> subsets(vector<int>& nums) {\n        return {};\n    }\n};"}'::jsonb, 'subsets', '[{"input":"nums = [1,2,3]","output":"[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]"},{"input":"nums = [0]","output":"[[],[0]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[0]}', '[[],[0]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Word Search', 'Given an m x n grid of characters board and a string word, return true if word exists in the grid. The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.', 'MEDIUM', '["Array","Backtracking","Matrix"]'::jsonb, '["AMD"]'::jsonb,
        4, 3426, 270, 10278, 3622,
        '["m == board.length","n = board[i].length","1 <= m, n <= 6","1 <= word.length <= 15"]'::jsonb, '["Start DFS from every cell ensuring it matches the first char of word.","Mark visited cells to avoid cycles."]'::jsonb, '{"java":"class Solution {\n    public boolean exist(char[][] board, String word) {\n        return false;\n    }\n}","python":"class Solution:\n    def exist(self, board: List[List[str]], word: str) -> bool:\n        pass","javascript":"/**\n * @param {character[][]} board\n * @param {string} word\n * @return {boolean}\n */\nvar exist = function(board, word) {\n    \n};","cpp":"class Solution {\npublic:\n    bool exist(vector<vector<char>>& board, string word) {\n        return false;\n    }\n};"}'::jsonb, 'exist', '[{"input":"board = [[\"A\",\"B\",\"C\",\"E\"],[\"S\",\"F\",\"C\",\"S\"],[\"A\",\"D\",\"E\",\"E\"]], word = \"ABCCED\"","output":"true"},{"input":"board = [[\"A\",\"B\",\"C\",\"E\"],[\"S\",\"F\",\"C\",\"S\"],[\"A\",\"D\",\"E\",\"E\"]], word = \"SEE\"","output":"true"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"board":[["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]],"word":"ABCCED"}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Partition Equal Subset Sum', 'Given an integer array nums, return true if you can partition the array into two subsets such that the sum of the elements in both subsets is equal or false otherwise.', 'MEDIUM', '["Array","Dynamic Programming"]'::jsonb, '["Amazon","Walmart"]'::jsonb,
        35, 533, 58, 2665, 1560,
        '["1 <= nums.length <= 200","1 <= nums[i] <= 100"]'::jsonb, '["This is a 0/1 Knapsack problem variant.","Target sum is sum(nums) / 2."]'::jsonb, '{"java":"class Solution {\n    public boolean canPartition(int[] nums) {\n        return false;\n    }\n}","python":"class Solution:\n    def canPartition(self, nums: List[int]) -> bool:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {boolean}\n */\nvar canPartition = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    bool canPartition(vector<int>& nums) {\n        return false;\n    }\n};"}'::jsonb, 'canPartition', '[{"input":"nums = [1,5,11,5]","output":"true"},{"input":"nums = [1,2,3,5]","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,5,11,5]}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Generate Parentheses', 'Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.', 'MEDIUM', '["String","Dynamic Programming","Backtracking"]'::jsonb, '["AMD","Adobe"]'::jsonb,
        3, 3243, 411, 6486, 2984,
        '["1 <= n <= 8"]'::jsonb, '["Backtracking: keep count of open and close brackets.","Add '')'' only if close < open."]'::jsonb, '{"java":"class Solution {\n    public List<String> generateParenthesis(int n) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def generateParenthesis(self, n: int) -> List[str]:\n        pass","javascript":"/**\n * @param {number} n\n * @return {string[]}\n */\nvar generateParenthesis = function(n) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<string> generateParenthesis(int n) {\n        return {};\n    }\n};"}'::jsonb, 'generateParenthesis', '[{"input":"n = 3","output":"[\"((()))\",\"(()())\",\"(())()\",\"()(())\",\"()()()\"]"},{"input":"n = 1","output":"[\"()\"]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":1}', '["()"]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Wildcard Matching', 'Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for ''?'' and ''*''. ''?'' Matches any single character. ''*'' Matches any sequence of characters (including the empty sequence). The matching should cover the entire input string (not partial).', 'HARD', '["String","Dynamic Programming","Greedy","Recursion"]'::jsonb, '["Target","AMD","Nvidia","LinkedIn"]'::jsonb,
        70, 1823, 85, 5469, 2963,
        '["0 <= s.length, p.length <= 2000","s contains only lowercase English letters.","p contains only lowercase English letters, ''?'' or ''*''."]'::jsonb, '["DP: dp[i][j] is true if s[0..i] matches p[0..j].","If p[j] == ''*'', it matches empty sequence or any sequence."]'::jsonb, '{"java":"class Solution {\n    public boolean isMatch(String s, String pattern) {\n        return false;\n    }\n}","python":"class Solution:\n    def isMatch(self, s: str, p: str) -> bool:\n        pass","javascript":"/**\n * @param {string} s\n * @param {string} p\n * @return {boolean}\n */\nvar isMatch = function(s, p) {\n    \n};","cpp":"class Solution {\npublic:\n    bool isMatch(string s, string p) {\n        return false;\n    }\n};"}'::jsonb, 'isMatch', '[{"input":"s = \"aa\", p = \"a\"","output":"false"},{"input":"s = \"aa\", p = \"*\"","output":"true"},{"input":"s = \"cb\", p = \"?a\"","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"aa","p":"*"}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Best Time to Buy and Sell Stock III', 'You are given an array prices where prices[i] is the price of a given stock on the ith day. Find the maximum profit you can achieve. You may complete at most two transactions. Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).', 'HARD', '["Array","Dynamic Programming"]'::jsonb, '["JPMorgan"]'::jsonb,
        57, 3139, 127, 15695, 7562,
        '["1 <= prices.length <= 10^5","0 <= prices[i] <= 10^5"]'::jsonb, '["Use 4 variables: buy1, sell1, buy2, sell2.","Or DP state: dp[k][i] max profit with k transactions up to day i."]'::jsonb, '{"java":"class Solution {\n    public int maxProfit(int[] prices) {\n        return 0;\n    }\n}","python":"class Solution:\n    def maxProfit(self, prices: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} prices\n * @return {number}\n */\nvar maxProfit = function(prices) {\n    \n};","cpp":"class Solution {\npublic:\n    int maxProfit(vector<int>& prices) {\n        return 0;\n    }\n};"}'::jsonb, 'maxProfit', '[{"input":"prices = [3,3,5,0,0,3,1,4]","output":"6"},{"input":"prices = [1,2,3,4,5]","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"prices":[3,3,5,0,0,3,1,4]}', '6');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Combination Sum', 'Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order. The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.', 'MEDIUM', '["Array","Backtracking"]'::jsonb, '["Adobe","Facebook","Salesforce"]'::jsonb,
        57, 3137, 423, 15685, 7380,
        '["1 <= candidates.length <= 30","2 <= candidates[i] <= 40","All elements of candidates are distinct.","1 <= target <= 40"]'::jsonb, '["Backtracking: At each step, choose a candidate.","Allow reusing the same candidate index."]'::jsonb, '{"java":"class Solution {\n    public List<List<Integer>> combinationSum(int[] candidates, int target) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[]} candidates\n * @param {number} target\n * @return {number[][]}\n */\nvar combinationSum = function(candidates, target) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> combinationSum(vector<int>& candidates, int target) {\n        return {};\n    }\n};"}'::jsonb, 'combinationSum', '[{"input":"candidates = [2,3,6,7], target = 7","output":"[[2,2,3],[7]]"},{"input":"candidates = [2,3,5], target = 8","output":"[[2,2,2,2],[2,3,3],[3,5]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"candidates":[2,3,6,7],"target":7}', '[[2,2,3],[7]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Palindrome Partitioning', 'Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.', 'MEDIUM', '["String","Dynamic Programming","Backtracking"]'::jsonb, '["Tesla"]'::jsonb,
        23, 1736, 129, 6944, 3558,
        '["1 <= s.length <= 16","s contains only lowercase English letters."]'::jsonb, '["Backtracking with DP to check palindrome efficiently."]'::jsonb, '{"java":"class Solution {\n    public List<List<String>> partition(String s) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def partition(self, s: str) -> List[List[str]]:\n        pass","javascript":"/**\n * @param {string} s\n * @return {string[][]}\n */\nvar partition = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<string>> partition(string s) {\n        return {};\n    }\n};"}'::jsonb, 'partition', '[{"input":"s = \"aab\"","output":"[[\"a\",\"a\",\"b\"],[\"aa\",\"b\"]]"},{"input":"s = \"a\"","output":"[[\"a\"]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"aab"}', '[["a","a","b"],["aa","b"]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Target Sum', 'You are given an integer array nums and an integer target. You want to build an expression out of nums by adding one of the symbols ''+'' and ''-'' before each integer in nums and then concatenate all the integers. Return the number of different expressions that you can build, which evaluates to target.', 'MEDIUM', '["Array","Dynamic Programming","Backtracking"]'::jsonb, '["Spotify","Cisco","Walmart"]'::jsonb,
        100, 2236, 100, 6708, 3027,
        '["1 <= nums.length <= 20","0 <= nums[i] <= 1000","0 <= sum(nums[i]) <= 1000","-1000 <= target <= 1000"]'::jsonb, '["This is a Subset Sum variant: Find a subset P (positive) and N (negative) such that sum(P) - sum(N) = target.","Transform to: sum(P) = (target + sum(nums)) / 2."]'::jsonb, '{"java":"class Solution {\n    public int findTargetSumWays(int[] nums, int target) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findTargetSumWays(self, nums: List[int], target: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number}\n */\nvar findTargetSumWays = function(nums, target) {\n    \n};","cpp":"class Solution {\npublic:\n    int findTargetSumWays(vector<int>& nums, int target) {\n        return 0;\n    }\n};"}'::jsonb, 'findTargetSumWays', '[{"input":"nums = [1,1,1,1,1], target = 3","output":"5"},{"input":"nums = [1], target = 1","output":"1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,1,1,1,1],"target":3}', '5');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Maximal Square', 'Given an m x n binary matrix filled with 0s and 1s, find the largest square containing only 1s and return its area.', 'MEDIUM', '["Array","Dynamic Programming","Matrix"]'::jsonb, '["SpaceX","Salesforce","Intel","Amazon"]'::jsonb,
        71, 1145, 63, 4580, 3175,
        '["m == matrix.length","n == matrix[i].length","1 <= m, n <= 300","matrix[i][j] is ''0'' or ''1''."]'::jsonb, '["dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1 if matrix[i][j] == ''1''."]'::jsonb, '{"java":"class Solution {\n    public int maximalSquare(char[][] matrix) {\n        return 0;\n    }\n}","python":"class Solution:\n    def maximalSquare(self, matrix: List[List[str]]) -> int:\n        pass","javascript":"/**\n * @param {character[][]} matrix\n * @return {number}\n */\nvar maximalSquare = function(matrix) {\n    \n};","cpp":"class Solution {\npublic:\n    int maximalSquare(vector<vector<char>>& matrix) {\n        return 0;\n    }\n};"}'::jsonb, 'maximalSquare', '[{"input":"matrix = [[\"1\",\"0\",\"1\",\"0\",\"0\"],[\"1\",\"0\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"0\",\"0\",\"1\",\"0\"]]","output":"4"},{"input":"matrix = [[\"0\",\"1\"],[\"1\",\"0\"]]","output":"1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"matrix":[["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Letter Combinations of a Phone Number', 'Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.', 'MEDIUM', '["String","Backtracking","Hash Table"]'::jsonb, '["Shopify","JPMorgan","Facebook","Twitter"]'::jsonb,
        38, 4520, 66, 22600, 12605,
        '["0 <= digits.length <= 4","digits[i] is a digit in the range [''2'', ''9'']."]'::jsonb, '["Backtracking: Iterate through letters for current digit and recurse."]'::jsonb, '{"java":"class Solution {\n    public List<String> letterCombinations(String digits) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def letterCombinations(self, digits: str) -> List[str]:\n        pass","javascript":"/**\n * @param {string} digits\n * @return {string[]}\n */\nvar letterCombinations = function(digits) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<string> letterCombinations(string digits) {\n        return {};\n    }\n};"}'::jsonb, 'letterCombinations', '[{"input":"digits = \"23\"","output":"[\"ad\",\"ae\",\"af\",\"bd\",\"be\",\"bf\",\"cd\",\"ce\",\"cf\"]"},{"input":"digits = \"\"","output":"[]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"digits":"23"}', '["ad","ae","af","bd","be","bf","cd","ce","cf"]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Decode Ways', 'A message containing letters from A-Z can be encoded into numbers using the following mapping: ''A'' -> "1", ''B'' -> "2", ... ''Z'' -> "26". To decode an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above. Given a string s containing only digits, return the number of ways to decode it.', 'MEDIUM', '["String","Dynamic Programming"]'::jsonb, '["Stripe"]'::jsonb,
        15, 4485, 329, 26910, 9522,
        '["1 <= s.length <= 100","s contains only digits and may contain leading zero(s)."]'::jsonb, '["dp[i] = dp[i-1] (if single digit valid) + dp[i-2] (if two digits valid).","Watch out for ''0''."]'::jsonb, '{"java":"class Solution {\n    public int numDecodings(String s) {\n        return 0;\n    }\n}","python":"class Solution:\n    def numDecodings(self, s: str) -> int:\n        pass","javascript":"/**\n * @param {string} s\n * @return {number}\n */\nvar numDecodings = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    int numDecodings(string s) {\n        return 0;\n    }\n};"}'::jsonb, 'numDecodings', '[{"input":"s = \"12\"","output":"2"},{"input":"s = \"226\"","output":"3"},{"input":"s = \"06\"","output":"0"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"12"}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Jump Game', 'You are given an integer array nums. You are initially positioned at the array''s first index, and each element in the array represents your maximum jump length at that position. Return true if you can reach the last index, or false otherwise.', 'MEDIUM', '["Array","Dynamic Programming","Greedy"]'::jsonb, '["Stripe","Cisco"]'::jsonb,
        11, 3772, 40, 18860, 6604,
        '["1 <= nums.length <= 10^4","0 <= nums[i] <= 10^5"]'::jsonb, '["Greedy: Track the furthest reachable index.","Iterate and update max reach."]'::jsonb, '{"java":"class Solution {\n    public boolean canJump(int[] nums) {\n        return false;\n    }\n}","python":"class Solution:\n    def canJump(self, nums: List[int]) -> bool:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {boolean}\n */\nvar canJump = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    bool canJump(vector<int>& nums) {\n        return false;\n    }\n};"}'::jsonb, 'canJump', '[{"input":"nums = [2,3,1,1,4]","output":"true"},{"input":"nums = [3,2,1,0,4]","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[2,3,1,1,4]}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Gas Station', 'There are n gas stations along a circular route, where the amount of gas at the ith station is gas[i]. You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from the ith station to its next (i + 1)th station. You begin the journey with an empty tank at one of the gas stations. Given two integer arrays gas and cost, return the starting gas station''s index if you can travel around the circuit once in the clockwise direction, otherwise return -1. If there exists a solution, it is guaranteed to be unique.', 'MEDIUM', '["Array","Greedy"]'::jsonb, '["Apple"]'::jsonb,
        36, 4907, 426, 14721, 5735,
        '["n == gas.length == cost.length","1 <= n <= 10^5"]'::jsonb, '["If total gas < total cost, impossible.","Greedy: If current tank < 0, reset start to next station."]'::jsonb, '{"java":"class Solution {\n    public int canCompleteCircuit(int[] gas, int[] cost) {\n        return -1;\n    }\n}","python":"class Solution:\n    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} gas\n * @param {number[]} cost\n * @return {number}\n */\nvar canCompleteCircuit = function(gas, cost) {\n    \n};","cpp":"class Solution {\npublic:\n    int canCompleteCircuit(vector<int>& gas, vector<int>& cost) {\n        return -1;\n    }\n};"}'::jsonb, 'canCompleteCircuit', '[{"input":"gas = [1,2,3,4,5], cost = [3,4,5,1,2]","output":"3"},{"input":"gas = [2,3,4], cost = [3,4,3]","output":"-1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"gas":[1,2,3,4,5],"cost":[3,4,5,1,2]}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Candy', 'There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings. You are giving candies to these children subjected to the following requirements: Each child must have at least one candy. Children with a higher rating get more candies than their neighbors. Return the minimum number of candies you need to have to distribute the candies to the children.', 'HARD', '["Array","Greedy"]'::jsonb, '["Bloomberg","Twitter","Apple"]'::jsonb,
        17, 2000, 168, 10000, 3399,
        '["n == ratings.length","1 <= n <= 2 * 10^4","0 <= ratings[i] <= 2 * 10^4"]'::jsonb, '["Two passes: Left to right (satisfy left neighbor), Right to left (satisfy right neighbor).","Take max of both passes."]'::jsonb, '{"java":"class Solution {\n    public int candy(int[] ratings) {\n        return 0;\n    }\n}","python":"class Solution:\n    def candy(self, ratings: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} ratings\n * @return {number}\n */\nvar candy = function(ratings) {\n    \n};","cpp":"class Solution {\npublic:\n    int candy(vector<int>& ratings) {\n        return 0;\n    }\n};"}'::jsonb, 'candy', '[{"input":"ratings = [1,0,2]","output":"5"},{"input":"ratings = [1,2,2]","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"ratings":[1,0,2]}', '5');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Merge Intervals', 'Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.', 'MEDIUM', '["Array","Sorting","Greedy"]'::jsonb, '["Shopify","Stripe","Uber","Morgan Stanley"]'::jsonb,
        57, 654, 4, 3924, 2542,
        '["1 <= intervals.length <= 10^4","intervals[i].length == 2","0 <= starti <= endi <= 10^4"]'::jsonb, '["Sort by start time.","Iterate and merge if overlap (end >= next.start)."]'::jsonb, '{"java":"class Solution {\n    public int[][] merge(int[][] intervals) {\n        return new int[][]{};\n    }\n}","python":"class Solution:\n    def merge(self, intervals: List[List[int]]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[][]} intervals\n * @return {number[][]}\n */\nvar merge = function(intervals) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> merge(vector<vector<int>>& intervals) {\n        return {};\n    }\n};"}'::jsonb, 'merge', '[{"input":"intervals = [[1,3],[2,6],[8,10],[15,18]]","output":"[[1,6],[8,10],[15,18]]"},{"input":"intervals = [[1,4],[4,5]]","output":"[[1,5]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"intervals":[[1,3],[2,6],[8,10],[15,18]]}', '[[1,6],[8,10],[15,18]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Non-overlapping Intervals', 'Given an array of intervals intervals where intervals[i] = [starti, endi], return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.', 'MEDIUM', '["Array","Dynamic Programming","Greedy","Sorting"]'::jsonb, '["JPMorgan","Intel"]'::jsonb,
        64, 2828, 68, 16968, 10388,
        '["1 <= intervals.length <= 10^5","intervals[i].length == 2","starti < endi"]'::jsonb, '["Greedy: Sort by end time.","Keep the interval ending earliest to leave room for others."]'::jsonb, '{"java":"class Solution {\n    public int eraseOverlapIntervals(int[][] intervals) {\n        return 0;\n    }\n}","python":"class Solution:\n    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:\n        pass","javascript":"/**\n * @param {number[][]} intervals\n * @return {number}\n */\nvar eraseOverlapIntervals = function(intervals) {\n    \n};","cpp":"class Solution {\npublic:\n    int eraseOverlapIntervals(vector<vector<int>>& intervals) {\n        return 0;\n    }\n};"}'::jsonb, 'eraseOverlapIntervals', '[{"input":"intervals = [[1,2],[2,3],[3,4],[1,3]]","output":"1"},{"input":"intervals = [[1,2],[1,2],[1,2]]","output":"2"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"intervals":[[1,2],[2,3],[3,4],[1,3]]}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Lemonade Change', 'At a lemonade stand, each lemonade costs $5. Customers are standing in a queue to buy from you and order one at a time. Each customer will only buy one lemonade and pay with either a $5, $10, or $20 bill. You must provide the correct change to each customer so that the net transaction is that the customer pays $5. Return true if you can provide every customer with correct change, or false otherwise.', 'EASY', '["Array","Greedy"]'::jsonb, '["Target","ByteDance","Stripe"]'::jsonb,
        37, 4791, 205, 19164, 8288,
        '["1 <= bills.length <= 10^5","bills[i] is either 5, 10, or 20."]'::jsonb, '["Track count of $5s and $10s.","Greedy: For $20 bill, prefer giving one $10 and one $5."]'::jsonb, '{"java":"class Solution {\n    public boolean lemonadeChange(int[] bills) {\n        return false;\n    }\n}","python":"class Solution:\n    def lemonadeChange(self, bills: List[int]) -> bool:\n        pass","javascript":"/**\n * @param {number[]} bills\n * @return {boolean}\n */\nvar lemonadeChange = function(bills) {\n    \n};","cpp":"class Solution {\npublic:\n    bool lemonadeChange(vector<int>& bills) {\n        return false;\n    }\n};"}'::jsonb, 'lemonadeChange', '[{"input":"bills = [5,5,5,10,20]","output":"true"},{"input":"bills = [5,5,10,10,20]","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"bills":[5,5,5,10,20]}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Next Greater Element I', 'The next greater element of some element x in an array is the first greater element that is to the right of x in the same array. You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2. For each 0 <= i < nums1.length, find the index j such that nums1[i] == nums2[j] and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is -1.', 'EASY', '["Array","Hash Table","Stack","Monotonic Stack"]'::jsonb, '["Cisco","Spotify"]'::jsonb,
        17, 1616, 284, 8080, 3971,
        '["1 <= nums1.length <= nums2.length <= 1000","0 <= nums1[i], nums2[i] <= 10^4","All integers in nums1 and nums2 are unique."]'::jsonb, '["Use a monotonic stack to find next greater element for all items in nums2.","Store results in a map."]'::jsonb, '{"java":"class Solution {\n    public int[] nextGreaterElement(int[] nums1, int[] nums2) {\n        return new int[]{};\n    }\n}","python":"class Solution:\n    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} nums1\n * @param {number[]} nums2\n * @return {number[]}\n */\nvar nextGreaterElement = function(nums1, nums2) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> nextGreaterElement(vector<int>& nums1, vector<int>& nums2) {\n        return {};\n    }\n};"}'::jsonb, 'nextGreaterElement', '[{"input":"nums1 = [4,1,2], nums2 = [1,3,4,2]","output":"[-1,3,-1]"},{"input":"nums1 = [2,4], nums2 = [1,2,3,4]","output":"[3,-1]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums1":[4,1,2],"nums2":[1,3,4,2]}', '[-1,3,-1]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Daily Temperatures', 'Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0.', 'MEDIUM', '["Array","Stack","Monotonic Stack"]'::jsonb, '["Intel","Target"]'::jsonb,
        46, 3012, 146, 12048, 6476,
        '["1 <= temperatures.length <= 10^5","30 <= temperatures[i] <= 100"]'::jsonb, '["Stack stores indices. While current temp > stack top temp, pop and resolve."]'::jsonb, '{"java":"class Solution {\n    public int[] dailyTemperatures(int[] temperatures) {\n        return new int[]{};\n    }\n}","python":"class Solution:\n    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} temperatures\n * @return {number[]}\n */\nvar dailyTemperatures = function(temperatures) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> dailyTemperatures(vector<int>& temperatures) {\n        return {};\n    }\n};"}'::jsonb, 'dailyTemperatures', '[{"input":"temperatures = [73,74,75,71,69,72,76,73]","output":"[1,1,4,2,1,1,0,0]"},{"input":"temperatures = [30,40,50,60]","output":"[1,1,1,0]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"temperatures":[73,74,75,71,69,72,76,73]}', '[1,1,4,2,1,1,0,0]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Largest Rectangle in Histogram', 'Given an array of integers heights representing the histogram''s bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.', 'HARD', '["Array","Stack","Monotonic Stack"]'::jsonb, '["Intel","LinkedIn"]'::jsonb,
        82, 2081, 261, 10405, 7234,
        '["1 <= heights.length <= 10^5","0 <= heights[i] <= 10^4"]'::jsonb, '["For each bar, find the first smaller bar to left and right.","Use monotonic stack to find boundaries."]'::jsonb, '{"java":"class Solution {\n    public int largestRectangleArea(int[] heights) {\n        return 0;\n    }\n}","python":"class Solution:\n    def largestRectangleArea(self, heights: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} heights\n * @return {number}\n */\nvar largestRectangleArea = function(heights) {\n    \n};","cpp":"class Solution {\npublic:\n    int largestRectangleArea(vector<int>& heights) {\n        return 0;\n    }\n};"}'::jsonb, 'largestRectangleArea', '[{"input":"heights = [2,1,5,6,2,3]","output":"10"},{"input":"heights = [2,4]","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"heights":[2,1,5,6,2,3]}', '10');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Online Stock Span', 'Design an algorithm that collects daily price quotes for some stock and returns the span of that stock''s price for the current day. The span of the stock''s price in one day is the maximum number of consecutive days (starting from that day and going backward) for which the stock price was less than or equal to the price of that day.', 'MEDIUM', '["Stack","Design","Monotonic Stack","Data Stream"]'::jsonb, '["Twitter","Oracle","Uber","ByteDance"]'::jsonb,
        90, 469, 30, 2814, 1408,
        '["Prices are positive.","At most 10^4 calls."]'::jsonb, '["Maintain a monotonic stack of (price, span) pairs.","If current price >= stack top, pop and add span."]'::jsonb, '{"java":"class StockSpanner {\n    public StockSpanner() {\n        \n    }\n    public int next(int price) {\n        return 0;\n    }\n}","python":"class StockSpanner:\n    def __init__(self):\n        pass\n    def next(self, price: int) -> int:\n        pass","javascript":"\nvar StockSpanner = function() {\n    \n};\n\n/** \n * @param {number} price\n * @return {number}\n */\nStockSpanner.prototype.next = function(price) {\n    \n};","cpp":"class StockSpanner {\npublic:\n    StockSpanner() {\n        \n    }\n    \n    int next(int price) {\n        return 0;\n    }\n};"}'::jsonb, 'next', '[{"input":"price = [100, 80, 60, 70, 60, 75, 85]","output":"[1, 1, 1, 2, 1, 4, 6]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Redundant Connection', 'In this problem, a tree is an undirected graph that is connected and has no cycles. You are given a graph that started as a tree with n nodes labeled from 1 to n, with one additional edge added. The added edge has two different vertices chosen from 1 to n, and was not an edge that already existed. The graph is represented as an array edges of length n where edges[i] = [ai, bi] indicates that there is an edge between nodes ai and bi in the graph. Return an edge that can be removed so that the resulting graph is a tree of n nodes.', 'MEDIUM', '["DFS","BFS","Union Find","Graph"]'::jsonb, '["Amazon"]'::jsonb,
        35, 3360, 640, 6720, 4571,
        '["n == edges.length","3 <= n <= 1000","edges[i].length == 2","1 <= ai < bi <= n"]'::jsonb, '["Use Union-Find.","If adding an edge connects two already connected nodes, that''s the redundant one."]'::jsonb, '{"java":"class Solution {\n    public int[] findRedundantConnection(int[][] edges) {\n        return new int[]{};\n    }\n}","python":"class Solution:\n    def findRedundantConnection(self, edges: List[List[int]]) -> List[int]:\n        pass","javascript":"/**\n * @param {number[][]} edges\n * @return {number[]}\n */\nvar findRedundantConnection = function(edges) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> findRedundantConnection(vector<vector<int>>& edges) {\n        return {};\n    }\n};"}'::jsonb, 'findRedundantConnection', '[{"input":"edges = [[1,2],[1,3],[2,3]]","output":"[2,3]"},{"input":"edges = [[1,2],[2,3],[3,4],[1,4],[1,5]]","output":"[1,4]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"edges":[[1,2],[1,3],[2,3]]}', '[2,3]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Accounts Merge', 'Given a list of accounts where each element accounts[i] is a list of strings, where the first element accounts[i][0] is a name, and the rest of the elements are emails representing emails of the account. Now, we would like to merge these accounts. Two accounts definitely belong to the same person if there is some common email to both accounts. Return the accounts in the following format: the first element of each account is the name, and the rest of the elements are emails in sorted order. The accounts themselves can be returned in any order.', 'MEDIUM', '["Array","DFS","BFS","Union Find","Hash Table"]'::jsonb, '["Twitter"]'::jsonb,
        5, 3900, 397, 15600, 5193,
        '["1 <= accounts.length <= 1000","2 <= accounts[i].length <= 10","1 <= accounts[i][j].length <= 30"]'::jsonb, '["Use Union-Find to group component emails.","Map email to ID."]'::jsonb, '{"java":"class Solution {\n    public List<List<String>> accountsMerge(List<List<String>> accounts) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def accountsMerge(self, accounts: List[List[str]]) -> List[List[str]]:\n        pass","javascript":"/**\n * @param {string[][]} accounts\n * @return {string[][কান\n */\nvar accountsMerge = function(accounts) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<string>> accountsMerge(vector<vector<string>>& accounts) {\n        return {};\n    }\n};"}'::jsonb, 'accountsMerge', '[{"input":"accounts = [[\"John\",\"johnsmith@mail.com\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\",\"john00@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]","output":"[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"accounts":[["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]}', '[["John","john00@mail.com","john_newyork@mail.com","johnsmith@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Consecutive Sequence', 'Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence. You must write an algorithm that runs in O(n) time.', 'MEDIUM', '["Array","Hash Table","Union Find"]'::jsonb, '["Intel","Shopify","Adobe"]'::jsonb,
        58, 3757, 171, 18785, 6869,
        '["0 <= nums.length <= 10^5","-10^9 <= nums[i] <= 10^9"]'::jsonb, '["Use a HashSet to store numbers for O(1) lookup.","Or use Union-Find on adjacent numbers."]'::jsonb, '{"java":"class Solution {\n    public int longestConsecutive(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def longestConsecutive(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar longestConsecutive = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int longestConsecutive(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'longestConsecutive', '[{"input":"nums = [100,4,200,1,3,2]","output":"4"},{"input":"nums = [0,3,7,2,5,8,4,6,0,1]","output":"9"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[100,4,200,1,3,2]}', '4');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Number of Operations to Make Network Connected', 'There are n computers numbered from 0 to n - 1 connected by ethernet cables connections forming a network where connections[i] = [a, b] represents a connection between computers a and b. Any computer can reach any other computer directly or indirectly through the network. You are given an initial computer network connections. You can extract certain cables between two directly connected computers, and place them between any pair of disconnected computers to make them directly connected. Return the minimum number of times you need to do this in order to make all the computers connected. If it is not possible, return -1.', 'MEDIUM', '["DFS","BFS","Union Find","Graph"]'::jsonb, '["Apple","Intel"]'::jsonb,
        34, 2839, 426, 11356, 3974,
        '["1 <= n <= 10^5","1 <= connections.length <= 10^5","connections[i].length == 2"]'::jsonb, '["Need at least n-1 cables.","Count connected components k. Ans is k-1."]'::jsonb, '{"java":"class Solution {\n    public int makeConnected(int n, int[][] connections) {\n        return 0;\n    }\n}","python":"class Solution:\n    def makeConnected(self, n: int, connections: List[List[int]]) -> int:\n        pass","javascript":"/**\n * @param {number} n\n * @param {number[][]} connections\n * @return {number}\n */\nvar makeConnected = function(n, connections) {\n    \n};","cpp":"class Solution {\npublic:\n    int makeConnected(int n, vector<vector<int>>& connections) {\n        return 0;\n    }\n};"}'::jsonb, 'makeConnected', '[{"input":"n = 4, connections = [[0,1],[0,2],[1,2]]","output":"1"},{"input":"n = 6, connections = [[0,1],[0,2],[0,3],[1,2],[1,3]]","output":"2"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":4,"connections":[[0,1],[0,2],[1,2]]}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Implement Trie (Prefix Tree)', 'A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker. Implement the Trie class.', 'MEDIUM', '["Hash Table","String","Design","Trie"]'::jsonb, '["JPMorgan","Tesla","Goldman Sachs"]'::jsonb,
        30, 4362, 520, 8724, 5962,
        '["1 <= word.length <= 2000","word consists of lowercase English letters.","At most 3 * 10^4 calls."]'::jsonb, '["Use an array of size 26 or a Map for children.","Mark end of word with a boolean flag."]'::jsonb, '{"java":"class Trie {\n    public Trie() {\n        \n    }\n    public void insert(String word) {\n        \n    }\n    public boolean search(String word) {\n        return false;\n    }\n    public boolean startsWith(String prefix) {\n        return false;\n    }\n}","python":"class Trie:\n    def __init__(self):\n        pass\n    def insert(self, word: str) -> None:\n        pass\n    def search(self, word: str) -> bool:\n        pass\n    def startsWith(self, prefix: str) -> bool:\n        pass","javascript":"\nvar Trie = function() {\n    \n};\n\n/** \n * @param {string} word\n * @return {void}\n */\nTrie.prototype.insert = function(word) {\n    \n};\n\n/** \n * @param {string} word\n * @return {boolean}\n */\nTrie.prototype.search = function(word) {\n    \n};\n\n/** \n * @param {string} prefix\n * @return {boolean}\n */\nTrie.prototype.startsWith = function(prefix) {\n    \n};\n","cpp":"class Trie {\npublic:\n    Trie() {\n        \n    }\n    \n    void insert(string word) {\n        \n    }\n    \n    bool search(string word) {\n        return false;\n    }\n    \n    bool startsWith(string prefix) {\n        return false;\n    }\n};"}'::jsonb, 'insert', '[{"input":"Trie trie = new Trie(); trie.insert(\"apple\"); trie.search(\"apple\");   // return True","output":"null"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Design Add and Search Words Data Structure', 'Design a data structure that supports adding new words and finding if a string matches any previously added string. Implement the WordDictionary class. The search function supports ''.'' as a wildcard character.', 'MEDIUM', '["String","DFS","Design","Trie"]'::jsonb, '["Salesforce","IBM","Amazon"]'::jsonb,
        84, 4132, 200, 8264, 5220,
        '["1 <= word.length <= 25","At most 10^4 calls."]'::jsonb, '["Use Trie.","For ''.'', recurse on all possible children."]'::jsonb, '{"java":"class WordDictionary {\n    public WordDictionary() {\n        \n    }\n    public void addWord(String word) {\n        \n    }\n    public boolean search(String word) {\n        return false;\n    }\n}","python":"class WordDictionary:\n    def __init__(self):\n        pass\n    def addWord(self, word: str) -> None:\n        pass\n    def search(self, word: str) -> bool:\n        pass","javascript":"\nvar WordDictionary = function() {\n    \n};\n\n/** \n * @param {string} word\n * @return {void}\n */\nWordDictionary.prototype.addWord = function(word) {\n    \n};\n\n/** \n * @param {string} word\n * @return {boolean}\n */\nWordDictionary.prototype.search = function(word) {\n    \n};\n","cpp":"class WordDictionary {\npublic:\n    WordDictionary() {\n        \n    }\n    \n    void addWord(string word) {\n        \n    }\n    \n    bool search(string word) {\n        return false;\n    }\n};"}'::jsonb, 'addWord', '[{"input":"wordDictionary.addWord(\"bad\"); wordDictionary.search(\".ad\"); // return True","output":"null"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Kth Largest Element in an Array', 'Given an integer array nums and an integer k, return the kth largest element in the array. Note that it is the kth largest element in the sorted order, not the kth distinct element. Can you solve it without sorting?', 'MEDIUM', '["Array","Divide and Conquer","Sorting","Heap","Priority Queue","Quickselect"]'::jsonb, '["Nvidia","Stripe","Walmart"]'::jsonb,
        23, 178, 26, 712, 493,
        '["1 <= k <= nums.length <= 10^5","-10^4 <= nums[i] <= 10^4"]'::jsonb, '["Sorting takes O(N log N).","Min-Heap of size k takes O(N log K).","Quickselect takes O(N) average."]'::jsonb, '{"java":"class Solution {\n    public int findKthLargest(int[] nums, int k) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findKthLargest(self, nums: List[int], k: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number}\n */\nvar findKthLargest = function(nums, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int findKthLargest(vector<int>& nums, int k) {\n        return 0;\n    }\n};"}'::jsonb, 'findKthLargest', '[{"input":"nums = [3,2,1,5,6,4], k = 2","output":"5"},{"input":"nums = [3,2,3,1,2,4,5,5,6], k = 4","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[3,2,1,5,6,4],"k":2}', '5');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Top K Frequent Elements', 'Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.', 'MEDIUM', '["Array","Hash Table","Divide and Conquer","Sorting","Heap","Priority Queue","Bucket Sort"]'::jsonb, '["Apple","Target","IBM","Morgan Stanley"]'::jsonb,
        71, 4281, 515, 25686, 17365,
        '["1 <= nums.length <= 10^5","k is in the range [1, the number of unique elements in the array].","It is guaranteed that the answer is unique."]'::jsonb, '["Count frequencies map.","Use Min-Heap of size k based on frequency.","Or Bucket Sort since max freq is N."]'::jsonb, '{"java":"class Solution {\n    public int[] topKFrequent(int[] nums, int k) {\n        return new int[]{};\n    }\n}","python":"class Solution:\n    def topKFrequent(self, nums: List[int], k: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} k\n * @return {number[]}\n */\nvar topKFrequent = function(nums, k) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> topKFrequent(vector<int>& nums, int k) {\n        return {};\n    }\n};"}'::jsonb, 'topKFrequent', '[{"input":"nums = [1,1,1,2,2,3], k = 2","output":"[1,2]"},{"input":"nums = [1], k = 1","output":"[1]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,1,1,2,2,3],"k":2}', '[1,2]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find Median from Data Stream', 'The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values. Implement the MedianFinder class: MedianFinder() initializes the MedianFinder object. void addNum(int num) adds the integer num from the data stream to the data structure. double findMedian() returns the median of all elements so far.', 'HARD', '["Two Pointers","Design","Sorting","Heap","Priority Queue","Data Stream"]'::jsonb, '["AMD","Twitter"]'::jsonb,
        37, 4457, 228, 8914, 4162,
        '["At most 5 * 10^4 calls.","Value range -10^5 to 10^5."]'::jsonb, '["Maintain two heaps: Max-Heap for lower half, Min-Heap for upper half.","Balance sizes to differ by at most 1."]'::jsonb, '{"java":"class MedianFinder {\n    public MedianFinder() {\n        \n    }\n    public void addNum(int num) {\n        \n    }\n    public double findMedian() {\n        return 0.0;\n    }\n}","python":"class MedianFinder:\n    def __init__(self):\n        pass\n    def addNum(self, num: int) -> None:\n        pass\n    def findMedian(self) -> float:\n        pass","javascript":"\nvar MedianFinder = function() {\n    \n};\n\n/** \n * @param {number} num\n * @return {void}\n */\nMedianFinder.prototype.addNum = function(num) {\n    \n};\n\n/**\n * @return {number}\n */\nMedianFinder.prototype.findMedian = function() {\n    \n};\n","cpp":"class MedianFinder {\npublic:\n    MedianFinder() {\n        \n    }\n    \n    void addNum(int num) {\n        \n    }\n    \n    double findMedian() {\n        return 0.0;\n    }\n};"}'::jsonb, 'addNum', '[{"input":"obj.addNum(1); obj.addNum(2); obj.findMedian(); // 1.5","output":"null"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Merge k Sorted Lists', 'You are given an array of k linked-lists lists, each linked-list is sorted in ascending order. Merge all the linked-lists into one sorted linked-list and return it.', 'HARD', '["Linked List","Divide and Conquer","Heap","Priority Queue","Merge Sort"]'::jsonb, '["Morgan Stanley"]'::jsonb,
        8, 1718, 158, 8590, 5142,
        '["k == lists.length","0 <= k <= 10^4","0 <= lists[i].length <= 500"]'::jsonb, '["Use Min-Heap to keep track of the smallest current node from each list.","Extract min and add next node from that list to heap."]'::jsonb, '{"java":"class Solution {\n    public ListNode mergeKLists(ListNode[] lists) {\n        return null;\n    }\n}","python":"class Solution:\n    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:\n        pass","javascript":"/**\n * @param {ListNode[]} lists\n * @return {ListNode}\n */\nvar mergeKLists = function(lists) {\n    \n};","cpp":"class Solution {\npublic:\n    ListNode* mergeKLists(vector<ListNode*>& lists) {\n        return nullptr;\n    }\n};"}'::jsonb, 'mergeKLists', '[{"input":"lists = [[1,4,5],[1,3,4],[2,6]]","output":"[1,1,2,3,4,4,5,6]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Task Scheduler', 'Given a characters array tasks, representing the tasks a CPU needs to do, where each letter represents a different task. Tasks could be done in any order. Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle. However, there is a non-negative integer n that represents the cooldown period between two same tasks (the same letter in the array), that is that there must be at least n units of time between any two same tasks. Return the least number of units of times that the CPU will take to finish all the given tasks.', 'MEDIUM', '["Array","Hash Table","Greedy","Sorting","Heap","Priority Queue","Counting"]'::jsonb, '["Shopify"]'::jsonb,
        54, 2723, 502, 16338, 10231,
        '["1 <= tasks.length <= 10^4","tasks[i] is upper-case English letter.","0 <= n <= 100"]'::jsonb, '["Greedy: schedule max frequency tasks first.","Formula based approach: (maxFreq - 1) * (n + 1) + countOfMaxFreq."]'::jsonb, '{"java":"class Solution {\n    public int leastInterval(char[] tasks, int n) {\n        return 0;\n    }\n}","python":"class Solution:\n    def leastInterval(self, tasks: List[str], n: int) -> int:\n        pass","javascript":"/**\n * @param {character[]} tasks\n * @param {number} n\n * @return {number}\n */\nvar leastInterval = function(tasks, n) {\n    \n};","cpp":"class Solution {\npublic:\n    int leastInterval(vector<char>& tasks, int n) {\n        return 0;\n    }\n};"}'::jsonb, 'leastInterval', '[{"input":"tasks = [\"A\",\"A\",\"A\",\"B\",\"B\",\"B\"], n = 2","output":"8"},{"input":"tasks = [\"A\",\"A\",\"A\",\"B\",\"B\",\"B\"], n = 0","output":"6"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"tasks":["A","A","A","B","B","B"],"n":2}', '8');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Allocate Minimum Pages', 'You are given an array of integers `A` and an integer `M`. `A[i]` represents the number of pages in the `i`-th book. There are `M` students. You need to allocate all the books to `M` students such that: 1. Each student gets at least one book. 2. Each student gets a contiguous sequence of books. 3. The maximum number of pages assigned to a student is minimized. Return the minimum possible maximum pages. If allocation is not possible, return -1.', 'HARD', '["Binary Search","Array"]'::jsonb, '["IBM","Google","Intel","Amazon"]'::jsonb,
        53, 1406, 30, 5624, 3444,
        '["1 <= N <= 10^5","1 <= A[i] <= 10^9","1 <= M <= N"]'::jsonb, '["Binary search on the max pages. Range [max(A), sum(A)].","Check function: Greedily assign books."]'::jsonb, '{"java":"class Solution {\n    public int findPages(int[] A, int M) {\n        return -1;\n    }\n}","python":"class Solution:\n    def findPages(self, A: List[int], M: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} A\n * @param {number} M\n * @return {number}\n */\nvar findPages = function(A, M) {\n    \n};","cpp":"class Solution {\npublic:\n    int findPages(vector<int>& A, int M) {\n        return -1;\n    }\n};"}'::jsonb, 'findPages', '[{"input":"A = [12, 34, 67, 90], M = 2","output":"113"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"A":[12,34,67,90],"M":2}', '113');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sqrt(x)', 'Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well. You must not use any built-in exponent function or operator.', 'EASY', '["Math","Binary Search"]'::jsonb, '["Goldman Sachs","Amazon","JPMorgan","Target"]'::jsonb,
        44, 2593, 101, 12965, 8067,
        '["0 <= x <= 2^31 - 1"]'::jsonb, '["Binary search between 0 and x.","Check mid * mid <= x."]'::jsonb, '{"java":"class Solution {\n    public int mySqrt(int x) {\n        return 0;\n    }\n}","python":"class Solution:\n    def mySqrt(self, x: int) -> int:\n        pass","javascript":"/**\n * @param {number} x\n * @return {number}\n */\nvar mySqrt = function(x) {\n    \n};","cpp":"class Solution {\npublic:\n    int mySqrt(int x) {\n        return 0;\n    }\n};"}'::jsonb, 'mySqrt', '[{"input":"x = 4","output":"2"},{"input":"x = 8","output":"2"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"x":4}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Search in a Sorted Array of Unknown Size', 'You have a sorted array of unique elements and an unknown size. You do not have access to the array but can use the `ArrayReader` interface to access it. You can call `ArrayReader.get(i)` that returns the value at the ith index (0-indexed). If you access an index out of bounds, it returns `2^31 - 1`. Return the index of `target` or -1 if not found.', 'MEDIUM', '["Array","Binary Search","Interactive"]'::jsonb, '["Microsoft","Nvidia"]'::jsonb,
        6, 1779, 149, 5337, 2714,
        '["1 <= secret.length <= 10^4"]'::jsonb, '["Find bounds by exponentially increasing index: 1, 2, 4, 8... until get(i) > target.","Then standard binary search."]'::jsonb, '{"java":"/**\n * // This is ArrayReader''s API interface.\n * // You should not implement it, or speculate about its implementation\n * interface ArrayReader {\n *     public int get(int index) {}\n * }\n */\n\nclass Solution {\n    public int search(ArrayReader reader, int target) {\n        return -1;\n    }\n}","python":"# \"\"\"\n# This is ArrayReader''s API interface.\n# You should not implement it, or speculate about its implementation\n# \"\"\"\n#class ArrayReader:\n#    def get(self, index: int) -> int:\n\nclass Solution:\n    def search(self, reader: ''ArrayReader'', target: int) -> int:\n        pass","javascript":"/**\n * // This is the ArrayReader''s API interface.\n * // You should not implement it, or speculate about its implementation\n * // function ArrayReader() {\n * //     this.get = function(index) {};\n * // };\n */\n\n/**\n * @param {ArrayReader} reader\n * @param {number} target\n * @return {number}\n */\nvar search = function(reader, target) {\n    \n};","cpp":"/**\n * // This is the ArrayReader''s API interface.\n * // You should not implement it, or speculate about its implementation\n * class ArrayReader {\n *   public:\n *     int get(int index);\n * };\n */\n\nclass Solution {\npublic:\n    int search(const ArrayReader& reader, int target) {\n        return -1;\n    }\n};"}'::jsonb, 'search', '[{"input":"array = [-1,0,3,5,9,12], target = 9","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Serialize and Deserialize Binary Tree', 'Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment. Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.', 'HARD', '["String","Tree","DFS","BFS","Design","Binary Tree"]'::jsonb, '["Oracle","ByteDance","Intel"]'::jsonb,
        94, 2462, 276, 9848, 5709,
        '["The number of nodes in the tree is in the range [0, 10^4].","-1000 <= Node.val <= 1000"]'::jsonb, '["Use Preorder traversal with special character for null (e.g., ''X'')."]'::jsonb, '{"java":"public class Codec {\n    public String serialize(TreeNode root) {\n        return \"\";\n    }\n    public TreeNode deserialize(String data) {\n        return null;\n    }\n}","python":"class Codec:\n    def serialize(self, root):\n        pass\n    def deserialize(self, data):\n        pass","javascript":"/**\n * Encodes a tree to a single string.\n *\n * @param {TreeNode} root\n * @return {string}\n */\nvar serialize = function(root) {\n    \n};\n\n/**\n * Decodes your encoded data to tree.\n *\n * @param {string} data\n * @return {TreeNode}\n */\nvar deserialize = function(data) {\n    \n};","cpp":"class Codec {\npublic:\n    string serialize(TreeNode* root) {\n        return \"\";\n    }\n    TreeNode* deserialize(string data) {\n        return nullptr;\n    }\n};"}'::jsonb, 'serialize', '[{"input":"root = [1,2,3,null,null,4,5]","output":"[1,2,3,null,null,4,5]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Course Schedule', 'There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai. Return true if you can finish all courses. Otherwise, return false.', 'MEDIUM', '["DFS","BFS","Graph","Topological Sort"]'::jsonb, '["Cisco"]'::jsonb,
        43, 595, 38, 1190, 643,
        '["1 <= numCourses <= 2000","0 <= prerequisites.length <= 5000"]'::jsonb, '["This is a cycle detection problem.","Use DFS with 3 states (visiting, visited, unvisited) or Kahn''s Algorithm (BFS)."]'::jsonb, '{"java":"class Solution {\n    public boolean canFinish(int numCourses, int[][] prerequisites) {\n        return false;\n    }\n}","python":"class Solution:\n    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:\n        pass","javascript":"/**\n * @param {number} numCourses\n * @param {number[][]} prerequisites\n * @return {boolean}\n */\nvar canFinish = function(numCourses, prerequisites) {\n    \n};","cpp":"class Solution {\npublic:\n    bool canFinish(int numCourses, vector<vector<int>>& prerequisites) {\n        return false;\n    }\n};"}'::jsonb, 'canFinish', '[{"input":"numCourses = 2, prerequisites = [[1,0]]","output":"true"},{"input":"numCourses = 2, prerequisites = [[1,0],[0,1]]","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"numCourses":2,"prerequisites":[[1,0]]}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Course Schedule II', 'There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai. Return the ordering of courses you should take to finish all courses. If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.', 'MEDIUM', '["DFS","BFS","Graph","Topological Sort"]'::jsonb, '["AMD","Walmart","Amazon"]'::jsonb,
        91, 2942, 414, 8826, 4596,
        '["1 <= numCourses <= 2000"]'::jsonb, '["Use Kahn''s Algorithm for Topological Sort.","If result size < numCourses, cycle exists."]'::jsonb, '{"java":"class Solution {\n    public int[] findOrder(int numCourses, int[][] prerequisites) {\n        return new int[]{};\n    }\n}","python":"class Solution:\n    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:\n        pass","javascript":"/**\n * @param {number} numCourses\n * @param {number[][]} prerequisites\n * @return {number[]}\n */\nvar findOrder = function(numCourses, prerequisites) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> findOrder(int numCourses, vector<vector<int>>& prerequisites) {\n        return {};\n    }\n};"}'::jsonb, 'findOrder', '[{"input":"numCourses = 2, prerequisites = [[1,0]]","output":"[0,1]"},{"input":"numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]","output":"[0,2,1,3]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"numCourses":2,"prerequisites":[[1,0]]}', '[0,1]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Matrix Chain Multiplication', 'Given a sequence of matrices, find the most efficient way to multiply these matrices together. The problem is not actually to perform the multiplications, but merely to decide in which order to perform the multiplications.', 'MEDIUM', '["Dynamic Programming"]'::jsonb, '["Google","Amazon","Nvidia","Goldman Sachs"]'::jsonb,
        85, 316, 3, 632, 286,
        '["1 <= N <= 100","arr[i] is dimension."]'::jsonb, '["Gap strategy DP.","dp[i][j] = min(dp[i][k] + dp[k+1][j] + cost)."]'::jsonb, '{"java":"class Solution {\n    public int matrixMultiplication(int N, int arr[]) {\n        return 0;\n    }\n}","python":"class Solution:\n    def matrixMultiplication(self, N: int, arr: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number} N\n * @param {number[]} arr\n * @return {number}\n */\nvar matrixMultiplication = function(N, arr) {\n    \n};","cpp":"class Solution {\npublic:\n    int matrixMultiplication(int N, int arr[]) {\n        return 0;\n    }\n};"}'::jsonb, 'matrixMultiplication', '[{"input":"N = 5, arr = [40, 20, 30, 10, 30]","output":"26000"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Egg Dropping Puzzle', 'You are given `k` eggs and `n` floors. Determine the minimum number of moves (drops) required to confirm the critical floor `f` (0 <= f <= n) from which the egg breaks, in the worst case.', 'HARD', '["Dynamic Programming","Math","Binary Search"]'::jsonb, '["Uber","LinkedIn","Stripe"]'::jsonb,
        18, 549, 14, 3294, 1612,
        '["1 <= k <= 100","1 <= n <= 10^4"]'::jsonb, '["dp[moves][eggs] >= floors.","Binary search on moves."]'::jsonb, '{"java":"class Solution {\n    public int superEggDrop(int k, int n) {\n        return 0;\n    }\n}","python":"class Solution:\n    def superEggDrop(self, k: int, n: int) -> int:\n        pass","javascript":"/**\n * @param {number} k\n * @param {number} n\n * @return {number}\n */\nvar superEggDrop = function(k, n) {\n    \n};","cpp":"class Solution {\npublic:\n    int superEggDrop(int k, int n) {\n        return 0;\n    }\n};"}'::jsonb, 'superEggDrop', '[{"input":"k = 1, n = 2","output":"2"},{"input":"k = 2, n = 6","output":"3"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"k":1,"n":2}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Palindrome Partitioning II', 'Given a string s, partition s such that every substring of the partition is a palindrome. Return the minimum cuts needed for a palindrome partitioning of s.', 'HARD', '["Dynamic Programming","String"]'::jsonb, '["Apple","SpaceX","ByteDance","Oracle"]'::jsonb,
        22, 1535, 96, 4605, 1771,
        '["1 <= s.length <= 2000"]'::jsonb, '["dp[i] = min cuts for s[0..i].","Precompute palindromes."]'::jsonb, '{"java":"class Solution {\n    public int minCut(String s) {\n        return 0;\n    }\n}","python":"class Solution:\n    def minCut(self, s: str) -> int:\n        pass","javascript":"/**\n * @param {string} s\n * @return {number}\n */\nvar minCut = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    int minCut(string s) {\n        return 0;\n    }\n};"}'::jsonb, 'minCut', '[{"input":"s = \"aab\"","output":"1"},{"input":"s = \"a\"","output":"0"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"aab"}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Falling Path Sum', 'Given an n x n array of integers matrix, return the minimum sum of any falling path through matrix. A falling path starts at any element in the first row and chooses the element in the next row that is either directly below or diagonally left/right. Specifically, the next element from position (row, col) will be (row + 1, col - 1), (row + 1, col), or (row + 1, col + 1).', 'MEDIUM', '["Array","Dynamic Programming","Matrix"]'::jsonb, '["Morgan Stanley","ByteDance","Bloomberg"]'::jsonb,
        59, 1055, 74, 3165, 1915,
        '["n == matrix.length == matrix[i].length","1 <= n <= 100","-100 <= matrix[i][j] <= 100"]'::jsonb, '["dp[i][j] = matrix[i][j] + min(dp[i-1][j-1], dp[i-1][j], dp[i-1][j+1])."]'::jsonb, '{"java":"class Solution {\n    public int minFallingPathSum(int[][] matrix) {\n        return 0;\n    }\n}","python":"class Solution:\n    def minFallingPathSum(self, matrix: List[List[int]]) -> int:\n        pass","javascript":"/**\n * @param {number[][]} matrix\n * @return {number}\n */\nvar minFallingPathSum = function(matrix) {\n    \n};","cpp":"class Solution {\npublic:\n    int minFallingPathSum(vector<vector<int>>& matrix) {\n        return 0;\n    }\n};"}'::jsonb, 'minFallingPathSum', '[{"input":"matrix = [[2,1,3],[6,5,4],[7,8,9]]","output":"13"},{"input":"matrix = [[-19,57],[-40,-5]]","output":"-59"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"matrix":[[2,1,3],[6,5,4],[7,8,9]]}', '13');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Cherry Pickup', 'You are given an n x n grid representing a field of cherries, each cell is one of the following: 0: empty cell, 1: cherry, -1: thorn/obstacle. Your task is to collect maximum cherries by going from (0,0) to (n-1, n-1) and back to (0,0) without using thorns.', 'HARD', '["Array","Dynamic Programming","Matrix"]'::jsonb, '["JPMorgan"]'::jsonb,
        14, 1327, 70, 3981, 2277,
        '["n == grid.length","1 <= n <= 50"]'::jsonb, '["Think of two people starting from (0,0) sumultaneously.","dp[r1][c1][c2] max cherries."]'::jsonb, '{"java":"class Solution {\n    public int cherryPickup(int[][] grid) {\n        return 0;\n    }\n}","python":"class Solution:\n    def cherryPickup(self, grid: List[List[int]]) -> int:\n        pass","javascript":"/**\n * @param {number[][]} grid\n * @return {number}\n */\nvar cherryPickup = function(grid) {\n    \n};","cpp":"class Solution {\npublic:\n    int cherryPickup(vector<vector<int>>& grid) {\n        return 0;\n    }\n};"}'::jsonb, 'cherryPickup', '[{"input":"grid = [[0,1,-1],[1,0,-1],[1,1,1]]","output":"5"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"grid":[[0,1,-1],[1,0,-1],[1,1,1]]}', '5');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Partition Labels', 'You are given a string s. We want to partition the string into as many parts as possible so that each letter appears in at most one part. Note that the partition is done so that after concatenating all the parts in order, the resultant string should be s. Return a list of integers representing the size of these parts.', 'MEDIUM', '["Hash Table","Two Pointers","String","Greedy"]'::jsonb, '["Airbnb","Shopify"]'::jsonb,
        1, 414, 60, 2484, 998,
        '["1 <= s.length <= 500","s consists of lowercase English letters."]'::jsonb, '["Precompute last occurrence of each char.","Iterate and extend ''end'' of current part to max(end, last[char])."]'::jsonb, '{"java":"class Solution {\n    public List<Integer> partitionLabels(String s) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def partitionLabels(self, s: str) -> List[int]:\n        pass","javascript":"/**\n * @param {string} s\n * @return {number[]}\n */\nvar partitionLabels = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> partitionLabels(string s) {\n        return {};\n    }\n};"}'::jsonb, 'partitionLabels', '[{"input":"s = \"ababcbacadefegdehijhklij\"","output":"[9,7,8]"},{"input":"s = \"eccbbbbdec\"","output":"[10]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"ababcbacadefegdehijhklij"}', '[9,7,8]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Number of Arrows to Burst Balloons', 'There are some spherical balloons taped onto a flat wall that represents the XY-plane. The balloons are represented as a 2D integer array points where points[i] = [xstart, xend] denotes a balloon whose horizontal diameter stretches between xstart and xend. You do not know the exact y-coordinates of the balloons. Arrows can be shot up directly vertically (in the positive y-direction) from different points along the x-axis. A balloon with xstart and xend is burst by an arrow shot at x if xstart <= x <= xend. There is no limit to the number of arrows that can be shot. A shot arrow keeps traveling up infinitely, bursting any balloons in its path. Given the array points, return the minimum number of arrows that must be shot to burst all balloons.', 'MEDIUM', '["Array","Greedy","Sorting"]'::jsonb, '["Salesforce"]'::jsonb,
        35, 3837, 626, 19185, 11479,
        '["1 <= points.length <= 10^5","points[i].length == 2","-2^31 <= xstart < xend <= 2^31 - 1"]'::jsonb, '["Sort by end coordinate.","Greedy: shoot arrow at end of current balloon, skip all overlapping."]'::jsonb, '{"java":"class Solution {\n    public int findMinArrowShots(int[][] points) {\n        return 0;\n    }\n}","python":"class Solution:\n    def findMinArrowShots(self, points: List[List[int]]) -> int:\n        pass","javascript":"/**\n * @param {number[][]} points\n * @return {number}\n */\nvar findMinArrowShots = function(points) {\n    \n};","cpp":"class Solution {\npublic:\n    int findMinArrowShots(vector<vector<int>>& points) {\n        return 0;\n    }\n};"}'::jsonb, 'findMinArrowShots', '[{"input":"points = [[10,16],[2,8],[1,6],[7,12]]","output":"2"},{"input":"points = [[1,2],[3,4],[5,6],[7,8]]","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"points":[[10,16],[2,8],[1,6],[7,12]]}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Queue Reconstruction by Height', 'You are given an array of people, people, which are the attributes of some people in a queue (not necessarily in order). Each people[i] = [hi, ki] represents the ith person of height hi with exactly ki other people in front who have a height greater than or equal to hi. Reconstruct and return the queue that is represented by the input array people. The returned queue should be formatted as an array queue, where queue[j] = [hj, kj] is the attributes of the jth person of the queue (queue[0] is the person at the front of the queue).', 'MEDIUM', '["Array","Greedy","Sorting"]'::jsonb, '["Salesforce","Netflix"]'::jsonb,
        12, 3979, 776, 7958, 4484,
        '["1 <= people.length <= 2000","0 <= hi <= 10^6","0 <= ki < people.length"]'::jsonb, '["Sort by height desc, k asc.","Insert into list at index k."]'::jsonb, '{"java":"class Solution {\n    public int[][] reconstructQueue(int[][] people) {\n        return new int[][]{};\n    }\n}","python":"class Solution:\n    def reconstructQueue(self, people: List[List[int]]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[][]} people\n * @return {number[][]}\n */\nvar reconstructQueue = function(people) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> reconstructQueue(vector<vector<int>>& people) {\n        return {};\n    }\n};"}'::jsonb, 'reconstructQueue', '[{"input":"people = [[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]","output":"[[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"people":[[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]}', '[[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Distinct Subsequences', 'Given two strings s and t, return the number of distinct subsequences of s which equals t. The test cases are generated so that the answer fits on a 32-bit signed integer.', 'HARD', '["Dynamic Programming","String"]'::jsonb, '["Target","Nvidia"]'::jsonb,
        27, 1360, 131, 4080, 2020,
        '["1 <= s.length, t.length <= 1000","s and t consist of English letters."]'::jsonb, '["dp[i][j]: number of ways to form t[0..j] using s[0..i].","If s[i] == t[j], we can either use s[i] or skip it."]'::jsonb, '{"java":"class Solution {\n    public int numDistinct(String s, String t) {\n        return 0;\n    }\n}","python":"class Solution:\n    def numDistinct(self, s: str, t: str) -> int:\n        pass","javascript":"/**\n * @param {string} s\n * @param {string} t\n * @return {number}\n */\nvar numDistinct = function(s, t) {\n    \n};","cpp":"class Solution {\npublic:\n    int numDistinct(string s, string t) {\n        return 0;\n    }\n};"}'::jsonb, 'numDistinct', '[{"input":"s = \"rabbbit\", t = \"rabbit\"","output":"3"},{"input":"s = \"babgbag\", t = \"bag\"","output":"5"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"rabbbit","t":"rabbit"}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Interleaving String', 'Given strings s1, s2, and s3, find whether s3 is formed by an interleaving of s1 and s2. An interleaving of two strings s and t is a configuration where s and t are divided into n and m substrings respectively, such that s = s1 + s2 + ... + sn and t = t1 + t2 + ... + tm, and the interleaving is s1 + t1 + s2 + t2 + ... or t1 + s1 + t2 + s2 + ...', 'MEDIUM', '["Dynamic Programming","String"]'::jsonb, '["Netflix","Stripe","Adobe"]'::jsonb,
        33, 4589, 124, 18356, 12744,
        '["0 <= s1.length, s2.length <= 100","0 <= s3.length <= 200","s3.length == s1.length + s2.length"]'::jsonb, '["dp[i][j] means s1[0..i] and s2[0..j] can form s3[0..i+j]."]'::jsonb, '{"java":"class Solution {\n    public boolean isInterleave(String s1, String s2, String s3) {\n        return false;\n    }\n}","python":"class Solution:\n    def isInterleave(self, s1: str, s2: str, s3: str) -> bool:\n        pass","javascript":"/**\n * @param {string} s1\n * @param {string} s2\n * @param {string} s3\n * @return {boolean}\n */\nvar isInterleave = function(s1, s2, s3) {\n    \n};","cpp":"class Solution {\npublic:\n    bool isInterleave(string s1, string s2, string s3) {\n        return false;\n    }\n};"}'::jsonb, 'isInterleave', '[{"input":"s1 = \"aabcc\", s2 = \"dbbca\", s3 = \"aadbbcbcac\"","output":"true"},{"input":"s1 = \"aabcc\", s2 = \"dbbca\", s3 = \"aadbbbaccc\"","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s1":"aabcc","s2":"dbbca","s3":"aadbbcbcac"}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Delete and Earn', 'You are given an integer array nums. You want to maximize the number of points you get by performing the following operation any number of times: Pick any nums[i] and delete it to earn nums[i] points. Afterwards, you must delete every element equal to nums[i] - 1 and every element equal to nums[i] + 1. Return the maximum number of points you can earn.', 'MEDIUM', '["Array","Hash Table","Dynamic Programming"]'::jsonb, '["Google","Spotify"]'::jsonb,
        83, 932, 11, 4660, 2964,
        '["1 <= nums.length <= 2 * 10^4","1 <= nums[i] <= 10^4"]'::jsonb, '["Reduce to House Robber problem by summing up same values."]'::jsonb, '{"java":"class Solution {\n    public int deleteAndEarn(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def deleteAndEarn(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar deleteAndEarn = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int deleteAndEarn(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'deleteAndEarn', '[{"input":"nums = [3,4,2]","output":"6"},{"input":"nums = [2,2,3,3,3,4]","output":"9"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[3,4,2]}', '6');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Network Delay Time', 'You are given a network of n nodes, labeled from 1 to n. You are also given times, a list of travel times as directed edges times[i] = (ui, vi, wi), where ui is the source node, vi is the target node, and wi is the time it takes for a signal to travel from source to target. We will send a signal from a given node k. Return the minimum time it takes for all the n nodes to receive the signal. If it is impossible for all the n nodes to receive the signal, return -1.', 'MEDIUM', '["Graph","BFS","Heap","Shortest Path"]'::jsonb, '["Airbnb"]'::jsonb,
        4, 3974, 439, 11922, 5135,
        '["1 <= k <= n <= 100","1 <= times.length <= 6000"]'::jsonb, '["Dijkstra''s Algorithm or Bellman-Ford."]'::jsonb, '{"java":"class Solution {\n    public int networkDelayTime(int[][] times, int n, int k) {\n        return -1;\n    }\n}","python":"class Solution:\n    def networkDelayTime(self, times: List[List[int]], n: int, k: int) -> int:\n        pass","javascript":"/**\n * @param {number[][]} times\n * @param {number} n\n * @param {number} k\n * @return {number}\n */\nvar networkDelayTime = function(times, n, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int networkDelayTime(vector<vector<int>>& times, int n, int k) {\n        return -1;\n    }\n};"}'::jsonb, 'networkDelayTime', '[{"input":"times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2","output":"2"},{"input":"times = [[1,2,1]], n = 2, k = 1","output":"1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"times":[[2,1,1],[2,3,1],[3,4,1]],"n":4,"k":2}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Cheapest Flights Within K Stops', 'There are n cities connected by some number of flights. You are given an array flights where flights[i] = [from_i, to_i, price_i] indicates that there is a flight from city from_i to city to_i with cost price_i. You are also given three integers src, dst, and k, return the cheapest price from src to dst with at most k stops. If there is no such route, return -1.', 'MEDIUM', '["Dynamic Programming","Graph","Shortest Path","BFS"]'::jsonb, '["Stripe","Intel","AMD","Adobe"]'::jsonb,
        63, 1185, 127, 7110, 2846,
        '["1 <= n <= 100","0 <= flights.length <= (n * (n - 1) / 2)","0 <= k < n"]'::jsonb, '["Run Dijkstra''s but track steps. Or BFS level by level. Or Bellman-Ford k+1 times."]'::jsonb, '{"java":"class Solution {\n    public int findCheapestPrice(int n, int[][] flights, int src, int dst, int k) {\n        return -1;\n    }\n}","python":"class Solution:\n    def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int:\n        pass","javascript":"/**\n * @param {number} n\n * @param {number[][]} flights\n * @param {number} src\n * @param {number} dst\n * @param {number} k\n * @return {number}\n */\nvar findCheapestPrice = function(n, flights, src, dst, k) {\n    \n};","cpp":"class Solution {\npublic:\n    int findCheapestPrice(int n, vector<vector<int>>& flights, int src, int dst, int k) {\n        return -1;\n    }\n};"}'::jsonb, 'findCheapestPrice', '[{"input":"n = 4, flights = [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], src = 0, dst = 3, k = 1","output":"700"},{"input":"n = 3, flights = [[0,1,100],[1,2,100],[0,2,500]], src = 0, dst = 2, k = 1","output":"200"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":3,"flights":[[0,1,100],[1,2,100],[0,2,500]],"src":0,"dst":2,"k":1}', '200');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Spiral Matrix', 'Given an m x n matrix, return all elements of the matrix in spiral order.', 'MEDIUM', '["Array","Matrix","Simulation"]'::jsonb, '["Netflix","Morgan Stanley","Facebook"]'::jsonb,
        75, 3567, 525, 10701, 6255,
        '["m == matrix.length","n == matrix[i].length","1 <= m, n <= 10","-100 <= matrix[i][j] <= 100"]'::jsonb, '["Simulate the process with 4 boundaries: top, bottom, left, right."]'::jsonb, '{"java":"class Solution {\n    public List<Integer> spiralOrder(int[][] matrix) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:\n        pass","javascript":"/**\n * @param {number[][]} matrix\n * @return {number[]}\n */\nvar spiralOrder = function(matrix) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> spiralOrder(vector<vector<int>>& matrix) {\n        return {};\n    }\n};"}'::jsonb, 'spiralOrder', '[{"input":"matrix = [[1,2,3],[4,5,6],[7,8,9]]","output":"[1,2,3,6,9,8,7,4,5]"},{"input":"matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]","output":"[1,2,3,4,8,12,11,10,9,5,6,7]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"matrix":[[1,2,3],[4,5,6],[7,8,9]]}', '[1,2,3,6,9,8,7,4,5]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Rotate Image', 'You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise). You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.', 'MEDIUM', '["Array","Math","Matrix"]'::jsonb, '["Oracle","Intel"]'::jsonb,
        70, 1356, 128, 2712, 1207,
        '["n == matrix.length == matrix[i].length","1 <= n <= 20","-1000 <= matrix[i][j] <= 1000"]'::jsonb, '["Transpose the matrix, then reverse each row."]'::jsonb, '{"java":"class Solution {\n    public void rotate(int[][] matrix) {\n        \n    }\n}","python":"class Solution:\n    def rotate(self, matrix: List[List[int]]) -> None:\n        \"\"\"\n        Do not return anything, modify matrix in-place.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[][]} matrix\n * @return {void} Do not return anything, modify matrix in-place.\n */\nvar rotate = function(matrix) {\n    \n};","cpp":"class Solution {\npublic:\n    void rotate(vector<vector<int>>& matrix) {\n        \n    }\n};"}'::jsonb, 'rotate', '[{"input":"matrix = [[1,2,3],[4,5,6],[7,8,9]]","output":"[[7,4,1],[8,5,2],[9,6,3]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"matrix":[[1,2,3],[4,5,6],[7,8,9]]}', '[[7,4,1],[8,5,2],[9,6,3]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Set Matrix Zeroes', 'Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0''s. You must do it in place.', 'MEDIUM', '["Array","Hash Table","Matrix"]'::jsonb, '["IBM"]'::jsonb,
        53, 2890, 395, 14450, 7249,
        '["m == matrix.length","n == matrix[0].length","1 <= m, n <= 200"]'::jsonb, '["Use the first row and first column as markers to store states."]'::jsonb, '{"java":"class Solution {\n    public void setZeroes(int[][] matrix) {\n        \n    }\n}","python":"class Solution:\n    def setZeroes(self, matrix: List[List[int]]) -> None:\n        \"\"\"\n        Do not return anything, modify matrix in-place.\n        \"\"\"\n        pass","javascript":"/**\n * @param {number[][]} matrix\n * @return {void} Do not return anything, modify matrix in-place.\n */\nvar setZeroes = function(matrix) {\n    \n};","cpp":"class Solution {\npublic:\n    void setZeroes(vector<vector<int>>& matrix) {\n        \n    }\n};"}'::jsonb, 'setZeroes', '[{"input":"matrix = [[1,1,1],[1,0,1],[1,1,1]]","output":"[[1,0,1],[0,0,0],[1,0,1]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"matrix":[[1,1,1],[1,0,1],[1,1,1]]}', '[[1,0,1],[0,0,0],[1,0,1]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reverse Pairs', 'Given an integer array nums, return the number of reverse pairs in the array. A reverse pair is a pair (i, j) where: 0 <= i < j < nums.length and nums[i] > 2 * nums[j].', 'HARD', '["Array","Binary Search","Divide and Conquer","Sorting"]'::jsonb, '["Bloomberg","IBM","Microsoft","Morgan Stanley"]'::jsonb,
        12, 2169, 422, 13014, 6232,
        '["1 <= nums.length <= 5 * 10^4","-2^31 <= nums[i] <= 2^31 - 1"]'::jsonb, '["Use Merge Sort logic. Count pairs during merge step."]'::jsonb, '{"java":"class Solution {\n    public int reversePairs(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def reversePairs(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar reversePairs = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int reversePairs(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'reversePairs', '[{"input":"nums = [1,3,2,3,1]","output":"2"},{"input":"nums = [2,4,3,5,1]","output":"3"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,3,2,3,1]}', '2');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Count of Range Sum', 'Given an integer array nums and two integers lower and upper, return the number of range sums that lie in [lower, upper] inclusive. Range sum S(i, j) is defined as the sum of the elements in nums between indices i and j inclusive, where i <= j.', 'HARD', '["Array","Binary Search","Divide and Conquer","Sorting"]'::jsonb, '["Goldman Sachs"]'::jsonb,
        76, 1077, 169, 5385, 2316,
        '["1 <= nums.length <= 10^5","lower <= upper"]'::jsonb, '["Use Merge Sort or Segment Tree."]'::jsonb, '{"java":"class Solution {\n    public int countRangeSum(int[] nums, int lower, int upper) {\n        return 0;\n    }\n}","python":"class Solution:\n    def countRangeSum(self, nums: List[int], lower: int, upper: int) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @param {number} lower\n * @param {number} upper\n * @return {number}\n */\nvar countRangeSum = function(nums, lower, upper) {\n    \n};","cpp":"class Solution {\npublic:\n    int countRangeSum(vector<int>& nums, int lower, int upper) {\n        return 0;\n    }\n};"}'::jsonb, 'countRangeSum', '[{"input":"nums = [-2,5,-1], lower = -2, upper = 2","output":"3"},{"input":"nums = [0], lower = 0, upper = 0","output":"1"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[-2,5,-1],"lower":-2,"upper":2}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Remove Duplicates from Sorted List II', 'Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list sorted as well.', 'MEDIUM', '["Linked List","Two Pointers"]'::jsonb, '["JPMorgan","ByteDance"]'::jsonb,
        96, 2475, 32, 9900, 4245,
        '["The number of nodes in the list is in the range [0, 300].","-100 <= Node.val <= 100","The list is guaranteed to be sorted in ascending order."]'::jsonb, '["Use a dummy head. Pointer ''prev'' tracks last valid node."]'::jsonb, '{"java":"class Solution {\n    public ListNode deleteDuplicates(ListNode head) {\n        return null;\n    }\n}","python":"class Solution:\n    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        pass","javascript":"/**\n * @param {ListNode} head\n * @return {ListNode}\n */\nvar deleteDuplicates = function(head) {\n    \n};","cpp":"class Solution {\npublic:\n    ListNode* deleteDuplicates(ListNode* head) {\n        return nullptr;\n    }\n};"}'::jsonb, 'deleteDuplicates', '[{"input":"head = [1,2,3,3,4,4,5]","output":"[1,2,5]"},{"input":"head = [1,1,1,2,3]","output":"[2,3]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Smallest String With Swaps', 'You are given a string s, and an array of pairs of indices in the string pairs where pairs[i] = [a, b] indicates 2 indices(0-indexed) of the string. You can swap the characters at any pair of indices in the given pairs any number of times. Return the lexicographically smallest string that s can be changed to after using the swaps.', 'MEDIUM', '["Array","String","Union Find","Graph"]'::jsonb, '["Stripe","Bloomberg","Goldman Sachs","Netflix"]'::jsonb,
        47, 506, 19, 1518, 1035,
        '["1 <= s.length <= 10^5","0 <= pairs.length <= 10^5"]'::jsonb, '["Union-Find to group indices that can be swapped.","For each group, collect characters, sort them, and place them back in sorted indices."]'::jsonb, '{"java":"class Solution {\n    public String smallestStringWithSwaps(String s, List<List<Integer>> pairs) {\n        return \"\";\n    }\n}","python":"class Solution:\n    def smallestStringWithSwaps(self, s: str, pairs: List[List[int]]) -> str:\n        pass","javascript":"/**\n * @param {string} s\n * @param {number[][]} pairs\n * @return {string}\n */\nvar smallestStringWithSwaps = function(s, pairs) {\n    \n};","cpp":"class Solution {\npublic:\n    string smallestStringWithSwaps(string s, vector<vector<int>>& pairs) {\n        return \"\";\n    }\n};"}'::jsonb, 'smallestStringWithSwaps', '[{"input":"s = \"dcab\", pairs = [[0,3],[1,2]]","output":"\"bacd\""},{"input":"s = \"dcab\", pairs = [[0,3],[1,2],[0,2]]","output":"\"abcd\""}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"dcab","pairs":[[0,3],[1,2]]}', 'bacd');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reorganize String', 'Given a string s, rearrange the characters of s so that any two adjacent characters are not the same. Return any possible rearrangement of s or return "" if not possible.', 'MEDIUM', '["HashTable","String","Greedy","Heap","Counting"]'::jsonb, '["IBM","Adobe","Salesforce","Stripe"]'::jsonb,
        47, 4102, 639, 20510, 7980,
        '["1 <= s.length <= 500","s consists of lowercase English letters."]'::jsonb, '["Use Max Heap to store character frequencies. Pick top 2 and place them."]'::jsonb, '{"java":"class Solution {\n    public String reorganizeString(String s) {\n        return \"\";\n    }\n}","python":"class Solution:\n    def reorganizeString(self, s: str) -> str:\n        pass","javascript":"/**\n * @param {string} s\n * @return {string}\n */\nvar reorganizeString = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    string reorganizeString(string s) {\n        return \"\";\n    }\n};"}'::jsonb, 'reorganizeString', '[{"input":"s = \"aab\"","output":"\"aba\""},{"input":"s = \"aaab\"","output":"\"\""}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"aab"}', 'aba');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'K Closest Points to Origin', 'Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane and an integer k, return the k closest points to the origin (0, 0). The distance between two points on the X-Y plane is the Euclidean distance (i.e., v((x1 - x2)^2 + (y1 - y2)^2)). You may return the answer in any order. The answer is guaranteed to be unique (except for the order that it is in).', 'MEDIUM', '["Array","Math","Divide and Conquer","Geometry","Sorting","Heap","Quickselect"]'::jsonb, '["ByteDance","IBM"]'::jsonb,
        14, 4107, 453, 24642, 11773,
        '["1 <= k <= points.length <= 10^4","-10^4 < xi, yi < 10^4"]'::jsonb, '["Calculate distance squared for each point. Use Max Heap of size K to keep smallest distances."]'::jsonb, '{"java":"class Solution {\n    public int[][] kClosest(int[][] points, int k) {\n        return new int[][]{};\n    }\n}","python":"class Solution:\n    def kClosest(self, points: List[List[int]], k: int) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[][]} points\n * @param {number} k\n * @return {number[][]}\n */\nvar kClosest = function(points, k) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> kClosest(vector<vector<int>>& points, int k) {\n        return {};\n    }\n};"}'::jsonb, 'kClosest', '[{"input":"points = [[1,3],[-2,2]], k = 1","output":"[[-2,2]]"},{"input":"points = [[3,3],[5,-1],[-2,4]], k = 2","output":"[[3,3],[-2,4]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"points":[[1,3],[-2,2]],"k":1}', '[[-2,2]]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Top K Frequent Words', 'Given an array of strings words and an integer k, return the k most frequent strings. Return the answer sorted by the frequency from highest to lowest. Sort the words with the same frequency by their lexicographical order.', 'MEDIUM', '["HashTable","String","Trie","Sorting","Heap","Bucket Sort","Counting"]'::jsonb, '["Cisco","Google","Microsoft","Twitter"]'::jsonb,
        10, 1597, 123, 3194, 1768,
        '["1 <= words.length <= 500","1 <= words[i].length <= 10"]'::jsonb, '["Count freq. Use Min Heap of size K with custom comparator."]'::jsonb, '{"java":"class Solution {\n    public List<String> topKFrequent(String[] words, int k) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def topKFrequent(self, words: List[str], k: int) -> List[str]:\n        pass","javascript":"/**\n * @param {string[]} words\n * @param {number} k\n * @return {string[]}\n */\nvar topKFrequent = function(words, k) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<string> topKFrequent(vector<string>& words, int k) {\n        return {};\n    }\n};"}'::jsonb, 'topKFrequent', '[{"input":"words = [\"i\",\"love\",\"leetcode\",\"i\",\"love\",\"coding\"], k = 2","output":"[\"i\",\"love\"]"},{"input":"words = [\"the\",\"day\",\"is\",\"sunny\",\"the\",\"the\",\"the\",\"sunny\",\"is\",\"is\"], k = 4","output":"[\"the\",\"is\",\"sunny\",\"day\"]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"words":["i","love","leetcode","i","love","coding"],"k":2}', '["i","love"]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Single Number', 'Given a non-empty array of integers nums, every element appears twice except for one. Find that single one. You must implement a solution with a linear runtime complexity and use only constant extra space.', 'EASY', '["Bit Manipulation","Array"]'::jsonb, '["Uber","AMD","Morgan Stanley"]'::jsonb,
        3, 4149, 818, 20745, 14344,
        '["1 <= nums.length <= 3 * 10^4","-3 * 10^4 <= nums[i] <= 3 * 10^4"]'::jsonb, '["XOR all elements. a ^ a = 0."]'::jsonb, '{"java":"class Solution {\n    public int singleNumber(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def singleNumber(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar singleNumber = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int singleNumber(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'singleNumber', '[{"input":"nums = [2,2,1]","output":"1"},{"input":"nums = [4,1,2,1,2]","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[2,2,1]}', '1');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Single Number II', 'Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it. You must implement a solution with a linear runtime complexity and use only constant extra space.', 'MEDIUM', '["Bit Manipulation","Array"]'::jsonb, '["Oracle","Netflix"]'::jsonb,
        89, 3998, 520, 19990, 8850,
        '["1 <= nums.length <= 3 * 10^4","-2^31 <= nums[i] <= 2^31 - 1"]'::jsonb, '["Count bits at each position modulo 3."]'::jsonb, '{"java":"class Solution {\n    public int singleNumber(int[] nums) {\n        return 0;\n    }\n}","python":"class Solution:\n    def singleNumber(self, nums: List[int]) -> int:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number}\n */\nvar singleNumber = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    int singleNumber(vector<int>& nums) {\n        return 0;\n    }\n};"}'::jsonb, 'singleNumber', '[{"input":"nums = [2,2,3,2]","output":"3"},{"input":"nums = [0,1,0,1,0,1,99]","output":"99"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[2,2,3,2]}', '3');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Single Number III', 'Given an integer array nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once. You can return the answer in any order. You must write an algorithm that runs in linear runtime complexity and uses only constant extra space.', 'MEDIUM', '["Bit Manipulation","Array"]'::jsonb, '["Apple","Intel","Google"]'::jsonb,
        19, 1135, 75, 5675, 3072,
        '["2 <= nums.length <= 3 * 10^4","-2^31 <= nums[i] <= 2^31 - 1"]'::jsonb, '["XOR all. Result is x^y. Find rightmost set bit to separate into two groups."]'::jsonb, '{"java":"class Solution {\n    public int[] singleNumber(int[] nums) {\n        return new int[]{};\n    }\n}","python":"class Solution:\n    def singleNumber(self, nums: List[int]) -> List[int]:\n        pass","javascript":"/**\n * @param {number[]} nums\n * @return {number[]}\n */\nvar singleNumber = function(nums) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> singleNumber(vector<int>& nums) {\n        return {};\n    }\n};"}'::jsonb, 'singleNumber', '[{"input":"nums = [1,2,1,3,2,5]","output":"[3,5]"},{"input":"nums = [-1,0]","output":"[-1,0]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"nums":[1,2,1,3,2,5]}', '[3,5]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Counting Bits', 'Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n), ans[i] is the number of 1''s in the binary representation of i.', 'EASY', '["Dynamic Programming","Bit Manipulation"]'::jsonb, '["Stripe"]'::jsonb,
        86, 4444, 267, 22220, 8123,
        '["0 <= n <= 10^5"]'::jsonb, '["dp[i] = dp[i >> 1] + (i & 1)."]'::jsonb, '{"java":"class Solution {\n    public int[] countBits(int n) {\n        return new int[]{};\n    }\n}","python":"class Solution:\n    def countBits(self, n: int) -> List[int]:\n        pass","javascript":"/**\n * @param {number} n\n * @return {number[]}\n */\nvar countBits = function(n) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<int> countBits(int n) {\n        return {};\n    }\n};"}'::jsonb, 'countBits', '[{"input":"n = 2","output":"[0,1,1]"},{"input":"n = 5","output":"[0,1,1,2,1,2]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"n":2}', '[0,1,1]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reverse Bits', 'Reverse bits of a given 32 bits unsigned integer.', 'EASY', '["Bit Manipulation","Divide and Conquer"]'::jsonb, '["Target","JPMorgan"]'::jsonb,
        89, 2550, 472, 15300, 10236,
        '["n is a binary string of length 32"]'::jsonb, '["Iterate 32 times, extract bit and push to result."]'::jsonb, '{"java":"public class Solution {\n    // you need treat n as an unsigned value\n    public int reverseBits(int n) {\n        return 0;\n    }\n}","python":"class Solution:\n    def reverseBits(self, n: int) -> int:\n        pass","javascript":"/**\n * @param {number} n - a positive integer\n * @return {number} - a positive integer\n */\nvar reverseBits = function(n) {\n    \n};","cpp":"class Solution {\npublic:\n    uint32_t reverseBits(uint32_t n) {\n        return 0;\n    }\n};"}'::jsonb, 'reverseBits', '[{"input":"n = 00000010100101000001111010011100","output":"964176192 (00111001011110000010100101000000)"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Pow(x, n)', 'Implement pow(x, n), which calculates x raised to the power n (i.e., x^n).', 'MEDIUM', '["Math","Recursion"]'::jsonb, '["LinkedIn","Shopify","Bloomberg"]'::jsonb,
        94, 817, 103, 3268, 2128,
        '["-100.0 < x < 100.0","-2^31 <= n <= 2^31-1","-10^4 <= x^n <= 10^4"]'::jsonb, '["Binary Exponentiation. Recursive or Iterative."]'::jsonb, '{"java":"class Solution {\n    public double myPow(double x, int n) {\n        return 0.0;\n    }\n}","python":"class Solution:\n    def myPow(self, x: float, n: int) -> float:\n        pass","javascript":"/**\n * @param {number} x\n * @param {number} n\n * @return {number}\n */\nvar myPow = function(x, n) {\n    \n};","cpp":"class Solution {\npublic:\n    double myPow(double x, int n) {\n        return 0.0;\n    }\n};"}'::jsonb, 'myPow', '[{"input":"x = 2.00000, n = 10","output":"1024.00000"},{"input":"x = 2.10000, n = 3","output":"9.26100"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"x":2,"n":10}', '1024.0');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Multiply Strings', 'Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string. Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.', 'MEDIUM', '["Math","String","Simulation"]'::jsonb, '["Goldman Sachs"]'::jsonb,
        42, 3386, 406, 6772, 3531,
        '["1 <= num1.length, num2.length <= 200"]'::jsonb, '["Start from right to left, perform multiplication like in elementary school."]'::jsonb, '{"java":"class Solution {\n    public String multiply(String num1, String num2) {\n        return \"\";\n    }\n}","python":"class Solution:\n    def multiply(self, num1: str, num2: str) -> str:\n        pass","javascript":"/**\n * @param {string} num1\n * @param {string} num2\n * @return {string}\n */\nvar multiply = function(num1, num2) {\n    \n};","cpp":"class Solution {\npublic:\n    string multiply(string num1, string num2) {\n        return \"\";\n    }\n};"}'::jsonb, 'multiply', '[{"input":"num1 = \"2\", num2 = \"3\"","output":"\"6\""},{"input":"num1 = \"123\", num2 = \"456\"","output":"\"56088\""}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"num1":"2","num2":"3"}', '6');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Robot Bounded In Circle', 'On an infinite plane, a robot initially stands at (0, 0) and faces north. The robot can receive one of three instructions: "G": go straight 1 unit; "L": turn 90 degrees to the left; "R": turn 90 degrees to the right. The robot performs the instructions given in order, and repeats them forever. Return true if and only if there exists a circle in the plane such that the robot never leaves the circle.', 'MEDIUM', '["Math","Simulation","String"]'::jsonb, '["IBM"]'::jsonb,
        9, 2895, 313, 14475, 5985,
        '["1 <= instructions.length <= 100"]'::jsonb, '["It''s a circle if final pos is (0,0) OR final direction is NOT North."]'::jsonb, '{"java":"class Solution {\n    public boolean isRobotBounded(String instructions) {\n        return false;\n    }\n}","python":"class Solution:\n    def isRobotBounded(self, instructions: str) -> bool:\n        pass","javascript":"/**\n * @param {string} instructions\n * @return {boolean}\n */\nvar isRobotBounded = function(instructions) {\n    \n};","cpp":"class Solution {\npublic:\n    bool isRobotBounded(string instructions) {\n        return false;\n    }\n};"}'::jsonb, 'isRobotBounded', '[{"input":"instructions = \"GGLLGG\"","output":"true"},{"input":"instructions = \"GG\"","output":"false"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"instructions":"GGLLGG"}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Flatten Binary Tree to Linked List', 'Given the root of a binary tree, flatten the tree into a "linked list": The "linked list" should use the same TreeNode class where the right child pointer points to the next node in the list and the left child pointer is always null. The "linked list" should be in the same order as a pre-order traversal of the binary tree.', 'MEDIUM', '["Linked List","Stack","Tree","DFS","Binary Tree"]'::jsonb, '["AMD","IBM","ByteDance"]'::jsonb,
        87, 3758, 71, 22548, 14761,
        '["The number of nodes in the tree is in the range [0, 2000].","-100 <= Node.val <= 100"]'::jsonb, '["Use Morris Traversal or recursive post-order (right, left, root)."]'::jsonb, '{"java":"class Solution {\n    public void flatten(TreeNode root) {\n        \n    }\n}","python":"class Solution:\n    def flatten(self, root: Optional[TreeNode]) -> None:\n        \"\"\"\n        Do not return anything, modify root in-place.\n        \"\"\"\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @return {void} Do not return anything, modify root in-place.\n */\nvar flatten = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    void flatten(TreeNode* root) {\n        \n    }\n};"}'::jsonb, 'flatten', '[{"input":"root = [1,2,5,3,4,null,6]","output":"[1,null,2,null,3,null,4,null,5,null,6]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Populating Next Right Pointers in Each Node', 'You are given a perfect binary tree where all leaves are on the same level, and every parent has two children. Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL. Initially, all next pointers are set to NULL.', 'MEDIUM', '["Tree","DFS","BFS","Binary Tree"]'::jsonb, '["AMD","Amazon"]'::jsonb,
        2, 2073, 96, 12438, 7071,
        '["The number of nodes is in the range [0, 2^12 - 1].","-1000 <= Node.val <= 1000"]'::jsonb, '["Level order traversal (BFS). Or rely on the fact that if a node has left child, it has right child. Connect left->next = right. Connect right->next = next->left."]'::jsonb, '{"java":"class Solution {\n    public Node connect(Node root) {\n        return null;\n    }\n}","python":"class Solution:\n    def connect(self, root: ''Optional[Node]'') -> ''Optional[Node]'':\n        pass","javascript":"/**\n * @param {Node} root\n * @return {Node}\n */\nvar connect = function(root) {\n    \n};","cpp":"class Solution {\npublic:\n    Node* connect(Node* root) {\n        return nullptr;\n    }\n};"}'::jsonb, 'connect', '[{"input":"root = [1,2,3,4,5,6,7]","output":"[1,#,2,3,#,4,5,6,7,#]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Path Sum II', 'Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where the sum of the node values in the path equals targetSum. Each path should be returned as a list of the node values, not node references. A root-to-leaf path is a path starting from the root and ending at any leaf node. A leaf is a node with no children.', 'MEDIUM', '["Backtracking","Tree","DFS","Binary Tree"]'::jsonb, '["Nvidia"]'::jsonb,
        28, 1196, 11, 5980, 2285,
        '["The number of nodes in the tree is in the range [0, 5000].","-1000 <= Node.val <= 1000","-1000 <= targetSum <= 1000"]'::jsonb, '["DFS keeping track of current path and current sum."]'::jsonb, '{"java":"class Solution {\n    public List<List<Integer>> pathSum(TreeNode root, int targetSum) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def pathSum(self, root: Optional[TreeNode], targetSum: int) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @param {number} targetSum\n * @return {number[][]}\n */\nvar pathSum = function(root, targetSum) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> pathSum(TreeNode* root, int targetSum) {\n        return {};\n    }\n};"}'::jsonb, 'pathSum', '[{"input":"root = [5,4,8,11,null,13,4,7,2,5,1], targetSum = 22","output":"[[5,4,11,2],[5,8,4,5]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Path Sum III', 'Given the root of a binary tree and an integer targetSum, return the number of paths where the sum of the values along the path equals targetSum. The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).', 'MEDIUM', '["Tree","DFS","Binary Tree"]'::jsonb, '["Amazon"]'::jsonb,
        8, 1307, 78, 6535, 2788,
        '["The number of nodes in the tree is in the range [0, 1000].","-10^9 <= Node.val <= 10^9","-1000 <= targetSum <= 1000"]'::jsonb, '["Use Prefix Sum HashMap to store path sums encountered so far."]'::jsonb, '{"java":"class Solution {\n    public int pathSum(TreeNode root, int targetSum) {\n        return 0;\n    }\n}","python":"class Solution:\n    def pathSum(self, root: Optional[TreeNode], targetSum: int) -> int:\n        pass","javascript":"/**\n * @param {TreeNode} root\n * @param {number} targetSum\n * @return {number}\n */\nvar pathSum = function(root, targetSum) {\n    \n};","cpp":"class Solution {\npublic:\n    int pathSum(TreeNode* root, int targetSum) {\n        return 0;\n    }\n};"}'::jsonb, 'pathSum', '[{"input":"root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8","output":"3"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Word Break', 'Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words. Note that the same word in the dictionary may be reused multiple times in the segmentation.', 'MEDIUM', '["HashTable","String","Dynamic Programming","Trie","Memoization"]'::jsonb, '["IBM","Intel"]'::jsonb,
        25, 4306, 310, 17224, 8627,
        '["1 <= s.length <= 300","1 <= wordDict.length <= 1000"]'::jsonb, '["dp[i] is true if s[0...i] can be segmented."]'::jsonb, '{"java":"class Solution {\n    public boolean wordBreak(String s, List<String> wordDict) {\n        return false;\n    }\n}","python":"class Solution:\n    def wordBreak(self, s: str, wordDict: List[str]) -> bool:\n        pass","javascript":"/**\n * @param {string} s\n * @param {string[]} wordDict\n * @return {boolean}\n */\nvar wordBreak = function(s, wordDict) {\n    \n};","cpp":"class Solution {\npublic:\n    bool wordBreak(string s, vector<string>& wordDict) {\n        return false;\n    }\n};"}'::jsonb, 'wordBreak', '[{"input":"s = \"leetcode\", wordDict = [\"leet\",\"code\"]","output":"true"},{"input":"s = \"applepenapple\", wordDict = [\"apple\",\"pen\"]","output":"true"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"leetcode","wordDict":["leet","code"]}', 'true');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Word Break II', 'Given a string s and a dictionary of strings wordDict, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences in any order. Note that the same word in the dictionary may be reused multiple times in the segmentation.', 'HARD', '["HashTable","String","Dynamic Programming","Backtracking","Trie"]'::jsonb, '["Intel"]'::jsonb,
        17, 2770, 385, 8310, 5445,
        '["1 <= s.length <= 20","1 <= wordDict.length <= 1000"]'::jsonb, '["Backtracking with Memoization."]'::jsonb, '{"java":"class Solution {\n    public List<String> wordBreak(String s, List<String> wordDict) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def wordBreak(self, s: str, wordDict: List[str]) -> List[str]:\n        pass","javascript":"/**\n * @param {string} s\n * @param {string[]} wordDict\n * @return {string[]}\n */\nvar wordBreak = function(s, wordDict) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<string> wordBreak(string s, vector<string>& wordDict) {\n        return {};\n    }\n};"}'::jsonb, 'wordBreak', '[{"input":"s = \"catsanddog\", wordDict = [\"cat\",\"cats\",\"and\",\"sand\",\"dog\"]","output":"[\"cats and dog\",\"cat sand dog\"]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Restore IP Addresses', 'A valid IP address consists of exactly four integers separated by single dots. Each integer is between 0 and 255 (inclusive) and cannot have leading zeros. Given a string s containing only digits, return all possible valid IP addresses that can be formed by inserting dots into s. You are not allowed to reorder or remove any digits in s. You may return the valid IP addresses in any order.', 'MEDIUM', '["String","Backtracking"]'::jsonb, '["Google","Facebook","Microsoft","Oracle"]'::jsonb,
        43, 2507, 385, 5014, 1589,
        '["1 <= s.length <= 20","s consists of digits only."]'::jsonb, '["Backtracking. Try placing dot after 1, 2, or 3 digits."]'::jsonb, '{"java":"class Solution {\n    public List<String> restoreIpAddresses(String s) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def restoreIpAddresses(self, s: str) -> List[str]:\n        pass","javascript":"/**\n * @param {string} s\n * @return {string[]}\n */\nvar restoreIpAddresses = function(s) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<string> restoreIpAddresses(string s) {\n        return {};\n    }\n};"}'::jsonb, 'restoreIpAddresses', '[{"input":"s = \"25525511135\"","output":"[\"255.255.11.135\",\"255.255.111.35\"]"},{"input":"s = \"0000\"","output":"[\"0.0.0.0\"]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '{"s":"25525511135"}', '["255.255.11.135","255.255.111.35"]');
END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Surrounded Regions', 'Given an m x n matrix board containing ''X'' and ''O'', capture all regions that are 4-directionally surrounded by ''X''. A region is captured by flipping all ''O''s into ''X''s in that surrounded region.', 'MEDIUM', '["Array","DFS","BFS","Matrix","Union Find"]'::jsonb, '["IBM"]'::jsonb,
        8, 4940, 422, 14820, 6968,
        '["m == board.length","n == board[i].length","1 <= m, n <= 200"]'::jsonb, '["Start from ''O''s on the boundary and mark them as safe. All other ''O''s are captured."]'::jsonb, '{"java":"class Solution {\n    public void solve(char[][] board) {\n        \n    }\n}","python":"class Solution:\n    def solve(self, board: List[List[str]]) -> None:\n        \"\"\"\n        Do not return anything, modify board in-place.\n        \"\"\"\n        pass","javascript":"/**\n * @param {character[][]} board\n * @return {void} Do not return anything, modify board in-place.\n */\nvar solve = function(board) {\n    \n};","cpp":"class Solution {\npublic:\n    void solve(vector<vector<char>>& board) {\n        \n    }\n};"}'::jsonb, 'solve', '[{"input":"board = [[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"O\",\"O\",\"X\"],[\"X\",\"X\",\"O\",\"X\"],[\"X\",\"O\",\"X\",\"X\"]]","output":"[[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"O\",\"X\",\"X\"]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Trapping Rain Water II', 'Given an m x n integer matrix heightMap representing the height of each unit cell in a 2D elevation map, return the volume of water it can trap after raining.', 'HARD', '["Array","BFS","Heap","Matrix"]'::jsonb, '["Uber","Cisco"]'::jsonb,
        66, 3037, 225, 9111, 3567,
        '["m == heightMap.length","n == heightMap[i].length","1 <= m, n <= 200"]'::jsonb, '["Min-Heap boundary. Always pick the smallest height from boundary and explore neighbors. If neighbor is lower, water trapped."]'::jsonb, '{"java":"class Solution {\n    public int trapRainWater(int[][] heightMap) {\n        return 0;\n    }\n}","python":"class Solution:\n    def trapRainWater(self, heightMap: List[List[int]]) -> int:\n        pass","javascript":"/**\n * @param {number[][]} heightMap\n * @return {number}\n */\nvar trapRainWater = function(heightMap) {\n    \n};","cpp":"class Solution {\npublic:\n    int trapRainWater(vector<vector<int>>& heightMap) {\n        return 0;\n    }\n};"}'::jsonb, 'trapRainWater', '[{"input":"heightMap = [[1,4,3,1,3,2],[3,2,1,3,2,4],[2,3,3,2,3,1]]","output":"4"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Maximal Rectangle', 'Given a rows x cols binary matrix filled with 0''s and 1''s, find the largest rectangle containing only 1''s and return its area.', 'HARD', '["Array","Dynamic Programming","Stack","Matrix","Monotonic Stack"]'::jsonb, '["SpaceX","Bloomberg","Shopify","Netflix"]'::jsonb,
        26, 2941, 576, 11764, 5857,
        '["rows == matrix.length","cols == matrix[i].length","1 <= rows, cols <= 200"]'::jsonb, '["Treat each row as a histogram base. Compute Largest Rectangle in Histogram for each row."]'::jsonb, '{"java":"class Solution {\n    public int maximalRectangle(char[][] matrix) {\n        return 0;\n    }\n}","python":"class Solution:\n    def maximalRectangle(self, matrix: List[List[str]]) -> int:\n        pass","javascript":"/**\n * @param {character[][]} matrix\n * @return {number}\n */\nvar maximalRectangle = function(matrix) {\n    \n};","cpp":"class Solution {\npublic:\n    int maximalRectangle(vector<vector<char>>& matrix) {\n        return 0;\n    }\n};"}'::jsonb, 'maximalRectangle', '[{"input":"matrix = [[\"1\",\"0\",\"1\",\"0\",\"0\"],[\"1\",\"0\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"0\",\"0\",\"1\",\"0\"]]","output":"6"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'The Skyline Problem', 'A city''s skyline is the outer contour of the silhouette formed by all the buildings in that city when viewed from a distance. Given the locations and heights of all the buildings, return the skyline formed by these buildings collectively. The geometric information of each building is given by an array buildings where buildings[i] = [lefti, righti, heighti].', 'HARD', '["Array","Divide and Conquer","Heap","Binary Indexed Tree","Segment Tree"]'::jsonb, '["JPMorgan"]'::jsonb,
        34, 1218, 112, 2436, 1446,
        '["1 <= buildings.length <= 10^4","0 <= lefti < righti <= 2^31 - 1"]'::jsonb, '["Sweep Line algorithm. Use Max Heap to store live buildings'' heights."]'::jsonb, '{"java":"class Solution {\n    public List<List<Integer>> getSkyline(int[][] buildings) {\n        return new ArrayList<>();\n    }\n}","python":"class Solution:\n    def getSkyline(self, buildings: List[List[int]]) -> List[List[int]]:\n        pass","javascript":"/**\n * @param {number[][]} buildings\n * @return {number[][]}\n */\nvar getSkyline = function(buildings) {\n    \n};","cpp":"class Solution {\npublic:\n    vector<vector<int>> getSkyline(vector<vector<int>>& buildings) {\n        return {};\n    }\n};"}'::jsonb, 'getSkyline', '[{"input":"buildings = [[2,9,10],[3,7,15],[5,12,12],[15,20,10],[19,24,8]]","output":"[[2,10],[3,15],[7,12],[12,0],[15,10],[20,8],[24,0]]"}]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Roman to Integer', 'Given a roman numeral, convert it to an integer.', 'EASY', '["Math","String"]'::jsonb, '["Oracle","Goldman Sachs","Tesla"]'::jsonb,
        10, 1599, 51, 7995, 3676,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int romanToInt(String s) { return 0; } }","python":"class Solution:\n    def romanToInt(self, s: str) -> int:\n        pass","javascript":"var romanToInt = function(s) {};","cpp":"class Solution { public: int romanToInt(string s) { return 0; } };"}'::jsonb, 'romanToInt', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Common Prefix', 'Write a function to find the longest common prefix string amongst an array of strings.', 'EASY', '["String"]'::jsonb, '["Target","Adobe","Cisco","Amazon"]'::jsonb,
        75, 66, 3, 330, 135,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String longestCommonPrefix(String[] strs) { return \"\"; } }","python":"class Solution:\n    def longestCommonPrefix(self, strs: List[str]) -> str:\n        pass","javascript":"var longestCommonPrefix = function(strs) {};","cpp":"class Solution { public: string longestCommonPrefix(vector<string>& strs) { return \"\"; } };"}'::jsonb, 'longestCommonPrefix', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Valid Parentheses', 'Given a string s containing just the characters ''('', '')'', ''{'', ''}'', ''['' and '']'', determine if the input string is valid.', 'EASY', '["String","Stack"]'::jsonb, '["Morgan Stanley","Twitter"]'::jsonb,
        96, 903, 26, 4515, 1603,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean isValid(String s) { return false; } }","python":"class Solution:\n    def isValid(self, s: str) -> bool:\n        pass","javascript":"var isValid = function(s) {};","cpp":"class Solution { public: bool isValid(string s) { return false; } };"}'::jsonb, 'isValid', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Merge Two Sorted Lists', 'Merge two sorted linked lists and return it as a sorted list.', 'EASY', '["Linked List","Recursion"]'::jsonb, '["Goldman Sachs","Shopify","Microsoft"]'::jsonb,
        32, 4816, 875, 9632, 3638,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public ListNode mergeTwoLists(ListNode list1, ListNode list2) { return null; } }","python":"class Solution:\n    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:\n        pass","javascript":"var mergeTwoLists = function(list1, list2) {};","cpp":"class Solution { public: ListNode* mergeTwoLists(ListNode* list1, ListNode* list2) { return nullptr; } };"}'::jsonb, 'mergeTwoLists', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Implement strStr()', 'Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.', 'EASY', '["Two Pointers","String"]'::jsonb, '["Airbnb","Uber","SpaceX"]'::jsonb,
        69, 3165, 171, 9495, 3991,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int strStr(String haystack, String needle) { return 0; } }","python":"class Solution:\n    def strStr(self, haystack: str, needle: str) -> int:\n        pass","javascript":"var strStr = function(haystack, needle) {};","cpp":"class Solution { public: int strStr(string haystack, string needle) { return 0; } };"}'::jsonb, 'strStr', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Search Insert Position', 'Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.', 'EASY', '["Array","Binary Search"]'::jsonb, '["Airbnb"]'::jsonb,
        59, 1594, 135, 9564, 4012,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int searchInsert(int[] nums, int target) { return 0; } }","python":"class Solution:\n    def searchInsert(self, nums: List[int], target: int) -> int:\n        pass","javascript":"var searchInsert = function(nums, target) {};","cpp":"class Solution { public: int searchInsert(vector<int>& nums, int target) { return 0; } };"}'::jsonb, 'searchInsert', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Length of Last Word', 'Given a string s consisting of some words separated by some number of spaces, return the length of the last word in the string.', 'EASY', '["String"]'::jsonb, '["Morgan Stanley","Facebook","Airbnb","Spotify"]'::jsonb,
        80, 4339, 335, 26034, 8072,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int lengthOfLastWord(String s) { return 0; } }","python":"class Solution:\n    def lengthOfLastWord(self, s: str) -> int:\n        pass","javascript":"var lengthOfLastWord = function(s) {};","cpp":"class Solution { public: int lengthOfLastWord(string s) { return 0; } };"}'::jsonb, 'lengthOfLastWord', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Plus One', 'You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. Increment the large integer by one and return the resulting array of digits.', 'EASY', '["Array","Math"]'::jsonb, '["ByteDance"]'::jsonb,
        8, 1754, 128, 5262, 2217,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] plusOne(int[] digits) { return new int[]{}; } }","python":"class Solution:\n    def plusOne(self, digits: List[int]) -> List[int]:\n        pass","javascript":"var plusOne = function(digits) {};","cpp":"class Solution { public: vector<int> plusOne(vector<int>& digits) { return {}; } };"}'::jsonb, 'plusOne', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Add Binary', 'Given two binary strings a and b, return their sum as a binary string.', 'EASY', '["Math","String","Bit Manipulation"]'::jsonb, '["Adobe","Cisco","Uber","Amazon"]'::jsonb,
        19, 144, 0, 864, 531,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String addBinary(String a, String b) { return \"\"; } }","python":"class Solution:\n    def addBinary(self, a: str, b: str) -> str:\n        pass","javascript":"var addBinary = function(a, b) {};","cpp":"class Solution { public: string addBinary(string a, string b) { return \"\"; } };"}'::jsonb, 'addBinary', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Same Tree', 'Given the roots of two binary trees p and q, write a function to check if they are the same or not.', 'EASY', '["Tree","DFS","BFS","Binary Tree"]'::jsonb, '["AMD","Facebook","IBM","Cisco"]'::jsonb,
        96, 2946, 99, 11784, 6762,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean isSameTree(TreeNode p, TreeNode q) { return false; } }","python":"class Solution:\n    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:\n        pass","javascript":"var isSameTree = function(p, q) {};","cpp":"class Solution { public: bool isSameTree(TreeNode* p, TreeNode* q) { return false; } };"}'::jsonb, 'isSameTree', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sorted Array to BST', 'Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.', 'EASY', '["Tree","DFS","Binary Search Tree","Divide and Conquer","Binary Tree"]'::jsonb, '["Shopify","Facebook","AMD","Amazon"]'::jsonb,
        47, 708, 24, 2832, 1218,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public TreeNode sortedArrayToBST(int[] nums) { return null; } }","python":"class Solution:\n    def sortedArrayToBST(self, nums: List[int]) -> Optional[TreeNode]:\n        pass","javascript":"var sortedArrayToBST = function(nums) {};","cpp":"class Solution { public: TreeNode* sortedArrayToBST(vector<int>& nums) { return nullptr; } };"}'::jsonb, 'sortedArrayToBST', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Depth of Binary Tree', 'Given a binary tree, find its minimum depth.', 'EASY', '["Tree","DFS","BFS","Binary Tree"]'::jsonb, '["Apple"]'::jsonb,
        84, 3320, 649, 9960, 3910,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minDepth(TreeNode root) { return 0; } }","python":"class Solution:\n    def minDepth(self, root: Optional[TreeNode]) -> int:\n        pass","javascript":"var minDepth = function(root) {};","cpp":"class Solution { public: int minDepth(TreeNode* root) { return 0; } };"}'::jsonb, 'minDepth', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Pascal''s Triangle', 'Given an integer numRows, return the first numRows of Pascal''s triangle.', 'EASY', '["Array","Dynamic Programming"]'::jsonb, '["Oracle"]'::jsonb,
        74, 1554, 172, 3108, 1316,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<List<Integer>> generate(int numRows) { return new ArrayList<>(); } }","python":"class Solution:\n    def generate(self, numRows: int) -> List[List[int]]:\n        pass","javascript":"var generate = function(numRows) {};","cpp":"class Solution { public: vector<vector<int>> generate(int numRows) { return {}; } };"}'::jsonb, 'generate', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Pascal''s Triangle II', 'Given an integer rowIndex, return the rowIndex-th (0-indexed) row of the Pascal''s triangle.', 'EASY', '["Array","Dynamic Programming"]'::jsonb, '["Facebook"]'::jsonb,
        32, 1532, 295, 3064, 2112,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<Integer> getRow(int rowIndex) { return new ArrayList<>(); } }","python":"class Solution:\n    def getRow(self, rowIndex: int) -> List[int]:\n        pass","javascript":"var getRow = function(rowIndex) {};","cpp":"class Solution { public: vector<int> getRow(int rowIndex) { return {}; } };"}'::jsonb, 'getRow', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Best Time to Buy and Sell Stock', 'You are given an array prices where prices[i] is the price of a given stock on the ith day. You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.', 'EASY', '["Array","Dynamic Programming"]'::jsonb, '["Twitter","Goldman Sachs","Google"]'::jsonb,
        27, 441, 56, 1323, 779,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxProfit(int[] prices) { return 0; } }","python":"class Solution:\n    def maxProfit(self, prices: List[int]) -> int:\n        pass","javascript":"var maxProfit = function(prices) {};","cpp":"class Solution { public: int maxProfit(vector<int>& prices) { return 0; } };"}'::jsonb, 'maxProfit', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Min Stack', 'Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.', 'EASY', '["Stack","Design"]'::jsonb, '["Apple","LinkedIn"]'::jsonb,
        55, 896, 111, 4480, 1672,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class MinStack { public MinStack() {} public void push(int val) {} public void pop() {} public int top() { return 0; } public int getMin() { return 0; } }","python":"class MinStack:\n    def __init__(self):\n        pass\n    def push(self, val: int) -> None:\n        pass\n    def pop(self) -> None:\n        pass\n    def top(self) -> int:\n        pass\n    def getMin(self) -> int:\n        pass","javascript":"var MinStack = function() {};","cpp":"class MinStack { public: MinStack() {} void push(int val) {} void pop() {} int top() { return 0; } int getMin() { return 0; } };"}'::jsonb, 'getMin', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Missing Number', 'Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.', 'EASY', '["Bit Manipulation","Array","Math"]'::jsonb, '["Morgan Stanley"]'::jsonb,
        71, 1039, 193, 6234, 3576,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int missingNumber(int[] nums) { return 0; } }","python":"class Solution:\n    def missingNumber(self, nums: List[int]) -> int:\n        pass","javascript":"var missingNumber = function(nums) {};","cpp":"class Solution { public: int missingNumber(vector<int>& nums) { return 0; } };"}'::jsonb, 'missingNumber', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Intersection of Two Arrays II', 'Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.', 'EASY', '["Array","HashTable","Binary Search"]'::jsonb, '["Netflix","Oracle","Shopify"]'::jsonb,
        66, 1086, 186, 5430, 3786,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] intersect(int[] nums1, int[] nums2) { return new int[]{}; } }","python":"class Solution:\n    def intersect(self, nums1: List[int], nums2: List[int]) -> List[int]:\n        pass","javascript":"var intersect = function(nums1, nums2) {};","cpp":"class Solution { public: vector<int> intersect(vector<int>& nums1, vector<int>& nums2) { return {}; } };"}'::jsonb, 'intersect', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'First Unique Character in a String', 'Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.', 'EASY', '["Hash Table","String"]'::jsonb, '["ByteDance"]'::jsonb,
        82, 1631, 308, 6524, 3812,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int firstUniqChar(String s) { return 0; } }","python":"class Solution:\n    def firstUniqChar(self, s: str) -> int:\n        pass","javascript":"var firstUniqChar = function(s) {};","cpp":"class Solution { public: int firstUniqChar(string s) { return 0; } };"}'::jsonb, 'firstUniqChar', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Fizz Buzz', 'Given an integer n, return a string array answer (1-indexed) where: answer[i] == "FizzBuzz" if i is divisible by 3 and 5. answer[i] == "Fizz" if i is divisible by 3. answer[i] == "Buzz" if i is divisible by 5. answer[i] == i (as a string) if none of the above conditions are true.', 'EASY', '["Math","String"]'::jsonb, '["Apple","Morgan Stanley","Google"]'::jsonb,
        59, 3009, 26, 9027, 3701,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<String> fizzBuzz(int n) { return new ArrayList<>(); } }","python":"class Solution:\n    def fizzBuzz(self, n: int) -> List[str]:\n        pass","javascript":"var fizzBuzz = function(n) {};","cpp":"class Solution { public: vector<string> fizzBuzz(int n) { return {}; } };"}'::jsonb, 'fizzBuzz', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reverse Vowels of a String', 'Given a string s, reverse only all the vowels in the string and return it.', 'EASY', '["Two Pointers","String"]'::jsonb, '["SpaceX","Spotify"]'::jsonb,
        38, 1738, 272, 5214, 2929,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String reverseVowels(String s) { return \"\"; } }","python":"class Solution:\n    def reverseVowels(self, s: str) -> str:\n        pass","javascript":"var reverseVowels = function(s) {};","cpp":"class Solution { public: string reverseVowels(string s) { return \"\"; } };"}'::jsonb, 'reverseVowels', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Third Maximum Number', 'Given an integer array nums, return the third distinct maximum number in this array. If the third maximum does not exist, return the maximum number.', 'EASY', '["Array","Sorting"]'::jsonb, '["Walmart","Goldman Sachs","Apple","Amazon"]'::jsonb,
        39, 4485, 423, 13455, 9253,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int thirdMax(int[] nums) { return 0; } }","python":"class Solution:\n    def thirdMax(self, nums: List[int]) -> int:\n        pass","javascript":"var thirdMax = function(nums) {};","cpp":"class Solution { public: int thirdMax(vector<int>& nums) { return 0; } };"}'::jsonb, 'thirdMax', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find All Numbers Disappeared in an Array', 'Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.', 'EASY', '["Array","HashTable"]'::jsonb, '["Goldman Sachs"]'::jsonb,
        91, 3590, 313, 21540, 7090,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<Integer> findDisappearedNumbers(int[] nums) { return new ArrayList<>(); } }","python":"class Solution:\n    def findDisappearedNumbers(self, nums: List[int]) -> List[int]:\n        pass","javascript":"var findDisappearedNumbers = function(nums) {};","cpp":"class Solution { public: vector<int> findDisappearedNumbers(vector<int>& nums) { return {}; } };"}'::jsonb, 'findDisappearedNumbers', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Hamming Distance', 'The Hamming distance between two integers is the number of positions at which the corresponding bits are different. Given two integers x and y, return the Hamming distance between them.', 'EASY', '["Bit Manipulation"]'::jsonb, '["ByteDance"]'::jsonb,
        91, 2033, 63, 10165, 6468,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int hammingDistance(int x, int y) { return 0; } }","python":"class Solution:\n    def hammingDistance(self, x: int, y: int) -> int:\n        pass","javascript":"var hammingDistance = function(x, y) {};","cpp":"class Solution { public: int hammingDistance(int x, int y) { return 0; } };"}'::jsonb, 'hammingDistance', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Island Perimeter', 'You are given row x col grid representing a map where grid[i][j] = 1 represents land and grid[i][j] = 0 represents water. Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). The island doesn''t have "lakes", meaning the water inside isn''t connected to the water around the island. One cell is a square with side length 1. The grid is rectangular, width and height don''t exceed 100. Determine the perimeter of the island.', 'EASY', '["Array","Matrix"]'::jsonb, '["Bloomberg","Amazon"]'::jsonb,
        94, 1707, 145, 8535, 5640,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int islandPerimeter(int[][] grid) { return 0; } }","python":"class Solution:\n    def islandPerimeter(self, grid: List[List[int]]) -> int:\n        pass","javascript":"var islandPerimeter = function(grid) {};","cpp":"class Solution { public: int islandPerimeter(vector<vector<int>>& grid) { return 0; } };"}'::jsonb, 'islandPerimeter', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Max Consecutive Ones', 'Given a binary array nums, return the maximum number of consecutive 1''s in the array.', 'EASY', '["Array","Sliding Window"]'::jsonb, '["Goldman Sachs","Uber","Oracle"]'::jsonb,
        37, 2770, 454, 5540, 1856,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int findMaxConsecutiveOnes(int[] nums) { return 0; } }","python":"class Solution:\n    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:\n        pass","javascript":"var findMaxConsecutiveOnes = function(nums) {};","cpp":"class Solution { public: int findMaxConsecutiveOnes(vector<int>& nums) { return 0; } };"}'::jsonb, 'findMaxConsecutiveOnes', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Construct the Rectangle', 'A web developer needs to know how to design a web page''s size. So, given a specific rectangular web page’s area, your job by now is to design a rectangular web page, whose length L and width W satisfy the following requirements: 1. The area of the rectangular web page you designed must equal to the given target area. 2. The width W should not be larger than the length L, which means L >= W. 3. The difference between length L and width W should be as small as possible. Return an array [L, W] where L and W are the length and width of the web page you designed in sequence.', 'EASY', '["Math"]'::jsonb, '["Salesforce","Oracle"]'::jsonb,
        86, 969, 167, 2907, 1825,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] constructRectangle(int area) { return new int[]{}; } }","python":"class Solution:\n    def constructRectangle(self, area: int) -> List[int]:\n        pass","javascript":"var constructRectangle = function(area) {};","cpp":"class Solution { public: vector<int> constructRectangle(int area) { return {}; } };"}'::jsonb, 'constructRectangle', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Teemo Attacking', 'Our hero Teemo is attacking an enemy Ashe with poison attacks! One poured poison attack lasts duration seconds. Given a non-decreasing integer array timeSeries, where timeSeries[i] denotes that Teemo attacks Ashe at second timeSeries[i], and an integer duration. Return the total number of seconds that Ashe is poisoned.', 'EASY', '["Array","Simulation"]'::jsonb, '["Salesforce"]'::jsonb,
        48, 2810, 434, 8430, 2739,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int findPoisonedDuration(int[] timeSeries, int duration) { return 0; } }","python":"class Solution:\n    def findPoisonedDuration(self, timeSeries: List[int], duration: int) -> int:\n        pass","javascript":"var findPoisonedDuration = function(timeSeries, duration) {};","cpp":"class Solution { public: int findPoisonedDuration(vector<int>& timeSeries, int duration) { return 0; } };"}'::jsonb, 'findPoisonedDuration', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Keyboard Row', 'Given an array of strings words, return the words that can be typed using letters of the alphabet on only one row of American keyboard like the image below.', 'EASY', '["Array","Hash Table","String"]'::jsonb, '["Salesforce"]'::jsonb,
        43, 4266, 542, 8532, 4392,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String[] findWords(String[] words) { return new String[]{}; } }","python":"class Solution:\n    def findWords(self, words: List[str]) -> List[str]:\n        pass","javascript":"var findWords = function(words) {};","cpp":"class Solution { public: vector<string> findWords(vector<string>& words) { return {}; } };"}'::jsonb, 'findWords', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find Mode in Binary Search Tree', 'Given the root of a binary search tree (BST) with duplicates, return all the mode(s) (i.e., the most frequently occurred element) in it.', 'EASY', '["Tree","DFS","Binary Search Tree"]'::jsonb, '["ByteDance"]'::jsonb,
        51, 4366, 626, 17464, 12076,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] findMode(TreeNode root) { return new int[]{}; } }","python":"class Solution:\n    def findMode(self, root: Optional[TreeNode]) -> List[int]:\n        pass","javascript":"var findMode = function(root) {};","cpp":"class Solution { public: vector<int> findMode(TreeNode* root) { return {}; } };"}'::jsonb, 'findMode', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Convert BST to Greater Tree', 'Given the root of a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus the sum of all keys greater than the original key in BST.', 'MEDIUM', '["Tree","DFS","Binary Search Tree"]'::jsonb, '["Stripe","Target","Salesforce","Apple"]'::jsonb,
        61, 184, 6, 368, 143,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public TreeNode convertBST(TreeNode root) { return null; } }","python":"class Solution:\n    def convertBST(self, root: Optional[TreeNode]) -> Optional[TreeNode]:\n        pass","javascript":"var convertBST = function(root) {};","cpp":"class Solution { public: TreeNode* convertBST(TreeNode* root) { return nullptr; } };"}'::jsonb, 'convertBST', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Spiral Matrix II', 'Given a positive integer n, generate an n x n matrix filled with elements from 1 to n^2 in spiral order.', 'MEDIUM', '["Array","Matrix","Simulation"]'::jsonb, '["Walmart","Airbnb"]'::jsonb,
        16, 4440, 218, 22200, 14063,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[][] generateMatrix(int n) { return new int[][]{}; } }","javascript":"var generateMatrix = function(n) {};","python":"class Solution:\n    def generateMatrix(self, n: int) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> generateMatrix(int n) { return {}; } };"}'::jsonb, 'generateMatrix', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Permutation Sequence', 'The set [1, 2, 3, ..., n] contains a total of n! unique permutations. Given n and k, return the kth permutation sequence.', 'HARD', '["Math","Recursion"]'::jsonb, '["Walmart"]'::jsonb,
        54, 2838, 67, 17028, 7256,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String getPermutation(int n, int k) { return \"\"; } }","javascript":"var getPermutation = function(n, k) {};","python":"class Solution:\n    def getPermutation(self, n: int, k: int) -> str:\n        pass","cpp":"class Solution { public: string getPermutation(int n, int k) { return \"\"; } };"}'::jsonb, 'getPermutation', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Partition List', 'Given the head of a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.', 'MEDIUM', '["Linked List","Two Pointers"]'::jsonb, '["Walmart","Intel","Spotify","Tesla"]'::jsonb,
        57, 267, 12, 1335, 690,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public ListNode partition(ListNode head, int x) { return null; } }","javascript":"var partition = function(head, x) {};","python":"class Solution:\n    def partition(self, head: Optional[ListNode], x: int) -> Optional[ListNode]:\n        pass","cpp":"class Solution { public: ListNode* partition(ListNode* head, int x) { return nullptr; } };"}'::jsonb, 'partition', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Gray Code', 'An n-bit gray code sequence is a sequence of 2^n integers where: Every integer is in the inclusive range [0, 2^n - 1], the first integer is 0, an integer appears no more than once in the sequence, the binary representation of every pair of adjacent integers differs by exactly one bit, and the binary representation of the first and last integers differs by exactly one bit. Given an integer n, return any valid n-bit gray code sequence.', 'MEDIUM', '["Math","Backtracking","Bit Manipulation"]'::jsonb, '["Target","Tesla","Google","Nvidia"]'::jsonb,
        38, 320, 59, 1600, 1003,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<Integer> grayCode(int n) { return new ArrayList<>(); } }","javascript":"var grayCode = function(n) {};","python":"class Solution:\n    def grayCode(self, n: int) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> grayCode(int n) { return {}; } };"}'::jsonb, 'grayCode', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Subsets II', 'Given an integer array nums that may contain duplicates, return all possible subsets (the power set). The solution set must not contain duplicate subsets. Return the solution in any order.', 'MEDIUM', '["Array","Backtracking","Bit Manipulation"]'::jsonb, '["Netflix","Salesforce"]'::jsonb,
        13, 2236, 327, 8944, 6049,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<List<Integer>> subsetsWithDup(int[] nums) { return new ArrayList<>(); } }","javascript":"var subsetsWithDup = function(nums) {};","python":"class Solution:\n    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> subsetsWithDup(vector<int>& nums) { return {}; } };"}'::jsonb, 'subsetsWithDup', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Unique Binary Search Trees', 'Given an integer n, return the number of structurally unique BST''s (binary search trees) which has exactly n nodes of unique values from 1 to n.', 'MEDIUM', '["Math","Dynamic Programming","Tree","Binary Search Tree"]'::jsonb, '["IBM","Facebook"]'::jsonb,
        55, 489, 47, 1467, 789,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int numTrees(int n) { return 0; } }","javascript":"var numTrees = function(n) {};","python":"class Solution:\n    def numTrees(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int numTrees(int n) { return 0; } };"}'::jsonb, 'numTrees', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Unique Binary Search Trees II', 'Given an integer n, return all the structurally unique BST''s (binary search trees), which has exactly n nodes of unique values from 1 to n. Return the answer in any order.', 'MEDIUM', '["Dynamic Programming","Backtracking","Tree","Binary Search Tree"]'::jsonb, '["Microsoft","Facebook"]'::jsonb,
        32, 1308, 72, 5232, 1722,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<TreeNode> generateTrees(int n) { return new ArrayList<>(); } }","javascript":"var generateTrees = function(n) {};","python":"class Solution:\n    def generateTrees(self, n: int) -> List[Optional[TreeNode]]:\n        pass","cpp":"class Solution { public: vector<TreeNode*> generateTrees(int n) { return {}; } };"}'::jsonb, 'generateTrees', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Recover Binary Search Tree', 'You are given the root of a binary search tree (BST), where the values of exactly two nodes of the tree were swapped by mistake. Recover the tree without changing its structure.', 'MEDIUM', '["Tree","DFS","Binary Search Tree"]'::jsonb, '["Cisco","Tesla","Uber","Google"]'::jsonb,
        8, 3978, 789, 15912, 7337,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public void recoverTree(TreeNode root) {} }","javascript":"var recoverTree = function(root) {};","python":"class Solution:\n    def recoverTree(self, root: Optional[TreeNode]) -> None:\n        pass","cpp":"class Solution { public: void recoverTree(TreeNode* root) {} };"}'::jsonb, 'recoverTree', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Triangle', 'Given a triangle array, return the minimum path sum from top to bottom. For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.', 'MEDIUM', '["Array","Dynamic Programming"]'::jsonb, '["Bloomberg"]'::jsonb,
        72, 3628, 498, 21768, 10407,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minimumTotal(List<List<Integer>> triangle) { return 0; } }","javascript":"var minimumTotal = function(triangle) {};","python":"class Solution:\n    def minimumTotal(self, triangle: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int minimumTotal(vector<vector<int>>& triangle) { return 0; } };"}'::jsonb, 'minimumTotal', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Best Time to Buy and Sell Stock with Cooldown', 'You are given an array prices where prices[i] is the price of a given stock on the ith day. Find the maximum profit you can achieve. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times) with the following restrictions: After you sell your stock, you cannot buy stock on the next day (i.e., cooldown one day).', 'MEDIUM', '["Array","Dynamic Programming"]'::jsonb, '["Morgan Stanley","Walmart","Adobe"]'::jsonb,
        21, 1296, 251, 5184, 1880,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxProfit(int[] prices) { return 0; } }","javascript":"var maxProfit = function(prices) {};","python":"class Solution:\n    def maxProfit(self, prices: List[int]) -> int:\n        pass","cpp":"class Solution { public: int maxProfit(vector<int>& prices) { return 0; } };"}'::jsonb, 'maxProfit', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Additive Number', 'An additive number is a string whose digits can form an additive sequence. A valid additive sequence should contain at least three numbers. Except for the first two numbers, each subsequent number in the sequence must be the sum of the preceding two.', 'MEDIUM', '["String","Backtracking"]'::jsonb, '["Nvidia","Morgan Stanley"]'::jsonb,
        28, 4675, 661, 18700, 11279,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean isAdditiveNumber(String num) { return false; } }","javascript":"var isAdditiveNumber = function(num) {};","python":"class Solution:\n    def isAdditiveNumber(self, num: str) -> bool:\n        pass","cpp":"class Solution { public: bool isAdditiveNumber(string num) { return false; } };"}'::jsonb, 'isAdditiveNumber', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Range Sum Query 2D - Immutable', 'Given a 2D matrix matrix, handle multiple queries of the following type: Calculate the sum of the elements of matrix inside the rectangle defined by its upper left corner (row1, col1) and lower right corner (row2, col2).', 'MEDIUM', '["Array","Design","Matrix","Prefix Sum"]'::jsonb, '["Amazon","Nvidia"]'::jsonb,
        12, 2659, 479, 7977, 4903,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class NumMatrix { public NumMatrix(int[][] matrix) {} public int sumRegion(int row1, int col1, int row2, int col2) { return 0; } }","javascript":"var NumMatrix = function(matrix) {}; NumMatrix.prototype.sumRegion = function(row1, col1, row2, col2) {};","python":"class NumMatrix:\n    def __init__(self, matrix: List[List[int]]):\n        pass\n    def sumRegion(self, row1: int, col1: int, row2: int, col2: int) -> int:\n        pass","cpp":"class NumMatrix { public: NumMatrix(vector<vector<int>>& matrix) {} int sumRegion(int row1, int col1, int row2, int col2) { return 0; } };"}'::jsonb, 'sumRegion', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Super Ugly Number', 'A super ugly number is a positive integer whose prime factors are in the array primes. Given an integer n and an array of integers primes, return the nth super ugly number.', 'MEDIUM', '["Array","Math","Dynamic Programming","Heap"]'::jsonb, '["IBM","Goldman Sachs","Nvidia","Morgan Stanley"]'::jsonb,
        32, 2879, 491, 14395, 4672,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int nthSuperUglyNumber(int n, int[] primes) { return 0; } }","javascript":"var nthSuperUglyNumber = function(n, primes) {};","python":"class Solution:\n    def nthSuperUglyNumber(self, n: int, primes: List[int]) -> int:\n        pass","cpp":"class Solution { public: int nthSuperUglyNumber(int n, vector<int>& primes) { return 0; } };"}'::jsonb, 'nthSuperUglyNumber', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Remove Duplicate Letters', 'Given a string s, remove duplicate letters so that every letter appears once and only once. You must make sure your result is the smallest in lexicographical order among all possible results.', 'MEDIUM', '["String","Stack","Greedy","Monotonic Stack"]'::jsonb, '["SpaceX","Google"]'::jsonb,
        13, 1684, 98, 5052, 2359,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String removeDuplicateLetters(String s) { return \"\"; } }","javascript":"var removeDuplicateLetters = function(s) {};","python":"class Solution:\n    def removeDuplicateLetters(self, s: str) -> str:\n        pass","cpp":"class Solution { public: string removeDuplicateLetters(string s) { return \"\"; } };"}'::jsonb, 'removeDuplicateLetters', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Bulb Switcher', 'There are n bulbs that are initially off. You first turn on all the bulbs, then you turn off every second bulb. On the third round, you toggle every third bulb, and so on. For the ith round, you toggle every i bulb. For the nth round, you only toggle the last bulb. Return the number of bulbs that are on after n rounds.', 'MEDIUM', '["Math","Brainteaser"]'::jsonb, '["Microsoft","Intel","Spotify"]'::jsonb,
        88, 4042, 131, 24252, 15631,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int bulbSwitch(int n) { return 0; } }","javascript":"var bulbSwitch = function(n) {};","python":"class Solution:\n    def bulbSwitch(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int bulbSwitch(int n) { return 0; } };"}'::jsonb, 'bulbSwitch', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Wiggle Sort II', 'Given an integer array nums, reorder it such that nums[0] < nums[1] > nums[2] < nums[3]....', 'MEDIUM', '["Array","Divide and Conquer","Sorting","Quickselect"]'::jsonb, '["Adobe","Target","Nvidia"]'::jsonb,
        66, 529, 71, 2645, 1607,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public void wiggleSort(int[] nums) {} }","javascript":"var wiggleSort = function(nums) {};","python":"class Solution:\n    def wiggleSort(self, nums: List[int]) -> None:\n        pass","cpp":"class Solution { public: void wiggleSort(vector<int>& nums) {} };"}'::jsonb, 'wiggleSort', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Increasing Triplet Subsequence', 'Given an integer array nums, return true if there exists a triple of indices (i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k]. If no such indices exists, return false.', 'MEDIUM', '["Array","Greedy"]'::jsonb, '["Target"]'::jsonb,
        56, 1897, 223, 11382, 6323,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean increasingTriplet(int[] nums) { return false; } }","javascript":"var increasingTriplet = function(nums) {};","python":"class Solution:\n    def increasingTriplet(self, nums: List[int]) -> bool:\n        pass","cpp":"class Solution { public: bool increasingTriplet(vector<int>& nums) { return false; } };"}'::jsonb, 'increasingTriplet', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'House Robber III', 'The thief has found himself a new place for his thievery again. There is only one entrance to this area, called root. Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that all houses in this place form a binary tree. It will automatically contact the police if two directly-linked houses were broken into on the same night. Given the root of the binary tree, return the maximum amount of money the thief can rob without alerting the police.', 'MEDIUM', '["Dynamic Programming","Tree","DFS","Binary Tree"]'::jsonb, '["SpaceX","Adobe","Spotify"]'::jsonb,
        15, 4721, 207, 18884, 13166,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int rob(TreeNode root) { return 0; } }","javascript":"var rob = function(root) {};","python":"class Solution:\n    def rob(self, root: Optional[TreeNode]) -> int:\n        pass","cpp":"class Solution { public: int rob(TreeNode* root) { return 0; } };"}'::jsonb, 'rob', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Flatten Nested List Iterator', 'You are given a nested list of integers nestedList. Each element is either an integer or a list whose elements may also be integers or other lists. Implement an iterator to flatten it.', 'MEDIUM', '["Stack","Tree","Design","DFS","Queue"]'::jsonb, '["Shopify","Facebook","Airbnb","Bloomberg"]'::jsonb,
        91, 88, 4, 528, 204,
        '[]'::jsonb, '[]'::jsonb, '{"java":"public class NestedIterator implements Iterator<Integer> { public NestedIterator(List<NestedInteger> nestedList) {} @Override public Integer next() { return 0; } @Override public boolean hasNext() { return false; } }","javascript":"var NestedIterator = function(nestedList) {}; NestedIterator.prototype.hasNext = function() {}; NestedIterator.prototype.next = function() {};","python":"class NestedIterator:\n    def __init__(self, nestedList: [NestedInteger]):\n        pass\n    def next(self) -> int:\n        pass\n    def hasNext(self) -> bool:\n        pass","cpp":"class NestedIterator { public: NestedIterator(vector<NestedInteger> &nestedList) {} int next() { return 0; } bool hasNext() { return false; } };"}'::jsonb, 'next', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Integer Break', 'Given an integer n, break it into the sum of k positive integers, where k >= 2, and maximize the product of those integers. Return the maximum product you can get.', 'MEDIUM', '["Math","Dynamic Programming"]'::jsonb, '["Intel","Stripe","Apple","Microsoft"]'::jsonb,
        31, 553, 46, 2212, 1337,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int integerBreak(int n) { return 0; } }","javascript":"var integerBreak = function(n) {};","python":"class Solution:\n    def integerBreak(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int integerBreak(int n) { return 0; } };"}'::jsonb, 'integerBreak', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Count Numbers with Unique Digits', 'Given an integer n, return the count of all numbers with unique digits, x, where 0 <= x < 10^n.', 'MEDIUM', '["Math","Dynamic Programming","Backtracking"]'::jsonb, '["Amazon","Shopify","Bloomberg","Stripe"]'::jsonb,
        55, 3518, 485, 21108, 9134,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int countNumbersWithUniqueDigits(int n) { return 0; } }","javascript":"var countNumbersWithUniqueDigits = function(n) {};","python":"class Solution:\n    def countNumbersWithUniqueDigits(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int countNumbersWithUniqueDigits(int n) { return 0; } };"}'::jsonb, 'countNumbersWithUniqueDigits', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Russian Doll Envelopes', 'You are given a 2D array of integers envelopes where envelopes[i] = [wi, hi] represents the width and the height of an envelope. One envelope can fit into another if and only if both the width and height of one envelope are greater than the other envelope''s width and height. Return the maximum number of envelopes you can Russian doll (i.e., put one inside the other).', 'HARD', '["Array","Binary Search","Dynamic Programming","Sorting"]'::jsonb, '["IBM","SpaceX","Goldman Sachs","ByteDance"]'::jsonb,
        65, 4498, 550, 8996, 3795,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxEnvelopes(int[][] envelopes) { return 0; } }","javascript":"var maxEnvelopes = function(envelopes) {};","python":"class Solution:\n    def maxEnvelopes(self, envelopes: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int maxEnvelopes(vector<vector<int>>& envelopes) { return 0; } };"}'::jsonb, 'maxEnvelopes', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Design Twitter', 'Design a simplified version of Twitter where users can post tweets, follow/unfollow another user, and is able to see the 10 most recent tweets in the user''s news feed.', 'MEDIUM', '["Hash Table","Linked List","Design","Heap"]'::jsonb, '["JPMorgan","Twitter"]'::jsonb,
        40, 1580, 302, 4740, 2866,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Twitter { public Twitter() {} public void postTweet(int userId, int tweetId) {} public List<Integer> getNewsFeed(int userId) { return new ArrayList<>(); } public void follow(int followerId, int followeeId) {} public void unfollow(int followerId, int followeeId) {} }","javascript":"var Twitter = function() {}; Twitter.prototype.postTweet = function(userId, tweetId) {}; Twitter.prototype.getNewsFeed = function(userId) {}; Twitter.prototype.follow = function(followerId, followeeId) {}; Twitter.prototype.unfollow = function(followerId, followeeId) {};","python":"class Twitter:\n    def __init__(self):\n        pass\n    def postTweet(self, userId: int, tweetId: int) -> None:\n        pass\n    def getNewsFeed(self, userId: int) -> List[int]:\n        pass\n    def follow(self, followerId: int, followeeId: int) -> None:\n        pass\n    def unfollow(self, followerId: int, followeeId: int) -> None:\n        pass","cpp":"class Twitter { public: Twitter() {} void postTweet(int userId, int tweetId) {} vector<int> getNewsFeed(int userId) { return {}; } void follow(int followerId, int followeeId) {} void unfollow(int followerId, int followeeId) {} };"}'::jsonb, 'postTweet', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sort Characters By Frequency', 'Given a string s, sort it in decreasing order based on the frequency of the characters. The frequency of a character is the number of times it appears in the string. Return the sorted string. If there are multiple answers, return any of them.', 'MEDIUM', '["Hash Table","String","Sorting","Heap","Bucket Sort","Counting"]'::jsonb, '["Shopify","Spotify"]'::jsonb,
        23, 3479, 231, 17395, 10906,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String frequencySort(String s) { return \"\"; } }","javascript":"var frequencySort = function(s) {};","python":"class Solution:\n    def frequencySort(self, s: str) -> str:\n        pass","cpp":"class Solution { public: string frequencySort(string s) { return \"\"; } };"}'::jsonb, 'frequencySort', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Arithmetic Slices', 'An integer array is called arithmetic if it consists of at least three elements and if the difference between any two consecutive elements is the same. Given an integer array nums, return the number of arithmetic subarrays of nums.', 'MEDIUM', '["Array","Dynamic Programming"]'::jsonb, '["Walmart","Airbnb","Morgan Stanley","Apple"]'::jsonb,
        67, 3507, 195, 7014, 4810,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int numberOfArithmeticSlices(int[] nums) { return 0; } }","javascript":"var numberOfArithmeticSlices = function(nums) {};","python":"class Solution:\n    def numberOfArithmeticSlices(self, nums: List[int]) -> int:\n        pass","cpp":"class Solution { public: int numberOfArithmeticSlices(vector<int>& nums) { return 0; } };"}'::jsonb, 'numberOfArithmeticSlices', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Pacific Atlantic Water Flow', 'There is an m x n rectangular island that borders both the Pacific Ocean and Atlantic Ocean. The Pacific Ocean touches the island''s left and top edges, and the Atlantic Ocean touches the island''s right and bottom edges. Return a list of grid coordinates where water can flow to both the Pacific and Atlantic oceans.', 'MEDIUM', '["Array","DFS","BFS","Matrix"]'::jsonb, '["Apple","JPMorgan","Microsoft"]'::jsonb,
        18, 4090, 186, 16360, 10592,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<List<Integer>> pacificAtlantic(int[][] heights) { return new ArrayList<>(); } }","javascript":"var pacificAtlantic = function(heights) {};","python":"class Solution:\n    def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> pacificAtlantic(vector<vector<int>>& heights) { return {}; } };"}'::jsonb, 'pacificAtlantic', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Battleships in a Board', 'Given an m x n matrix board where each cell is a battleship ''X'' or empty ''.'', return the number of the battleships on board.', 'MEDIUM', '["Array","DFS","Matrix"]'::jsonb, '["Morgan Stanley","IBM"]'::jsonb,
        36, 4136, 712, 20680, 10106,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int countBattleships(char[][] board) { return 0; } }","javascript":"var countBattleships = function(board) {};","python":"class Solution:\n    def countBattleships(self, board: List[List[str]]) -> int:\n        pass","cpp":"class Solution { public: int countBattleships(vector<vector<char>>& board) { return 0; } };"}'::jsonb, 'countBattleships', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find Right Interval', 'You are given an array of intervals, where intervals[i] = [starti, endi] and each starti is unique. The right interval for an interval i is an interval j such that startj >= endi and startj is minimized. Note that i may equal j. Return an array of right interval indices for each interval i. If no right interval exists for interval i, then put -1 at index i.', 'MEDIUM', '["Array","Binary Search","Sorting"]'::jsonb, '["Cisco"]'::jsonb,
        25, 1993, 329, 5979, 3703,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] findRightInterval(int[][] intervals) { return new int[]{}; } }","javascript":"var findRightInterval = function(intervals) {};","python":"class Solution:\n    def findRightInterval(self, intervals: List[List[int]]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> findRightInterval(vector<vector<int>>& intervals) { return {}; } };"}'::jsonb, 'findRightInterval', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find All Duplicates in an Array', 'Given an integer array nums of length n where all the integers of nums are in the range [1, n] and each integer appears once or twice, return an array of all the integers that appears twice.', 'MEDIUM', '["Array","Hash Table"]'::jsonb, '["Airbnb"]'::jsonb,
        96, 3808, 626, 22848, 10335,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<Integer> findDuplicates(int[] nums) { return new ArrayList<>(); } }","javascript":"var findDuplicates = function(nums) {};","python":"class Solution:\n    def findDuplicates(self, nums: List[int]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> findDuplicates(vector<int>& nums) { return {}; } };"}'::jsonb, 'findDuplicates', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'String Compression', 'Given an array of characters chars, compress it using the following algorithm: Begin with an empty string s. For each group of consecutive repeating characters in chars: If the group''s length is 1, append the character to s. Otherwise, append the character followed by the group''s length.', 'MEDIUM', '["Two Pointers","String"]'::jsonb, '["Adobe"]'::jsonb,
        87, 1267, 190, 6335, 2567,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int compress(char[] chars) { return 0; } }","javascript":"var compress = function(chars) {};","python":"class Solution:\n    def compress(self, chars: List[str]) -> int:\n        pass","cpp":"class Solution { public: int compress(vector<char>& chars) { return 0; } };"}'::jsonb, 'compress', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Add Two Numbers II', 'You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.', 'MEDIUM', '["Linked List","Math","Stack"]'::jsonb, '["JPMorgan","Microsoft","Walmart","Salesforce"]'::jsonb,
        29, 4325, 703, 21625, 13788,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public ListNode addTwoNumbers(ListNode l1, ListNode l2) { return null; } }","javascript":"var addTwoNumbers = function(l1, l2) {};","python":"class Solution:\n    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:\n        pass","cpp":"class Solution { public: ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) { return nullptr; } };"}'::jsonb, 'addTwoNumbers', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Number of Boomerangs', 'You are given n points in the plane that are all distinct, where points[i] = [xi, yi]. A boomerang is a tuple of points (i, j, k) such that the distance between i and j equals the distance between i and k (the order of the tuple matters). Return the number of boomerangs.', 'MEDIUM', '["Array","Hash Table","Math"]'::jsonb, '["Amazon","Goldman Sachs","Microsoft"]'::jsonb,
        87, 1494, 171, 5976, 2261,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int numberOfBoomerangs(int[][] points) { return 0; } }","javascript":"var numberOfBoomerangs = function(points) {};","python":"class Solution:\n    def numberOfBoomerangs(self, points: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int numberOfBoomerangs(vector<vector<int>>& points) { return 0; } };"}'::jsonb, 'numberOfBoomerangs', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Serialize and Deserialize BST', 'Serialization is converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment. Design an algorithm to serialize and deserialize a binary search tree.', 'MEDIUM', '["String","Tree","DFS","BFS","Binary Search Tree"]'::jsonb, '["Airbnb"]'::jsonb,
        42, 18, 1, 36, 17,
        '[]'::jsonb, '[]'::jsonb, '{"java":"public class Codec { public String serialize(TreeNode root) { return \"\"; } public TreeNode deserialize(String data) { return null; } }","javascript":"var serialize = function(root) {}; var deserialize = function(data) {};","python":"class Codec:\n    def serialize(self, root: Optional[TreeNode]) -> str:\n        pass\n    def deserialize(self, data: str) -> Optional[TreeNode]:\n        pass","cpp":"class Codec { public: string serialize(TreeNode* root) { return \"\"; } TreeNode* deserialize(string data) { return nullptr; } };"}'::jsonb, 'serialize', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Delete Node in a BST', 'Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.', 'MEDIUM', '["Tree","Binary Search Tree"]'::jsonb, '["JPMorgan"]'::jsonb,
        61, 1888, 197, 11328, 5618,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public TreeNode deleteNode(TreeNode root, int key) { return null; } }","javascript":"var deleteNode = function(root, key) {};","python":"class Solution:\n    def deleteNode(self, root: Optional[TreeNode], key: int) -> Optional[TreeNode]:\n        pass","cpp":"class Solution { public: TreeNode* deleteNode(TreeNode* root, int key) { return nullptr; } };"}'::jsonb, 'deleteNode', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Frequency of the Most Frequent Element', 'The frequency of an element is the number of times it occurs in an array. You are given an integer array nums and an integer k. In one operation, you can choose an index of nums and increment the element at that index by 1. Return the maximum possible frequency of an element after performing at most k operations.', 'MEDIUM', '["Array","Binary Search","Greedy","Sliding Window","Sorting","Prefix Sum"]'::jsonb, '["Nvidia","Microsoft","Intel"]'::jsonb,
        61, 338, 38, 1014, 655,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxFrequency(int[] nums, int k) { return 0; } }","javascript":"var maxFrequency = function(nums, k) {};","python":"class Solution:\n    def maxFrequency(self, nums: List[int], k: int) -> int:\n        pass","cpp":"class Solution { public: int maxFrequency(vector<int>& nums, int k) { return 0; } };"}'::jsonb, 'maxFrequency', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum ASCII Delete Sum for Two Strings', 'Given two strings s1 and s2, return the lowest ASCII sum of deleted characters to make two strings equal.', 'MEDIUM', '["String","Dynamic Programming"]'::jsonb, '["Uber"]'::jsonb,
        73, 1392, 121, 2784, 1349,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minimumDeleteSum(String s1, String s2) { return 0; } }","javascript":"var minimumDeleteSum = function(s1, s2) {};","python":"class Solution:\n    def minimumDeleteSum(self, s1: str, s2: str) -> int:\n        pass","cpp":"class Solution { public: int minimumDeleteSum(string s1, string s2) { return 0; } };"}'::jsonb, 'minimumDeleteSum', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Random Pick with Weight', 'You are given a 0-indexed array of positive integers w where w[i] describes the weight of the ith index. You need to implement the function pickIndex(), which randomly picks an index in the range [0, w.length - 1] (inclusive) and returns it. The probability of picking an index i is w[i] / sum(w).', 'MEDIUM', '["Array","Math","Binary Search","Prefix Sum","Randomized"]'::jsonb, '["Walmart","JPMorgan","Tesla"]'::jsonb,
        16, 2450, 230, 14700, 8384,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public Solution(int[] w) {} public int pickIndex() { return 0; } }","javascript":"var Solution = function(w) {}; Solution.prototype.pickIndex = function() {};","python":"class Solution:\n    def __init__(self, w: List[int]):\n        pass\n    def pickIndex(self) -> int:\n        pass","cpp":"class Solution { public: Solution(vector<int>& w) {} int pickIndex() { return 0; } };"}'::jsonb, 'pickIndex', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Exam Room', 'There is an exam room with n seats in a single row labeled from 0 to n - 1. When a student enters the room, they must sit in the seat that maximizes the distance to the closest person. If there are multiple such seats, they sit in the seat with the lowest number. If no one is in the room, then the student sits at seat number 0.', 'MEDIUM', '["Design","Heap"]'::jsonb, '["Oracle","Netflix","Uber","Google"]'::jsonb,
        47, 2899, 349, 14495, 6751,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class ExamRoom { public ExamRoom(int n) {} public int seat() { return 0; } public void leave(int p) {} }","javascript":"var ExamRoom = function(n) {}; ExamRoom.prototype.seat = function() {}; ExamRoom.prototype.leave = function(p) {};","python":"class ExamRoom:\n    def __init__(self, n: int):\n        pass\n    def seat(self) -> int:\n        pass\n    def leave(self, p: int) -> None:\n        pass","cpp":"class ExamRoom { public: ExamRoom(int n) {} int seat() { return 0; } void leave(int p) {} };"}'::jsonb, 'seat', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Score of Parentheses', 'Given a balanced parentheses string s, return the score of the string. The score of a balanced parentheses string is based on the following rule: "()" has score 1. AB has score A + B, where A and B are balanced parentheses strings. (A) has score 2 * A, where A is a balanced parentheses string.', 'MEDIUM', '["String","Stack"]'::jsonb, '["JPMorgan","Google","Spotify"]'::jsonb,
        93, 3005, 398, 6010, 3527,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int scoreOfParentheses(String s) { return 0; } }","javascript":"var scoreOfParentheses = function(s) {};","python":"class Solution:\n    def scoreOfParentheses(self, s: str) -> int:\n        pass","cpp":"class Solution { public: int scoreOfParentheses(string s) { return 0; } };"}'::jsonb, 'scoreOfParentheses', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Mirror Reflection', 'There is a special square room with mirrors on each of the four walls. Except for the southwest corner, there are receptors on each of the remaining corners, numbered 0, 1, and 2. The square room has walls of length p and a laser ray from the southwest corner first meets the east wall at a distance q from the 0th receptor. Given the two integers p and q, return the number of the receptor that the ray meets first.', 'MEDIUM', '["Math","Geometry"]'::jsonb, '["Walmart","Microsoft"]'::jsonb,
        98, 4103, 584, 24618, 11542,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int mirrorReflection(int p, int q) { return 0; } }","javascript":"var mirrorReflection = function(p, q) {};","python":"class Solution:\n    def mirrorReflection(self, p: int, q: int) -> int:\n        pass","cpp":"class Solution { public: int mirrorReflection(int p, int q) { return 0; } };"}'::jsonb, 'mirrorReflection', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Buddy Strings', 'Given two strings s and goal, return true if you can swap two letters in s so the result is equal to goal, otherwise, return false.', 'EASY', '["Hash Table","String"]'::jsonb, '["Twitter","AMD","Nvidia"]'::jsonb,
        20, 4637, 728, 9274, 3878,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean buddyStrings(String s, String goal) { return false; } }","javascript":"var buddyStrings = function(s, goal) {};","python":"class Solution:\n    def buddyStrings(self, s: str, goal: str) -> bool:\n        pass","cpp":"class Solution { public: bool buddyStrings(string s, string goal) { return false; } };"}'::jsonb, 'buddyStrings', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'All Nodes Distance K in Binary Tree', 'Given the root of a binary tree, the value of a target node target, and an integer k, return an array of the values of all nodes that have a distance k from the target node. You can return the answer in any order.', 'MEDIUM', '["Tree","DFS","BFS","Binary Tree"]'::jsonb, '["Amazon"]'::jsonb,
        73, 4924, 505, 29544, 15579,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<Integer> distanceK(TreeNode root, TreeNode target, int k) { return new ArrayList<>(); } }","javascript":"var distanceK = function(root, target, k) {};","python":"class Solution:\n    def distanceK(self, root: TreeNode, target: TreeNode, k: int) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> distanceK(TreeNode* root, TreeNode* target, int k) { return {}; } };"}'::jsonb, 'distanceK', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Smallest Subtree with all the Deepest Nodes', 'Given the root of a binary tree, the depth of each node is the shortest distance to the root. Return the smallest subtree such that it contains all the deepest nodes in the original tree.', 'MEDIUM', '["Tree","DFS","BFS","Binary Tree"]'::jsonb, '["Cisco","SpaceX"]'::jsonb,
        44, 3743, 431, 7486, 4045,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public TreeNode subtreeWithAllDeepest(TreeNode root) { return null; } }","javascript":"var subtreeWithAllDeepest = function(root) {};","python":"class Solution:\n    def subtreeWithAllDeepest(self, root: TreeNode) -> TreeNode:\n        pass","cpp":"class Solution { public: TreeNode* subtreeWithAllDeepest(TreeNode* root) { return nullptr; } };"}'::jsonb, 'subtreeWithAllDeepest', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Score After Flipping Matrix', 'You are given an m x n binary matrix grid. A move consists of choosing any row or column and toggling each value in that row or column (i.e., changing all 0''s to 1''s, and all 1''s to 0''s). Every row of the matrix is interpreted as a binary number, and the score of the matrix is the sum of these numbers. Return the highest possible score after making any number of moves (including zero moves).', 'MEDIUM', '["Array","Greedy","Bit Manipulation","Matrix"]'::jsonb, '["Nvidia","Airbnb"]'::jsonb,
        97, 2255, 443, 11275, 5358,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int matrixScore(int[][] grid) { return 0; } }","javascript":"var matrixScore = function(grid) {};","python":"class Solution:\n    def matrixScore(self, grid: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int matrixScore(vector<vector<int>>& grid) { return 0; } };"}'::jsonb, 'matrixScore', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Advantage Shuffle', 'You are given two integer arrays nums1 and nums2 of the same length. The advantage of nums1 with respect to nums2 is the number of indices i for which nums1[i] > nums2[i]. Return any permutation of nums1 that maximizes its advantage with respect to nums2.', 'MEDIUM', '["Array","Two Pointers","Greedy","Sorting"]'::jsonb, '["Microsoft","Bloomberg"]'::jsonb,
        15, 4377, 274, 13131, 4147,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] advantageCount(int[] nums1, int[] nums2) { return new int[]{}; } }","javascript":"var advantageCount = function(nums1, nums2) {};","python":"class Solution:\n    def advantageCount(self, nums1: List[int], nums2: List[int]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> advantageCount(vector<int>& nums1, vector<int>& nums2) { return {}; } };"}'::jsonb, 'advantageCount', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Spiral Matrix III', 'You start at the cell (rStart, cStart) of an rows x cols grid facing east. The northwest corner is at the first row and column in the grid, and the southeast corner is at the last row and column. You will walk in a clockwise spiral shape to visit every position in this grid. Calculate the total number of steps to visit every position.', 'MEDIUM', '["Array","Matrix","Simulation"]'::jsonb, '["Microsoft","Bloomberg","Goldman Sachs"]'::jsonb,
        22, 1163, 125, 6978, 4563,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[][] spiralMatrixIII(int rows, int cols, int rStart, int cStart) { return new int[][]{}; } }","javascript":"var spiralMatrixIII = function(rows, cols, rStart, cStart) {};","python":"class Solution:\n    def spiralMatrixIII(self, rows: int, cols: int, rStart: int, cStart: int) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> spiralMatrixIII(int rows, int cols, int rStart, int cStart) { return {}; } };"}'::jsonb, 'spiralMatrixIII', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Possible Bipartition', 'We want to split a group of n people (labeled from 1 to n) into two groups of any size. Each person may dislike some other people, and they should not go into the same group. Given the integer n and the array dislikes where dislikes[i] = [ai, bi] indicates that the person labeled ai does not like the person labeled bi, return true if it is possible to split everyone into two groups in this way.', 'MEDIUM', '["DFS","BFS","Union Find","Graph"]'::jsonb, '["Adobe","Salesforce"]'::jsonb,
        95, 3843, 395, 15372, 5236,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean possibleBipartition(int n, int[][] dislikes) { return false; } }","javascript":"var possibleBipartition = function(n, dislikes) {};","python":"class Solution:\n    def possibleBipartition(self, n: int, dislikes: List[List[int]]) -> bool:\n        pass","cpp":"class Solution { public: bool possibleBipartition(int n, vector<vector<int>>& dislikes) { return false; } };"}'::jsonb, 'possibleBipartition', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Construct Binary Tree from Preorder and Postorder Traversal', 'Given two integer arrays, preorder and postorder where preorder is the preorder traversal of a binary tree of distinct values and postorder is the postorder traversal of the same tree, reconstruct and return the binary tree.', 'MEDIUM', '["Array","HashTable","Divide and Conquer","Tree","Binary Tree"]'::jsonb, '["Airbnb"]'::jsonb,
        16, 1665, 304, 4995, 2536,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public TreeNode constructFromPrePost(int[] preorder, int[] postorder) { return null; } }","javascript":"var constructFromPrePost = function(preorder, postorder) {};","python":"class Solution:\n    def constructFromPrePost(self, preorder: List[int], postorder: List[int]) -> Optional[TreeNode]:\n        pass","cpp":"class Solution { public: TreeNode* constructFromPrePost(vector<int>& preorder, vector<int>& postorder) { return nullptr; } };"}'::jsonb, 'constructFromPrePost', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find and Replace Pattern', 'Given a list of strings words and a string pattern, return a list of words[i] that match pattern. You may return the answer in any order. A word matches the pattern if there exists a permutation of letters p so that after replacing every letter x in the pattern with p(x), we get the desired word.', 'MEDIUM', '["Array","Hash Table","String"]'::jsonb, '["Netflix","Walmart","Stripe"]'::jsonb,
        69, 3380, 59, 6760, 3198,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<String> findAndReplacePattern(String[] words, String pattern) { return new ArrayList<>(); } }","javascript":"var findAndReplacePattern = function(words, pattern) {};","python":"class Solution:\n    def findAndReplacePattern(self, words: List[str], pattern: str) -> List[str]:\n        pass","cpp":"class Solution { public: vector<string> findAndReplacePattern(vector<string>& words, string pattern) { return {}; } };"}'::jsonb, 'findAndReplacePattern', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'RLE Iterator', 'We can use run-length encoding (RLE) to encode a sequence of integers. In a run-length encoded array of even length encoding, for all even i, encoding[i] tells us the number of times that the non-negative integer value encoding[i + 1] is repeated in the sequence. Implement the RLEIterator class.', 'MEDIUM', '["Array","Design","Counting","Iterator"]'::jsonb, '["Google"]'::jsonb,
        52, 1986, 11, 9930, 3469,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class RLEIterator { public RLEIterator(int[] encoding) {} public int next(int n) { return 0; } }","javascript":"var RLEIterator = function(encoding) {}; RLEIterator.prototype.next = function(n) {};","python":"class RLEIterator:\n    def __init__(self, encoding: List[int]):\n        pass\n    def next(self, n: int) -> int:\n        pass","cpp":"class RLEIterator { public: RLEIterator(vector<int>& encoding) {} int next(int n) { return 0; } };"}'::jsonb, 'next', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Add to Make Parentheses Valid', 'A parentheses string is valid if and only if: It is the empty string, It can be written as AB (A concatenated with B), where A and B are valid strings, or It can be written as (A), where A is a valid string. You are given a parentheses string s. In one move, you can insert a parenthesis at any position of the string. Return the minimum number of moves required to make s valid.', 'MEDIUM', '["String","Stack","Greedy"]'::jsonb, '["Goldman Sachs","IBM","JPMorgan","Facebook"]'::jsonb,
        71, 1401, 54, 8406, 5155,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minAddToMakeValid(String s) { return 0; } }","javascript":"var minAddToMakeValid = function(s) {};","python":"class Solution:\n    def minAddToMakeValid(self, s: str) -> int:\n        pass","cpp":"class Solution { public: int minAddToMakeValid(string s) { return 0; } };"}'::jsonb, 'minAddToMakeValid', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sort Array By Parity', 'Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers. Return any array that satisfies this condition.', 'EASY', '["Array","Two Pointers","Sorting"]'::jsonb, '["Tesla","AMD","LinkedIn"]'::jsonb,
        14, 1888, 226, 9440, 6129,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] sortArrayByParity(int[] nums) { return new int[]{}; } }","javascript":"var sortArrayByParity = function(nums) {};","python":"class Solution:\n    def sortArrayByParity(self, nums: List[int]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> sortArrayByParity(vector<int>& nums) { return {}; } };"}'::jsonb, 'sortArrayByParity', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        '3Sum With Multiplicity', 'Given an integer array arr, and an integer target, return the number of tuples i, j, k such that i < j < k and arr[i] + arr[j] + arr[k] == target. As the answer can be very large, return it modulo 10^9 + 7.', 'MEDIUM', '["Array","Hash Table","Two Pointers","Sorting","Counting"]'::jsonb, '["Bloomberg","Amazon","Airbnb"]'::jsonb,
        30, 3024, 456, 18144, 6073,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int threeSumMulti(int[] arr, int target) { return 0; } }","javascript":"var threeSumMulti = function(arr, target) {};","python":"class Solution:\n    def threeSumMulti(self, arr: List[int], target: int) -> int:\n        pass","cpp":"class Solution { public: int threeSumMulti(vector<int>& arr, int target) { return 0; } };"}'::jsonb, 'threeSumMulti', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Shortest Bridge', 'You are given an n x n binary matrix grid where 1 represents land and 0 represents water. An island is a 4-directionally connected group of 1''s not connected to any other 1''s. There are exactly two islands in grid. You may change 0''s to 1''s to connect the two islands to form one island. Return the smallest number of 0''s you must flip to connect the two islands.', 'MEDIUM', '["Array","DFS","BFS","Matrix"]'::jsonb, '["JPMorgan","Goldman Sachs"]'::jsonb,
        11, 277, 9, 554, 249,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int shortestBridge(int[][] grid) { return 0; } }","javascript":"var shortestBridge = function(grid) {};","python":"class Solution:\n    def shortestBridge(self, grid: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int shortestBridge(vector<vector<int>>& grid) { return 0; } };"}'::jsonb, 'shortestBridge', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Knight Dialer', 'The chess knight has a unique movement, it may move two squares vertically and one square horizontally, or two squares horizontally and one square vertically (with both forming the shape of an L). We have a chess knight and a phone pad as shown below, the knight can only stand on a numeric cell (i.e. blue cell). Given an integer n, return how many distinct phone numbers of length n we can dial.', 'MEDIUM', '["Dynamic Programming"]'::jsonb, '["IBM"]'::jsonb,
        100, 4225, 617, 16900, 5887,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int knightDialer(int n) { return 0; } }","javascript":"var knightDialer = function(n) {};","python":"class Solution:\n    def knightDialer(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int knightDialer(int n) { return 0; } };"}'::jsonb, 'knightDialer', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reorder Data in Log Files', 'You are given an array of logs. Each log is a space-delimited string of words, where the first word is the identifier. There are two types of logs: Letter-logs: All words (except the identifier) consist of lowercase English letters. Digit-logs: All words (except the identifier) consist of digits. Reorder these logs.', 'MEDIUM', '["Array","String","Sorting"]'::jsonb, '["Airbnb"]'::jsonb,
        9, 741, 61, 2223, 1412,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String[] reorderLogFiles(String[] logs) { return new String[]{}; } }","javascript":"var reorderLogFiles = function(logs) {};","python":"class Solution:\n    def reorderLogFiles(self, logs: List[str]) -> List[str]:\n        pass","cpp":"class Solution { public: vector<string> reorderLogFiles(vector<string>& logs) { return {}; } };"}'::jsonb, 'reorderLogFiles', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Range Sum of BST', 'Given the root node of a binary search tree and two integers low and high, return the sum of values of all nodes with a value in the inclusive range [low, high].', 'EASY', '["Tree","DFS","Binary Search Tree"]'::jsonb, '["Cisco","SpaceX","Salesforce","Microsoft"]'::jsonb,
        53, 2952, 331, 14760, 7043,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int rangeSumBST(TreeNode root, int low, int high) { return 0; } }","javascript":"var rangeSumBST = function(root, low, high) {};","python":"class Solution:\n    def rangeSumBST(self, root: Optional[TreeNode], low: int, high: int) -> int:\n        pass","cpp":"class Solution { public: int rangeSumBST(TreeNode* root, int low, int high) { return 0; } };"}'::jsonb, 'rangeSumBST', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Area Rectangle', 'You are given an array of points in the X-Y plane points where points[i] = [xi, yi]. Return the minimum area of a rectangle formed from these points, with sides parallel to the x and y axes. If there is not any such rectangle, return 0.', 'MEDIUM', '["Array","Hash Table","Math","Geometry","Sorting"]'::jsonb, '["Stripe","IBM","Amazon"]'::jsonb,
        9, 1975, 153, 11850, 3773,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minAreaRect(int[][] points) { return 0; } }","javascript":"var minAreaRect = function(points) {};","python":"class Solution:\n    def minAreaRect(self, points: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int minAreaRect(vector<vector<int>>& points) { return 0; } };"}'::jsonb, 'minAreaRect', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Arithmetic Subsequence', 'Given an array nums of integers, return the length of the longest arithmetic subsequence in nums.', 'MEDIUM', '["Array","Hash Table","Binary Search","Dynamic Programming"]'::jsonb, '["Goldman Sachs","Oracle","Salesforce"]'::jsonb,
        78, 570, 103, 2850, 857,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int longestArithSeqLength(int[] nums) { return 0; } }","javascript":"var longestArithSeqLength = function(nums) {};","python":"class Solution:\n    def longestArithSeqLength(self, nums: List[int]) -> int:\n        pass","cpp":"class Solution { public: int longestArithSeqLength(vector<int>& nums) { return 0; } };"}'::jsonb, 'longestArithSeqLength', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Maximum Binary Tree II', 'We are given the root node of a maximum tree: a tree where every node has a value greater than any other value in its subtree. Just as in the previous problem, the given tree was constructed from an list A (root = Construct(A)). We suppose that the Construct operation is generally known. Given a maximum tree defined by root, which denotes the maximum tree constructed from A, and a value val, insert val into the tree so that the resulting tree is also a maximum tree.', 'MEDIUM', '["Tree","Binary Tree"]'::jsonb, '["Goldman Sachs","Netflix","Salesforce","Morgan Stanley"]'::jsonb,
        38, 4527, 247, 18108, 6625,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public TreeNode insertIntoMaxTree(TreeNode root, int val) { return null; } }","javascript":"var insertIntoMaxTree = function(root, val) {};","python":"class Solution:\n    def insertIntoMaxTree(self, root: Optional[TreeNode], val: int) -> Optional[TreeNode]:\n        pass","cpp":"class Solution { public: TreeNode* insertIntoMaxTree(TreeNode* root, int val) { return nullptr; } };"}'::jsonb, 'insertIntoMaxTree', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Vowel Spellchecker', 'Given a wordlist, we want to implement a spellchecker that converts a query word into a correct word. For a given query word, the spell checker handles two categories of spelling mistakes: Capitalization and Vowel Errors.', 'MEDIUM', '["Array","Hash Table","String"]'::jsonb, '["Airbnb","Intel","Stripe"]'::jsonb,
        66, 3122, 330, 9366, 3232,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String[] spellchecker(String[] wordlist, String[] queries) { return new String[]{}; } }","javascript":"var spellchecker = function(wordlist, queries) {};","python":"class Solution:\n    def spellchecker(self, wordlist: List[str], queries: List[str]) -> List[str]:\n        pass","cpp":"class Solution { public: vector<string> spellchecker(vector<string>& wordlist, vector<string>& queries) { return {}; } };"}'::jsonb, 'spellchecker', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Pancake Sorting', 'Given an array of integers arr, sort the array performing a series of pancake flips. In one pancake flip we do the following steps: Choose an integer k where 1 <= k <= arr.length. Reverse the sub-array arr[0...k-1]. Return an array of the k-values corresponding to a sequence of pancake flips that sort arr.', 'MEDIUM', '["Array","Two Pointers","Greedy","Sorting"]'::jsonb, '["Uber"]'::jsonb,
        61, 49, 1, 196, 106,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<Integer> pancakeSort(int[] arr) { return new ArrayList<>(); } }","javascript":"var pancakeSort = function(arr) {};","python":"class Solution:\n    def pancakeSort(self, arr: List[int]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> pancakeSort(vector<int>& arr) { return {}; } };"}'::jsonb, 'pancakeSort', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Powerful Integers', 'Given three integers x, y, and bound, return a list of all the powerful integers that have a value less than or equal to bound. An integer is powerful if it can be represented as x^i + y^j for some integers i >= 0 and j >= 0. You may return the answer in any order. In your answer, each value should occur at most once.', 'MEDIUM', '["Hash Table","Math"]'::jsonb, '["Uber","Oracle"]'::jsonb,
        39, 4295, 245, 8590, 3988,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<Integer> powerfulIntegers(int x, int y, int bound) { return new ArrayList<>(); } }","javascript":"var powerfulIntegers = function(x, y, bound) {};","python":"class Solution:\n    def powerfulIntegers(self, x: int, y: int, bound: int) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> powerfulIntegers(int x, int y, int bound) { return {}; } };"}'::jsonb, 'powerfulIntegers', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Flip Binary Tree To Match Preorder Traversal', 'You are given the root of a binary tree with n nodes, where each node is uniquely assigned a value from 1 to n. You are also given a sequence of n values voyage, which is the desired pre-order traversal of the binary tree. Any node in the binary tree can be flipped by swapping its left and right subtrees.', 'MEDIUM', '["Tree","DFS","Binary Tree"]'::jsonb, '["Tesla"]'::jsonb,
        40, 4321, 362, 21605, 8502,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<Integer> flipMatchVoyage(TreeNode root, int[] voyage) { return new ArrayList<>(); } }","javascript":"var flipMatchVoyage = function(root, voyage) {};","python":"class Solution:\n    def flipMatchVoyage(self, root: Optional[TreeNode], voyage: List[int]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> flipMatchVoyage(TreeNode* root, vector<int>& voyage) { return {}; } };"}'::jsonb, 'flipMatchVoyage', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Verifying an Alien Dictionary', 'In an alien language, surprisingly, they also use English lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters. Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographically in this alien language.', 'EASY', '["Array","Hash Table","String"]'::jsonb, '["Twitter","Spotify","Google"]'::jsonb,
        43, 3889, 595, 15556, 7178,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean isAlienSorted(String[] words, String order) { return false; } }","javascript":"var isAlienSorted = function(words, order) {};","python":"class Solution:\n    def isAlienSorted(self, words: List[str], order: str) -> bool:\n        pass","cpp":"class Solution { public: bool isAlienSorted(vector<string>& words, string order) { return false; } };"}'::jsonb, 'isAlienSorted', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Array of Doubled Pairs', 'Given an integer array of even length arr, return true if it is possible to reorder arr such that arr[2 * i + 1] = 2 * arr[2 * i] for every 0 <= i < len(arr) / 2, or false otherwise.', 'MEDIUM', '["Array","Hash Table","Greedy","Sorting"]'::jsonb, '["Spotify"]'::jsonb,
        76, 4569, 802, 22845, 13218,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean canReorderDoubled(int[] arr) { return false; } }","javascript":"var canReorderDoubled = function(arr) {};","python":"class Solution:\n    def canReorderDoubled(self, arr: List[int]) -> bool:\n        pass","cpp":"class Solution { public: bool canReorderDoubled(vector<int>& arr) { return false; } };"}'::jsonb, 'canReorderDoubled', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Turbulent Subarray', 'Given an integer array arr, return the length of a maximum size turbulent subarray of arr. A subarray is turbulent if the comparison sign flips between each adjacent pair of elements in the subarray.', 'MEDIUM', '["Array","Dynamic Programming","Sliding Window"]'::jsonb, '["Microsoft","Salesforce"]'::jsonb,
        98, 384, 75, 2304, 1022,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxTurbulenceSize(int[] arr) { return 0; } }","javascript":"var maxTurbulenceSize = function(arr) {};","python":"class Solution:\n    def maxTurbulenceSize(self, arr: List[int]) -> int:\n        pass","cpp":"class Solution { public: int maxTurbulenceSize(vector<int>& arr) { return 0; } };"}'::jsonb, 'maxTurbulenceSize', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Distribute Coins in Binary Tree', 'You are given the root of a binary tree with n nodes where each node in the tree has node.val coins. There are n coins in total throughout the whole tree. In one move, we may choose two adjacent nodes and move one coin from one node to another. A move may be from parent to child, or from child to parent. Return the minimum number of moves required to make every node have exactly one coin.', 'MEDIUM', '["Tree","DFS","Binary Tree"]'::jsonb, '["Facebook"]'::jsonb,
        88, 4933, 271, 14799, 5476,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int distributeCoins(TreeNode root) { return 0; } }","javascript":"var distributeCoins = function(root) {};","python":"class Solution:\n    def distributeCoins(self, root: Optional[TreeNode]) -> int:\n        pass","cpp":"class Solution { public: int distributeCoins(TreeNode* root) { return 0; } };"}'::jsonb, 'distributeCoins', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Maximize Sum Of Array After K Negations', 'Given an integer array nums and an integer k, modify the array in the following way: choose an index i and replace nums[i] with -nums[i]. You should apply this process exactly k times. You may choose the same index i multiple times. Return the largest possible sum of the array after modifying it in this way.', 'EASY', '["Array","Greedy","Sorting"]'::jsonb, '["AMD","Walmart","Facebook","Uber"]'::jsonb,
        38, 4235, 226, 8470, 3406,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int largestSumAfterKNegations(int[] nums, int k) { return 0; } }","javascript":"var largestSumAfterKNegations = function(nums, k) {};","python":"class Solution:\n    def largestSumAfterKNegations(self, nums: List[int], k: int) -> int:\n        pass","cpp":"class Solution { public: int largestSumAfterKNegations(vector<int>& nums, int k) { return 0; } };"}'::jsonb, 'largestSumAfterKNegations', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Clumsy Factorial', 'The clumsy factorial of a positive integer n is obtained by applying the multiplication, division, addition, and subtraction operations to the integers n, n - 1, ..., 1 in that order. For example, the clumsy factorial of 10 is 10 * 9 / 8 + 7 - 6 * 5 / 4 + 3 - 2 * 1. However, these operations are still applied using the usual order of operations. Return the clumsy factorial of n.', 'MEDIUM', '["Math","Stack","Simulation"]'::jsonb, '["Twitter"]'::jsonb,
        20, 2383, 246, 11915, 6047,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int clumsy(int n) { return 0; } }","javascript":"var clumsy = function(n) {};","python":"class Solution:\n    def clumsy(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int clumsy(int n) { return 0; } };"}'::jsonb, 'clumsy', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Domino Rotations For Equal Row', 'In a row of dominoes, tops[i] and bottoms[i] represent the top and bottom halves of the ith domino. (A domino is a tile with two numbers from 1 to 6 - one on each half of the tile.) We may rotate the ith domino, so that tops[i] and bottoms[i] swap values. Return the minimum number of rotations so that all the values in tops are the same, or all the values in bottoms are the same. If it cannot be done, return -1.', 'MEDIUM', '["Array","Greedy"]'::jsonb, '["Twitter","Salesforce","LinkedIn","Apple"]'::jsonb,
        6, 1187, 169, 4748, 1775,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minDominoRotations(int[] tops, int[] bottoms) { return 0; } }","javascript":"var minDominoRotations = function(tops, bottoms) {};","python":"class Solution:\n    def minDominoRotations(self, tops: List[int], bottoms: List[int]) -> int:\n        pass","cpp":"class Solution { public: int minDominoRotations(vector<int>& tops, vector<int>& bottoms) { return 0; } };"}'::jsonb, 'minDominoRotations', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Construct Binary Search Tree from Preorder Traversal', 'Given an array of integers preorder, which represents the preorder traversal of a BST (i.e., binary search tree), construct the tree and return its root.', 'MEDIUM', '["Stack","Tree","Binary Search Tree","Monotonic Stack","Binary Tree"]'::jsonb, '["Cisco"]'::jsonb,
        80, 2701, 59, 13505, 5048,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public TreeNode bstFromPreorder(int[] preorder) { return null; } }","javascript":"var bstFromPreorder = function(preorder) {};","python":"class Solution:\n    def bstFromPreorder(self, preorder: List[int]) -> Optional[TreeNode]:\n        pass","cpp":"class Solution { public: TreeNode* bstFromPreorder(vector<int>& preorder) { return nullptr; } };"}'::jsonb, 'bstFromPreorder', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Binary Prefix Divisible By 5', 'You are given a binary array nums (0-indexed). We define xi as the number whose binary representation is the subarray nums[0..i] (from most-significant-bit to least-significant-bit). For example, if nums = [1,0,1], then x0 = 1, x1 = 2, and x2 = 5. Return an array of booleans answer where answer[i] is true if xi is divisible by 5.', 'EASY', '["Array"]'::jsonb, '["Oracle","Bloomberg"]'::jsonb,
        73, 2141, 77, 4282, 2969,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<Boolean> prefixesDivBy5(int[] nums) { return new ArrayList<>(); } }","javascript":"var prefixesDivBy5 = function(nums) {};","python":"class Solution:\n    def prefixesDivBy5(self, nums: List[int]) -> List[bool]:\n        pass","cpp":"class Solution { public: vector<bool> prefixesDivBy5(vector<int>& nums) { return {}; } };"}'::jsonb, 'prefixesDivBy5', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Next Greater Node In Linked List', 'You are given the head of a linked list with n nodes. For each node in the list, find the value of the next greater node. That is, for each node, find the value of the first node that is next to it and has a strictly larger value than it. Return an integer array answer where answer[i] is the value of the next greater node of the ith node (1-indexed). If the ith node does not have a next greater node, set answer[i] to 0.', 'MEDIUM', '["Array","Linked List","Stack","Monotonic Stack"]'::jsonb, '["IBM"]'::jsonb,
        24, 2528, 469, 12640, 7416,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] nextLargerNodes(ListNode head) { return new int[]{}; } }","javascript":"var nextLargerNodes = function(head) {};","python":"class Solution:\n    def nextLargerNodes(self, head: Optional[ListNode]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> nextLargerNodes(ListNode* head) { return {}; } };"}'::jsonb, 'nextLargerNodes', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Partition Array Into Three Parts With Equal Sum', 'Given an array of integers arr, return true if we can partition the array into three non-empty parts with equal sums.', 'EASY', '["Array","Greedy"]'::jsonb, '["IBM","Cisco","Walmart","Adobe"]'::jsonb,
        40, 1960, 308, 9800, 3868,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean canThreePartsEqualSum(int[] arr) { return false; } }","javascript":"var canThreePartsEqualSum = function(arr) {};","python":"class Solution:\n    def canThreePartsEqualSum(self, arr: List[int]) -> bool:\n        pass","cpp":"class Solution { public: bool canThreePartsEqualSum(vector<int>& arr) { return false; } };"}'::jsonb, 'canThreePartsEqualSum', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Best Sightseeing Pair', 'You are given an integer array values where values[i] represents the value of the ith sightseeing spot. Two sightseeing spots i and j have a distance j - i between them. The score of a pair (i < j) of sightseeing spots is values[i] + values[j] + i - j: the sum of the values of the sightseeing spots, minus the distance between them. Return the maximum score of a pair of sightseeing spots.', 'MEDIUM', '["Array","Dynamic Programming"]'::jsonb, '["Airbnb"]'::jsonb,
        15, 2114, 325, 6342, 3531,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxScoreSightseeingPair(int[] values) { return 0; } }","javascript":"var maxScoreSightseeingPair = function(values) {};","python":"class Solution:\n    def maxScoreSightseeingPair(self, values: List[int]) -> int:\n        pass","cpp":"class Solution { public: int maxScoreSightseeingPair(vector<int>& values) { return 0; } };"}'::jsonb, 'maxScoreSightseeingPair', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Binary String With Substrings Representing 1 To N', 'Given a binary string s and a positive integer n, return true if the binary representation of all the integers in the range [1, n] are substrings of s, or false otherwise.', 'MEDIUM', '["String"]'::jsonb, '["Microsoft","Morgan Stanley","Oracle","Nvidia"]'::jsonb,
        76, 1765, 63, 10590, 7209,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean queryString(String s, int n) { return false; } }","javascript":"var queryString = function(s, n) {};","python":"class Solution:\n    def queryString(self, s: str, n: int) -> bool:\n        pass","cpp":"class Solution { public: bool queryString(string s, int n) { return false; } };"}'::jsonb, 'queryString', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Word Search II', 'Given an m x n board of characters and a list of strings words, return all words on the board. Each word must be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.', 'HARD', '["Array","String","Backtracking","Trie","Matrix"]'::jsonb, '["Netflix","Adobe","Intel"]'::jsonb,
        45, 2111, 194, 4222, 2028,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<String> findWords(char[][] board, String[] words) { return new ArrayList<>(); } }","javascript":"var findWords = function(board, words) {};","python":"class Solution:\n    def findWords(self, board: List[List[str]], words: List[str]) -> List[str]:\n        pass","cpp":"class Solution { public: vector<string> findWords(vector<vector<char>>& board, vector<string>& words) { return {}; } };"}'::jsonb, 'findWords', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Map Sum Pairs', 'Design a map that allows you to do the following: Maps a string key to a given value. Returns the sum of the values that have a key with a prefix equal to a given string. Implement the MapSum class.', 'MEDIUM', '["Hash Table","String","Design","Trie"]'::jsonb, '["SpaceX"]'::jsonb,
        30, 4606, 908, 18424, 6250,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class MapSum { public MapSum() {} public void insert(String key, int val) {} public int sum(String prefix) { return 0; } }","javascript":"var MapSum = function() {}; MapSum.prototype.insert = function(key, val) {}; MapSum.prototype.sum = function(prefix) {};","python":"class MapSum:\n    def __init__(self):\n        pass\n    def insert(self, key: str, val: int) -> None:\n        pass\n    def sum(self, prefix: str) -> int:\n        pass","cpp":"class MapSum { public: MapSum() {} void insert(string key, int val) {} int sum(string prefix) { return 0; } };"}'::jsonb, 'insert', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Replace Words', 'In English, we have a concept called root, which can be followed by some other word to form another longer word - let''s call this word successor. For example, when the root "an" is followed by the successor word "other", we can form a new word "another". Given a dictionary consisting of many roots and a sentence consisting of words separated by spaces, replace all the successors in the sentence with the root forming it. If a successor can be replaced by more than one root, replace it with the root that has the shortest length. Return the sentence after the replacement.', 'MEDIUM', '["Array","Hash Table","String","Trie"]'::jsonb, '["Salesforce"]'::jsonb,
        31, 1181, 165, 3543, 1223,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String replaceWords(List<String> dictionary, String sentence) { return \"\"; } }","javascript":"var replaceWords = function(dictionary, sentence) {};","python":"class Solution:\n    def replaceWords(self, dictionary: List[str], sentence: str) -> str:\n        pass","cpp":"class Solution { public: string replaceWords(vector<string>& dictionary, string sentence) { return \"\"; } };"}'::jsonb, 'replaceWords', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find K Pairs with Smallest Sums', 'You are given two integer arrays nums1 and nums2 sorted in non-decreasing order and an integer k. Define a pair (u, v) which consists of one element from the first array and one element from the second array. Return the k pairs (u1, v1), (u2, v2), ..., (uk, vk) with the smallest sums.', 'MEDIUM', '["Array","Heap"]'::jsonb, '["Uber","Microsoft"]'::jsonb,
        42, 4068, 724, 8136, 5570,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<List<Integer>> kSmallestPairs(int[] nums1, int[] nums2, int k) { return new ArrayList<>(); } }","javascript":"var kSmallestPairs = function(nums1, nums2, k) {};","python":"class Solution:\n    def kSmallestPairs(self, nums1: List[int], nums2: List[int], k: int) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> kSmallestPairs(vector<int>& nums1, vector<int>& nums2, int k) { return {}; } };"}'::jsonb, 'kSmallestPairs', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Kth Smallest Element in a Sorted Matrix', 'Given an n x n matrix where each of the rows and columns is sorted in ascending order, return the kth smallest element in the matrix.', 'MEDIUM', '["Array","Binary Search","Sorting","Heap","Matrix"]'::jsonb, '["Adobe","Twitter"]'::jsonb,
        100, 2725, 254, 8175, 3708,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int kthSmallest(int[][] matrix, int k) { return 0; } }","javascript":"var kthSmallest = function(matrix, k) {};","python":"class Solution:\n    def kthSmallest(self, matrix: List[List[int]], k: int) -> int:\n        pass","cpp":"class Solution { public: int kthSmallest(vector<vector<int>>& matrix, int k) { return 0; } };"}'::jsonb, 'kthSmallest', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Split Array into Consecutive Subsequences', 'You are given an integer array nums that is sorted in non-decreasing order. Determine if it is possible to split nums into one or more subsequences such that both of the following conditions are true: 1. Each subsequence is a consecutive increasing sequence (i.e. each integer is exactly one more than the previous integer). 2. All subsequences have a length of at least 3. Return true if you can split nums according to the above conditions, or false otherwise.', 'MEDIUM', '["Array","Hash Table","Greedy","Heap"]'::jsonb, '["SpaceX","Target"]'::jsonb,
        40, 4947, 760, 19788, 6770,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean isPossible(int[] nums) { return false; } }","javascript":"var isPossible = function(nums) {};","python":"class Solution:\n    def isPossible(self, nums: List[int]) -> bool:\n        pass","cpp":"class Solution { public: bool isPossible(vector<int>& nums) { return false; } };"}'::jsonb, 'isPossible', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Range Module', 'A Range Module is a module that tracks ranges of numbers. Design a data structure to track the ranges represented as half-open intervals and query about them. A half-open interval [left, right) denotes all the real numbers x where left <= x < right.', 'HARD', '["Design","Segment Tree","Ordered Set"]'::jsonb, '["Netflix","Walmart"]'::jsonb,
        57, 353, 14, 1412, 444,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class RangeModule { public RangeModule() {} public void addRange(int left, int right) {} public boolean queryRange(int left, int right) { return false; } public void removeRange(int left, int right) {} }","javascript":"var RangeModule = function() {}; RangeModule.prototype.addRange = function(left, right) {}; RangeModule.prototype.queryRange = function(left, right) {}; RangeModule.prototype.removeRange = function(left, right) {};","python":"class RangeModule:\n    def __init__(self):\n        pass\n    def addRange(self, left: int, right: int) -> None:\n        pass\n    def queryRange(self, left: int, right: int) -> bool:\n        pass\n    def removeRange(self, left: int, right: int) -> None:\n        pass","cpp":"class RangeModule { public: RangeModule() {} void addRange(int left, int right) {} bool queryRange(int left, int right) { return false; } void removeRange(int left, int right) {} };"}'::jsonb, 'addRange', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Falling Squares', 'There are several squares being dropped onto the X-axis of a 2D plane. You are given a 2D integer array positions where positions[i] = [lefti, sideLengthi] represents the ith square with a side length of sideLengthi that is dropped with its left edge aligned with x-coordinate lefti. Each square is dropped one at a time from a height above any landed squares. It continues to fall until it lands on a previous square or on the X-axis. A square lands on another square if the bottom of the falling square has any overlap with the top of the stationary square. Return the array of maximum heights of the stack of squares after each drop.', 'HARD', '["Array","Segment Tree","Ordered Set"]'::jsonb, '["LinkedIn","Shopify","Morgan Stanley"]'::jsonb,
        73, 57, 2, 228, 88,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<Integer> fallingSquares(int[][] positions) { return new ArrayList<>(); } }","javascript":"var fallingSquares = function(positions) {};","python":"class Solution:\n    def fallingSquares(self, positions: List[List[int]]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> fallingSquares(vector<vector<int>>& positions) { return {}; } };"}'::jsonb, 'fallingSquares', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Rectangle Area II', 'You are given a 2D array of axis-aligned rectangles. Each rectangle[i] = [xi1, yi1, xi2, yi2] denotes the ith rectangle where (xi1, yi1) are the coordinates of the bottom-left corner, and (xi2, yi2) are the coordinates of the top-right corner. Calculate the total area covered by all rectangles in the plane. Any area covered by two or more rectangles should only be counted once. Return the total area modulo 10^9 + 7.', 'HARD', '["Array","Segment Tree","Line Sweep","Ordered Set"]'::jsonb, '["IBM"]'::jsonb,
        39, 1721, 3, 10326, 6401,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int rectangleArea(int[][] rectangles) { return 0; } }","javascript":"var rectangleArea = function(rectangles) {};","python":"class Solution:\n    def rectangleArea(self, rectangles: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int rectangleArea(vector<vector<int>>& rectangles) { return 0; } };"}'::jsonb, 'rectangleArea', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Count Items Matching a Rule', 'You are given an array items, where each items[i] = [typei, colori, namei] describes the type, color, and name of the ith item. You are also given a rule represented by two strings, ruleKey and ruleValue. The ith item is said to match the rule if one of the following is true: ruleKey == "type" and ruleValue == typei. ruleKey == "color" and ruleValue == colori. ruleKey == "name" and ruleValue == namei. Return the number of items that match the given rule.', 'EASY', '["Array","String"]'::jsonb, '["Airbnb","IBM","Netflix"]'::jsonb,
        21, 3720, 194, 18600, 7908,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int countMatches(List<List<String>> items, String ruleKey, String ruleValue) { return 0; } }","javascript":"var countMatches = function(items, ruleKey, ruleValue) {};","python":"class Solution:\n    def countMatches(self, items: List[List[str]], ruleKey: str, ruleValue: str) -> int:\n        pass","cpp":"class Solution { public: int countMatches(vector<vector<string>>& items, string ruleKey, string ruleValue) { return 0; } };"}'::jsonb, 'countMatches', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Check if the Sentence Is Pangram', 'A pangram is a sentence where every letter of the English alphabet appears at least once. Given a string sentence containing only lowercase English letters, return true if sentence is a pangram, or false otherwise.', 'EASY', '["Hash Table","String"]'::jsonb, '["Microsoft"]'::jsonb,
        17, 1783, 3, 5349, 3159,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean checkIfPangram(String sentence) { return false; } }","javascript":"var checkIfPangram = function(sentence) {};","python":"class Solution:\n    def checkIfPangram(self, sentence: str) -> bool:\n        pass","cpp":"class Solution { public: bool checkIfPangram(string sentence) { return false; } };"}'::jsonb, 'checkIfPangram', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sum of Unique Elements', 'You are given an integer array nums. The unique elements of an array are the elements that appear exactly once in the array. Return the sum of all the unique elements of nums.', 'EASY', '["Array","Hash Table","Counting"]'::jsonb, '["Microsoft","ByteDance"]'::jsonb,
        62, 2894, 168, 14470, 8292,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int sumOfUnique(int[] nums) { return 0; } }","javascript":"var sumOfUnique = function(nums) {};","python":"class Solution:\n    def sumOfUnique(self, nums: List[int]) -> int:\n        pass","cpp":"class Solution { public: int sumOfUnique(vector<int>& nums) { return 0; } };"}'::jsonb, 'sumOfUnique', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Shuffle String', 'You are given a string s and an integer array indices of the same length. The string s will be shuffled such that the character at the ith position moves to indices[i] in the shuffled string. Return the shuffled string.', 'EASY', '["Array","String"]'::jsonb, '["Intel","Morgan Stanley","Nvidia","Shopify"]'::jsonb,
        97, 1207, 107, 6035, 2326,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String restoreString(String s, int[] indices) { return \"\"; } }","javascript":"var restoreString = function(s, indices) {};","python":"class Solution:\n    def restoreString(self, s: str, indices: List[int]) -> str:\n        pass","cpp":"class Solution { public: string restoreString(string s, vector<int>& indices) { return \"\"; } };"}'::jsonb, 'restoreString', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Count Good Triplets', 'Given an array of integers arr, and three integers a, b and c. You need to find the number of good triplets. A triplet (arr[i], arr[j], arr[k]) is good if the following conditions are true: 0 <= i < j < k < arr.length, |arr[i] - arr[j]| <= a, |arr[j] - arr[k]| <= b, and |arr[i] - arr[k]| <= c. Where |x| denotes the absolute value of x. Return the number of good triplets.', 'EASY', '["Array","Enumeration"]'::jsonb, '["Apple","Morgan Stanley"]'::jsonb,
        42, 1912, 279, 5736, 3919,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int countGoodTriplets(int[] arr, int a, int b, int c) { return 0; } }","javascript":"var countGoodTriplets = function(arr, a, b, c) {};","python":"class Solution:\n    def countGoodTriplets(self, arr: List[int], a: int, b: int, c: int) -> int:\n        pass","cpp":"class Solution { public: int countGoodTriplets(vector<int>& arr, int a, int b, int c) { return 0; } };"}'::jsonb, 'countGoodTriplets', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Kth Missing Positive Number', 'Given an array arr of positive integers sorted in a strictly increasing order, and an integer k. Return the kth positive integer that is missing from this array.', 'EASY', '["Array","Binary Search"]'::jsonb, '["Walmart"]'::jsonb,
        78, 3863, 752, 11589, 6555,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int findKthPositive(int[] arr, int k) { return 0; } }","javascript":"var findKthPositive = function(arr, k) {};","python":"class Solution:\n    def findKthPositive(self, arr: List[int], k: int) -> int:\n        pass","cpp":"class Solution { public: int findKthPositive(vector<int>& arr, int k) { return 0; } };"}'::jsonb, 'findKthPositive', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Matrix Diagonal Sum', 'Given a square matrix mat, return the sum of the matrix diagonals. Only include the sum of all the elements on the primary diagonal and all the elements on the secondary diagonal that are not part of the primary diagonal.', 'EASY', '["Array","Matrix"]'::jsonb, '["Goldman Sachs","Tesla","Adobe","Microsoft"]'::jsonb,
        94, 1668, 175, 6672, 4115,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int diagonalSum(int[][] mat) { return 0; } }","javascript":"var diagonalSum = function(mat) {};","python":"class Solution:\n    def diagonalSum(self, mat: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int diagonalSum(vector<vector<int>>& mat) { return 0; } };"}'::jsonb, 'diagonalSum', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Maximum Product Difference Between Two Pairs', 'The product difference between two pairs (a, b) and (c, d) is defined as (a * b) - (c * d). Given an integer array nums, choose four distinct indices w, x, y, and z such that the product difference between pairs (nums[w], nums[x]) and (nums[y], nums[z]) is maximized. Return the maximum such product difference.', 'EASY', '["Array","Sorting"]'::jsonb, '["Airbnb","Amazon"]'::jsonb,
        94, 1341, 246, 2682, 1465,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxProductDifference(int[] nums) { return 0; } }","javascript":"var maxProductDifference = function(nums) {};","python":"class Solution:\n    def maxProductDifference(self, nums: List[int]) -> int:\n        pass","cpp":"class Solution { public: int maxProductDifference(vector<int>& nums) { return 0; } };"}'::jsonb, 'maxProductDifference', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Build Array from Permutation', 'Given a zero-based permutation nums (0-indexed), build an array ans of the same length where ans[i] = nums[nums[i]] for each 0 <= i < nums.length and return it. A zero-based permutation nums is an array of distinct integers from 0 to nums.length - 1 (inclusive).', 'EASY', '["Array","Simulation"]'::jsonb, '["Google","Microsoft","Airbnb","ByteDance"]'::jsonb,
        37, 1367, 166, 4101, 2505,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] buildArray(int[] nums) { return new int[]{}; } }","javascript":"var buildArray = function(nums) {};","python":"class Solution:\n    def buildArray(self, nums: List[int]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> buildArray(vector<int>& nums) { return {}; } };"}'::jsonb, 'buildArray', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Concatenation of Array', 'Given an integer array nums of length n, you want to create an array ans of length 2n where ans[i] == nums[i] and ans[i + n] == nums[i] for 0 <= i < n (0-indexed). Return the array ans.', 'EASY', '["Array"]'::jsonb, '["ByteDance","Salesforce"]'::jsonb,
        94, 3626, 357, 14504, 7256,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] getConcatenation(int[] nums) { return new int[]{}; } }","javascript":"var getConcatenation = function(nums) {};","python":"class Solution:\n    def getConcatenation(self, nums: List[int]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> getConcatenation(vector<int>& nums) { return {}; } };"}'::jsonb, 'getConcatenation', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Count of Matches in Tournament', 'You are given an integer n, the number of teams in a tournament that has strange rules: If the current number of teams is even, each team gets paired with another team. A total of n / 2 matches are played, and n / 2 teams advance to the next round. If the current number of teams is odd, one team randomly advances in the tournament, and the rest gets paired. A total of (n - 1) / 2 matches are played, and (n - 1) / 2 + 1 teams advance to the next round. Return the number of matches played in the tournament until a winner is decided.', 'EASY', '["Math","Backtracking","Simulation"]'::jsonb, '["ByteDance","Cisco"]'::jsonb,
        22, 1497, 214, 2994, 2091,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int numberOfMatches(int n) { return 0; } }","javascript":"var numberOfMatches = function(n) {};","python":"class Solution:\n    def numberOfMatches(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int numberOfMatches(int n) { return 0; } };"}'::jsonb, 'numberOfMatches', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sorting the Sentence', 'A sentence is a list of words that are separated by a single space with no leading or trailing spaces. Each word consists of lowercase and uppercase English letters. A sentence can be shuffled by appending the 1-indexed word position to each word then rearranging the words in the sentence. Given a shuffled sentence s containing no more than 9 words, reconstruct and return the original sentence.', 'EASY', '["String","Sorting"]'::jsonb, '["Goldman Sachs","Twitter"]'::jsonb,
        2, 182, 8, 364, 131,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String sortSentence(String s) { return \"\"; } }","javascript":"var sortSentence = function(s) {};","python":"class Solution:\n    def sortSentence(self, s: str) -> str:\n        pass","cpp":"class Solution { public: string sortSentence(string s) { return \"\"; } };"}'::jsonb, 'sortSentence', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'N-Queens II', 'The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other. Given an integer n, return the number of distinct solutions to the n-queens puzzle.', 'HARD', '["Backtracking"]'::jsonb, '["Intel","Google"]'::jsonb,
        26, 96, 5, 384, 125,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int totalNQueens(int n) { return 0; } }","javascript":"var totalNQueens = function(n) {};","python":"class Solution:\n    def totalNQueens(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int totalNQueens(int n) { return 0; } };"}'::jsonb, 'totalNQueens', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Scramble String', 'We can scramble a string s to get a string t using the following algorithm: If the length of the string is 1, stop. If the length of the string is > 1, do the following: Split the string into two non-empty substrings at a random index, i.e., if the string is s, divide it to x and y where s = x + y. Randomly decide to swap the two substrings or to keep them in the same order. i.e., after this step, s may become s = x + y or s = y + x. Apply step 1 recursively on each of the two substrings x and y. Given two strings s1 and s2 of the same length, return true if s2 is a scrambled string of s1, otherwise, return false.', 'HARD', '["String","Dynamic Programming"]'::jsonb, '["AMD","Cisco","Apple"]'::jsonb,
        9, 1950, 129, 7800, 5412,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean isScramble(String s1, String s2) { return false; } }","javascript":"var isScramble = function(s1, s2) {};","python":"class Solution:\n    def isScramble(self, s1: str, s2: str) -> bool:\n        pass","cpp":"class Solution { public: bool isScramble(string s1, string s2) { return false; } };"}'::jsonb, 'isScramble', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Dungeon Game', 'The demons had captured the princess and imprisoned her in the bottom-right corner of a dungeon. The dungeon consists of m x n rooms laid out in a 2D grid. Our valiant knight was initially positioned in the top-left room and must fight his way through dungeon to rescue the princess. The knight has an initial health point represented by a positive integer. If at any point his health point drops to 0 or below, he dies immediately. Return the knight''s minimum initial health so that he can rescue the princess.', 'HARD', '["Array","Dynamic Programming","Matrix"]'::jsonb, '["Cisco"]'::jsonb,
        14, 2619, 483, 7857, 3611,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int calculateMinimumHP(int[][] dungeon) { return 0; } }","javascript":"var calculateMinimumHP = function(dungeon) {};","python":"class Solution:\n    def calculateMinimumHP(self, dungeon: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int calculateMinimumHP(vector<vector<int>>& dungeon) { return 0; } };"}'::jsonb, 'calculateMinimumHP', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Best Time to Buy and Sell Stock IV', 'You are given an integer array prices where prices[i] is the price of a given stock on the ith day, and an integer k. Find the maximum profit you can achieve. You may complete at most k transactions.', 'HARD', '["Array","Dynamic Programming"]'::jsonb, '["Salesforce"]'::jsonb,
        20, 1935, 72, 11610, 5917,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxProfit(int k, int[] prices) { return 0; } }","javascript":"var maxProfit = function(k, prices) {};","python":"class Solution:\n    def maxProfit(self, k: int, prices: List[int]) -> int:\n        pass","cpp":"class Solution { public: int maxProfit(int k, vector<int>& prices) { return 0; } };"}'::jsonb, 'maxProfit', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Max Points on a Line', 'Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane, return the maximum number of points that lie on the same straight line.', 'HARD', '["Array","Hash Table","Math","Geometry"]'::jsonb, '["Salesforce","Morgan Stanley","Apple","Tesla"]'::jsonb,
        34, 3043, 423, 15215, 8788,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxPoints(int[][] points) { return 0; } }","javascript":"var maxPoints = function(points) {};","python":"class Solution:\n    def maxPoints(self, points: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int maxPoints(vector<vector<int>>& points) { return 0; } };"}'::jsonb, 'maxPoints', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Concatenated Words', 'Given an array of strings words (without duplicates), return all the concatenated words in the given list of words. A concatenated word is defined as a string that is comprised entirely of at least two shorter words in the given array.', 'HARD', '["Array","String","Dynamic Programming","DFS","Trie"]'::jsonb, '["Airbnb","IBM","Target"]'::jsonb,
        2, 1657, 217, 9942, 4438,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<String> findAllConcatenatedWordsInADict(String[] words) { return new ArrayList<>(); } }","javascript":"var findAllConcatenatedWordsInADict = function(words) {};","python":"class Solution:\n    def findAllConcatenatedWordsInADict(self, words: List[str]) -> List[str]:\n        pass","cpp":"class Solution { public: vector<string> findAllConcatenatedWordsInADict(vector<string>& words) { return {}; } };"}'::jsonb, 'findAllConcatenatedWordsInADict', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Smallest Good Base', 'Given an integer n represented as a string, return the smallest good base of n. We call k >= 2 a good base of n, if all digits of n base k are 1s.', 'HARD', '["Math","Binary Search"]'::jsonb, '["Morgan Stanley","Apple","Target"]'::jsonb,
        73, 262, 45, 524, 213,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String smallestGoodBase(String n) { return \"\"; } }","javascript":"var smallestGoodBase = function(n) {};","python":"class Solution:\n    def smallestGoodBase(self, n: str) -> str:\n        pass","cpp":"class Solution { public: string smallestGoodBase(string n) { return \"\"; } };"}'::jsonb, 'smallestGoodBase', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Freedom Trail', 'In the video game Fallout 4, the quest "Road to Freedom" requires players to reach a metal dial called the "Freedom Trail Ring", and use the dial to spell a specific keyword in order to open the door. Given a string ring, which represents the code engraved on the outer ring and another string key, which represents the keyword needs to be spelled. You need to find the minimum number of steps in order to spell all the characters in the keyword.', 'HARD', '["String","Dynamic Programming","DFS","BFS"]'::jsonb, '["Target"]'::jsonb,
        45, 2998, 384, 17988, 12451,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int findRotateSteps(String ring, String key) { return 0; } }","javascript":"var findRotateSteps = function(ring, key) {};","python":"class Solution:\n    def findRotateSteps(self, ring: str, key: str) -> int:\n        pass","cpp":"class Solution { public: int findRotateSteps(string ring, string key) { return 0; } };"}'::jsonb, 'findRotateSteps', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Super Washing Machines', 'You have n super washing machines on a line. Initially, each washing machine has some dresses or is empty. For each move, you could choose any m (1 <= m <= n) washing machines, and pass one dress of each washing machine to one of its adjacent washing machines at the same time. Given an integer array machines representing the number of dresses in each washing machine from left to right on the line, return the minimum number of moves to make all the washing machines have the same number of dresses. If it is not possible to do it, return -1.', 'HARD', '["Array","Greedy"]'::jsonb, '["Apple"]'::jsonb,
        14, 3714, 473, 7428, 4299,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int findMinMoves(int[] machines) { return 0; } }","javascript":"var findMinMoves = function(machines) {};","python":"class Solution:\n    def findMinMoves(self, machines: List[int]) -> int:\n        pass","cpp":"class Solution { public: int findMinMoves(vector<int>& machines) { return 0; } };"}'::jsonb, 'findMinMoves', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Student Attendance Record II', 'An attendance record for a student can be represented as a string where each character signifies whether the student was absent, late, or present. Given an integer n, return the number of possible attendance records of length n that make a student eligible for an attendance award. The answer may be very large, so return it modulo 10^9 + 7.', 'HARD', '["Dynamic Programming"]'::jsonb, '["Facebook","Salesforce","Adobe","AMD"]'::jsonb,
        52, 476, 58, 2856, 1409,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int checkRecord(int n) { return 0; } }","javascript":"var checkRecord = function(n) {};","python":"class Solution:\n    def checkRecord(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int checkRecord(int n) { return 0; } };"}'::jsonb, 'checkRecord', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'K Inverse Pairs Array', 'For an integer array nums, an inverse pair is a pair of integers [i, j] where 0 <= i < j < nums.length and nums[i] > nums[j]. Given two integers n and k, return the number of different arrays consist of numbers from 1 to n such that there are exactly k inverse pairs. Since the answer can be huge, return it modulo 10^9 + 7.', 'HARD', '["Dynamic Programming"]'::jsonb, '["ByteDance","IBM","Facebook"]'::jsonb,
        14, 1612, 241, 6448, 3545,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int kInversePairs(int n, int k) { return 0; } }","javascript":"var kInversePairs = function(n, k) {};","python":"class Solution:\n    def kInversePairs(self, n: int, k: int) -> int:\n        pass","cpp":"class Solution { public: int kInversePairs(int n, int k) { return 0; } };"}'::jsonb, 'kInversePairs', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Course Schedule III', 'There are n different online courses numbered from 1 to n. You are given an array courses where courses[i] = [durationi, lastDayi] indicate that the ith course should be taken continuously for durationi days and must be finished before or on lastDayi. You will start on the 1st day and you cannot take two or more courses simultaneously. Return the maximum number of courses that you can take.', 'HARD', '["Array","Greedy","Heap"]'::jsonb, '["LinkedIn"]'::jsonb,
        51, 825, 17, 1650, 1115,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int scheduleCourse(int[][] courses) { return 0; } }","javascript":"var scheduleCourse = function(courses) {};","python":"class Solution:\n    def scheduleCourse(self, courses: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int scheduleCourse(vector<vector<int>>& courses) { return 0; } };"}'::jsonb, 'scheduleCourse', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Cut Off Trees for Golf Event', 'You are asked to cut off all the trees in a forest for a golf event. The forest is represented as an m x n matrix. In this matrix: 0 means the cell cannot be walked through. 1 means the cell can be walked through. A number greater than 1 means there is a tree in this cell with this height. You are asked to cut off all the trees in this forest in the order of tree''s height - always cut off the tree with lowest height first. Return the minimum steps you will walk in the forest to cut all the trees. If it is impossible, return -1.', 'HARD', '["Array","BFS","Heap","Matrix"]'::jsonb, '["Amazon","Cisco","LinkedIn","Uber"]'::jsonb,
        5, 3579, 582, 21474, 14679,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int cutOffTree(List<List<Integer>> forest) { return 0; } }","javascript":"var cutOffTree = function(forest) {};","python":"class Solution:\n    def cutOffTree(self, forest: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int cutOffTree(vector<vector<int>>& forest) { return 0; } };"}'::jsonb, 'cutOffTree', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        '24 Game', 'You are given an integer array cards of length 4. You have four cards, each containing a number in the range [1, 9]. You should arrange the numbers on these cards in a mathematical expression using the operators [''+'', ''-'', ''*'', ''/''] and the parentheses ''('' and '')'' to get the value 24. Return true if you can get such expression, or false otherwise.', 'HARD', '["Array","Backtracking","Math"]'::jsonb, '["Shopify","Amazon"]'::jsonb,
        67, 3595, 263, 21570, 12184,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean judgePoint24(int[] cards) { return false; } }","javascript":"var judgePoint24 = function(cards) {};","python":"class Solution:\n    def judgePoint24(self, cards: List[int]) -> bool:\n        pass","cpp":"class Solution { public: bool judgePoint24(vector<int>& cards) { return false; } };"}'::jsonb, 'judgePoint24', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Stickers to Spell Word', 'We are given n different types of stickers. Each sticker has a lowercase English word on it. You would like to spell out the given string target string by cutting individual letters from your collection of stickers and rearranging them. You can use each sticker more than once if you want, and you have infinite quantities of each sticker. Return the minimum number of stickers that you need to spell out target. If the task is impossible, return -1.', 'HARD', '["Array","String","Dynamic Programming","Backtracking","Bit Masking"]'::jsonb, '["LinkedIn","Adobe","Twitter"]'::jsonb,
        99, 4835, 557, 14505, 5142,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minStickers(String[] stickers, String target) { return 0; } }","javascript":"var minStickers = function(stickers, target) {};","python":"class Solution:\n    def minStickers(self, stickers: List[str], target: str) -> int:\n        pass","cpp":"class Solution { public: int minStickers(vector<string>& stickers, string target) { return 0; } };"}'::jsonb, 'minStickers', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Redundant Connection II', 'In this problem, a rooted tree is a directed graph such that, there is exactly one node (the root) for which all other nodes are descendants of this node, plus every node has exactly one parent, except for the root node which has no parents. The given input is a directed graph that started as a rooted tree with n nodes (with distinct values from 1 to n), with one additional directed edge added. Return an edge that can be removed so that the resulting graph is a rooted tree of n nodes.', 'HARD', '["DFS","BFS","Union Find","Graph"]'::jsonb, '["Walmart","Target","Microsoft","Apple"]'::jsonb,
        68, 2245, 148, 8980, 5840,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] findRedundantDirectedConnection(int[][] edges) { return new int[]{}; } }","javascript":"var findRedundantDirectedConnection = function(edges) {};","python":"class Solution:\n    def findRedundantDirectedConnection(self, edges: List[List[int]]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> findRedundantDirectedConnection(vector<vector<int>>& edges) { return {}; } };"}'::jsonb, 'findRedundantDirectedConnection', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Cracking the Safe', 'There is a safe protected by a password. The password is a sequence of n digits where each digit can be in the range [0, k - 1]. The safe has a peculiar way of checking the password. When you enter a sequence, it checks the last n digits entered. If that matches the password, the safe opens. Return any string of minimum length that is guaranteed to open the safe at some point of entering it.', 'HARD', '["DFS","Graph","Eulerian Circuit"]'::jsonb, '["JPMorgan"]'::jsonb,
        93, 3397, 319, 13588, 9473,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String crackSafe(int n, int k) { return \"\"; } }","javascript":"var crackSafe = function(n, k) {};","python":"class Solution:\n    def crackSafe(self, n: int, k: int) -> str:\n        pass","cpp":"class Solution { public: string crackSafe(int n, int k) { return \"\"; } };"}'::jsonb, 'crackSafe', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Couples Holding Hands', 'There are n couples sitting in 2n seats arranged in a row and want to hold hands. The people and seats are represented by an integer array row where row[i] is the ID of the person sitting in the ith seat. The couples are numbered in order, the first couple being (0, 1), the second couple being (2, 3), and so on with the last couple being (2n - 2, 2n - 1). Return the minimum number of swaps so that every couple is sitting side by side.', 'HARD', '["Greedy","DFS","BFS","Union Find","Graph"]'::jsonb, '["Salesforce","Walmart","ByteDance"]'::jsonb,
        75, 4616, 153, 23080, 9447,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minSwapsCouples(int[] row) { return 0; } }","javascript":"var minSwapsCouples = function(row) {};","python":"class Solution:\n    def minSwapsCouples(self, row: List[int]) -> int:\n        pass","cpp":"class Solution { public: int minSwapsCouples(vector<int>& row) { return 0; } };"}'::jsonb, 'minSwapsCouples', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reaching Points', 'Given four integers sx, sy, tx, and ty, return true if it is possible to convert the point (sx, sy) to the point (tx, ty) through some operations, or false otherwise. The allowed operation on some point (x, y) is to convert it to either (x, x + y) or (x + y, y).', 'HARD', '["Math"]'::jsonb, '["Amazon","Uber","Bloomberg","Nvidia"]'::jsonb,
        64, 4956, 757, 19824, 8308,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean reachingPoints(int sx, int sy, int tx, int ty) { return false; } }","javascript":"var reachingPoints = function(sx, sy, tx, ty) {};","python":"class Solution:\n    def reachingPoints(self, sx: int, sy: int, tx: int, ty: int) -> bool:\n        pass","cpp":"class Solution { public: bool reachingPoints(int sx, int sy, int tx, int ty) { return false; } };"}'::jsonb, 'reachingPoints', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Transform to Chessboard', 'You are given an n x n binary grid board. In each move, you can swap any two rows with each other, or any two columns with each other. Return the minimum number of moves to transform the board into a chessboard board. If the task is impossible, return -1.', 'HARD', '["Array","Math","Bit Manipulation","Matrix"]'::jsonb, '["Stripe","SpaceX","Netflix"]'::jsonb,
        59, 3984, 200, 19920, 7700,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int movesToChessboard(int[][] board) { return 0; } }","javascript":"var movesToChessboard = function(board) {};","python":"class Solution:\n    def movesToChessboard(self, board: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int movesToChessboard(vector<vector<int>>& board) { return 0; } };"}'::jsonb, 'movesToChessboard', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Basic Calculator III', 'Implement a basic calculator to evaluate a simple expression string. The expression string contains only non-negative integers, ''+'', ''-'', ''*'', ''/'', ''('', '')'', and empty spaces '' ''. The integer division should truncate toward zero.', 'HARD', '["Math","String","Stack","Recursion"]'::jsonb, '["Spotify"]'::jsonb,
        57, 415, 82, 830, 284,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int calculate(String s) { return 0; } }","javascript":"var calculate = function(s) {};","python":"class Solution:\n    def calculate(self, s: str) -> int:\n        pass","cpp":"class Solution { public: int calculate(string s) { return 0; } };"}'::jsonb, 'calculate', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Max Chunks To Make Sorted II', 'You are given an integer array arr. We split arr into some number of chunks (i.e., partitions), and individually sort each chunk. After concatenating them, the result should equal the sorted array. Return the largest number of chunks we can make to sort the array.', 'HARD', '["Stack","Greedy","Sorting","Monotonic Stack"]'::jsonb, '["Adobe","Twitter","SpaceX"]'::jsonb,
        37, 4580, 804, 27480, 17786,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxChunksToSorted(int[] arr) { return 0; } }","javascript":"var maxChunksToSorted = function(arr) {};","python":"class Solution:\n    def maxChunksToSorted(self, arr: List[int]) -> int:\n        pass","cpp":"class Solution { public: int maxChunksToSorted(vector<int>& arr) { return 0; } };"}'::jsonb, 'maxChunksToSorted', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Swim in Rising Water', 'You are given an n x n integer matrix grid where each value grid[i][j] represents the elevation at that point (i, j). The rain starts to fall. At time t, the depth of the water everywhere is t. You can swim from a square to another 4-directionally adjacent square if and only if the elevation of both squares individually are at most t. You can swim infinite distances in zero time. You must stay within the boundaries of the grid during your swim. Return the least time until you can reach the bottom right square (n - 1, n - 1) if you start at the top left square (0, 0).', 'HARD', '["Array","BS","DFS","BFS","Union Find","Heap","Matrix"]'::jsonb, '["AMD","Morgan Stanley","Tesla","Adobe"]'::jsonb,
        28, 2524, 2, 7572, 3141,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int swimInWater(int[][] grid) { return 0; } }","javascript":"var swimInWater = function(grid) {};","python":"class Solution:\n    def swimInWater(self, grid: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int swimInWater(vector<vector<int>>& grid) { return 0; } };"}'::jsonb, 'swimInWater', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Race Car', 'Your car starts at position 0 and speed +1 on an infinite number line. Your car can go into negative positions. Your car drives automatically according to a sequence of instructions ''A'' (accelerate) and ''R'' (reverse). Return the length of the shortest sequence of instructions to get to the target.', 'HARD', '["DP","BFS"]'::jsonb, '["Bloomberg"]'::jsonb,
        62, 3872, 599, 15488, 4769,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int racecar(int target) { return 0; } }","javascript":"var racecar = function(target) {};","python":"class Solution:\n    def racecar(self, target: int) -> int:\n        pass","cpp":"class Solution { public: int racecar(int target) { return 0; } };"}'::jsonb, 'racecar', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Making A Large Island', 'You are given an n x n binary matrix grid. You are allowed to change at most one 0 to be 1. Return the size of the largest island in grid after applying this operation.', 'HARD', '["Array","DFS","BFS","Union Find","Matrix"]'::jsonb, '["Airbnb","Google"]'::jsonb,
        95, 2648, 125, 10592, 4351,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int largestIsland(int[][] grid) { return 0; } }","javascript":"var largestIsland = function(grid) {};","python":"class Solution:\n    def largestIsland(self, grid: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int largestIsland(vector<vector<int>>& grid) { return 0; } };"}'::jsonb, 'largestIsland', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sum of Distances in Tree', 'There is an undirected connected tree with n nodes labeled from 0 to n - 1 and n - 1 edges. You are given the integer n and the array edges where edges[i] = [ai, bi] indicates that there is an edge between nodes ai and bi in the tree. Return an array answer of length n where answer[i] is the sum of the distances between the ith node in the tree and all other nodes.', 'HARD', '["DP","Tree","DFS","Graph"]'::jsonb, '["Intel","SpaceX","Airbnb","Twitter"]'::jsonb,
        13, 244, 0, 488, 270,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] sumOfDistancesInTree(int n, int[][] edges) { return new int[]{}; } }","javascript":"var sumOfDistancesInTree = function(n, edges) {};","python":"class Solution:\n    def sumOfDistancesInTree(self, n: int, edges: List[List[int]]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> sumOfDistancesInTree(int n, vector<vector<int>>& edges) { return {}; } };"}'::jsonb, 'sumOfDistancesInTree', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Distinct Subsequences II', 'Given a string s, return the number of distinct non-empty subsequences of s. Since the answer may be very large, return it modulo 10^9 + 7.', 'HARD', '["String","Dynamic Programming"]'::jsonb, '["Apple","Nvidia"]'::jsonb,
        73, 777, 24, 4662, 2277,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int distinctSubseqII(String s) { return 0; } }","javascript":"var distinctSubseqII = function(s) {};","python":"class Solution:\n    def distinctSubseqII(self, s: str) -> int:\n        pass","cpp":"class Solution { public: int distinctSubseqII(string s) { return 0; } };"}'::jsonb, 'distinctSubseqII', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Number of Music Playlists', 'Your music player contains n different songs. You want to listen to goal (not necessarily different) songs during your trip. To avoid boredom, you will create a playlist so that: Every song is played at least once. A song can only be played again only if k other songs have been played. Given n, goal, and k, return the number of possible playlists. Since the answer can be very large, return it modulo 10^9 + 7.', 'HARD', '["Math","Dynamic Programming","Combinatorics"]'::jsonb, '["LinkedIn","Airbnb","Bloomberg"]'::jsonb,
        57, 2797, 383, 5594, 1826,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int numMusicPlaylists(int n, int goal, int k) { return 0; } }","javascript":"var numMusicPlaylists = function(n, goal, k) {};","python":"class Solution:\n    def numMusicPlaylists(self, n: int, goal: int, k: int) -> int:\n        pass","cpp":"class Solution { public: int numMusicPlaylists(int n, int goal, int k) { return 0; } };"}'::jsonb, 'numMusicPlaylists', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimize Malibu', 'In a network of nodes, each node i is directly connected to another node j if and only if graph[i][j] = 1. Some nodes initial are initially infected by malware. Whenever two nodes are directly connected and at least one of those two nodes is infected by malware, both nodes will be infected by malware. This spread of malware will continue until no more nodes can be infected in this manner. Suppose M(initial) is the final number of nodes infected with malware in the entire network, after the spread of malware stops. We will remove one node from the initial infected node list. Return the node that if removed, would minimize M(initial). If multiple nodes could be removed to minimize M(initial), return such a node with the smallest index.', 'HARD', '["DFS","BFS","Union Find","Graph"]'::jsonb, '["Airbnb","Uber","Shopify","Google"]'::jsonb,
        87, 5007, 522, 20028, 13256,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minMalwareSpread(int[][] graph, int[] initial) { return 0; } }","javascript":"var minMalwareSpread = function(graph, initial) {};","python":"class Solution:\n    def minMalwareSpread(self, graph: List[List[int]], initial: List[int]) -> int:\n        pass","cpp":"class Solution { public: int minMalwareSpread(vector<vector<int>>& graph, vector<int>& initial) { return 0; } };"}'::jsonb, 'minMalwareSpread', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Three Equal Parts', 'You are given an array arr which consists of only zeros and ones, divide the array into three non-empty parts such that all of these parts represent the same binary value. If it is possible, return any [i, j] with i + 1 < j, such that: arr[0], arr[1], ..., arr[i] is the first part, arr[i + 1], arr[i + 2], ..., arr[j - 1] is the second part, and arr[j], arr[j + 1], ..., arr[arr.length - 1] is the third part. All three parts have equal binary values. If it is not possible, return [-1, -1].', 'HARD', '["Array","Math"]'::jsonb, '["Apple"]'::jsonb,
        39, 1987, 277, 9935, 6934,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] threeEqualParts(int[] arr) { return new int[]{}; } }","javascript":"var threeEqualParts = function(arr) {};","python":"class Solution:\n    def threeEqualParts(self, arr: List[int]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> threeEqualParts(vector<int>& arr) { return {}; } };"}'::jsonb, 'threeEqualParts', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Cat and Mouse', 'A game on an undirected graph is played by two players, Mouse and Cat, who alternate turns. The graph is given as follows: graph[a] is a list of all nodes b such that ab is an edge of the graph. The mouse starts at node 1 and goes first, the cat starts at node 2 and goes second, and there is a hole at node 0. During each player''s turn, they must travel along one edge of the graph that meets where they are. For example, if the Mouse is at node 1, it must travel to any node in graph[1]. Additionally, it is not allowed for the Cat to travel to the Hole (node 0).', 'HARD', '["Math","Dynamic Programming","Graph","Topological Sort","Memoization","Game Theory"]'::jsonb, '["Stripe","ByteDance","AMD","LinkedIn"]'::jsonb,
        41, 968, 87, 1936, 1147,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int catMouseGame(int[][] graph) { return 0; } }","javascript":"var catMouseGame = function(graph) {};","python":"class Solution:\n    def catMouseGame(self, graph: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int catMouseGame(vector<vector<int>>& graph) { return 0; } };"}'::jsonb, 'catMouseGame', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Number of Atoms', 'Given a string formula representing a chemical formula, return the count of each atom. The atomic element always starts with an uppercase character, then zero or more lowercase letters, representing the name. One or more digits representing that element''s count may follow if the count is greater than 1. If the count is 1, no digits will follow.', 'HARD', '["Hash Table","String","Stack","Sorting"]'::jsonb, '["Walmart"]'::jsonb,
        5, 1698, 130, 5094, 3203,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String countOfAtoms(String formula) { return \"\"; } }","javascript":"var countOfAtoms = function(formula) {};","python":"class Solution:\n    def countOfAtoms(self, formula: str) -> str:\n        pass","cpp":"class Solution { public: string countOfAtoms(string formula) { return \"\"; } };"}'::jsonb, 'countOfAtoms', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reach a Number', 'You are standing at position 0 on an infinite number line. There is a destination at position target. You can make some number of moves numMoves so that: On each move, you can either go left or right. During the ith move (starting from i == 1 to i == numMoves), you take i steps in the chosen direction. Given the integer target, return the minimum number of moves required (i.e., the minimum numMoves) to reach the destination.', 'MEDIUM', '["Math","Binary Search"]'::jsonb, '["AMD","Goldman Sachs"]'::jsonb,
        16, 3668, 418, 11004, 3520,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int reachNumber(int target) { return 0; } }","javascript":"var reachNumber = function(target) {};","python":"class Solution:\n    def reachNumber(self, target: int) -> int:\n        pass","cpp":"class Solution { public: int reachNumber(int target) { return 0; } };"}'::jsonb, 'reachNumber', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Partition to K Equal Sum Subsets', 'Given an integer array nums and an integer k, return true if it is possible to divide this array into k non-empty subsets whose sums are all equal.', 'MEDIUM', '["Array","Dynamic Programming","Backtracking","Bit Manipulation","Memoization","Bitmask"]'::jsonb, '["Intel","Microsoft","Morgan Stanley","SpaceX"]'::jsonb,
        93, 1995, 220, 5985, 2865,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean canPartitionKSubsets(int[] nums, int k) { return false; } }","javascript":"var canPartitionKSubsets = function(nums, k) {};","python":"class Solution:\n    def canPartitionKSubsets(self, nums: List[int], k: int) -> bool:\n        pass","cpp":"class Solution { public: bool canPartitionKSubsets(vector<int>& nums, int k) { return false; } };"}'::jsonb, 'canPartitionKSubsets', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Shortest Path Visiting All Nodes', 'You have an undirected, connected graph of n nodes labeled from 0 to n - 1. You are given an array graph where graph[i] is a list of all the nodes connected with node i by an edge. Return the length of the shortest path that visits every node. You may start and stop at any node, you may revisit nodes multiple times, and you may reuse edges.', 'HARD', '["Dynamic Programming","BFS","Graph","Bit Masking"]'::jsonb, '["IBM","JPMorgan","Oracle"]'::jsonb,
        4, 3608, 612, 18040, 9353,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int shortestPathLength(int[][] graph) { return 0; } }","javascript":"var shortestPathLength = function(graph) {};","python":"class Solution:\n    def shortestPathLength(self, graph: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int shortestPathLength(vector<vector<int>>& graph) { return 0; } };"}'::jsonb, 'shortestPathLength', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Prime Palindrome', 'Given an integer n, return the smallest prime palindrome greater than or equal to n. An integer is prime if it has exactly two divisors: 1 and itself. Note that 1 is not a prime number. For example, 2, 3, 5, 7, 11, and 13 are all primes. An integer is a palindrome if it reads the same from left to right as it does from right to left.', 'MEDIUM', '["Math"]'::jsonb, '["Bloomberg"]'::jsonb,
        41, 4329, 307, 12987, 6481,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int primePalindrome(int n) { return 0; } }","javascript":"var primePalindrome = function(n) {};","python":"class Solution:\n    def primePalindrome(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int primePalindrome(int n) { return 0; } };"}'::jsonb, 'primePalindrome', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reconstruct Itinerary', 'You are given a list of airline tickets where tickets[i] = [fromi, toi] represent the departure and the arrival airports of one flight. Reconstruct the itinerary in order and return it. All of the tickets belong to a man who departs from "JFK", thus, the itinerary must begin with "JFK". If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string.', 'HARD', '["DFS","Graph","Eulerian Circuit"]'::jsonb, '["ByteDance","Uber"]'::jsonb,
        86, 4507, 196, 13521, 7163,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<String> findItinerary(List<List<String>> tickets) { return new ArrayList<>(); } }","javascript":"var findItinerary = function(tickets) {};","python":"class Solution:\n    def findItinerary(self, tickets: List[List[str]]) -> List[str]:\n        pass","cpp":"class Solution { public: vector<string> findItinerary(vector<vector<string>>& tickets) { return {}; } };"}'::jsonb, 'findItinerary', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Largest Component Size by Common Factor', 'You are given an integer array of unique positive integers nums. Consider the following graph: There are nums.length nodes, labeled nums[0] to nums[nums.length - 1], There is an undirected edge between nums[i] and nums[j] if nums[i] and nums[j] share a common factor greater than 1. Return the size of the largest connected component in the graph.', 'HARD', '["Array","Math","Union Find"]'::jsonb, '["Facebook","Goldman Sachs"]'::jsonb,
        48, 2168, 367, 6504, 3750,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int largestComponentSize(int[] nums) { return 0; } }","javascript":"var largestComponentSize = function(nums) {};","python":"class Solution:\n    def largestComponentSize(self, nums: List[int]) -> int:\n        pass","cpp":"class Solution { public: int largestComponentSize(vector<int>& nums) { return 0; } };"}'::jsonb, 'largestComponentSize', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Least Operators to Express Number', 'Given a single positive integer x, we will write an expression of the form x (op1) x (op2) x (op3) x ... where each operator op1, op2, etc. is either addition, subtraction, multiplication, or division (+, -, *, or /). For example, with x = 3, we might write 3 * 3 / 3 + 3 - 3 which is a value of 3. When writing such an expression, we adhere to the following conventions: The division operator (/) returns rational numbers. There are no parentheses placed anywhere. We use the usual order of operations: multiplication and division happen before addition and explanation. We are not allowed to use the unary negation operator. Return the least number of operators to express a given number target.', 'HARD', '["Math","Dynamic Programming"]'::jsonb, '["Spotify","Salesforce","Netflix"]'::jsonb,
        41, 1640, 118, 8200, 5717,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int leastOpsExpressTarget(int x, int target) { return 0; } }","javascript":"var leastOpsExpressTarget = function(x, target) {};","python":"class Solution:\n    def leastOpsExpressTarget(self, x: int, target: int) -> int:\n        pass","cpp":"class Solution { public: int leastOpsExpressTarget(int x, int target) { return 0; } };"}'::jsonb, 'leastOpsExpressTarget', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Tallest Billboard', 'You are installing a billboard and want it to have the largest height. The billboard will have two steel supports, one on each side. Each steel support must be an equal height. You are given a collection of rods that can be welded together. For example, if you have rods of lengths 1, 2, and 3, you can weld them together to make a support of length 6. Return the largest possible height of your billboard installation. If you cannot support the billboard, return 0.', 'HARD', '["Array","Dynamic Programming"]'::jsonb, '["Tesla"]'::jsonb,
        29, 4052, 35, 16208, 7089,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int tallestBillboard(int[] rods) { return 0; } }","javascript":"var tallestBillboard = function(rods) {};","python":"class Solution:\n    def tallestBillboard(self, rods: List[int]) -> int:\n        pass","cpp":"class Solution { public: int tallestBillboard(vector<int>& rods) { return 0; } };"}'::jsonb, 'tallestBillboard', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Binary Tree Cameras', 'You are given the root of a binary tree. We install cameras on the tree nodes where each camera at a node can monitor its parent, itself, and its immediate children. Return the minimum number of cameras needed to monitor all nodes of the tree.', 'HARD', '["Dynamic Programming","Tree","DFS","Binary Tree"]'::jsonb, '["LinkedIn","Uber","Tesla","Adobe"]'::jsonb,
        80, 602, 30, 3612, 2370,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minCameraCover(TreeNode root) { return 0; } }","javascript":"var minCameraCover = function(root) {};","python":"class Solution:\n    def minCameraCover(self, root: Optional[TreeNode]) -> int:\n        pass","cpp":"class Solution { public: int minCameraCover(TreeNode* root) { return 0; } };"}'::jsonb, 'minCameraCover', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Triples with Bitwise AND Equal To Zero', 'Given an integer array nums, return the number of AND triples. An AND triple is a triple of indices (i, j, k) such that: 0 <= i < nums.length, 0 <= j < nums.length, 0 <= k < nums.length, and nums[i] & nums[j] & nums[k] == 0, where & represents the bitwise-AND operator.', 'HARD', '["Array","Hash Table","Bit Manipulation"]'::jsonb, '["Twitter"]'::jsonb,
        5, 2542, 237, 10168, 3497,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int countTriplets(int[] nums) { return 0; } }","javascript":"var countTriplets = function(nums) {};","python":"class Solution:\n    def countTriplets(self, nums: List[int]) -> int:\n        pass","cpp":"class Solution { public: int countTriplets(vector<int>& nums) { return 0; } };"}'::jsonb, 'countTriplets', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Cost to Merge Stones', 'There are n piles of stones arranged in a row. The ith pile has stones[i] stones. A move consists of merging exactly k consecutive piles into one pile, and the cost of this move is equal to the total number of stones in these k piles. Return the minimum cost to merge all piles of stones into one pile. If it is impossible, return -1.', 'HARD', '["Array","Dynamic Programming"]'::jsonb, '["IBM","Facebook","Google"]'::jsonb,
        25, 123, 1, 738, 353,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int mergeStones(int[] stones, int k) { return 0; } }","javascript":"var mergeStones = function(stones, k) {};","python":"class Solution:\n    def mergeStones(self, stones: List[int], k: int) -> int:\n        pass","cpp":"class Solution { public: int mergeStones(vector<int>& stones, int k) { return 0; } };"}'::jsonb, 'mergeStones', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Number of Squareful Arrays', 'Given an integer array nums, return the number of permutations of nums that are squareful. A permutation is squareful if for every pair of adjacent elements, their sum is a perfect square.', 'HARD', '["Array","Math","Backtracking","Bit Manipulation"]'::jsonb, '["Oracle","Netflix","Uber"]'::jsonb,
        30, 3145, 320, 12580, 8107,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int numSquarefulPerms(int[] nums) { return 0; } }","javascript":"var numSquarefulPerms = function(nums) {};","python":"class Solution:\n    def numSquarefulPerms(self, nums: List[int]) -> int:\n        pass","cpp":"class Solution { public: int numSquarefulPerms(vector<int>& nums) { return 0; } };"}'::jsonb, 'numSquarefulPerms', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Stream of Characters', 'Design an algorithm that accepts a stream of characters and checks if a suffix of these characters is a string of a given array of strings words.', 'HARD', '["Array","String","Design","Trie","Data Stream"]'::jsonb, '["LinkedIn","JPMorgan","Oracle","Bloomberg"]'::jsonb,
        31, 2017, 306, 12102, 5761,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class StreamChecker { public StreamChecker(String[] words) {} public boolean query(char letter) { return false; } }","javascript":"var StreamChecker = function(words) {}; StreamChecker.prototype.query = function(letter) {};","python":"class StreamChecker:\n    def __init__(self, words: List[str]):\n        pass\n    def query(self, letter: str) -> bool:\n        pass","cpp":"class StreamChecker { public: StreamChecker(vector<string>& words) {} bool query(char letter) { return false; } };"}'::jsonb, 'query', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Duplicate Substring', 'Given a string s, consider all duplicated substrings: (contiguous) substrings of s that occur 2 or more times. The occurrences may overlap. Return any duplicated substring that has the longest possible length. If s does not have a duplicated substring, the answer is "".', 'HARD', '["String","Binary Search","Sliding Window","Rolling Hash","Suffix Array"]'::jsonb, '["Google","Facebook","Netflix"]'::jsonb,
        11, 920, 112, 3680, 2399,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String longestDupSubstring(String s) { return \"\"; } }","javascript":"var longestDupSubstring = function(s) {};","python":"class Solution:\n    def longestDupSubstring(self, s: str) -> str:\n        pass","cpp":"class Solution { public: string longestDupSubstring(string s) { return \"\"; } };"}'::jsonb, 'longestDupSubstring', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Recover a Tree From Preorder Traversal', 'We run a preorder depth-first search (DFS) on the root of a binary tree. At each node in this traversal, we output D dashes (where D is the depth of this node), then we output the value of this node. If the depth of a node is D, the depth of its immediate child is D + 1. The depth of the root node is 0. If a node has only one child, that child is guaranteed to be the left child. Given the output traversal of this traversal, recover the tree and return its root.', 'HARD', '["String","Tree","DFS","Binary Tree"]'::jsonb, '["JPMorgan"]'::jsonb,
        23, 1268, 253, 6340, 3812,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public TreeNode recoverFromPreorder(String traversal) { return null; } }","javascript":"var recoverFromPreorder = function(traversal) {};","python":"class Solution:\n    def recoverFromPreorder(self, traversal: str) -> Optional[TreeNode]:\n        pass","cpp":"class Solution { public: TreeNode* recoverFromPreorder(string traversal) { return nullptr; } };"}'::jsonb, 'recoverFromPreorder', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Last Stone Weight II', 'You are given an array of integers stones where stones[i] is the weight of the ith stone. We are playing a game with the stones. On each turn, we choose any two stones and smash them together. Suppose the stones have weights x and y with x <= y. The result of this smash is: If x == y, both stones are destroyed, and If x != y, the stone of weight x is destroyed, and the stone of weight y has new weight y - x. At the end of the game, there is at most one stone left. Return the smallest possible weight of the left stone. If there are no stones left, return 0.', 'MEDIUM', '["Array","Dynamic Programming"]'::jsonb, '["Cisco","Stripe","Bloomberg"]'::jsonb,
        70, 2836, 346, 11344, 7431,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int lastStoneWeightII(int[] stones) { return 0; } }","javascript":"var lastStoneWeightII = function(stones) {};","python":"class Solution:\n    def lastStoneWeightII(self, stones: List[int]) -> int:\n        pass","cpp":"class Solution { public: int lastStoneWeightII(vector<int>& stones) { return 0; } };"}'::jsonb, 'lastStoneWeightII', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Shortest Common Supersequence', 'Given two strings str1 and str2, return the shortest string that has both str1 and str2 as subsequences. If there are multiple valid strings, return any of them. A string s is a subsequence of string t if deleting some number of characters from t (possibly 0) results in the string s.', 'HARD', '["String","Dynamic Programming"]'::jsonb, '["Walmart"]'::jsonb,
        30, 4132, 20, 20660, 10865,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String shortestCommonSupersequence(String str1, String str2) { return \"\"; } }","javascript":"var shortestCommonSupersequence = function(str1, str2) {};","python":"class Solution:\n    def shortestCommonSupersequence(self, str1: str, str2: str) -> str:\n        pass","cpp":"class Solution { public: string shortestCommonSupersequence(string str1, string str2) { return \"\"; } };"}'::jsonb, 'shortestCommonSupersequence', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Parsing A Boolean Expression', 'A boolean expression is an expression that evaluates to either true or false. It can be in one of the following shapes: ''t'' that evaluates to true. ''f'' that evaluates to false. ''!(subExpr)'' that evaluates to the logical NOT of the inner expression subExpr. ''&(subExpr1, subExpr2, ..., subExprn)'' that evaluates to the logical AND of the inner expressions subExpr1, subExpr2, ..., subExprn. ''|(subExpr1, subExpr2, ..., subExprn)'' that evaluates to the logical OR of the inner expressions subExpr1, subExpr2, ..., subExprn. Given a string expression that represents a boolean expression, return the evaluation of that expression.', 'HARD', '["String","Stack","Recursion"]'::jsonb, '["Google","Bloomberg","Apple"]'::jsonb,
        77, 722, 46, 3610, 1765,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean parseBoolExpr(String expression) { return false; } }","javascript":"var parseBoolExpr = function(expression) {};","python":"class Solution:\n    def parseBoolExpr(self, expression: str) -> bool:\n        pass","cpp":"class Solution { public: bool parseBoolExpr(string expression) { return false; } };"}'::jsonb, 'parseBoolExpr', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Critical Connections in a Network', 'There are n servers numbered from 0 to n - 1 connected by undirected server-to-server connections forming a network where connections[i] = [ai, bi] represents a connection between servers ai and bi. Any server can reach other servers directly or indirectly through the network. A critical connection is a connection that, if removed, will make some servers unable to reach some other server. Return all critical connections in the network in any order.', 'HARD', '["DFS","Graph","Strongly Connected Component","Biconnected Component"]'::jsonb, '["ByteDance","Facebook","Netflix","Salesforce"]'::jsonb,
        60, 4666, 705, 23330, 9861,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<List<Integer>> criticalConnections(int n, List<List<Integer>> connections) { return new ArrayList<>(); } }","javascript":"var criticalConnections = function(n, connections) {};","python":"class Solution:\n    def criticalConnections(self, n: int, connections: List[List[int]]) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> criticalConnections(int n, vector<vector<int>>& connections) { return {}; } };"}'::jsonb, 'criticalConnections', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Remove Invalid Parentheses', 'Given a string s that contains parentheses and letters, remove the minimum number of invalid parentheses to make the input string valid. Return all the possible results. You may return the answer in any order.', 'HARD', '["String","Backtracking","BFS"]'::jsonb, '["Facebook","Google","JPMorgan"]'::jsonb,
        91, 504, 35, 1512, 972,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<String> removeInvalidParentheses(String s) { return new ArrayList<>(); } }","javascript":"var removeInvalidParentheses = function(s) {};","python":"class Solution:\n    def removeInvalidParentheses(self, s: str) -> List[str]:\n        pass","cpp":"class Solution { public: vector<string> removeInvalidParentheses(string s) { return {}; } };"}'::jsonb, 'removeInvalidParentheses', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'First Missing Positive', 'Given an unsorted integer array nums, return the smallest missing positive integer. You must implement an algorithm that runs in O(n) time and uses constant extra space.', 'HARD', '["Array","Hash Table"]'::jsonb, '["Shopify","AMD","Target"]'::jsonb,
        46, 1593, 190, 6372, 2316,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int firstMissingPositive(int[] nums) { return 0; } }","javascript":"var firstMissingPositive = function(nums) {};","python":"class Solution:\n    def firstMissingPositive(self, nums: List[int]) -> int:\n        pass","cpp":"class Solution { public: int firstMissingPositive(vector<int>& nums) { return 0; } };"}'::jsonb, 'firstMissingPositive', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Increasing Path in a Matrix', 'Given an m x n integers matrix, return the length of the longest increasing path in matrix. From each cell, you can either move in four directions: left, right, up, or down. You may not move diagonally or move outside the boundary (i.e., wrap-around is not allowed).', 'HARD', '["Dynamic Programming","DFS","BFS","Graph","Topological Sort","Memoization"]'::jsonb, '["SpaceX","Adobe","Goldman Sachs","Salesforce"]'::jsonb,
        32, 2231, 125, 4462, 2658,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int longestIncreasingPath(int[][] matrix) { return 0; } }","javascript":"var longestIncreasingPath = function(matrix) {};","python":"class Solution:\n    def longestIncreasingPath(self, matrix: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int longestIncreasingPath(vector<vector<int>>& matrix) { return 0; } };"}'::jsonb, 'longestIncreasingPath', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Regular Expression Matching', 'Given an input string s and a pattern p, implement regular expression matching with support for ''.'' and ''*'' where: ''.'' Matches any single character. ''*'' Matches zero or more of the preceding element. The matching should cover the entire input string (not partial).', 'HARD', '["String","Dynamic Programming","Recursion"]'::jsonb, '["Salesforce","Walmart","SpaceX"]'::jsonb,
        26, 791, 106, 4746, 2000,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean isMatch(String s, String p) { return false; } }","javascript":"var isMatch = function(s, p) {};","python":"class Solution:\n    def isMatch(self, s: str, p: str) -> bool:\n        pass","cpp":"class Solution { public: bool isMatch(string s, string p) { return false; } };"}'::jsonb, 'isMatch', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Strange Printer', 'There is a strange printer with the following two special properties: The printer can only print a sequence of the same character each time. At each turn, the printer can print new characters starting from and ending at any place and will cover the original existing characters. Given a string s, return the minimum number of turns the printer needed to print it.', 'HARD', '["String","Dynamic Programming"]'::jsonb, '["Google","Target","JPMorgan"]'::jsonb,
        80, 2263, 130, 11315, 6258,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int strangePrinter(String s) { return 0; } }","javascript":"var strangePrinter = function(s) {};","python":"class Solution:\n    def strangePrinter(self, s: str) -> int:\n        pass","cpp":"class Solution { public: int strangePrinter(string s) { return 0; } };"}'::jsonb, 'strangePrinter', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Create Maximum Number', 'You are given two integer arrays nums1 and nums2 of lengths m and n, respectively. nums1 and nums2 represent the digits of two numbers. You are also given an integer k. Create the maximum number of length k <= m + n from digits of the two numbers. The relative order of the digits from the same array must be preserved. Return an array of the k digits representing the answer.', 'HARD', '["Stack","Greedy","Monotonic Stack"]'::jsonb, '["Morgan Stanley","Cisco","JPMorgan","Facebook"]'::jsonb,
        66, 4683, 487, 9366, 4073,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[] maxNumber(int[] nums1, int[] nums2, int k) { return new int[]{}; } }","javascript":"var maxNumber = function(nums1, nums2, k) {};","python":"class Solution:\n    def maxNumber(self, nums1: List[int], nums2: List[int], k: int) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> maxNumber(vector<int>& nums1, vector<int>& nums2, int k) { return {}; } };"}'::jsonb, 'maxNumber', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Frog Jump', 'A frog is crossing a river. The river is divided into some number of units, and at each unit, there may or may not be a stone. The frog can jump on a stone, but it must not jump into the water. Given a list of stones'' positions (in units) in sorted ascending order, determine if the frog can cross the river by landing on the last stone. Initially, the frog is on the first stone and assumes the first jump must be 1 unit. If the frog''s last jump was k units, its next jump must be either k - 1, k, or k + 1 units. The frog can only jump in the forward direction.', 'HARD', '["Array","Dynamic Programming"]'::jsonb, '["Stripe","Target"]'::jsonb,
        86, 3193, 632, 6386, 3881,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean canCross(int[] stones) { return false; } }","javascript":"var canCross = function(stones) {};","python":"class Solution:\n    def canCross(self, stones: List[int]) -> bool:\n        pass","cpp":"class Solution { public: bool canCross(vector<int>& stones) { return false; } };"}'::jsonb, 'canCross', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Poor Pigs', 'There are buckets buckets of liquid, where exactly one of the buckets is poisonous. To figure out which one is poisonous, you feed some number of (poor) pigs the liquid to see whether they will die or not. Unfortunately, you only have minutesToTest minutes to determine which bucket is poisonous. You can feed the pigs according to these steps: Choose some live pigs to feed. For each pig, choose which buckets to feed it. The pig will consume all the chosen buckets simultaneously and will take no time. Wait for minutesToDie minutes. You may not feed any other pigs during this time. After minutesToDie minutes have passed, any pigs that have been fed the poisonous bucket will die, and all others will survive. Repeat this process until you run out of time. Given buckets, minutesToDie, and minutesToTest, return the minimum number of pigs needed to figure out which bucket is poisonous within the allotted time.', 'HARD', '["Math","Dynamic Programming","Combinatorics"]'::jsonb, '["IBM","Microsoft","Walmart"]'::jsonb,
        90, 4180, 566, 20900, 11911,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int poorPigs(int buckets, int minutesToDie, int minutesToTest) { return 0; } }","javascript":"var poorPigs = function(buckets, minutesToDie, minutesToTest) {};","python":"class Solution:\n    def poorPigs(self, buckets: int, minutesToDie: int, minutesToTest: int) -> int:\n        pass","cpp":"class Solution { public: int poorPigs(int buckets, int minutesToDie, int minutesToTest) { return 0; } };"}'::jsonb, 'poorPigs', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Zuma Game', 'You are playing a variation of the game Zuma. In this variation of Zuma, there is a single row of colored balls on a board, where each ball can be colored Red ''R'', Yellow ''Y'', Blue ''B'', Green ''G'', or White ''W''. You also have several colored balls in your hand. Your goal is to clear all of the balls from the board. Return the minimum number of balls you have to insert to clear all the balls from the board. If you cannot clear all the balls, return -1.', 'HARD', '["String","Dynamic Programming","Memoization","Breadth-First Search"]'::jsonb, '["Cisco","Target","Bloomberg","ByteDance"]'::jsonb,
        100, 2401, 436, 9604, 6473,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int findMinStep(String board, String hand) { return 0; } }","javascript":"var findMinStep = function(board, hand) {};","python":"class Solution:\n    def findMinStep(self, board: str, hand: str) -> int:\n        pass","cpp":"class Solution { public: int findMinStep(string board, string hand) { return 0; } };"}'::jsonb, 'findMinStep', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Remove Boxes', 'You are given several boxes with different colors represented by different positive integers. You may experience several rounds to remove boxes until there is no box left. Each time you can choose some continuous boxes with the same color (i.e., composed of k boxes, k >= 1), remove them and get k * k points. Return the maximum points you can get.', 'HARD', '["Array","Dynamic Programming","Memoization"]'::jsonb, '["Cisco","Target","Facebook","Uber"]'::jsonb,
        64, 1751, 336, 5253, 2425,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int removeBoxes(int[] boxes) { return 0; } }","javascript":"var removeBoxes = function(boxes) {};","python":"class Solution:\n    def removeBoxes(self, boxes: List[int]) -> int:\n        pass","cpp":"class Solution { public: int removeBoxes(vector<int>& boxes) { return 0; } };"}'::jsonb, 'removeBoxes', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Super Egg Drop', 'You are given k identical eggs and you have access to a building with n floors labeled from 1 to n. You know that there exists a floor f where 0 <= f <= n such that any egg dropped at a floor higher than f will break, and any egg dropped at or below floor f will not break. Each move, you may take an unbroken egg and drop it from any floor x (where 1 <= x <= n). If the egg breaks, you can no longer use it. However, if the egg does not break, you may reuse it in future moves. Return the minimum number of moves that you need to determine with certainty what the value of f is.', 'HARD', '["Math","Binary Search","Dynamic Programming"]'::jsonb, '["ByteDance","Cisco","Microsoft"]'::jsonb,
        9, 1020, 43, 3060, 929,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int superEggDrop(int k, int n) { return 0; } }","javascript":"var superEggDrop = function(k, n) {};","python":"class Solution:\n    def superEggDrop(self, k: int, n: int) -> int:\n        pass","cpp":"class Solution { public: int superEggDrop(int k, int n) { return 0; } };"}'::jsonb, 'superEggDrop', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Profitable Schemes', 'There is a group of n members, and a list of various crimes they could commit. The ith crime generates a profit[i] and requires group[i] members to participate. If a member participates in one crime, that member can''t participate in another crime. Let''s call a profitable scheme any subset of these crimes that generates at least minProfit profit, and the total number of members participating in that subset of crimes is at most n. Return the number of schemes that can be chosen. Since the answer may be very large, return it modulo 10^9 + 7.', 'HARD', '["Array","Dynamic Programming"]'::jsonb, '["LinkedIn","Oracle","Adobe","Cisco"]'::jsonb,
        73, 4841, 303, 9682, 6234,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int profitableSchemes(int n, int minProfit, int[] group, int[] profit) { return 0; } }","javascript":"var profitableSchemes = function(n, minProfit, group, profit) {};","python":"class Solution:\n    def profitableSchemes(self, n: int, minProfit: int, group: List[int], profit: List[int]) -> int:\n        pass","cpp":"class Solution { public: int profitableSchemes(int n, int minProfit, vector<int>& group, vector<int>& profit) { return 0; } };"}'::jsonb, 'profitableSchemes', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Numbers At Most N Given Digit Set', 'Given an array of digits which is sorted in non-decreasing order. You can write numbers using each digits[i] as many times as we want. For example, if digits = [''1'',''3'',''5''], we may write numbers such as ''13'', ''551'', and ''13513''. Return the number of positive integers that can be generated that are less than or equal to a given integer n.', 'HARD', '["Math","Dynamic Programming","Binary Search"]'::jsonb, '["AMD","Walmart"]'::jsonb,
        41, 2580, 15, 7740, 4586,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int atMostNGivenDigitSet(String[] digits, int n) { return 0; } }","javascript":"var atMostNGivenDigitSet = function(digits, n) {};","python":"class Solution:\n    def atMostNGivenDigitSet(self, digits: List[str], n: int) -> int:\n        pass","cpp":"class Solution { public: int atMostNGivenDigitSet(vector<string>& digits, int n) { return 0; } };"}'::jsonb, 'atMostNGivenDigitSet', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Valid Permutations for DI Sequence', 'You are given a string s of length n where s[i] is either: ''D'' means decreasing, or ''I'' means increasing. A permutation perm of n + 1 integers of all the integers in the range [0, n] is called a valid permutation if for all valid i: If s[i] == ''D'', then perm[i] > perm[i + 1], and If s[i] == ''I'', then perm[i] < perm[i + 1]. Return the number of valid permutations perm. Since the answer may be very large, return it modulo 10^9 + 7.', 'HARD', '["Dynamic Programming","Divide and Conquer"]'::jsonb, '["JPMorgan"]'::jsonb,
        53, 2924, 400, 8772, 4355,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int numPermsDISequence(String s) { return 0; } }","javascript":"var numPermsDISequence = function(s) {};","python":"class Solution:\n    def numPermsDISequence(self, s: str) -> int:\n        pass","cpp":"class Solution { public: int numPermsDISequence(string s) { return 0; } };"}'::jsonb, 'numPermsDISequence', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Orderly Queue', 'You are given a string s and an integer k. You can choose one of the first k letters of s and append it at the end of the string. Return the lexicographically smallest string you could have after applying the mentioned step any number of moves.', 'HARD', '["Math","String","Sorting"]'::jsonb, '["IBM","Microsoft","Bloomberg"]'::jsonb,
        44, 592, 102, 1776, 622,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String orderlyQueue(String s, int k) { return \"\"; } }","javascript":"var orderlyQueue = function(s, k) {};","python":"class Solution:\n    def orderlyQueue(self, s: str, k: int) -> str:\n        pass","cpp":"class Solution { public: string orderlyQueue(string s, int k) { return \"\"; } };"}'::jsonb, 'orderlyQueue', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reverse Subarray To Maximize Array Value', 'You are given an integer array nums. The value of this array is defined as the sum of |nums[i] - nums[i + 1]| for all 0 <= i < nums.length - 1. You are allowed to select any subarray of the given array and reverse it. You can perform this operation only once. Find maximum possible value of the final array.', 'HARD', '["Array","Math","Greedy"]'::jsonb, '["Oracle","Goldman Sachs"]'::jsonb,
        41, 3051, 111, 15255, 4852,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxValueAfterReverse(int[] nums) { return 0; } }","javascript":"var maxValueAfterReverse = function(nums) {};","python":"class Solution:\n    def maxValueAfterReverse(self, nums: List[int]) -> int:\n        pass","cpp":"class Solution { public: int maxValueAfterReverse(vector<int>& nums) { return 0; } };"}'::jsonb, 'maxValueAfterReverse', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Number of Tap to Open to Water a Garden', 'There is a one-dimensional garden on the x-axis. The garden starts at the point 0 and ends at the point n. (i.e The length of the garden is n). There are n + 1 taps located at points [0, 1, ..., n] in the garden. Given an integer n and an integer array ranges of length n + 1 where ranges[i] (0-indexed) means the i-th tap can water the area [i - ranges[i], i + ranges[i]] if it was open. Return the minimum number of taps that should be open to water the whole garden, If the garden cannot be watered return -1.', 'HARD', '["Array","Dynamic Programming","Greedy"]'::jsonb, '["AMD","Twitter","Nvidia"]'::jsonb,
        6, 1381, 23, 6905, 3105,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minTaps(int n, int[] ranges) { return 0; } }","javascript":"var minTaps = function(n, ranges) {};","python":"class Solution:\n    def minTaps(self, n: int, ranges: List[int]) -> int:\n        pass","cpp":"class Solution { public: int minTaps(int n, vector<int>& ranges) { return 0; } };"}'::jsonb, 'minTaps', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Jump Game IV', 'Given an array of integers arr, you are initially positioned at the first index of the array. In one step you can jump from index i to index: i + 1 where: i + 1 < arr.length. i - 1 where: i - 1 >= 0. j where: arr[i] == arr[j] and i != j. Return the minimum number of steps to reach the last index of the array.', 'HARD', '["Array","Hash Table","BFS"]'::jsonb, '["Adobe","Nvidia"]'::jsonb,
        81, 726, 98, 2904, 1237,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minJumps(int[] arr) { return 0; } }","javascript":"var minJumps = function(arr) {};","python":"class Solution:\n    def minJumps(self, arr: List[int]) -> int:\n        pass","cpp":"class Solution { public: int minJumps(vector<int>& arr) { return 0; } };"}'::jsonb, 'minJumps', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reducing Dishes', 'A chef has collected data on the satisfaction level of his n dishes. Chef can cook any dish in 1 unit of time. Like-time coefficient of a dish is defined as the time taken to cook that dish including previous dishes multiplied by its satisfaction level i.e. time[i] * satisfaction[i]. Return the maximum sum of like-time coefficient that the chef can obtain after dishes preparation. Dishes can be prepared in any order and the chef can discard some dishes to get this maximum value.', 'HARD', '["Array","Dynamic Programming","Greedy","Sorting"]'::jsonb, '["Adobe","Salesforce","Stripe"]'::jsonb,
        43, 258, 30, 1548, 621,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxSatisfaction(int[] satisfaction) { return 0; } }","javascript":"var maxSatisfaction = function(satisfaction) {};","python":"class Solution:\n    def maxSatisfaction(self, satisfaction: List[int]) -> int:\n        pass","cpp":"class Solution { public: int maxSatisfaction(vector<int>& satisfaction) { return 0; } };"}'::jsonb, 'maxSatisfaction', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Stone Game III', 'Alice and Bob continue their games with piles of stones. There are several stones arranged in a row, and each stone has an associated value which is an integer given in the array stoneValue. Alice and Bob take turns, with Alice starting first. On each player''s turn, that player can take 1, 2, or 3 stones from the first remaining stones in the row. The score of each player is the sum of the values of the stones taken. The score of each player is 0 initially. The objective of the game is to end with the highest score, and the winner is the player with the highest score and there could be a tie. The game continues until all the stones have been taken.', 'HARD', '["Array","Dynamic Programming","Game Theory"]'::jsonb, '["Google","LinkedIn","Adobe","Salesforce"]'::jsonb,
        51, 3064, 104, 6128, 2957,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String stoneGameIII(int[] stoneValue) { return \"\"; } }","javascript":"var stoneGameIII = function(stoneValue) {};","python":"class Solution:\n    def stoneGameIII(self, stoneValue: List[int]) -> str:\n        pass","cpp":"class Solution { public: string stoneGameIII(vector<int>& stoneValue) { return \"\"; } };"}'::jsonb, 'stoneGameIII', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Max Dot Product of Two Subsequences', 'Given two arrays nums1 and nums2. Return the maximum dot product between non-empty subsequences of nums1 and nums2 with the same length. A subsequence of a array is a new array which is formed from the original array by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, [2,3,5] is a subsequence of [1,2,3,4,5] while [1,5,3] is not).', 'HARD', '["Array","Dynamic Programming"]'::jsonb, '["Intel","Nvidia","LinkedIn","Google"]'::jsonb,
        92, 2255, 1, 11275, 7766,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxDotProduct(int[] nums1, int[] nums2) { return 0; } }","javascript":"var maxDotProduct = function(nums1, nums2) {};","python":"class Solution:\n    def maxDotProduct(self, nums1: List[int], nums2: List[int]) -> int:\n        pass","cpp":"class Solution { public: int maxDotProduct(vector<int>& nums1, vector<int>& nums2) { return 0; } };"}'::jsonb, 'maxDotProduct', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Number of Days to Disconnect Island', 'You are given an m x n binary grid grid where 1 represents land and 0 represents water. An island is a maximal 4-directionally (horizontal or vertical) connected group of 1s. The grid is said to be connected if we have exactly one island, otherwise is said disconnected. In one day, we are allowed to change any single land cell (1) into a water cell (0). Return the minimum number of days to disconnect the grid.', 'HARD', '["Array","DFS","BFS","Matrix","Strongly Connected Component"]'::jsonb, '["Tesla","SpaceX","Netflix"]'::jsonb,
        52, 1884, 137, 5652, 3364,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minDays(int[][] grid) { return 0; } }","javascript":"var minDays = function(grid) {};","python":"class Solution:\n    def minDays(self, grid: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int minDays(vector<vector<int>>& grid) { return 0; } };"}'::jsonb, 'minDays', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Kth Smallest Instructions', 'Bob is standing at cell (0, 0), and he wants to reach destination: (row, column). He can only travel right and down. You are going to help Bob to get to destination (row, column). However, Bob doesn''t want to receive instructions like "RRDD". He wants the kth lexicographically smallest instructions that will lead him to destination (row, column). k is 1-indexed. Given an integer array destination and an integer k, return the kth lexicographically smallest instructions that will take Bob to destination.', 'HARD', '["Array","Math","Dynamic Programming","Combinatorics"]'::jsonb, '["Twitter","Cisco","Netflix","ByteDance"]'::jsonb,
        70, 2701, 247, 13505, 4585,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String kthSmallestPath(int[] destination, int k) { return \"\"; } }","javascript":"var kthSmallestPath = function(destination, k) {};","python":"class Solution:\n    def kthSmallestPath(self, destination: List[int], k: int) -> str:\n        pass","cpp":"class Solution { public: string kthSmallestPath(vector<int>& destination, int k) { return \"\"; } };"}'::jsonb, 'kthSmallestPath', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Initial Energy to Finish Tasks', 'You are given an array tasks where tasks[i] = [actuali, minimumi]: actuali is the actual amount of energy you spend to finish the ith task. minimumi is the minimum amount of energy you require to begin the ith task. For example, if the task is [10, 12] and your current energy is 11, you cannot start this task. However, if your current energy is 13, you can complete this task, and your energy becomes 13 - 10 = 3. Return the minimum initial amount of energy you will need to finish all the tasks.', 'HARD', '["Array","Greedy","Sorting"]'::jsonb, '["Oracle","Adobe","ByteDance","Shopify"]'::jsonb,
        26, 2572, 168, 12860, 8737,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minimumEffort(int[][] tasks) { return 0; } }","javascript":"var minimumEffort = function(tasks) {};","python":"class Solution:\n    def minimumEffort(self, tasks: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int minimumEffort(vector<vector<int>>& tasks) { return 0; } };"}'::jsonb, 'minimumEffort', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Check If Two Expression Trees are Equivalent', 'A binary expression tree is a kind of binary tree used to represent arithmetic expressions. Each node of a binary expression tree has either zero or two children. Leaf nodes (nodes with 0 children) correspond to operands (variables), and internal nodes (nodes with 2 children) correspond to the operators. In this problem, we only consider the ''+'' operator (i.e. addition). You are given the roots of two binary expression trees, root1 and root2. Return true if the two binary expression trees are equivalent. Otherwise, return false.', 'MEDIUM', '["Tree","DFS","Brainteaser"]'::jsonb, '["Oracle","Twitter","Target"]'::jsonb,
        36, 3511, 354, 14044, 5284,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean checkEquivalence(Node root1, Node root2) { return false; } }","javascript":"var checkEquivalence = function(root1, root2) {};","python":"class Solution:\n    def checkEquivalence(self, root1: ''Node'', root2: ''Node'') -> bool:\n        pass","cpp":"class Solution { public: bool checkEquivalence(Node* root1, Node* root2) { return false; } };"}'::jsonb, 'checkEquivalence', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimize Deviation in Array', 'You are given an array nums of n positive integers. You can perform two types of operations on any element of the array any number of times: If the element is even, divide it by 2. If the element is odd, multiply it by 2. Return the minimum deviation the array can have after performing some number of operations.', 'HARD', '["Array","Greedy","Heap","Ordered Set"]'::jsonb, '["ByteDance","Apple","Salesforce","Facebook"]'::jsonb,
        93, 3467, 138, 17335, 9439,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minimumDeviation(int[] nums) { return 0; } }","javascript":"var minimumDeviation = function(nums) {};","python":"class Solution:\n    def minimumDeviation(self, nums: List[int]) -> int:\n        pass","cpp":"class Solution { public: int minimumDeviation(vector<int>& nums) { return 0; } };"}'::jsonb, 'minimumDeviation', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Delivering Boxes from Storage to Ports', 'You have the task of delivering some boxes from storage to their ports using only one ship. However, this ship has a limit on the number of boxes and the total weight that it can carry. Given an array of boxes, portsCount, maxBoxes, and maxWeight, return the minimum number of trips to deliver all boxes to their respective ports.', 'HARD', '["Array","Dynamic Programming","Segment Tree","Queue","Monotonic Queue"]'::jsonb, '["Cisco","Oracle","Shopify","Morgan Stanley"]'::jsonb,
        27, 1660, 174, 8300, 5650,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int boxDelivering(int[][] boxes, int portsCount, int maxBoxes, int maxWeight) { return 0; } }","javascript":"var boxDelivering = function(boxes, portsCount, maxBoxes, maxWeight) {};","python":"class Solution:\n    def boxDelivering(self, boxes: List[List[int]], portsCount: int, maxBoxes: int, maxWeight: int) -> int:\n        pass","cpp":"class Solution { public: int boxDelivering(vector<vector<int>>& boxes, int portsCount, int maxBoxes, int maxWeight) { return 0; } };"}'::jsonb, 'boxDelivering', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Maximum Number of Non-Overlapping Substrings', 'Given a string s of lowercase letters, you need to find the maximum number of non-empty substrings of s that meet the following conditions: The substrings do not overlap, meaning for any two substrings s[i..j] and s[x..y], either j < x or i > y is true. A substring that contains a certain character c must also contain all occurrences of c. Find the maximum number of such substrings.', 'HARD', '["String","Greedy"]'::jsonb, '["Spotify","Salesforce"]'::jsonb,
        58, 26, 1, 52, 28,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<String> maxNumOfSubstrings(String s) { return new ArrayList<>(); } }","javascript":"var maxNumOfSubstrings = function(s) {};","python":"class Solution:\n    def maxNumOfSubstrings(self, s: str) -> List[str]:\n        pass","cpp":"class Solution { public: vector<string> maxNumOfSubstrings(string s) { return {}; } };"}'::jsonb, 'maxNumOfSubstrings', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Minimum Operations to Make a Subsequence', 'You are given an array target that consists of distinct integers and another integer array arr that can have duplicates. In one operation, you can insert any integer at any position in arr. For example, if arr = [1,4,1,2], you can add 3 in the middle and make it [1,4,3,1,2]. Note that you can perform the operation at any number of times. Return the minimum number of operations needed to make target a subsequence of arr.', 'HARD', '["Array","Hash Table","Binary Search","Greedy"]'::jsonb, '["Spotify","Intel"]'::jsonb,
        37, 1537, 95, 7685, 2829,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minOperations(int[] target, int[] arr) { return 0; } }","javascript":"var minOperations = function(target, arr) {};","python":"class Solution:\n    def minOperations(self, target: List[int], arr: List[int]) -> int:\n        pass","cpp":"class Solution { public: int minOperations(vector<int>& target, vector<int>& arr) { return 0; } };"}'::jsonb, 'minOperations', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Number of Restricted Paths From First to Last Node', 'There is an undirected weighted connected graph. You are given a positive integer n which denotes that the graph has n nodes labeled from 1 to n, and an array edges where each edges[i] = [ui, vi, weighti] denotes that there is an edge between nodes ui and vi with weight equal to weighti. A path from node start to node end is a sequence of nodes [z0, z1, ..., zk] such that z0 = start and zk = end and there is an edge between zi and zi+1 where 0 <= i <= k-1. The distance of a path is the sum of the weights on the edges of the path. Let distanceToLastNode(x) denote the shortest distance of a path between node x and node n. A restricted path is a path that also satisfies that distanceToLastNode(zi) > distanceToLastNode(zi+1) where 0 <= i <= k-1. Return the number of restricted paths from node 1 to node n. Since that number may be too large, return it modulo 10^9 + 7.', 'MEDIUM', '["Dynamic Programming","Graph","Topological Sort","Shortest Path"]'::jsonb, '["Nvidia","Spotify","ByteDance"]'::jsonb,
        52, 4972, 620, 9944, 6132,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int countRestrictedPaths(int n, int[][] edges) { return 0; } }","javascript":"var countRestrictedPaths = function(n, edges) {};","python":"class Solution:\n    def countRestrictedPaths(self, n: int, edges: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int countRestrictedPaths(int n, vector<vector<int>>& edges) { return 0; } };"}'::jsonb, 'countRestrictedPaths', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Maximum Score from Performing Multiplication Operations', 'You are given two integer arrays nums and multipliers of size n and m respectively, where n >= m. The arrays are 1-indexed. You begin with a score of 0. You want to perform exactly m operations. On the ith operation (1-indexed), you will: Choose one integer x from either the start or the end of the array nums. Add multipliers[i] * x to your score. Remove x from the array nums. Return the maximum score after performing m operations.', 'HARD', '["Array","Dynamic Programming"]'::jsonb, '["Nvidia"]'::jsonb,
        68, 845, 18, 2535, 1642,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maximumScore(int[] nums, int[] multipliers) { return 0; } }","javascript":"var maximumScore = function(nums, multipliers) {};","python":"class Solution:\n    def maximumScore(self, nums: List[int], multipliers: List[int]) -> int:\n        pass","cpp":"class Solution { public: int maximumScore(vector<int>& nums, vector<int>& multipliers) { return 0; } };"}'::jsonb, 'maximumScore', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Longest Valid Parentheses', 'Given a string containing just the characters ''('' and '')'', find the length of the longest valid (well-formed) parentheses substring.', 'HARD', '["String","Dynamic Programming","Stack"]'::jsonb, '["Google","Target","Apple"]'::jsonb,
        54, 3376, 470, 10128, 5637,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int longestValidParentheses(String s) { return 0; } }","javascript":"var longestValidParentheses = function(s) {};","python":"class Solution:\n    def longestValidParentheses(self, s: str) -> int:\n        pass","cpp":"class Solution { public: int longestValidParentheses(string s) { return 0; } };"}'::jsonb, 'longestValidParentheses', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Word Ledger', 'A transformation sequence from wordBegin to wordEnd using a dictionary wordList is a sequence of words wordBegin -> s1 -> s2 -> ... -> sk such that: Every adjacent pair of words differs by a single letter. Every si for 1 <= i <= k is in wordList. Note that wordBegin does not need to be in wordList. sk == wordEnd. Given two words, wordBegin and wordEnd, and a dictionary wordList, return the number of words in the shortest transformation sequence from wordBegin to wordEnd, or 0 if no such sequence exists.', 'HARD', '["Hash Table","String","BFS"]'::jsonb, '["Cisco","Google","Target"]'::jsonb,
        47, 2903, 438, 5806, 3746,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int ladderLength(String beginWord, String endWord, List<String> wordList) { return 0; } }","javascript":"var ladderLength = function(beginWord, endWord, wordList) {};","python":"class Solution:\n    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:\n        pass","cpp":"class Solution { public: int ladderLength(string beginWord, string endWord, vector<string>& wordList) { return 0; } };"}'::jsonb, 'ladderLength', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Text Justification', 'Given an array of strings words and a width maxWidth, format the text such that each line has exactly maxWidth characters and is fully (left and right) justified. You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces '' '' when necessary so that each line has exactly maxWidth characters. Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line does not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right. For the last line of text, it should be left-justified and no extra space is inserted between words.', 'HARD', '["Array","String","Simulation"]'::jsonb, '["Goldman Sachs","Shopify","Cisco","Google"]'::jsonb,
        99, 1124, 37, 2248, 1490,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<String> fullJustify(String[] words, int maxWidth) { return new ArrayList<>(); } }","javascript":"var fullJustify = function(words, maxWidth) {};","python":"class Solution:\n    def fullJustify(self, words: List[str], maxWidth: int) -> List[str]:\n        pass","cpp":"class Solution { public: vector<string> fullJustify(vector<string>& words, int maxWidth) { return {}; } };"}'::jsonb, 'fullJustify', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Substring with Concatenation of All Words', 'You are given a string s and an array of strings words of the same length. Return all starting indices of substring(s) in s that is a concatenation of each word in words exactly once, in any order, and without any intervening characters. You can return the answer in any order.', 'HARD', '["Hash Table","String","Sliding Window"]'::jsonb, '["Google","Oracle"]'::jsonb,
        77, 58, 10, 116, 63,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<Integer> findSubstring(String s, String[] words) { return new ArrayList<>(); } }","javascript":"var findSubstring = function(s, words) {};","python":"class Solution:\n    def findSubstring(self, s: str, words: List[str]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> findSubstring(string s, vector<string>& words) { return {}; } };"}'::jsonb, 'findSubstring', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reverse Nodes in k-Group', 'Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list. k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is. You may not alter the values in the list''s nodes, only nodes themselves may be changed.', 'HARD', '["Linked List","Recursion"]'::jsonb, '["JPMorgan","Oracle"]'::jsonb,
        10, 4934, 370, 29604, 11585,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public ListNode reverseKGroup(ListNode head, int k) { return null; } }","javascript":"var reverseKGroup = function(head, k) {};","python":"class Solution:\n    def reverseKGroup(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:\n        pass","cpp":"class Solution { public: ListNode* reverseKGroup(ListNode* head, int k) { return nullptr; } };"}'::jsonb, 'reverseKGroup', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sum of Subarray Minimums', 'Given an array of integers arr, find the sum of min(b), where b ranges over every (contiguous) subarray of arr. Since the answer may be large, return the answer modulo 10^9 + 7.', 'MEDIUM', '["Array","Dynamic Programming","Stack","Monotonic Stack"]'::jsonb, '["Shopify","Bloomberg"]'::jsonb,
        3, 3116, 538, 18696, 12811,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int sumSubarrayMins(int[] arr) { return 0; } }","javascript":"var sumSubarrayMins = function(arr) {};","python":"class Solution:\n    def sumSubarrayMins(self, arr: List[int]) -> int:\n        pass","cpp":"class Solution { public: int sumSubarrayMins(vector<int>& arr) { return 0; } };"}'::jsonb, 'sumSubarrayMins', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Super Palindromes', 'Let''s say a positive integer is a super-palindrome if it is a palindrome, and it is also the square of a palindrome. Given two positive integers left and right represented as strings, return the number of super-palindromes integers in the inclusive range [left, right].', 'HARD', '["Math","Enumeration"]'::jsonb, '["Oracle"]'::jsonb,
        76, 437, 25, 874, 517,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int superpalindromesInRange(String left, String right) { return 0; } }","javascript":"var superpalindromesInRange = function(left, right) {};","python":"class Solution:\n    def superpalindromesInRange(self, left: str, right: str) -> int:\n        pass","cpp":"class Solution { public: int superpalindromesInRange(string left, string right) { return 0; } };"}'::jsonb, 'superpalindromesInRange', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find the Closest Palindrome', 'Given a string n representing an integer, return the closest integer (not including itself), which is a palindrome. If there is a tie, return the smaller one. The closest is defined as the absolute difference minimized between two integers.', 'HARD', '["Math","String"]'::jsonb, '["Netflix","AMD","Adobe"]'::jsonb,
        61, 3402, 130, 6804, 4633,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String nearestPalindromic(String n) { return \"\"; } }","javascript":"var nearestPalindromic = function(n) {};","python":"class Solution:\n    def nearestPalindromic(self, n: str) -> str:\n        pass","cpp":"class Solution { public: string nearestPalindromic(string n) { return \"\"; } };"}'::jsonb, 'nearestPalindromic', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Tag Validator', 'Given a string representing a code snippet, you need to implement a tag validator to parse the code and return whether it is valid. A code snippet is valid if all these hold: The code must be wrapped in a valid closed tag. Otherwise, the code is invalid. A closed tag (not necessarily valid) has exactly the following format: <TAG_NAME>TAG_CONTENT</TAG_NAME>. Among them, <TAG_NAME> is the start tag, and </TAG_NAME> is the end tag. The TAG_NAME in all tags must be the same and contain only uppercase letters. For example, <DIV> and <DIV> are valid tags, but <DIV> and <div are not.', 'HARD', '["String","Stack"]'::jsonb, '["Shopify","Intel"]'::jsonb,
        83, 4905, 328, 24525, 15565,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean isValid(String code) { return false; } }","javascript":"var isValid = function(code) {};","python":"class Solution:\n    def isValid(self, code: str) -> bool:\n        pass","cpp":"class Solution { public: bool isValid(string code) { return false; } };"}'::jsonb, 'isValid', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Remove Comments', 'Given a C++ program, remove comments from it. The program source is an array of strings source where source[i] is the ith line of the source code. This represents the result of splitting the original source code string by the newline character ''\n''. In C++, there are two types of comments: Line comments, which start with the two characters "//" and end at the end of the line. Block comments, which start with "/*" and end with "*/". If a line comment appears inside a block comment, it is ignored; usually, a block comment cannot appear inside a line comment.', 'MEDIUM', '["Array","String"]'::jsonb, '["Tesla"]'::jsonb,
        100, 4356, 651, 21780, 12051,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<String> removeComments(String[] source) { return new ArrayList<>(); } }","javascript":"var removeComments = function(source) {};","python":"class Solution:\n    def removeComments(self, source: List[str]) -> List[str]:\n        pass","cpp":"class Solution { public: vector<string> removeComments(vector<string>& source) { return {}; } };"}'::jsonb, 'removeComments', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Special Binary String', 'Special binary strings are binary strings with the following two properties: The number of 0''s is equal to the number of 1''s. Every prefix of the binary string has at least as many 1''s as 0''s. Given a special binary string S, a move consists of choosing two consecutive, non-empty, special substrings of S, and swapping them. (Two strings are consecutive if the last character of the first string is exactly one index before the first character of the second string.) Return the lexicographically largest resulting string possible after any number of moves.', 'HARD', '["String","Recursion"]'::jsonb, '["JPMorgan","Tesla","Bloomberg","Apple"]'::jsonb,
        40, 376, 4, 1504, 685,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String makeLargestSpecial(String s) { return \"\"; } }","javascript":"var makeLargestSpecial = function(s) {};","python":"class Solution:\n    def makeLargestSpecial(self, s: str) -> str:\n        pass","cpp":"class Solution { public: string makeLargestSpecial(string s) { return \"\"; } };"}'::jsonb, 'makeLargestSpecial', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Parse Lisp Expression', 'You are given a string expression representing a Lisp-like expression to return the integer value of. The syntax for these expressions is: An expression is either an integer, let expression, add expression, mult expression, or an assigned variable. Expressions always start with a "(", then a keyword or the operator, then one or more expressions separated by single spaces " ", and finally end with a ")". Let expression, Add expression, Mult expression are defined as follows: etc.', 'HARD', '["Hash Table","String","Stack","Recursion"]'::jsonb, '["IBM"]'::jsonb,
        19, 2416, 47, 7248, 2575,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int evaluate(String expression) { return 0; } }","javascript":"var evaluate = function(expression) {};","python":"class Solution:\n    def evaluate(self, expression: str) -> int:\n        pass","cpp":"class Solution { public: int evaluate(string expression) { return 0; } };"}'::jsonb, 'evaluate', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'My Calendar III', 'A k-booking happens when k events have some non-empty intersection (i.e., there is some time that is common to all k events.) You are given some events [start, end), after each given event, return the maximum k-booking between all the previous events.', 'HARD', '["Segment Tree","Ordered Set"]'::jsonb, '["JPMorgan","Cisco"]'::jsonb,
        37, 336, 2, 1680, 1086,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class MyCalendarThree { public MyCalendarThree() {} public int book(int startTime, int endTime) { return 0; } }","javascript":"var MyCalendarThree = function() {}; MyCalendarThree.prototype.book = function(startTime, endTime) {};","python":"class MyCalendarThree:\n    def __init__(self):\n        pass\n    def book(self, startTime: int, endTime: int) -> int:\n        pass","cpp":"class MyCalendarThree { public: MyCalendarThree() {} int book(int startTime, int endTime) { return 0; } };"}'::jsonb, 'book', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Self Crossing', 'You are given an array of integers distance. You start at point (0,0) on an X-Y plane and you move distance[0] meters to the north, then distance[1] meters to the west, distance[2] meters to the south, distance[3] meters to the east, and so on. In other words, after each move, your direction changes counter-clockwise. Return true if your path crosses itself, and false if it does not.', 'HARD', '["Array","Math","Geometry"]'::jsonb, '["Twitter","Spotify","IBM"]'::jsonb,
        74, 272, 25, 1360, 889,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean isSelfCrossing(int[] distance) { return false; } }","javascript":"var isSelfCrossing = function(distance) {};","python":"class Solution:\n    def isSelfCrossing(self, distance: List[int]) -> bool:\n        pass","cpp":"class Solution { public: bool isSelfCrossing(vector<int>& distance) { return false; } };"}'::jsonb, 'isSelfCrossing', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Patching Array', 'Given a sorted integer array nums and an integer n, add/patch elements to the array such that any number in the range [1, n] inclusive can be formed by the sum of some elements in the array. Return the minimum number of patches required.', 'HARD', '["Array","Greedy"]'::jsonb, '["Stripe"]'::jsonb,
        3, 1005, 65, 5025, 2317,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int minPatches(int[] nums, int n) { return 0; } }","javascript":"var minPatches = function(nums, n) {};","python":"class Solution:\n    def minPatches(self, nums: List[int], n: int) -> int:\n        pass","cpp":"class Solution { public: int minPatches(vector<int>& nums, int n) { return 0; } };"}'::jsonb, 'minPatches', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Create Sorted Array through Instructions', 'Given an integer array instructions, you are asked to create a sorted array from the elements in instructions. You start with an empty container nums. For each element from left to right in instructions, insert it into nums. The cost of each insertion is the minimum of the number of elements currently in nums that are strictly less than instructions[i] or the number of elements currently in nums that are strictly greater than instructions[i]. Return the total cost modulo 10^9 + 7.', 'HARD', '["Array","Binary Search","Divide and Conquer","Binary Indexed Tree","Segment Tree","Merge Sort","Ordered Set"]'::jsonb, '["Morgan Stanley","Salesforce","Amazon"]'::jsonb,
        81, 2728, 50, 13640, 4452,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int createSortedArray(int[] instructions) { return 0; } }","javascript":"var createSortedArray = function(instructions) {};","python":"class Solution:\n    def createSortedArray(self, instructions: List[int]) -> int:\n        pass","cpp":"class Solution { public: int createSortedArray(vector<int>& instructions) { return 0; } };"}'::jsonb, 'createSortedArray', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Maximize Grid Happiness', 'You are given four integers, m, n, introvertsCount, and extrovertsCount. You have an m x n grid, and there are two types of people: introverts and extroverts. There are introvertsCount introverts and extrovertsCount extroverts. You should decide how many people you want to live in the grid and assign each of them one grid cell. Note that you do not have to have all the people living in the grid. Happiness rules: Introverts start with 120 happiness and lose 30 happiness for each neighbor. Extroverts start with 40 happiness and gain 20 happiness for each neighbor. Neighbors are directly adjacent cells.', 'HARD', '["Dynamic Programming","Bit Masking","Matrix","Memoization"]'::jsonb, '["Microsoft","ByteDance","AMD","Stripe"]'::jsonb,
        47, 585, 23, 1170, 745,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int getMaxGridHappiness(int m, int n, int introvertsCount, int extrovertsCount) { return 0; } }","javascript":"var getMaxGridHappiness = function(m, n, introvertsCount, extrovertsCount) {};","python":"class Solution:\n    def getMaxGridHappiness(self, m: int, n: int, introvertsCount: int, extrovertsCount: int) -> int:\n        pass","cpp":"class Solution { public: int getMaxGridHappiness(int m, int n, int introvertsCount, int extrovertsCount) { return 0; } };"}'::jsonb, 'getMaxGridHappiness', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Rank Transform of a Matrix', 'Given an m x n matrix, return a new matrix answer where answer[row][col] is the rank of matrix[row][col]. The rank is an integer that represents how large an element is compared to other elements. It is calculated using the following rules: The rank is an integer starting from 1. If two elements p and q are in the same row or column, then: If p < q then rank(p) < rank(q). If p == q then rank(p) == rank(q). If p > q then rank(p) > rank(q). The rank should be as small as possible.', 'HARD', '["Array","Greedy","Union Find","Graph","Topological Sort","Matrix"]'::jsonb, '["AMD"]'::jsonb,
        17, 2016, 249, 12096, 4007,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[][] matrixRankTransform(int[][] matrix) { return new int[][]{}; } }","javascript":"var matrixRankTransform = function(matrix) {};","python":"class Solution:\n    def matrixRankTransform(self, matrix: List[List[int]]) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> matrixRankTransform(vector<vector<int>>& matrix) { return {}; } };"}'::jsonb, 'matrixRankTransform', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Maximum Height by Stacking Cuboids', 'Given n cuboids where the dimensions of the ith cuboid is cuboids[i] = [widthi, lengthi, heighti] (0-indexed). Choose a subset of cuboids and place them on each other. You can place cuboid i on cuboid j if widthi <= widthj and lengthi <= lengthj and heighti <= heightj. You can rearrange any cuboid''s dimensions by rotating it to put it on another cuboid. Return the maximum height of the stacked cuboids.', 'HARD', '["Array","Dynamic Programming","Sorting"]'::jsonb, '["LinkedIn"]'::jsonb,
        6, 1192, 92, 7152, 2435,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maxHeight(int[][] cuboids) { return 0; } }","javascript":"var maxHeight = function(cuboids) {};","python":"class Solution:\n    def maxHeight(self, cuboids: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int maxHeight(vector<vector<int>>& cuboids) { return 0; } };"}'::jsonb, 'maxHeight', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find Minimum in Rotated Sorted Array II', 'Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,4,4,5,6,7] might become: [4,5,6,7,0,1,4] if it was rotated 4 times. [0,1,4,4,5,6,7] if it was rotated 7 times. Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]]. Given the sorted rotated array nums that may contain duplicates, return the minimum element of this array.', 'HARD', '["Array","Binary Search"]'::jsonb, '["Airbnb"]'::jsonb,
        5, 2320, 214, 13920, 9380,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int findMin(int[] nums) { return 0; } }","javascript":"var findMin = function(nums) {};","python":"class Solution:\n    def findMin(self, nums: List[int]) -> int:\n        pass","cpp":"class Solution { public: int findMin(vector<int>& nums) { return 0; } };"}'::jsonb, 'findMin', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Search in Rotated Sorted Array II', 'There is an integer array nums sorted in non-decreasing order (not necessarily with distinct values). Before being passed to your function, nums is rotated at an unknown pivot index k (0 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,4,4,5,6,6,7] might be rotated at pivot index 5 and become [4,5,6,6,7,0,1,2,4,4]. Given the array nums after the rotation and an integer target, return true if target is in nums, or false if it is not in nums.', 'MEDIUM', '["Array","Binary Search"]'::jsonb, '["Spotify","Amazon","Target","Tesla"]'::jsonb,
        84, 4801, 819, 9602, 5532,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean search(int[] nums, int target) { return false; } }","javascript":"var search = function(nums, target) {};","python":"class Solution:\n    def search(self, nums: List[int], target: int) -> bool:\n        pass","cpp":"class Solution { public: bool search(vector<int>& nums, int target) { return false; } };"}'::jsonb, 'search', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Contains Duplicate III', 'You are given an integer array nums and two integers indexDiff and valueDiff. Find a pair of indices (i, j) such that: i != j, abs(i - j) <= indexDiff, and abs(nums[i] - nums[j]) <= valueDiff. Return true if such pair exists or false otherwise.', 'HARD', '["Array","Bucket Sort","Ordered Set","Sliding Window"]'::jsonb, '["Nvidia","LinkedIn","AMD","Walmart"]'::jsonb,
        90, 3513, 28, 7026, 3505,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean containsNearbyAlmostDuplicate(int[] nums, int indexDiff, int valueDiff) { return false; } }","javascript":"var containsNearbyAlmostDuplicate = function(nums, indexDiff, valueDiff) {};","python":"class Solution:\n    def containsNearbyAlmostDuplicate(self, nums: List[int], indexDiff: int, valueDiff: int) -> bool:\n        pass","cpp":"class Solution { public: bool containsNearbyAlmostDuplicate(vector<int>& nums, int indexDiff, int valueDiff) { return false; } };"}'::jsonb, 'containsNearbyAlmostDuplicate', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Combinations', 'Given two integers n and k, return all possible combinations of k numbers chosen from the range [1, n]. You may return the answer in any order.', 'MEDIUM', '["Backtracking"]'::jsonb, '["Oracle"]'::jsonb,
        3, 176, 29, 352, 169,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<List<Integer>> combine(int n, int k) { return new ArrayList<>(); } }","javascript":"var combine = function(n, k) {};","python":"class Solution:\n    def combine(self, n: int, k: int) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> combine(int n, int k) { return {}; } };"}'::jsonb, 'combine', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Permutations II', 'Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.', 'MEDIUM', '["Array","Backtracking"]'::jsonb, '["Adobe","AMD","ByteDance","Facebook"]'::jsonb,
        93, 4419, 514, 17676, 6758,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<List<Integer>> permuteUnique(int[] nums) { return new ArrayList<>(); } }","javascript":"var permuteUnique = function(nums) {};","python":"class Solution:\n    def permuteUnique(self, nums: List[int]) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> permuteUnique(vector<int>& nums) { return {}; } };"}'::jsonb, 'permuteUnique', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Combination Sum II', 'Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target. Each number in candidates may only be used once in the combination. Note: The solution set must not contain duplicate combinations.', 'MEDIUM', '["Array","Backtracking"]'::jsonb, '["LinkedIn"]'::jsonb,
        12, 2661, 311, 5322, 2125,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<List<Integer>> combinationSum2(int[] candidates, int target) { return new ArrayList<>(); } }","javascript":"var combinationSum2 = function(candidates, target) {};","python":"class Solution:\n    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> combinationSum2(vector<int>& candidates, int target) { return {}; } };"}'::jsonb, 'combinationSum2', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Combination Sum III', 'Find all valid combinations of k numbers that sum up to n such that the following conditions are true: Only numbers 1 through 9 are used. Each number is used at most once. Return a list of all possible valid combinations. The list must not contain the same combination twice, and the combinations may be returned in any order.', 'MEDIUM', '["Array","Backtracking"]'::jsonb, '["Amazon"]'::jsonb,
        53, 3713, 255, 22278, 10679,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<List<Integer>> combinationSum3(int k, int n) { return new ArrayList<>(); } }","javascript":"var combinationSum3 = function(k, n) {};","python":"class Solution:\n    def combinationSum3(self, k: int, n: int) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> combinationSum3(int k, int n) { return {}; } };"}'::jsonb, 'combinationSum3', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Ones and Zeroes', 'You are given an array of binary strings strs and two integers m and n. Return the size of the largest subset of strs such that there are at most m 0''s and n 1''s in the subset. A set x is a subset of a set y if all elements of x are also elements of y.', 'MEDIUM', '["Array","String","Dynamic Programming"]'::jsonb, '["Airbnb","IBM","Amazon"]'::jsonb,
        57, 4668, 181, 23340, 15836,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int findMaxForm(String[] strs, int m, int n) { return 0; } }","javascript":"var findMaxForm = function(strs, m, n) {};","python":"class Solution:\n    def findMaxForm(self, strs: List[str], m: int, n: int) -> int:\n        pass","cpp":"class Solution { public: int findMaxForm(vector<string>& strs, int m, int n) { return 0; } };"}'::jsonb, 'findMaxForm', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Coin Change II', 'You are given an integer array of coins representing coins of different denominations and an integer amount representing a total amount of money. Return the number of combinations that make up that amount. If that amount of money cannot be made up by any combination of the coins, return 0. You may assume that you have an infinite number of each kind of coin. The answer is guaranteed to fit into a signed 32-bit integer.', 'MEDIUM', '["Array","Dynamic Programming"]'::jsonb, '["ByteDance"]'::jsonb,
        66, 2803, 528, 8409, 3047,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int change(int amount, int[] coins) { return 0; } }","javascript":"var change = function(amount, coins) {};","python":"class Solution:\n    def change(self, amount: int, coins: List[int]) -> int:\n        pass","cpp":"class Solution { public: int change(int amount, vector<int>& coins) { return 0; } };"}'::jsonb, 'change', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Unique Paths', 'There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time. Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.', 'MEDIUM', '["Math","Dynamic Programming","Combinatorics"]'::jsonb, '["Uber"]'::jsonb,
        67, 724, 36, 2896, 901,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int uniquePaths(int m, int n) { return 0; } }","javascript":"var uniquePaths = function(m, n) {};","python":"class Solution:\n    def uniquePaths(self, m: int, n: int) -> int:\n        pass","cpp":"class Solution { public: int uniquePaths(int m, int n) { return 0; } };"}'::jsonb, 'uniquePaths', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Fibonacci Number', 'The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is, F(0) = 0, F(1) = 1, F(n) = F(n - 1) + F(n - 2), for n > 1. Given n, calculate F(n).', 'EASY', '["Math","Dynamic Programming","Recursion","Memoization"]'::jsonb, '["Spotify","Stripe"]'::jsonb,
        71, 179, 25, 895, 612,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int fib(int n) { return 0; } }","javascript":"var fib = function(n) {};","python":"class Solution:\n    def fib(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int fib(int n) { return 0; } };"}'::jsonb, 'fib', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'N-th Tribonacci Number', 'The Tribonacci sequence Tn is defined as follows: T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0. Given n, return the value of Tn.', 'EASY', '["Math","Dynamic Programming","Memoization"]'::jsonb, '["Apple","Shopify","LinkedIn"]'::jsonb,
        31, 2656, 15, 15936, 8903,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int tribonacci(int n) { return 0; } }","javascript":"var tribonacci = function(n) {};","python":"class Solution:\n    def tribonacci(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int tribonacci(int n) { return 0; } };"}'::jsonb, 'tribonacci', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Pascals Triangle', 'Given an integer numRows, return the first numRows of Pascal''s triangle. In Pascal''s triangle, each number is the sum of the two numbers directly above it as shown:', 'EASY', '["Array","Dynamic Programming"]'::jsonb, '["Intel","Twitter","AMD","Walmart"]'::jsonb,
        40, 4809, 272, 19236, 10464,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<List<Integer>> generate(int numRows) { return new ArrayList<>(); } }","javascript":"var generate = function(numRows) {};","python":"class Solution:\n    def generate(self, numRows: int) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> generate(int numRows) { return {}; } };"}'::jsonb, 'generate', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Count Odd Numbers in an Interval Range', 'Given two non-negative integers low and high. Return the count of odd numbers between low and high (inclusive).', 'EASY', '["Math"]'::jsonb, '["Airbnb"]'::jsonb,
        34, 3523, 145, 21138, 12446,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int countOdds(int low, int high) { return 0; } }","javascript":"var countOdds = function(low, high) {};","python":"class Solution:\n    def countOdds(self, low: int, high: int) -> int:\n        pass","cpp":"class Solution { public: int countOdds(int low, int high) { return 0; } };"}'::jsonb, 'countOdds', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Average Salary Excluding the Minimum and Maximum Salary', 'You are given an array of unique integers salary where salary[i] is the salary of the ith employee. Return the average salary of employees excluding the minimum and maximum salary. Answers within 10^-5 of the actual answer will be accepted.', 'EASY', '["Array","Sorting"]'::jsonb, '["Airbnb","Spotify","Twitter","Oracle"]'::jsonb,
        52, 558, 28, 1674, 588,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public double average(int[] salary) { return 0.0; } }","javascript":"var average = function(salary) {};","python":"class Solution:\n    def average(self, salary: List[int]) -> float:\n        pass","cpp":"class Solution { public: double average(vector<int>& salary) { return 0.0; } };"}'::jsonb, 'average', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Largest Perimeter Triangle', 'Given an integer array nums, return the largest perimeter of a triangle with a non-zero area, formed from three of these lengths. If it is impossible to form any triangle of a non-zero area, return 0.', 'EASY', '["Array","Math","Greedy","Sorting"]'::jsonb, '["Salesforce","Oracle","Intel","Morgan Stanley"]'::jsonb,
        13, 703, 33, 2109, 792,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int largestPerimeter(int[] nums) { return 0; } }","javascript":"var largestPerimeter = function(nums) {};","python":"class Solution:\n    def largestPerimeter(self, nums: List[int]) -> int:\n        pass","cpp":"class Solution { public: int largestPerimeter(vector<int>& nums) { return 0; } };"}'::jsonb, 'largestPerimeter', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Check if One String Swap Can Make Strings Equal', 'You are given two strings s1 and s2 of equal length. A string swap is an operation where you choose two indices in a string (not necessarily different) and swap the characters at these indices. Return true if it is possible to make both strings equal by performing at most one string swap on exactly one of the strings. Otherwise, return false.', 'EASY', '["Hash Table","String","Counting"]'::jsonb, '["AMD"]'::jsonb,
        81, 269, 10, 1345, 898,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean areAlmostEqual(String s1, String s2) { return false; } }","javascript":"var areAlmostEqual = function(s1, s2) {};","python":"class Solution:\n    def areAlmostEqual(self, s1: str, s2: str) -> bool:\n        pass","cpp":"class Solution { public: bool areAlmostEqual(string s1, string s2) { return false; } };"}'::jsonb, 'areAlmostEqual', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sign of the Product of an Array', 'There is a function signFunc(x) that returns: 1 if x is positive. -1 if x is negative. 0 if x is equal to 0. You are given an integer array nums. Let product be the product of all values in the array nums. Return signFunc(product).', 'EASY', '["Array","Math"]'::jsonb, '["Goldman Sachs","Amazon","Twitter"]'::jsonb,
        18, 4548, 393, 27288, 14666,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int arraySign(int[] nums) { return 0; } }","javascript":"var arraySign = function(nums) {};","python":"class Solution:\n    def arraySign(self, nums: List[int]) -> int:\n        pass","cpp":"class Solution { public: int arraySign(vector<int>& nums) { return 0; } };"}'::jsonb, 'arraySign', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Can Make Arithmetic Progression From Sequence', 'A sequence of numbers is called an arithmetic progression if the difference between any two consecutive elements is the same. Given an array of numbers arr, return true if the array can be rearranged to form an arithmetic progression. Otherwise, return false.', 'EASY', '["Array","Sorting"]'::jsonb, '["LinkedIn","Airbnb"]'::jsonb,
        63, 1999, 245, 9995, 4456,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public boolean canMakeArithmeticProgression(int[] arr) { return false; } }","javascript":"var canMakeArithmeticProgression = function(arr) {};","python":"class Solution:\n    def canMakeArithmeticProgression(self, arr: List[int]) -> bool:\n        pass","cpp":"class Solution { public: bool canMakeArithmeticProgression(vector<int>& arr) { return false; } };"}'::jsonb, 'canMakeArithmeticProgression', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Find the Difference', 'You are given two strings s and t. String t is generated by random shuffling string s and then add one more letter at a random position. Return the letter that was added to t.', 'EASY', '["Hash Table","String","Bit Manipulation","Sorting"]'::jsonb, '["JPMorgan","ByteDance"]'::jsonb,
        79, 3242, 615, 9726, 4131,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public char findTheDifference(String s, String t) { return '' ''; } }","javascript":"var findTheDifference = function(s, t) {};","python":"class Solution:\n    def findTheDifference(self, s: str, t: str) -> str:\n        pass","cpp":"class Solution { public: char findTheDifference(string s, string t) { return '' ''; } };"}'::jsonb, 'findTheDifference', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Reshape the Matrix', 'In MATLAB, there is a handy function called reshape which can reshape an m x n matrix into a new one with a different size r x c keeping its original data. You are given an m x n matrix mat and two integers r and c representing the number of rows and the number of columns of the wanted reshaped matrix. The reshaped matrix should be filled with all the elements of the original matrix in the same row-traversing order as they were. If the reshape operation with given parameters is possible and legal, output the new reshaped matrix; Otherwise, output the original matrix.', 'EASY', '["Array","Matrix","Simulation"]'::jsonb, '["IBM","Uber","Stripe","Salesforce"]'::jsonb,
        99, 3950, 201, 23700, 11787,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[][] matrixReshape(int[][] mat, int r, int c) { return new int[][]{}; } }","javascript":"var matrixReshape = function(mat, r, c) {};","python":"class Solution:\n    def matrixReshape(self, mat: List[List[int]], r: int, c: int) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> matrixReshape(vector<vector<int>>& mat, int r, int c) { return {}; } };"}'::jsonb, 'matrixReshape', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Convert Binary Number in a Linked List to Integer', 'Given head which is a reference node to a singly-linked list. The value of each node in the linked list is either 0 or 1. The linked list holds the binary representation of a number. Return the decimal value of the number in the linked list. The most significant bit is at the head of the linked list.', 'EASY', '["Linked List","Math"]'::jsonb, '["IBM","Spotify"]'::jsonb,
        64, 4349, 684, 8698, 3185,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int getDecimalValue(ListNode head) { return 0; } }","javascript":"var getDecimalValue = function(head) {};","python":"class Solution:\n    def getDecimalValue(self, head: ListNode) -> int:\n        pass","cpp":"class Solution { public: int getDecimalValue(ListNode* head) { return 0; } };"}'::jsonb, 'getDecimalValue', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Subtract the Product and Sum of Digits of an Integer', 'Given an integer number n, return the difference between the product of its digits and the sum of its digits.', 'EASY', '["Math"]'::jsonb, '["Target"]'::jsonb,
        1, 4230, 211, 16920, 11042,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int subtractProductAndSum(int n) { return 0; } }","javascript":"var subtractProductAndSum = function(n) {};","python":"class Solution:\n    def subtractProductAndSum(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int subtractProductAndSum(int n) { return 0; } };"}'::jsonb, 'subtractProductAndSum', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Richest Customer Wealth', 'You are given an m x n integer grid accounts where accounts[i][j] is the amount of money the i​​​​​​​​​​th​​​​ customer has in the j​​​​​​​​​​th​​​​ bank. Return the wealth that the richest customer has. A customer''s wealth is the amount of money they have in all their bank accounts. The richest customer is the customer that has the maximum wealth.', 'EASY', '["Array","Matrix"]'::jsonb, '["Bloomberg","Goldman Sachs"]'::jsonb,
        21, 1833, 237, 5499, 2396,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int maximumWealth(int[][] accounts) { return 0; } }","javascript":"var maximumWealth = function(accounts) {};","python":"class Solution:\n    def maximumWealth(self, accounts: List[List[int]]) -> int:\n        pass","cpp":"class Solution { public: int maximumWealth(vector<vector<int>>& accounts) { return 0; } };"}'::jsonb, 'maximumWealth', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Thinking About a Matrix', 'You are given an m x n integer matrix. Print the matrix in spiral order.', 'MEDIUM', '["Array","Matrix","Simulation"]'::jsonb, '["JPMorgan","IBM","Goldman Sachs"]'::jsonb,
        67, 2932, 159, 5864, 3709,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<Integer> spiralOrder(int[][] matrix) { return new ArrayList<>(); } }","javascript":"var spiralOrder = function(matrix) {};","python":"class Solution:\n    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:\n        pass","cpp":"class Solution { public: vector<int> spiralOrder(vector<vector<int>>& matrix) { return {}; } };"}'::jsonb, 'spiralOrder', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Decrypt String from Alphabet to Integer Mapping', 'You are given a string s formed by digits and ''#''. We want to map s to English lowercase characters as follows: Characters (''a'' to ''i'') are represented by (''1'' to ''9'') respectively. Characters (''j'' to ''z'') are represented by (''10#'' to ''26#'') respectively. Return the string formed after mapping. The test cases are generated so that a unique mapping will always exist.', 'EASY', '["String"]'::jsonb, '["Spotify","Facebook"]'::jsonb,
        46, 3576, 114, 17880, 11450,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String freqAlphabets(String s) { return \"\"; } }","javascript":"var freqAlphabets = function(s) {};","python":"class Solution:\n    def freqAlphabets(self, s: str) -> str:\n        pass","cpp":"class Solution { public: string freqAlphabets(string s) { return \"\"; } };"}'::jsonb, 'freqAlphabets', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'To Lower Case', 'Given a string s, return the string after replacing every uppercase letter with the same lowercase letter.', 'EASY', '["String"]'::jsonb, '["JPMorgan","Airbnb"]'::jsonb,
        5, 315, 15, 1260, 520,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public String toLowerCase(String s) { return \"\"; } }","javascript":"var toLowerCase = function(s) {};","python":"class Solution:\n    def toLowerCase(self, s: str) -> str:\n        pass","cpp":"class Solution { public: string toLowerCase(string s) { return \"\"; } };"}'::jsonb, 'toLowerCase', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Matrix Block Sum', 'Given a m x n matrix mat and an integer k, return a matrix answer where each answer[i][j] is the sum of all elements mat[r][c] for: i - k <= r <= i + k, j - k <= c <= j + k, and (r, c) is a valid position in the matrix.', 'MEDIUM', '["Array","Matrix","Prefix Sum"]'::jsonb, '["Uber","Apple","JPMorgan"]'::jsonb,
        88, 4624, 445, 9248, 4719,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int[][] matrixBlockSum(int[][] mat, int k) { return new int[][]{}; } }","javascript":"var matrixBlockSum = function(mat, k) {};","python":"class Solution:\n    def matrixBlockSum(self, mat: List[List[int]], k: int) -> List[List[int]]:\n        pass","cpp":"class Solution { public: vector<vector<int>> matrixBlockSum(vector<vector<int>>& mat, int k) { return {}; } };"}'::jsonb, 'matrixBlockSum', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sum of All Odd Length Subarrays', 'Given an array of positive integers arr, return the sum of all possible odd-length subarrays of arr. A subarray is a contiguous subsequence of the array.', 'EASY', '["Array","Math","Prefix Sum"]'::jsonb, '["Airbnb"]'::jsonb,
        78, 666, 109, 3996, 1613,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int sumOddLengthSubarrays(int[] arr) { return 0; } }","javascript":"var sumOddLengthSubarrays = function(arr) {};","python":"class Solution:\n    def sumOddLengthSubarrays(self, arr: List[int]) -> int:\n        pass","cpp":"class Solution { public: int sumOddLengthSubarrays(vector<int>& arr) { return 0; } };"}'::jsonb, 'sumOddLengthSubarrays', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Range Sum Query - Immutable', 'Given an integer array nums, handle multiple queries of the following type: Calculate the sum of the elements of nums between indices left and right inclusive where left <= right. Implement the NumArray class: NumArray(int[] nums) Initializes the object with the integer array nums. int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).', 'EASY', '["Array","Design","Prefix Sum"]'::jsonb, '["Salesforce","Airbnb"]'::jsonb,
        4, 2598, 442, 7794, 4723,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class NumArray { public NumArray(int[] nums) {} public int sumRange(int left, int right) { return 0; } }","javascript":"var NumArray = function(nums) {}; NumArray.prototype.sumRange = function(left, right) {};","python":"class NumArray:\n    def __init__(self, nums: List[int]):\n        pass\n    def sumRange(self, left: int, right: int) -> int:\n        pass","cpp":"class NumArray { public: NumArray(vector<int>& nums) {} int sumRange(int left, int right) { return 0; } };"}'::jsonb, 'sumRange', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Sum of Left Leaves', 'Given the root of a binary tree, return the sum of all left leaves. A leaf is a node with no children. A left leaf is a leaf that is the left child of another node.', 'EASY', '["Tree","DFS","BFS","Binary Tree"]'::jsonb, '["Netflix","Airbnb","Shopify"]'::jsonb,
        71, 3341, 220, 16705, 6727,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public int sumOfLeftLeaves(TreeNode root) { return 0; } }","javascript":"var sumOfLeftLeaves = function(root) {};","python":"class Solution:\n    def sumOfLeftLeaves(self, root: Optional[TreeNode]) -> int:\n        pass","cpp":"class Solution { public: int sumOfLeftLeaves(TreeNode* root) { return 0; } };"}'::jsonb, 'sumOfLeftLeaves', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Binary Tree Paths', 'Given the root of a binary tree, return all root-to-leaf paths in any order. A leaf is a node with no children.', 'EASY', '["String","Backtracking","Tree","DFS","Binary Tree"]'::jsonb, '["Shopify","Cisco","Netflix"]'::jsonb,
        21, 2782, 547, 11128, 6337,
        '[]'::jsonb, '[]'::jsonb, '{"java":"class Solution { public List<String> binaryTreePaths(TreeNode root) { return new ArrayList<>(); } }","javascript":"var binaryTreePaths = function(root) {};","python":"class Solution:\n    def binaryTreePaths(self, root: Optional[TreeNode]) -> List[str]:\n        pass","cpp":"class Solution { public: vector<string> binaryTreePaths(TreeNode* root) { return {}; } };"}'::jsonb, 'binaryTreePaths', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'First Bad Version', 'You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad. Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad. You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.', 'EASY', '["Binary Search","Interactive"]'::jsonb, '["Intel"]'::jsonb,
        48, 2188, 290, 13128, 4566,
        '[]'::jsonb, '[]'::jsonb, '{"java":"public class Solution extends VersionControl { public int firstBadVersion(int n) { return 0; } }","javascript":"var solution = function(isBadVersion) { return function(n) {}; };","python":"class Solution:\n    def firstBadVersion(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int firstBadVersion(int n) { return 0; } };"}'::jsonb, 'firstBadVersion', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;


DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (
        title, description, difficulty, topics, companies, 
        frequency, likes, dislikes, submissions, accepted,
        constraints, hints, boilerplate_code, function_name, examples, is_active
    ) VALUES (
        'Guess Number Higher or Lower', 'We are playing the Guess Game. The game is as follows: I pick a number from 1 to n. You have to guess which number I picked. Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess. You call a pre-defined API int guess(int num), which returns three possible results: -1: Your guess is higher than the number I picked (i.e. num > pick). 1: Your guess is lower than the number I picked (i.e. num < pick). 0: your guess is equal to the number I picked (i.e. num == pick). Return the number that I picked.', 'EASY', '["Binary Search","Interactive"]'::jsonb, '["SpaceX","LinkedIn","Intel","Airbnb"]'::jsonb,
        71, 2519, 291, 15114, 7136,
        '[]'::jsonb, '[]'::jsonb, '{"java":"public class Solution extends GuessGame { public int guessNumber(int n) { return 0; } }","javascript":"var guessNumber = function(n) {};","python":"class Solution:\n    def guessNumber(self, n: int) -> int:\n        pass","cpp":"class Solution { public: int guessNumber(int n) { return 0; } };"}'::jsonb, 'guessNumber', '[]'::jsonb, true
    ) RETURNING id INTO p_id;

END $$;

