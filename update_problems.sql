UPDATE problems SET 
                        examples = '[{"input":"s = [\"h\",\"e\",\"l\",\"l\",\"o\"]","output":"[\"o\",\"l\",\"l\",\"e\",\"h\"]"},{"input":"s = [\"H\",\"a\",\"n\",\"n\",\"a\",\"h\"]","output":"[\"h\",\"a\",\"n\",\"n\",\"a\",\"H\"]"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 10^5","s[i] is a printable ascii character"]'::jsonb, 
                        hints = '["Use two pointers, one at the beginning and one at the end of the string.","Swap the characters at the two pointers and move them towards the center."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reverse String';
UPDATE problems SET 
                        examples = '[{"input":"nums = [-4,-1,0,3,10]","output":"[0,1,9,16,100]"},{"input":"nums = [-7,-3,2,3,11]","output":"[4,9,9,49,121]"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^4","-10^4 <= nums[i] <= 10^4","nums is sorted in non-decreasing order"]'::jsonb, 
                        hints = '["The largest square will be either at the start or the end of the array.","Use two pointers to compare absolute values at both ends and fill the result array from the back."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Squares of a Sorted Array';
UPDATE problems SET 
                        examples = '[{"input":"nums = [-1,0,1,2,-1,-4]","output":"[[-1,-1,2],[-1,0,1]]"},{"input":"nums = [0,1,1]","output":"[]"}]'::jsonb, 
                        constraints = '["3 <= nums.length <= 3000","-10^5 <= nums[i] <= 10^5"]'::jsonb, 
                        hints = '["Sort the array first to handle duplicates and make the two-pointer approach easier.","Iterate through the array with one pointer, and for each element, use two pointers to find the other two numbers that sum to zero."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = '3Sum';
UPDATE problems SET 
                        examples = '[{"input":"nums = [0,1,0,3,12]","output":"[1,3,12,0,0]"},{"input":"nums = [0]","output":"[0]"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^4","-2^31 <= nums[i] <= 2^31 - 1"]'::jsonb, 
                        hints = '["Keep a pointer for the position of the next non-zero element.","Iterate through the array and swap non-zero elements to the position indicated by the pointer."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Move Zeroes';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,1,2]","output":"2, nums = [1,2,_]"},{"input":"nums = [0,0,1,1,1,2,2,3,3,4]","output":"5, nums = [0,1,2,3,4,_,_,_,_,_]"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 3 * 10^4","-100 <= nums[i] <= 100","nums is sorted in non-decreasing order"]'::jsonb, 
                        hints = '["Use a slow pointer to track the position of unique elements.","Use a fast pointer to iterate through the array considering each element."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Remove Duplicates from Sorted Array';
UPDATE problems SET 
                        examples = '[{"input":"height = [0,1,0,2,1,0,1,3,2,1,2,1]","output":"6"},{"input":"height = [4,2,0,3,2,5]","output":"9"}]'::jsonb, 
                        constraints = '["n == height.length","1 <= n <= 2 * 10^4","0 <= height[i] <= 10^5"]'::jsonb, 
                        hints = '["For each element, the water it can trap depends on the maximum height to its left and to its right.","Use two pointers starting from both ends to maintain the left max and right max."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Trapping Rain Water';
UPDATE problems SET 
                        examples = '[{"input":"nums = [2,0,2,1,1,0]","output":"[0,0,1,1,2,2]"},{"input":"nums = [2,0,1]","output":"[0,1,2]"}]'::jsonb, 
                        constraints = '["n == nums.length","1 <= n <= 300","nums[i] is either 0, 1, or 2"]'::jsonb, 
                        hints = '["Use three pointers: low (for 0s), mid (for 1s), and high (for 2s).","Swap elements to move 0s to the beginning and 2s to the end, while iterating with mid."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sort Colors';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,0,-1,0,-2,2], target = 0","output":"[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]"},{"input":"nums = [2,2,2,2,2], target = 8","output":"[[2,2,2,2]]"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 200","-10^9 <= nums[i] <= 10^9","-10^9 <= target <= 10^9"]'::jsonb, 
                        hints = '["Sort the array first.","Use nested loops for the first two numbers and then use the two-pointer approach for the remaining two numbers."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = '4Sum';
UPDATE problems SET 
                        examples = '[{"input":"nums1 = [1,2,2,1], nums2 = [2,2]","output":"[2]"},{"input":"nums1 = [4,9,5], nums2 = [9,4,9,8,4]","output":"[9,4]"}]'::jsonb, 
                        constraints = '["1 <= nums1.length, nums2.length <= 1000","0 <= nums1[i], nums2[i] <= 1000"]'::jsonb, 
                        hints = '["Sort both arrays.","Use two pointers to iterate through both arrays and find common elements."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Intersection of Two Arrays';
UPDATE problems SET 
                        examples = '[{"input":"nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3","output":"[1,2,2,3,5,6]"},{"input":"nums1 = [1], m = 1, nums2 = [], n = 0","output":"[1]"}]'::jsonb, 
                        constraints = '["nums1.length == m + n","nums2.length == n","0 <= m, n <= 200"]'::jsonb, 
                        hints = '["Fill nums1 from the back.","Compare elements from the end of valid parts of nums1 and nums2 and place the larger one at the end of nums1."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Merge Sorted Array';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,2,3,4,5]","output":"[3,4,5]"},{"input":"head = [1,2,3,4,5,6]","output":"[4,5,6]"}]'::jsonb, 
                        constraints = '["The number of nodes in the list is in the range [1, 100].","1 <= Node.val <= 100"]'::jsonb, 
                        hints = '["Use two pointers: slow and fast.","Move slow one step and fast two steps.","When fast reaches the end, slow will be at the middle."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Middle of the Linked List';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,2,3,4,5], n = 2","output":"[1,2,3,5]"},{"input":"head = [1], n = 1","output":"[]"}]'::jsonb, 
                        constraints = '["The number of nodes in the list is sz.","1 <= sz <= 30","0 <= Node.val <= 100","1 <= n <= sz"]'::jsonb, 
                        hints = '["Maintain two pointers separated by n nodes.","Move both until the second pointer reaches the end."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Remove Nth Node From End of List';
UPDATE problems SET 
                        examples = '[{"input":"n = 19","output":"true"},{"input":"n = 2","output":"false"}]'::jsonb, 
                        constraints = '["1 <= n <= 2^31 - 1"]'::jsonb, 
                        hints = '["Use Fast & Slow pointers to detect a cycle in the sequence of sums.","If fast pointer reaches 1, it''s happy."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Happy Number';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,2,2,1]","output":"true"},{"input":"head = [1,2]","output":"false"}]'::jsonb, 
                        constraints = '["The number of nodes in the list is in the range [1, 10^5].","0 <= Node.val <= 9"]'::jsonb, 
                        hints = '["Use Fast & Slow pointers to find the middle.","Reverse the second half of the list.","Compare the first half with the reversed second half."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Palindrome Linked List';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,2,3,4]","output":"[1,4,2,3]"},{"input":"head = [1,2,3,4,5]","output":"[1,5,2,4,3]"}]'::jsonb, 
                        constraints = '["The number of nodes in the list is in the range [1, 5 * 10^4].","1 <= Node.val <= 1000"]'::jsonb, 
                        hints = '["Find the middle node.","Reverse the second part of the list.","Merge the two sorted lists."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reorder List';
UPDATE problems SET 
                        examples = '[{"input":"intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5]","output":"Intersected at ''8''"},{"input":"intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4]","output":"Intersected at ''2''"}]'::jsonb, 
                        constraints = '["The number of nodes of listA is in the m.","The number of nodes of listB is in the n.","1 <= m, n <= 3 * 10^4","1 <= Node.val <= 10^5"]'::jsonb, 
                        hints = '["Traverse both lists. When one reaches the end, redirect it to the head of the other list.","If they intersect, they will meet at the intersection point."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Intersection of Two Linked Lists';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,2,3,4,5]","output":"false"},{"input":"head = [1,2,3,4,1] (circular)","output":"true"}]'::jsonb, 
                        constraints = '["1 <= Number of nodes <= 100"]'::jsonb, 
                        hints = '["Use a temporary pointer to traverse the list.","If we reach NULL, valid. If we reach head again, it''s circular."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Check if Linked List is Circular';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,3,4,2,2]","output":"2"},{"input":"nums = [3,1,3,4,2]","output":"3"}]'::jsonb, 
                        constraints = '["1 <= n <= 10^5","nums.length == n + 1","1 <= nums[i] <= n"]'::jsonb, 
                        hints = '["Treat the array as a linked list: index i -> nums[i].","Use Floyd''s Cycle Detection algorithm (Tortoise and Hare)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find the Duplicate Number';
UPDATE problems SET 
                        examples = '[{"input":"nums = [2,-1,1,2,2]","output":"true"},{"input":"nums = [-1,2]","output":"false"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 5000","-1000 <= nums[i] <= 1000","nums[i] != 0"]'::jsonb, 
                        hints = '["Use Fast & Slow pointers for each index.","Handle directions carefully (should be single direction)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Circular Array Loop';
UPDATE problems SET 
                        examples = '[{"input":"head = [3,2,0,-4], pos = 1","output":"tail connects to node index 1"},{"input":"head = [1,2], pos = 0","output":"tail connects to node index 0"}]'::jsonb, 
                        constraints = '["number of nodes is in range [0, 10^4]","-10^5 <= Node.val <= 10^5"]'::jsonb, 
                        hints = '["Use Floyd''s Cycle Detection.","Once slow matches fast, move slow to head. Move both one step until they meet."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Linked List Cycle II';
UPDATE problems SET 
                        examples = '[{"input":"nums = [-1,0,3,5,9,12], target = 9","output":"4"},{"input":"nums = [-1,0,3,5,9,12], target = 2","output":"-1"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^4","-10^4 < nums[i], target < 10^4","All the integers in nums are unique.","nums is sorted in ascending order."]'::jsonb, 
                        hints = '["Check the middle element.","If target > mid, search right. If target < mid, search left.","Loop while left <= right."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Search';
UPDATE problems SET 
                        examples = '[{"input":"nums = [4,5,6,7,0,1,2], target = 0","output":"4"},{"input":"nums = [4,5,6,7,0,1,2], target = 3","output":"-1"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 5000","-10^4 <= nums[i] <= 10^4","All values of nums are unique.","nums is an ascending array that is possibly rotated.","-10^4 <= target <= 10^4"]'::jsonb, 
                        hints = '["One half of the array (left or right) will always be sorted.","Check which half is sorted, then check if target lies in that range."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Search in Rotated Sorted Array';
UPDATE problems SET 
                        examples = '[{"input":"nums = [5,7,7,8,8,10], target = 8","output":"[3,4]"},{"input":"nums = [5,7,7,8,8,10], target = 6","output":"[-1,-1]"}]'::jsonb, 
                        constraints = '["0 <= nums.length <= 10^5","-10^9 <= nums[i] <= 10^9","nums is a non-decreasing array.","-10^9 <= target <= 10^9"]'::jsonb, 
                        hints = '["Run binary search twice.","First to find the leftmost index, second to find the rightmost index."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'First and Last Position of Element in Sorted Array';
UPDATE problems SET 
                        examples = '[{"input":"nums = [3,4,5,1,2]","output":"1"},{"input":"nums = [4,5,6,7,0,1,2]","output":"0"}]'::jsonb, 
                        constraints = '["n == nums.length","1 <= n <= 5000","-5000 <= nums[i] <= 5000","All the integers of nums are unique.","nums is sorted and rotated."]'::jsonb, 
                        hints = '["If mid element > right element, minimum is in the right half.","Otherwise, minimum is in the left half (including mid)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find Minimum in Rotated Sorted Array';
UPDATE problems SET 
                        examples = '[{"input":"matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3","output":"true"},{"input":"matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13","output":"false"}]'::jsonb, 
                        constraints = '["m == matrix.length","n == matrix[i].length","1 <= m, n <= 100","-10^4 <= matrix[i][j], target <= 10^4"]'::jsonb, 
                        hints = '["Treat the 2D matrix as a flattened 1D sorted array of size m * n.","Index mapping: row = index / n, col = index % n."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Search a 2D Matrix';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,2,3,1]","output":"2"},{"input":"nums = [1,2,1,3,5,6,4]","output":"5"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 1000","-2^31 <= nums[i] <= 2^31 - 1","nums[i] != nums[i + 1] for all valid i."]'::jsonb, 
                        hints = '["Binary search. If mid < mid+1, peak is to the right.","Else peak is to the left (or mid itself)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Peak Element';
UPDATE problems SET 
                        examples = '[{"input":"piles = [3,6,7,11], h = 8","output":"4"},{"input":"piles = [30,11,23,4,20], h = 5","output":"30"}]'::jsonb, 
                        constraints = '["1 <= piles.length <= 10^4","piles.length <= h <= 10^9","1 <= piles[i] <= 10^9"]'::jsonb, 
                        hints = '["Binary search on the speed k (from 1 to max(piles)).","Check if a speed is feasible by simulating the eating process."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Koko Eating Bananas';
UPDATE problems SET 
                        examples = '[{"input":"weights = [1,2,3,4,5,6,7,8,9,10], days = 5","output":"15"},{"input":"weights = [3,2,2,4,1,4], days = 3","output":"6"}]'::jsonb, 
                        constraints = '["1 <= days <= weights.length <= 5 * 10^4","1 <= weights[i] <= 500"]'::jsonb, 
                        hints = '["Binary search on capacity. Range [max(weights), sum(weights)].","Check feasibility for a given capacity."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Capacity To Ship Packages Within D Days';
UPDATE problems SET 
                        examples = '[{"input":"nums = [7,2,5,10,8], k = 2","output":"18"},{"input":"nums = [1,2,3,4,5], k = 2","output":"9"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 1000","1 <= k <= min(50, nums.length)","0 <= nums[i] <= 10^6"]'::jsonb, 
                        hints = '["Binary search on the answer (max sum of a subarray).","Determine if a max sum is possible with <= k subarrays."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Split Array Largest Sum';
UPDATE problems SET 
                        examples = '[{"input":"nums1 = [1,3], nums2 = [2]","output":"2.00000"},{"input":"nums1 = [1,2], nums2 = [3,4]","output":"2.50000"}]'::jsonb, 
                        constraints = '["nums1.length == m","nums2.length == n","0 <= m <= 1000","0 <= n <= 1000","1 <= m + n <= 2000"]'::jsonb, 
                        hints = '["Binary Search on the smaller array to partition both arrays such that elements on left <= elements on right.","Handle edge cases (empty arrays)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Median of Two Sorted Arrays';
UPDATE problems SET 
                        examples = '[{"input":"x = 4","output":"2"},{"input":"x = 8","output":"2"}]'::jsonb, 
                        constraints = '["0 <= x <= 2^31 - 1"]'::jsonb, 
                        hints = '["Binary search between 0 and x.","Find k such that k*k <= x."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Square Root';
UPDATE problems SET 
                        examples = '[{"input":"letters = [\"c\",\"f\",\"j\"], target = \"a\"","output":"\"c\""},{"input":"letters = [\"c\",\"f\",\"j\"], target = \"c\"","output":"\"f\""}]'::jsonb, 
                        constraints = '["2 <= letters.length <= 10^4","letters[i] is a lowercase English letter.","letters is sorted in non-decreasing order.","target is a lowercase English letter."]'::jsonb, 
                        hints = '["Standard binary search to find upper bound.","Wrap around if index equals length."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find Smallest Letter Greater Than Target';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,1,2,3,3,4,4,8,8]","output":"2"},{"input":"nums = [3,3,7,7,10,11,11]","output":"10"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^5","0 <= nums[i] <= 10^5"]'::jsonb, 
                        hints = '["Binary search. Pairs start at even indices.","If nums[mid] == nums[mid^1], pattern holds, move right."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Single Element in a Sorted Array';
UPDATE problems SET 
                        examples = '[{"input":"nums1 = [1,3], nums2 = [2]","output":"2.00000"},{"input":"nums1 = [1,2], nums2 = [3,4]","output":"2.50000"}]'::jsonb, 
                        constraints = '["nums1.length == m","nums2.length == n","0 <= m <= 1000","0 <= n <= 1000","1 <= m + n <= 2000","-10^6 <= nums1[i], nums2[i] <= 10^6"]'::jsonb, 
                        hints = '["Use binary search to partition the smaller array.","Ensure max(left) <= min(right)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Median of Two Sorted Arrays';
UPDATE problems SET 
                        examples = '[{"input":"position = [1,2,3,4,7], m = 3","output":"3"},{"input":"position = [5,4,3,2,1,1000000000], m = 2","output":"999999999"}]'::jsonb, 
                        constraints = '["2 <= stalls.length <= 10^5","0 <= stalls[i] <= 10^9","2 <= k <= stalls.length"]'::jsonb, 
                        hints = '["Binary search on the answer (distance). Range [1, max(stalls) - min(stalls)].","Greedily place cows to check if distance ''d'' is possible."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Aggressive Cows';
UPDATE problems SET 
                        examples = '[{"input":"A = [12,34,67,90], M = 2","output":"113"}]'::jsonb, 
                        constraints = '["1 <= pages.length <= 10^5","1 <= m <= 10^5"]'::jsonb, 
                        hints = '["Binary search on the answer (max pages).","Range [max(pages), sum(pages)]."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Allocate Minimum Pages / Book Allocation';
UPDATE problems SET 
                        examples = '[{"input":"arr = [5,10,30,20,15], k = 3","output":"35"}]'::jsonb, 
                        constraints = '["1 <= n <= 10^5","1 <= k <= 10^5"]'::jsonb, 
                        hints = '["Binary search on time.","Similar to Book Allocation."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Painter''s Partition Problem';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,2,3...], target = 5","output":"4"}]'::jsonb, 
                        constraints = '["Array is sorted."]'::jsonb, 
                        hints = '["Find the range [start, end] where target might lie by exponentially increasing the range size.","Binary search within that range."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Search in Infinite Array';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1, 2, 8, 10, 10, 12, 19], x = 5","output":"[2, 8]"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^4"]'::jsonb, 
                        hints = '["Standard binary search can find the position.","Return elements at appropriate indices."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find Floor and Ceiling';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,1,1,1,0,0,0]","output":"4"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^5"]'::jsonb, 
                        hints = '["Find the last occurrence of 1 using binary search.","Index + 1 is the count."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Count 1s in Binary Sorted Array';
UPDATE problems SET 
                        examples = '[{"input":"dist = [1,3,2], hour = 6","output":"1"},{"input":"dist = [1,3,2], hour = 2.7","output":"3"}]'::jsonb, 
                        constraints = '["n == dist.length","1 <= n <= 10^5","1 <= dist[i] <= 10^5","1 <= hour <= 10^9"]'::jsonb, 
                        hints = '["Binary search on speed.","Time calculation involves ceiling function for integers."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Speed to Arrive on Time';
UPDATE problems SET 
                        examples = '[{"input":"arr = [0,0,0,1,1]","output":"3"}]'::jsonb, 
                        constraints = '["1 <= N <= 10^5","0 <= arr[i] <= 1"]'::jsonb, 
                        hints = '["Binary search for the first occurrence of 1."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find Transition Point';
UPDATE problems SET 
                        examples = '[{"input":"matrix = [[10,20,30,40],[15,25,35,45],[27,29,37,48],[32,33,39,50]], target = 29","output":"true"}]'::jsonb, 
                        constraints = '["n x m matrix"]'::jsonb, 
                        hints = '["Start from top-right corner.","If current < target, move down. If current > target, move left."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Search in Row-Column Sorted Matrix';
UPDATE problems SET 
                        examples = '[{"input":"arr1 = [2, 3, 6, 7, 9], arr2 = [1, 4, 8, 10], k = 5","output":"6"}]'::jsonb, 
                        constraints = '["1 <= n, m <= 10^6","1 <= k <= n+m"]'::jsonb, 
                        hints = '["Similar logic to Median of Two Sorted Arrays.","Binary search on partitioning."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Kth Element of Two Sorted Arrays';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,null,2,3]","output":"[1,3,2]"},{"input":"root = []","output":"[]"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 100].","-100 <= Node.val <= 100"]'::jsonb, 
                        hints = '["Use recursion or a stack.","Left -> Root -> Right."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Tree Inorder Traversal';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,null,2,3]","output":"[1,2,3]"},{"input":"root = []","output":"[]"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 100].","-100 <= Node.val <= 100"]'::jsonb, 
                        hints = '["Root -> Left -> Right."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Tree Preorder Traversal';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,null,2,3]","output":"[3,2,1]"},{"input":"root = []","output":"[]"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 100].","-100 <= Node.val <= 100"]'::jsonb, 
                        hints = '["Left -> Right -> Root."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Tree Postorder Traversal';
UPDATE problems SET 
                        examples = '[{"input":"root = [3,9,20,null,null,15,7]","output":"[[3],[9,20],[15,7]]"},{"input":"root = [1]","output":"[[1]]"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 2000].","-1000 <= Node.val <= 1000"]'::jsonb, 
                        hints = '["Use a queue for BFS.","Process nodes level by level."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Tree Level Order Traversal';
UPDATE problems SET 
                        examples = '[{"input":"root = [3,9,20,null,null,15,7]","output":"3"},{"input":"root = [1,null,2]","output":"2"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 10^4].","-100 <= Node.val <= 100"]'::jsonb, 
                        hints = '["Recursively find depth of left and right subtrees.","Return 1 + max(left, right)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximum Depth of Binary Tree';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,2,3,4,5]","output":"3"},{"input":"root = [1,2]","output":"1"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [1, 10^4].","-100 <= Node.val <= 100"]'::jsonb, 
                        hints = '["For every node, length of longest path passing through it is L+R.","Update max diameter during traversal."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Diameter of Binary Tree';
UPDATE problems SET 
                        examples = '[{"input":"root = [3,9,20,null,null,15,7]","output":"true"},{"input":"root = [1,2,2,3,3,null,null,4,4]","output":"false"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 5000].","-10^4 <= Node.val <= 10^4"]'::jsonb, 
                        hints = '["Check height of left and right subtrees.","If |left - right| > 1, return false/error value."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Balanced Binary Tree';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,2,3]","output":"6"},{"input":"root = [-10,9,20,null,null,15,7]","output":"42"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [1, 3 * 10^4].","-1000 <= Node.val <= 1000"]'::jsonb, 
                        hints = '["For each node, calculate max gain from left and right subtrees.","Max path through node = node.val + max(leftGain, 0) + max(rightGain, 0)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Tree Maximum Path Sum';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,2,2,3,4,4,3]","output":"true"},{"input":"root = [1,2,2,null,3,null,3]","output":"false"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [1, 1000].","-100 <= Node.val <= 100"]'::jsonb, 
                        hints = '["Compare left subtree''s left child with right subtree''s right child.","Recursively check mirror property."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Symmetric Tree';
UPDATE problems SET 
                        examples = '[{"input":"root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1","output":"3"},{"input":"root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4","output":"5"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [2, 10^5].","-10^9 <= Node.val <= 10^9","All Node.val are unique.","p != q","p and q will exist in the tree."]'::jsonb, 
                        hints = '["If root matches p or q, return root.","Recursively search left and right. If both return non-null, root is LCA."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Lowest Common Ancestor of a Binary Tree';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,2,3,null,5,null,4]","output":"[1,3,4]"},{"input":"root = [1,null,3]","output":"[1,3]"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 100].","-100 <= Node.val <= 100"]'::jsonb, 
                        hints = '["Use BFS (Level Order). The last element of each level is visible."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Tree Right Side View';
UPDATE problems SET 
                        examples = '[{"input":"root = [3,9,20,null,null,15,7]","output":"[[9],[3,15],[20],[7]]"},{"input":"root = [1,2,3,4,5,6,7]","output":"[[4],[2],[1,5,6],[3],[7]]"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [1, 1000].","-1000 <= Node.val <= 1000"]'::jsonb, 
                        hints = '["Store nodes as (col, row, val). Sort by col, then row, then val."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Vertical Order Traversal of a Binary Tree';
UPDATE problems SET 
                        examples = '[{"input":"root = [3,9,20,null,null,15,7]","output":"[[3],[20,9],[15,7]]"},{"input":"root = [1]","output":"[[1]]"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 2000].","-100 <= Node.val <= 100"]'::jsonb, 
                        hints = '["Standard Level Order traversal using a deque/queue.","Reverse the order for alternating levels."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Tree Zigzag Level Order Traversal';
UPDATE problems SET 
                        examples = '[{"input":"root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22","output":"true"},{"input":"root = [1,2,3], targetSum = 5","output":"false"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 5000].","-1000 <= Node.val <= 1000","-1000 <= targetSum <= 1000"]'::jsonb, 
                        hints = '["Recursively check if (targetSum - root.val) can be found in left or right subtree.","Base case: leaf node check."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Path Sum';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,2,3,4,5,6]","output":"6"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 5 * 10^4].","0 <= Node.val <= 5 * 10^4","The tree is guaranteed to be complete."]'::jsonb, 
                        hints = '["Compare depth of left and right subtrees.","If equal, left is full; recurse on right. Else recurse on left."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Count Complete Tree Nodes';
UPDATE problems SET 
                        examples = '[{"input":"grid = [[\"1\",\"1\",\"1\",\"1\",\"0\"],[\"1\",\"1\",\"0\",\"1\",\"0\"],[\"1\",\"1\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]","output":"1"},{"input":"grid = [[\"1\",\"1\",\"0\",\"0\",\"0\"],[\"1\",\"1\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"1\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"1\",\"1\"]]","output":"3"}]'::jsonb, 
                        constraints = '["m == grid.length","n == grid[i].length","1 <= m, n <= 300","grid[i][j] is ''0'' or ''1''."]'::jsonb, 
                        hints = '["Iterate through the grid. When a ''1'' is found, increment count and DFS/BFS to mark all connected ''1''s as visited."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Number of Islands';
UPDATE problems SET 
                        examples = '[{"input":"isConnected = [[1,1,0],[1,1,0],[0,0,1]]","output":"2"},{"input":"isConnected = [[1,0,0],[0,1,0],[0,0,1]]","output":"3"}]'::jsonb, 
                        constraints = '["1 <= n <= 200","n == isConnected.length","n == isConnected[i].length","isConnected[i][j] is 0 or 1.","isConnected[i][i] == 1","isConnected[i][j] == isConnected[j][i]"]'::jsonb, 
                        hints = '["This is finding the number of connected components in a graph.","Use DFS, BFS, or Union-Find."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Number of Provinces';
UPDATE problems SET 
                        examples = '[{"input":"grid = [[2,1,1],[1,1,0],[0,1,1]]","output":"4"},{"input":"grid = [[2,1,1],[0,1,1],[1,0,1]]","output":"-1"}]'::jsonb, 
                        constraints = '["m == grid.length","n == grid[i].length","1 <= m, n <= 10"]'::jsonb, 
                        hints = '["Multi-source BFS. Start BFS from all rotten oranges simultaneously.","Track level (minutes) and count fresh oranges."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Rotting Oranges';
UPDATE problems SET 
                        examples = '[{"input":"mat = [[0,0,0],[0,1,0],[0,0,0]]","output":"[[0,0,0],[0,1,0],[0,0,0]]"},{"input":"mat = [[0,0,0],[0,1,0],[1,1,1]]","output":"[[0,0,0],[0,1,0],[1,2,1]]"}]'::jsonb, 
                        constraints = '["m == mat.length","n == mat[i].length","1 <= m, n <= 10^4","mat[i][j] is either 0 or 1.","There is at least one 0 in mat."]'::jsonb, 
                        hints = '["Multi-source BFS starting from all 0s.","Initialize non-0 cells with infinity (or -1)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = '01 Matrix / Distance of Nearest Cell Having 0';
UPDATE problems SET 
                        examples = '[{"input":"adjList = [[2,4],[1,3],[2,4],[1,3]]","output":"[[2,4],[1,3],[2,4],[1,3]]"}]'::jsonb, 
                        constraints = '["The number of nodes in the graph is in the range [0, 100].","1 <= Node.val <= 100","Node.val is unique for each node."]'::jsonb, 
                        hints = '["Use a HashMap to map original nodes to their clones.","DFS or BFS to traverse and clone."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Clone Graph';
UPDATE problems SET 
                        examples = '[{"input":"graph = [[1,2,3],[0,2],[0,1,3],[0,2]]","output":"false"},{"input":"graph = [[1,3],[0,2],[1,3],[0,2]]","output":"true"}]'::jsonb, 
                        constraints = '["graph.length == n","1 <= n <= 100","0 <= graph[u].length < n","graph[u] does not contain u."]'::jsonb, 
                        hints = '["Try to color the graph with 2 colors using BFS or DFS.","If you meet a node that is already colored with the same color as current, traverse fails."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Is Graph Bipartite?';
UPDATE problems SET 
                        examples = '[{"input":"nums = [-1,2,1,-4], target = 1","output":"2"},{"input":"nums = [0,0,0], target = 1","output":"0"}]'::jsonb, 
                        constraints = '["3 <= nums.length <= 500","-1000 <= nums[i] <= 1000","-10^4 <= target <= 10^4"]'::jsonb, 
                        hints = '["Similar to 3Sum, sort the array first.","Iterate and use two pointers to find the pair that minimizes the difference with the target."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = '3Sum Closest';
UPDATE problems SET 
                        examples = '[{"input":"nums = [3,2,2,3], val = 3","output":"2, nums = [2,2,_,_]"},{"input":"nums = [0,1,2,2,3,0,4,2], val = 2","output":"5, nums = [0,1,3,0,4,_,_,_]"}]'::jsonb, 
                        constraints = '["0 <= nums.length <= 100","0 <= nums[i] <= 50","0 <= val <= 100"]'::jsonb, 
                        hints = '["Use one pointer to iterate and another to mark the position for valid elements.","Overwrite elements equal to val with valid elements."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Remove Element';
UPDATE problems SET 
                        examples = '[{"input":"s = \"the sky is blue\"","output":"\"blue is sky the\""},{"input":"s = \"  hello world  \"","output":"\"world hello\""}]'::jsonb, 
                        constraints = '["1 <= s.length <= 10^4","s contains English letters (upper-case and lower-case), digits, and spaces '' ''.","There is at least one word in s."]'::jsonb, 
                        hints = '["First, trim leading/trailing spaces and reduce multiple spaces to one.","Reverse the entire string, then reverse each individual word."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reverse Words in a String';
UPDATE problems SET 
                        examples = '[{"input":"nums = [2,2,3,4]","output":"3"},{"input":"nums = [4,2,3,4]","output":"4"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 1000","0 <= nums[i] <= 1000"]'::jsonb, 
                        hints = '["Sort the array.","Fix the largest side (c) and use two pointers to find pairs (a, b) such that a + b > c."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Valid Triangle Number';
UPDATE problems SET 
                        examples = '[{"input":"people = [1,2], limit = 3","output":"1"},{"input":"people = [3,2,2,1], limit = 3","output":"3"}]'::jsonb, 
                        constraints = '["1 <= people.length <= 5 * 10^4","1 <= people[i] <= limit <= 3 * 10^4"]'::jsonb, 
                        hints = '["Sort the people by weight.","Try to pair the heaviest person with the lightest person. If they fit, put them in a boat. otherwise, the heaviest person goes alone."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Boats to Save People';
UPDATE problems SET 
                        examples = '[{"input":"tokens = [100], power = 50","output":"0"},{"input":"tokens = [100,200], power = 150","output":"1"}]'::jsonb, 
                        constraints = '["0 <= tokens.length <= 1000","0 <= tokens[i], power <= 10^4"]'::jsonb, 
                        hints = '["Sort the tokens.","Buy tokens (Face-up) with the smallest value to save power, and sell tokens (Face-down) with the largest value to gain power."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Bag of Tokens';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,2,3,4,5,6,7], k = 3","output":"[5,6,7,1,2,3,4]"},{"input":"nums = [-1,-100,3,99], k = 2","output":"[3,99,-1,-100]"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^5","-2^31 <= nums[i] <= 2^31 - 1","0 <= k <= 10^5"]'::jsonb, 
                        hints = '["Reverse the entire array.","Reverse the first k elements and then reverse the rest."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Rotate Array';
UPDATE problems SET 
                        examples = '[{"input":"s = \"abc\"","output":"3"},{"input":"s = \"aaa\"","output":"6"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 1000","s consists of lowercase English letters."]'::jsonb, 
                        hints = '["Expand around the center for each character (and between characters) to find palindromes.","Count the valid palindromes found during expansion."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Palindromic Substrings';
UPDATE problems SET 
                        examples = '[{"input":"nums1 = [1,3], nums2 = [2]","output":"2.0"},{"input":"nums1 = [1,2], nums2 = [3,4]","output":"2.5"}]'::jsonb, 
                        constraints = '["nums1.length == m","nums2.length == n","0 <= m, n <= 1000","1 <= m + n <= 2000"]'::jsonb, 
                        hints = '["Try to partition both arrays such that elements on the left are smaller than elements on the right.","Use binary search on the smaller array to find the correct partition."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Median of Two Sorted Arrays';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,1,2]","output":"[1,2]"},{"input":"head = [1,1,2,3,3]","output":"[1,2,3]"}]'::jsonb, 
                        constraints = '["The number of nodes in the list is in the range [0, 300].","-100 <= Node.val <= 100","The list is guaranteed to be sorted in ascending order."]'::jsonb, 
                        hints = '["Use a pointer to traverse carefully.","If current node''s value is same as next node''s value, skip the next node."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Remove Duplicates from Sorted List';
UPDATE problems SET 
                        examples = '[{"input":"beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\"]","output":"5"},{"input":"beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\"]","output":"0"}]'::jsonb, 
                        constraints = '["1 <= beginWord.length <= 10","endWord.length == beginWord.length","1 <= wordList.length <= 5000"]'::jsonb, 
                        hints = '["Standard BFS for shortest path in an unweighted graph.","Preprocess wordList to efficiently find neighbors."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Word Ladder';
UPDATE problems SET 
                        examples = '[{"input":"board = [[1,2,3],[4,0,5]]","output":"1"},{"input":"board = [[1,2,3],[5,4,0]]","output":"-1"}]'::jsonb, 
                        constraints = '["board.length == 2","board[i].length == 3","0 <= board[i][j] <= 5"]'::jsonb, 
                        hints = '["BFS to find the shortest path to target state [[1,2,3],[4,5,0]].","Convert 2D board to string for state tracking."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sliding Puzzle';
UPDATE problems SET 
                        examples = '[{"input":"board = [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]","output":"4"}]'::jsonb, 
                        constraints = '["n == board.length == board[i].length","2 <= n <= 20","board[i][j] is either -1 or an integer in the range [1, n^2]."]'::jsonb, 
                        hints = '["BFS for shortest path from 1 to n^2.","Map 1D coordinate to 2D grid coordinates."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Snakes and Ladders';
UPDATE problems SET 
                        examples = '[{"input":"equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"c\"],[\"b\",\"a\"],[\"a\",\"e\"],[\"a\",\"a\"],[\"x\",\"x\"]]","output":"[6.00000,0.50000,-1.00000,1.00000,-1.00000]"}]'::jsonb, 
                        constraints = '["1 <= equations.length <= 20","equations[i].length == 2","1 <= values.length <= 20"]'::jsonb, 
                        hints = '["Model variables as nodes and equations as weighted edges.","For query (a, b), find path product from a to b."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Evaluate Division';
UPDATE problems SET 
                        examples = '[{"input":"n = 2","output":"2"},{"input":"n = 3","output":"3"}]'::jsonb, 
                        constraints = '["1 <= n <= 45"]'::jsonb, 
                        hints = '["This is a classic Fibonacci sequence problem.","dp[i] = dp[i-1] + dp[i-2]"]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Climbing Stairs';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,2,3,1]","output":"4"},{"input":"nums = [2,7,9,3,1]","output":"12"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 100","0 <= nums[i] <= 400"]'::jsonb, 
                        hints = '["dp[i] = max(dp[i-1], dp[i-2] + nums[i])"]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'House Robber';
UPDATE problems SET 
                        examples = '[{"input":"nums = [10,9,2,5,3,7,101,18]","output":"4"},{"input":"nums = [0,1,0,3,2,3]","output":"4"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 2500","-10^4 <= nums[i] <= 10^4"]'::jsonb, 
                        hints = '["O(n^2) DP: dp[i] = max(dp[j]) + 1 for j < i and nums[j] < nums[i].","O(n log n) using patience sorting/binary search."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Increasing Subsequence';
UPDATE problems SET 
                        examples = '[{"input":"text1 = \"abcde\", text2 = \"ace\"","output":"3"},{"input":"text1 = \"abc\", text2 = \"abc\"","output":"3"}]'::jsonb, 
                        constraints = '["1 <= text1.length, text2.length <= 1000","text1 and text2 consist of only lowercase English characters."]'::jsonb, 
                        hints = '["2D DP array where dp[i][j] is LCS of text1[0..i] and text2[0..j].","If chars match, 1 + dp[i-1][j-1]. Else max(dp[i-1][j], dp[i][j-1])."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Common Subsequence';
UPDATE problems SET 
                        examples = '[{"input":"coins = [1,2,5], amount = 11","output":"3"},{"input":"coins = [2], amount = 3","output":"-1"}]'::jsonb, 
                        constraints = '["1 <= coins.length <= 12","1 <= coins[i] <= 2^31 - 1","0 <= amount <= 10^4"]'::jsonb, 
                        hints = '["dp[i] = min(dp[i], dp[i - coin] + 1) for each coin."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Coin Change';
UPDATE problems SET 
                        examples = '[{"input":"word1 = \"horse\", word2 = \"ros\"","output":"3"},{"input":"word1 = \"intention\", word2 = \"execution\"","output":"5"}]'::jsonb, 
                        constraints = '["0 <= word1.length, word2.length <= 500"]'::jsonb, 
                        hints = '["2D DP. dp[i][j] is min operations for word1[0..i] to word2[0..j].","If chars are same, dp[i-1][j-1]. Else 1 + min(insert, delete, replace)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Edit Distance';
UPDATE problems SET 
                        examples = '[{"input":"obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]","output":"2"},{"input":"obstacleGrid = [[0,1],[0,0]]","output":"1"}]'::jsonb, 
                        constraints = '["m == obstacleGrid.length","n == obstacleGrid[i].length","1 <= m, n <= 100"]'::jsonb, 
                        hints = '["If cell has obstacle, dp[i][j] = 0.","Else dp[i][j] = dp[i-1][j] + dp[i][j-1]."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Unique Paths II';
UPDATE problems SET 
                        examples = '[{"input":"grid = [[1,3,1],[1,5,1],[4,2,1]]","output":"7"},{"input":"grid = [[1,2,3],[4,5,6]]","output":"12"}]'::jsonb, 
                        constraints = '["m == grid.length","n == grid[i].length","1 <= m, n <= 200"]'::jsonb, 
                        hints = '["dp[i][j] = grid[i][j] + min(dp[i-1][j], dp[i][j-1])"]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Path Sum';
UPDATE problems SET 
                        examples = '[{"input":"nums = [2,3,-2,4]","output":"6"},{"input":"nums = [-2,0,-1]","output":"0"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 2 * 10^4","-10 <= nums[i] <= 10"]'::jsonb, 
                        hints = '["Keep track of both max product and min product (because of negative numbers).","Swap max and min if number is negative."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximum Product Subarray';
UPDATE problems SET 
                        examples = '[{"input":"s = \"babad\"","output":"\"bab\""},{"input":"s = \"cbbd\"","output":"\"bb\""}]'::jsonb, 
                        constraints = '["1 <= s.length <= 1000","s consist of only digits and English letters."]'::jsonb, 
                        hints = '["Expand around center strategy is O(n^2).","DP approach: dp[i][j] is true if s[i..j] is palindrome."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Palindromic Substring';
UPDATE problems SET 
                        examples = '[{"input":"nums = [3,1,5,8]","output":"167"}]'::jsonb, 
                        constraints = '["n == nums.length","1 <= n <= 300","0 <= nums[i] <= 100"]'::jsonb, 
                        hints = '["Work backwards: think about which balloon is burst LAST.","dp[i][j] is max coins for range i to j."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Burst Balloons';
UPDATE problems SET 
                        examples = '[{"input":"n = 4","output":"[[\".Q..\",\"...Q\",\"Q...\",\"..Q.\"],[\"..Q.\",\"Q...\",\"...Q\",\".Q..\"]]"},{"input":"n = 1","output":"[[\"Q\"]]"}]'::jsonb, 
                        constraints = '["1 <= n <= 9"]'::jsonb, 
                        hints = '["Place queens row by row.","Use arrays/sets to keep track of occupied columns and diagonals."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'N-Queens';
UPDATE problems SET 
                        examples = '[{"input":"board = [[\"5\",\"3\",\".\",\".\",\"7\",\".\",\".\",\".\",\".\"],...]","output":"[[\"5\",\"3\",\"4\",\"6\",\"7\",\"8\",\"9\",\"1\",\"2\"],...]"}]'::jsonb, 
                        constraints = '["board.length == 9","board[i].length == 9","board[i][j] is a digit or ''.''."]'::jsonb, 
                        hints = '["Try filling a cell with 1-9 and recursively check if it leads to a solution.","Backtrack if valid number is not found."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sudoku Solver';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,2,3]","output":"[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]"},{"input":"nums = [0,1]","output":"[[0,1],[1,0]]"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 6","-10 <= nums[i] <= 10","All the integers of nums are unique."]'::jsonb, 
                        hints = '["Use backtracking to swap elements.","Or build permutations by adding one element at a time."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Permutations';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,2,3]","output":"[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]"},{"input":"nums = [0]","output":"[[],[0]]"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10","-10 <= nums[i] <= 10","All the numbers of nums are unique."]'::jsonb, 
                        hints = '["For each element, there are 2 choices: include or exclude.","Backtracking or Bitmasking (0 to 2^n - 1)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Subsets';
UPDATE problems SET 
                        examples = '[{"input":"board = [[\"A\",\"B\",\"C\",\"E\"],[\"S\",\"F\",\"C\",\"S\"],[\"A\",\"D\",\"E\",\"E\"]], word = \"ABCCED\"","output":"true"},{"input":"board = [[\"A\",\"B\",\"C\",\"E\"],[\"S\",\"F\",\"C\",\"S\"],[\"A\",\"D\",\"E\",\"E\"]], word = \"SEE\"","output":"true"}]'::jsonb, 
                        constraints = '["m == board.length","n = board[i].length","1 <= m, n <= 6","1 <= word.length <= 15"]'::jsonb, 
                        hints = '["Start DFS from every cell ensuring it matches the first char of word.","Mark visited cells to avoid cycles."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Word Search';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,5,11,5]","output":"true"},{"input":"nums = [1,2,3,5]","output":"false"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 200","1 <= nums[i] <= 100"]'::jsonb, 
                        hints = '["This is a 0/1 Knapsack problem variant.","Target sum is sum(nums) / 2."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Partition Equal Subset Sum';
UPDATE problems SET 
                        examples = '[{"input":"n = 3","output":"[\"((()))\",\"(()())\",\"(())()\",\"()(())\",\"()()()\"]"},{"input":"n = 1","output":"[\"()\"]"}]'::jsonb, 
                        constraints = '["1 <= n <= 8"]'::jsonb, 
                        hints = '["Backtracking: keep count of open and close brackets.","Add '')'' only if close < open."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Generate Parentheses';
UPDATE problems SET 
                        examples = '[{"input":"s = \"aa\", p = \"a\"","output":"false"},{"input":"s = \"aa\", p = \"*\"","output":"true"},{"input":"s = \"cb\", p = \"?a\"","output":"false"}]'::jsonb, 
                        constraints = '["0 <= s.length, p.length <= 2000","s contains only lowercase English letters.","p contains only lowercase English letters, ''?'' or ''*''."]'::jsonb, 
                        hints = '["DP: dp[i][j] is true if s[0..i] matches p[0..j].","If p[j] == ''*'', it matches empty sequence or any sequence."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Wildcard Matching';
UPDATE problems SET 
                        examples = '[{"input":"prices = [3,3,5,0,0,3,1,4]","output":"6"},{"input":"prices = [1,2,3,4,5]","output":"4"}]'::jsonb, 
                        constraints = '["1 <= prices.length <= 10^5","0 <= prices[i] <= 10^5"]'::jsonb, 
                        hints = '["Use 4 variables: buy1, sell1, buy2, sell2.","Or DP state: dp[k][i] max profit with k transactions up to day i."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Best Time to Buy and Sell Stock III';
UPDATE problems SET 
                        examples = '[{"input":"candidates = [2,3,6,7], target = 7","output":"[[2,2,3],[7]]"},{"input":"candidates = [2,3,5], target = 8","output":"[[2,2,2,2],[2,3,3],[3,5]]"}]'::jsonb, 
                        constraints = '["1 <= candidates.length <= 30","2 <= candidates[i] <= 40","All elements of candidates are distinct.","1 <= target <= 40"]'::jsonb, 
                        hints = '["Backtracking: At each step, choose a candidate.","Allow reusing the same candidate index."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Combination Sum';
UPDATE problems SET 
                        examples = '[{"input":"s = \"aab\"","output":"[[\"a\",\"a\",\"b\"],[\"aa\",\"b\"]]"},{"input":"s = \"a\"","output":"[[\"a\"]]"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 16","s contains only lowercase English letters."]'::jsonb, 
                        hints = '["Backtracking with DP to check palindrome efficiently."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Palindrome Partitioning';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,1,1,1,1], target = 3","output":"5"},{"input":"nums = [1], target = 1","output":"1"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 20","0 <= nums[i] <= 1000","0 <= sum(nums[i]) <= 1000","-1000 <= target <= 1000"]'::jsonb, 
                        hints = '["This is a Subset Sum variant: Find a subset P (positive) and N (negative) such that sum(P) - sum(N) = target.","Transform to: sum(P) = (target + sum(nums)) / 2."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Target Sum';
UPDATE problems SET 
                        examples = '[{"input":"matrix = [[\"1\",\"0\",\"1\",\"0\",\"0\"],[\"1\",\"0\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"0\",\"0\",\"1\",\"0\"]]","output":"4"},{"input":"matrix = [[\"0\",\"1\"],[\"1\",\"0\"]]","output":"1"}]'::jsonb, 
                        constraints = '["m == matrix.length","n == matrix[i].length","1 <= m, n <= 300","matrix[i][j] is ''0'' or ''1''."]'::jsonb, 
                        hints = '["dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1 if matrix[i][j] == ''1''."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximal Square';
UPDATE problems SET 
                        examples = '[{"input":"digits = \"23\"","output":"[\"ad\",\"ae\",\"af\",\"bd\",\"be\",\"bf\",\"cd\",\"ce\",\"cf\"]"},{"input":"digits = \"\"","output":"[]"}]'::jsonb, 
                        constraints = '["0 <= digits.length <= 4","digits[i] is a digit in the range [''2'', ''9'']."]'::jsonb, 
                        hints = '["Backtracking: Iterate through letters for current digit and recurse."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Letter Combinations of a Phone Number';
UPDATE problems SET 
                        examples = '[{"input":"s = \"12\"","output":"2"},{"input":"s = \"226\"","output":"3"},{"input":"s = \"06\"","output":"0"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 100","s contains only digits and may contain leading zero(s)."]'::jsonb, 
                        hints = '["dp[i] = dp[i-1] (if single digit valid) + dp[i-2] (if two digits valid).","Watch out for ''0''."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Decode Ways';
UPDATE problems SET 
                        examples = '[{"input":"nums = [2,3,1,1,4]","output":"true"},{"input":"nums = [3,2,1,0,4]","output":"false"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^4","0 <= nums[i] <= 10^5"]'::jsonb, 
                        hints = '["Greedy: Track the furthest reachable index.","Iterate and update max reach."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Jump Game';
UPDATE problems SET 
                        examples = '[{"input":"gas = [1,2,3,4,5], cost = [3,4,5,1,2]","output":"3"},{"input":"gas = [2,3,4], cost = [3,4,3]","output":"-1"}]'::jsonb, 
                        constraints = '["n == gas.length == cost.length","1 <= n <= 10^5"]'::jsonb, 
                        hints = '["If total gas < total cost, impossible.","Greedy: If current tank < 0, reset start to next station."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Gas Station';
UPDATE problems SET 
                        examples = '[{"input":"ratings = [1,0,2]","output":"5"},{"input":"ratings = [1,2,2]","output":"4"}]'::jsonb, 
                        constraints = '["n == ratings.length","1 <= n <= 2 * 10^4","0 <= ratings[i] <= 2 * 10^4"]'::jsonb, 
                        hints = '["Two passes: Left to right (satisfy left neighbor), Right to left (satisfy right neighbor).","Take max of both passes."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Candy';
UPDATE problems SET 
                        examples = '[{"input":"intervals = [[1,3],[2,6],[8,10],[15,18]]","output":"[[1,6],[8,10],[15,18]]"},{"input":"intervals = [[1,4],[4,5]]","output":"[[1,5]]"}]'::jsonb, 
                        constraints = '["1 <= intervals.length <= 10^4","intervals[i].length == 2","0 <= starti <= endi <= 10^4"]'::jsonb, 
                        hints = '["Sort by start time.","Iterate and merge if overlap (end >= next.start)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Merge Intervals';
UPDATE problems SET 
                        examples = '[{"input":"intervals = [[1,2],[2,3],[3,4],[1,3]]","output":"1"},{"input":"intervals = [[1,2],[1,2],[1,2]]","output":"2"}]'::jsonb, 
                        constraints = '["1 <= intervals.length <= 10^5","intervals[i].length == 2","starti < endi"]'::jsonb, 
                        hints = '["Greedy: Sort by end time.","Keep the interval ending earliest to leave room for others."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Non-overlapping Intervals';
UPDATE problems SET 
                        examples = '[{"input":"bills = [5,5,5,10,20]","output":"true"},{"input":"bills = [5,5,10,10,20]","output":"false"}]'::jsonb, 
                        constraints = '["1 <= bills.length <= 10^5","bills[i] is either 5, 10, or 20."]'::jsonb, 
                        hints = '["Track count of $5s and $10s.","Greedy: For $20 bill, prefer giving one $10 and one $5."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Lemonade Change';
UPDATE problems SET 
                        examples = '[{"input":"nums1 = [4,1,2], nums2 = [1,3,4,2]","output":"[-1,3,-1]"},{"input":"nums1 = [2,4], nums2 = [1,2,3,4]","output":"[3,-1]"}]'::jsonb, 
                        constraints = '["1 <= nums1.length <= nums2.length <= 1000","0 <= nums1[i], nums2[i] <= 10^4","All integers in nums1 and nums2 are unique."]'::jsonb, 
                        hints = '["Use a monotonic stack to find next greater element for all items in nums2.","Store results in a map."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Next Greater Element I';
UPDATE problems SET 
                        examples = '[{"input":"temperatures = [73,74,75,71,69,72,76,73]","output":"[1,1,4,2,1,1,0,0]"},{"input":"temperatures = [30,40,50,60]","output":"[1,1,1,0]"}]'::jsonb, 
                        constraints = '["1 <= temperatures.length <= 10^5","30 <= temperatures[i] <= 100"]'::jsonb, 
                        hints = '["Stack stores indices. While current temp > stack top temp, pop and resolve."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Daily Temperatures';
UPDATE problems SET 
                        examples = '[{"input":"heights = [2,1,5,6,2,3]","output":"10"},{"input":"heights = [2,4]","output":"4"}]'::jsonb, 
                        constraints = '["1 <= heights.length <= 10^5","0 <= heights[i] <= 10^4"]'::jsonb, 
                        hints = '["For each bar, find the first smaller bar to left and right.","Use monotonic stack to find boundaries."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Largest Rectangle in Histogram';
UPDATE problems SET 
                        examples = '[{"input":"price = [100, 80, 60, 70, 60, 75, 85]","output":"[1, 1, 1, 2, 1, 4, 6]"}]'::jsonb, 
                        constraints = '["Prices are positive.","At most 10^4 calls."]'::jsonb, 
                        hints = '["Maintain a monotonic stack of (price, span) pairs.","If current price >= stack top, pop and add span."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Online Stock Span';
UPDATE problems SET 
                        examples = '[{"input":"height = [0,1,0,2,1,0,1,3,2,1,2,1]","output":"6"},{"input":"height = [4,2,0,3,2,5]","output":"9"}]'::jsonb, 
                        constraints = '["n == height.length","1 <= n <= 2 * 10^4","0 <= height[i] <= 10^5"]'::jsonb, 
                        hints = '["Min of max-left and max-right height determines capacity.","Monotonic stack can find boundaries for trapped water."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Trapping Rain Water';
UPDATE problems SET 
                        examples = '[{"input":"edges = [[1,2],[1,3],[2,3]]","output":"[2,3]"},{"input":"edges = [[1,2],[2,3],[3,4],[1,4],[1,5]]","output":"[1,4]"}]'::jsonb, 
                        constraints = '["n == edges.length","3 <= n <= 1000","edges[i].length == 2","1 <= ai < bi <= n"]'::jsonb, 
                        hints = '["Use Union-Find.","If adding an edge connects two already connected nodes, that''s the redundant one."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Redundant Connection';
UPDATE problems SET 
                        examples = '[{"input":"accounts = [[\"John\",\"johnsmith@mail.com\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\",\"john00@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]","output":"[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]"}]'::jsonb, 
                        constraints = '["1 <= accounts.length <= 1000","2 <= accounts[i].length <= 10","1 <= accounts[i][j].length <= 30"]'::jsonb, 
                        hints = '["Use Union-Find to group component emails.","Map email to ID."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Accounts Merge';
UPDATE problems SET 
                        examples = '[{"input":"nums = [100,4,200,1,3,2]","output":"4"},{"input":"nums = [0,3,7,2,5,8,4,6,0,1]","output":"9"}]'::jsonb, 
                        constraints = '["0 <= nums.length <= 10^5","-10^9 <= nums[i] <= 10^9"]'::jsonb, 
                        hints = '["Use a HashSet to store numbers for O(1) lookup.","Or use Union-Find on adjacent numbers."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Consecutive Sequence';
UPDATE problems SET 
                        examples = '[{"input":"n = 4, connections = [[0,1],[0,2],[1,2]]","output":"1"},{"input":"n = 6, connections = [[0,1],[0,2],[0,3],[1,2],[1,3]]","output":"2"}]'::jsonb, 
                        constraints = '["1 <= n <= 10^5","1 <= connections.length <= 10^5","connections[i].length == 2"]'::jsonb, 
                        hints = '["Need at least n-1 cables.","Count connected components k. Ans is k-1."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Number of Operations to Make Network Connected';
UPDATE problems SET 
                        examples = '[{"input":"Trie trie = new Trie(); trie.insert(\"apple\"); trie.search(\"apple\");   // return True","output":"null"}]'::jsonb, 
                        constraints = '["1 <= word.length <= 2000","word consists of lowercase English letters.","At most 3 * 10^4 calls."]'::jsonb, 
                        hints = '["Use an array of size 26 or a Map for children.","Mark end of word with a boolean flag."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Implement Trie (Prefix Tree)';
UPDATE problems SET 
                        examples = '[{"input":"wordDictionary.addWord(\"bad\"); wordDictionary.search(\".ad\"); // return True","output":"null"}]'::jsonb, 
                        constraints = '["1 <= word.length <= 25","At most 10^4 calls."]'::jsonb, 
                        hints = '["Use Trie.","For ''.'', recurse on all possible children."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Design Add and Search Words Data Structure';
UPDATE problems SET 
                        examples = '[{"input":"numbers = [2,7,11,15], target = 9","output":"[1,2]"},{"input":"numbers = [2,3,4], target = 6","output":"[1,3]"}]'::jsonb, 
                        constraints = '["2 <= numbers.length <= 3 * 10^4","-1000 <= numbers[i] <= 1000","numbers is sorted in non-decreasing order"]'::jsonb, 
                        hints = '["Use two pointers, one at the start and one at the end.","If the sum is greater than target, decrease the right pointer. If less, increase the left pointer."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Two Sum II - Input Array Is Sorted';
UPDATE problems SET 
                        examples = '[{"input":"height = [1,8,6,2,5,4,8,3,7]","output":"49"},{"input":"height = [1,1]","output":"1"}]'::jsonb, 
                        constraints = '["n == height.length","2 <= n <= 10^5","0 <= height[i] <= 10^4"]'::jsonb, 
                        hints = '["Start with the widest container (pointers at both ends).","Move the shorter line inwards to potentially find a taller line that compensates for the reduced width."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Container With Most Water';
UPDATE problems SET 
                        examples = '[{"input":"s = \"abcabcbb\"","output":"3"},{"input":"s = \"bbbbb\"","output":"1"}]'::jsonb, 
                        constraints = '["0 <= s.length <= 5 * 10^4","s consists of English letters, digits, symbols and spaces."]'::jsonb, 
                        hints = '["Use a sliding window with two pointers.","Keep track of characters in the current window using a hash set or map."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Substring Without Repeating Characters';
UPDATE problems SET 
                        examples = '[{"input":"target = 7, nums = [2,3,1,2,4,3]","output":"2"},{"input":"target = 4, nums = [1,4,4]","output":"1"}]'::jsonb, 
                        constraints = '["1 <= target <= 10^9","1 <= nums.length <= 10^5"]'::jsonb, 
                        hints = '["Use two pointers to maintain a window.","Expand the window until the sum is >= target, then shrink it from the left to minimize length."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Size Subarray Sum';
UPDATE problems SET 
                        examples = '[{"input":"s1 = \"ab\", s2 = \"eidbaooo\"","output":"true"},{"input":"s1 = \"ab\", s2 = \"eidboaoo\"","output":"false"}]'::jsonb, 
                        constraints = '["1 <= s1.length, s2.length <= 10^4","s1 and s2 consist of lowercase English letters."]'::jsonb, 
                        hints = '["Use a sliding window of size equal to s1.length.","Compare key counts of the window in s2 with key counts of s1."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Permutation in String';
UPDATE problems SET 
                        examples = '[{"input":"s = \"ABAB\", k = 2","output":"4"},{"input":"s = \"AABABBA\", k = 1","output":"4"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 10^5","s consists of only uppercase English letters.","0 <= k <= s.length"]'::jsonb, 
                        hints = '["Use a sliding window. Maintain the count of the most frequent character in the current window.","If window length - max count > k, shrink the window."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Repeating Character Replacement';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2","output":"6"},{"input":"nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3","output":"10"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^5","nums[i] is either 0 or 1.","0 <= k <= nums.length"]'::jsonb, 
                        hints = '["Similar to character replacement, use a sliding window.","Count the number of 0s in the window. if count > k, shrink window."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Max Consecutive Ones III';
UPDATE problems SET 
                        examples = '[{"input":"fruits = [1,2,1]","output":"3"},{"input":"fruits = [0,1,2,2]","output":"3"}]'::jsonb, 
                        constraints = '["1 <= fruits.length <= 10^5","0 <= fruits[i] < fruits.length"]'::jsonb, 
                        hints = '["This is finding the longest subarray with at most 2 distinct elements.","Use a sliding window and a hash map to count distinct elements."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Fruit Into Baskets';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,3,4,2,2]","output":"2"},{"input":"nums = [3,1,3,4,2]","output":"3"}]'::jsonb, 
                        constraints = '["1 <= n <= 10^5","nums.length == n + 1","1 <= nums[i] <= n"]'::jsonb, 
                        hints = '["This can be modeled as a linked list cycle detection problem.","Use Floyd''s Cycle Detection algorithm (Tortoise and Hare)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find the Duplicate Number';
UPDATE problems SET 
                        examples = '[{"input":"head = [3,2,0,-4], pos = 1","output":"true"},{"input":"head = [1,2], pos = 0","output":"true"}]'::jsonb, 
                        constraints = '["The number of the nodes in the list is in the range [0, 10^4].","-10^5 <= Node.val <= 10^5","pos is -1 or a valid index in the linked-list."]'::jsonb, 
                        hints = '["Use two pointers, slow and fast.","Slow moves 1 step, fast moves 2 steps. If they collide, there is a cycle."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Linked List Cycle';
UPDATE problems SET 
                        examples = '[{"input":"nums = [3,2,1,5,6,4], k = 2","output":"5"},{"input":"nums = [3,2,3,1,2,4,5,5,6], k = 4","output":"4"}]'::jsonb, 
                        constraints = '["1 <= k <= nums.length <= 10^5","-10^4 <= nums[i] <= 10^4"]'::jsonb, 
                        hints = '["Sorting takes O(N log N).","Min-Heap of size k takes O(N log K).","Quickselect takes O(N) average."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Kth Largest Element in an Array';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,1,1,2,2,3], k = 2","output":"[1,2]"},{"input":"nums = [1], k = 1","output":"[1]"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^5","k is in the range [1, the number of unique elements in the array].","It is guaranteed that the answer is unique."]'::jsonb, 
                        hints = '["Count frequencies map.","Use Min-Heap of size k based on frequency.","Or Bucket Sort since max freq is N."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Top K Frequent Elements';
UPDATE problems SET 
                        examples = '[{"input":"obj.addNum(1); obj.addNum(2); obj.findMedian(); // 1.5","output":"null"}]'::jsonb, 
                        constraints = '["At most 5 * 10^4 calls.","Value range -10^5 to 10^5."]'::jsonb, 
                        hints = '["Maintain two heaps: Max-Heap for lower half, Min-Heap for upper half.","Balance sizes to differ by at most 1."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find Median from Data Stream';
UPDATE problems SET 
                        examples = '[{"input":"lists = [[1,4,5],[1,3,4],[2,6]]","output":"[1,1,2,3,4,4,5,6]"}]'::jsonb, 
                        constraints = '["k == lists.length","0 <= k <= 10^4","0 <= lists[i].length <= 500"]'::jsonb, 
                        hints = '["Use Min-Heap to keep track of the smallest current node from each list.","Extract min and add next node from that list to heap."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Merge k Sorted Lists';
UPDATE problems SET 
                        examples = '[{"input":"tasks = [\"A\",\"A\",\"A\",\"B\",\"B\",\"B\"], n = 2","output":"8"},{"input":"tasks = [\"A\",\"A\",\"A\",\"B\",\"B\",\"B\"], n = 0","output":"6"}]'::jsonb, 
                        constraints = '["1 <= tasks.length <= 10^4","tasks[i] is upper-case English letter.","0 <= n <= 100"]'::jsonb, 
                        hints = '["Greedy: schedule max frequency tasks first.","Formula based approach: (maxFreq - 1) * (n + 1) + countOfMaxFreq."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Task Scheduler';
UPDATE problems SET 
                        examples = '[{"input":"nums = [2,0,2,1,1,0]","output":"[0,0,1,1,2,2]"},{"input":"nums = [2,0,1]","output":"[0,1,2]"}]'::jsonb, 
                        constraints = '["n == nums.length","1 <= n <= 300","nums[i] is either 0, 1, or 2."]'::jsonb, 
                        hints = '["Use the Dutch National Flag algorithm.","Maintain three pointers: low, mid, high."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sort Colors';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2","output":"6"},{"input":"nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3","output":"10"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^5","nums[i] is either 0 or 1.","0 <= k <= nums.length"]'::jsonb, 
                        hints = '["Sliding window: Expand right. If zeros > k, shrink left."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Max Consecutive Ones III';
UPDATE problems SET 
                        examples = '[{"input":"s1 = \"ab\", s2 = \"eidbaooo\"","output":"true"},{"input":"s1 = \"ab\", s2 = \"eidboaoo\"","output":"false"}]'::jsonb, 
                        constraints = '["1 <= s1.length, s2.length <= 10^4","s1 and s2 consist of lowercase English letters."]'::jsonb, 
                        hints = '["Sliding Window with Frequency Map array of size 26.","Check if window match counts of s1."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Permutation in String';
UPDATE problems SET 
                        examples = '[{"input":"s = \"cbaebabacd\", p = \"abc\"","output":"[0,6]"},{"input":"s = \"abab\", p = \"ab\"","output":"[0,1,2]"}]'::jsonb, 
                        constraints = '["1 <= s.length, p.length <= 3 * 10^4","s and p consist of lowercase English letters."]'::jsonb, 
                        hints = '["Same as Permutation in String, but collect all start indices.","Fixed size window of size p.length."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find All Anagrams in a String';
UPDATE problems SET 
                        examples = '[{"input":"s = \"eceba\", k = 2","output":"3"},{"input":"s = \"aa\", k = 1","output":"2"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 5 * 10^4","0 <= k <= 50"]'::jsonb, 
                        hints = '["Use a map to track character counts in window.","If map size > k, shrink from left."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Substring with At Most K Distinct Characters';
UPDATE problems SET 
                        examples = '[{"input":"nums = [10,5,2,6], k = 100","output":"8"},{"input":"nums = [1,2,3], k = 0","output":"0"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 3 * 10^4","1 <= nums[i] <= 1000","0 <= k <= 10^6"]'::jsonb, 
                        hints = '["Sliding window: expand right, multiply product. While product >= k, divide left and shrink.","Count += (right - left + 1)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Subarray Product Less Than K';
UPDATE problems SET 
                        examples = '[{"input":"s = \"the sky is blue\"","output":"\"blue is sky the\""},{"input":"s = \"  hello world  \"","output":"\"world hello\""}]'::jsonb, 
                        constraints = '["1 <= s.length <= 10^4","s contains English letters (upper-case and lower-case), digits, and spaces '' ''.","There is at least one word in s."]'::jsonb, 
                        hints = '["Split by space, filter empty, reverse list, join."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reverse Words in a String';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,0,-1,0,-2,2], target = 0","output":"[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]"},{"input":"nums = [2,2,2,2,2], target = 8","output":"[[2,2,2,2]]"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 200","-10^9 <= nums[i] <= 10^9","-10^9 <= target <= 10^9"]'::jsonb, 
                        hints = '["Sort the array.","Use two nested loops for first two numbers, then Two Pointers for the remaining two."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = '4Sum';
UPDATE problems SET 
                        examples = '[{"input":"stalls = [1, 2, 8, 4, 9], k = 3","output":"3"},{"input":"stalls = [0, 3, 4, 7, 10, 9], k = 4","output":"3"}]'::jsonb, 
                        constraints = '["2 <= n <= 10^5","2 <= k <= n","0 <= stalls[i] <= 10^9"]'::jsonb, 
                        hints = '["Binary search on the answer (distance). Range [1, max_position - min_position].","Check if it''s possible to place k cows with at least `mid` distance."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Aggressive Cows';
UPDATE problems SET 
                        examples = '[{"input":"A = [12, 34, 67, 90], M = 2","output":"113"}]'::jsonb, 
                        constraints = '["1 <= N <= 10^5","1 <= A[i] <= 10^9","1 <= M <= N"]'::jsonb, 
                        hints = '["Binary search on the max pages. Range [max(A), sum(A)].","Check function: Greedily assign books."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Allocate Minimum Pages';
UPDATE problems SET 
                        examples = '[{"input":"k = 2, boards = [5, 10, 30, 20, 15]","output":"35"}]'::jsonb, 
                        constraints = '["Same logic as Allocate Minimum Pages.","1 <= k <= 10^5"]'::jsonb, 
                        hints = '["Identical to Allocate Minimum Pages / Split Array Largest Sum."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Painter''s Partition Problem';
UPDATE problems SET 
                        examples = '[{"input":"x = 4","output":"2"},{"input":"x = 8","output":"2"}]'::jsonb, 
                        constraints = '["0 <= x <= 2^31 - 1"]'::jsonb, 
                        hints = '["Binary search between 0 and x.","Check mid * mid <= x."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sqrt(x)';
UPDATE problems SET 
                        examples = '[{"input":"nums1 = [1,3], nums2 = [2]","output":"2.00000"},{"input":"nums1 = [1,2], nums2 = [3,4]","output":"2.50000"}]'::jsonb, 
                        constraints = '["nums1.length == m","nums2.length == n","0 <= m <= 1000","0 <= n <= 1000","1 <= m + n <= 2000"]'::jsonb, 
                        hints = '["Partition both arrays s.t. left halves and right halves have equal elements.","Binary search on the smaller array partition."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Median of Two Sorted Arrays';
UPDATE problems SET 
                        examples = '[{"input":"array = [-1,0,3,5,9,12], target = 9","output":"4"}]'::jsonb, 
                        constraints = '["1 <= secret.length <= 10^4"]'::jsonb, 
                        hints = '["Find bounds by exponentially increasing index: 1, 2, 4, 8... until get(i) > target.","Then standard binary search."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Search in a Sorted Array of Unknown Size';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,2,3,4,5]","output":"3"},{"input":"root = [1,2]","output":"1"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [1, 10^4].","-100 <= Node.val <= 100"]'::jsonb, 
                        hints = '["For every node, length of longest path passing through it is L + R.","Update global max diameter during DFS."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Diameter of Binary Tree';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,2,2,3,4,4,3]","output":"true"},{"input":"root = [1,2,2,null,3,null,3]","output":"false"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [1, 1000]."]'::jsonb, 
                        hints = '["Recursively check if left.left == right.right and left.right == right.left.","Or use Queue for BFS."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Symmetric Tree';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,2,3]","output":"6"},{"input":"root = [-10,9,20,null,null,15,7]","output":"42"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [1, 3 * 10^4].","-1000 <= Node.val <= 1000"]'::jsonb, 
                        hints = '["Calculate max gain from left and right subtrees.","Global max = max(global, left + right + node.val).","Return node.val + max(left, right)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Tree Maximum Path Sum';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,2,3,null,null,4,5]","output":"[1,2,3,null,null,4,5]"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 10^4].","-1000 <= Node.val <= 1000"]'::jsonb, 
                        hints = '["Use Preorder traversal with special character for null (e.g., ''X'')."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Serialize and Deserialize Binary Tree';
UPDATE problems SET 
                        examples = '[{"input":"numCourses = 2, prerequisites = [[1,0]]","output":"true"},{"input":"numCourses = 2, prerequisites = [[1,0],[0,1]]","output":"false"}]'::jsonb, 
                        constraints = '["1 <= numCourses <= 2000","0 <= prerequisites.length <= 5000"]'::jsonb, 
                        hints = '["This is a cycle detection problem.","Use DFS with 3 states (visiting, visited, unvisited) or Kahn''s Algorithm (BFS)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Course Schedule';
UPDATE problems SET 
                        examples = '[{"input":"numCourses = 2, prerequisites = [[1,0]]","output":"[0,1]"},{"input":"numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]","output":"[0,2,1,3]"}]'::jsonb, 
                        constraints = '["1 <= numCourses <= 2000"]'::jsonb, 
                        hints = '["Use Kahn''s Algorithm for Topological Sort.","If result size < numCourses, cycle exists."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Course Schedule II';
UPDATE problems SET 
                        examples = '[{"input":"N = 5, arr = [40, 20, 30, 10, 30]","output":"26000"}]'::jsonb, 
                        constraints = '["1 <= N <= 100","arr[i] is dimension."]'::jsonb, 
                        hints = '["Gap strategy DP.","dp[i][j] = min(dp[i][k] + dp[k+1][j] + cost)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Matrix Chain Multiplication';
UPDATE problems SET 
                        examples = '[{"input":"k = 1, n = 2","output":"2"},{"input":"k = 2, n = 6","output":"3"}]'::jsonb, 
                        constraints = '["1 <= k <= 100","1 <= n <= 10^4"]'::jsonb, 
                        hints = '["dp[moves][eggs] >= floors.","Binary search on moves."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Egg Dropping Puzzle';
UPDATE problems SET 
                        examples = '[{"input":"s = \"aab\"","output":"1"},{"input":"s = \"a\"","output":"0"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 2000"]'::jsonb, 
                        hints = '["dp[i] = min cuts for s[0..i].","Precompute palindromes."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Palindrome Partitioning II';
UPDATE problems SET 
                        examples = '[{"input":"matrix = [[2,1,3],[6,5,4],[7,8,9]]","output":"13"},{"input":"matrix = [[-19,57],[-40,-5]]","output":"-59"}]'::jsonb, 
                        constraints = '["n == matrix.length == matrix[i].length","1 <= n <= 100","-100 <= matrix[i][j] <= 100"]'::jsonb, 
                        hints = '["dp[i][j] = matrix[i][j] + min(dp[i-1][j-1], dp[i-1][j], dp[i-1][j+1])."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Falling Path Sum';
UPDATE problems SET 
                        examples = '[{"input":"grid = [[0,1,-1],[1,0,-1],[1,1,1]]","output":"5"}]'::jsonb, 
                        constraints = '["n == grid.length","1 <= n <= 50"]'::jsonb, 
                        hints = '["Think of two people starting from (0,0) sumultaneously.","dp[r1][c1][c2] max cherries."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Cherry Pickup';
UPDATE problems SET 
                        examples = '[{"input":"s = \"ababcbacadefegdehijhklij\"","output":"[9,7,8]"},{"input":"s = \"eccbbbbdec\"","output":"[10]"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 500","s consists of lowercase English letters."]'::jsonb, 
                        hints = '["Precompute last occurrence of each char.","Iterate and extend ''end'' of current part to max(end, last[char])."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Partition Labels';
UPDATE problems SET 
                        examples = '[{"input":"points = [[10,16],[2,8],[1,6],[7,12]]","output":"2"},{"input":"points = [[1,2],[3,4],[5,6],[7,8]]","output":"4"}]'::jsonb, 
                        constraints = '["1 <= points.length <= 10^5","points[i].length == 2","-2^31 <= xstart < xend <= 2^31 - 1"]'::jsonb, 
                        hints = '["Sort by end coordinate.","Greedy: shoot arrow at end of current balloon, skip all overlapping."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Number of Arrows to Burst Balloons';
UPDATE problems SET 
                        examples = '[{"input":"people = [[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]","output":"[[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]]"}]'::jsonb, 
                        constraints = '["1 <= people.length <= 2000","0 <= hi <= 10^6","0 <= ki < people.length"]'::jsonb, 
                        hints = '["Sort by height desc, k asc.","Insert into list at index k."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Queue Reconstruction by Height';
UPDATE problems SET 
                        examples = '[{"input":"words = [\"abcd\",\"dcba\",\"lls\",\"s\",\"sssll\"]","output":"[[0,1],[1,0],[3,2],[2,4]]"},{"input":"words = [\"bat\",\"tab\",\"cat\"]","output":"[[0,1],[1,0]]"}]'::jsonb, 
                        constraints = '["1 <= words.length <= 5000","0 <= words[i].length <= 300"]'::jsonb, 
                        hints = '["Use HashMap/Trie to store reverse of words.","For each word, check splitting points to form palindromes."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Palindrome Pairs';
UPDATE problems SET 
                        examples = '[{"input":"nums = [7,2,5,10,8], k = 2","output":"18"},{"input":"nums = [1,2,3,4,5], k = 2","output":"9"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 1000","0 <= nums[i] <= 10^6","1 <= k <= min(50, nums.length)"]'::jsonb, 
                        hints = '["Similar to Allocate Book Pages.","Binary search the answer in range [max(nums), sum(nums)]."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Split Array Largest Sum';
UPDATE problems SET 
                        examples = '[{"input":"weights = [1,2,3,4,5,6,7,8,9,10], days = 5","output":"15"},{"input":"weights = [3,2,2,4,1,4], days = 3","output":"6"}]'::jsonb, 
                        constraints = '["1 <= days <= weights.length <= 5 * 10^4","1 <= weights[i] <= 500"]'::jsonb, 
                        hints = '["Binary search on the capacity. Range [max(weights), sum(weights)]."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Capacity To Ship Packages Within D Days';
UPDATE problems SET 
                        examples = '[{"input":"piles = [3,6,7,11], h = 8","output":"4"},{"input":"piles = [30,11,23,4,20], h = 5","output":"30"}]'::jsonb, 
                        constraints = '["1 <= piles.length <= 10^4","piles.length <= h <= 10^9","1 <= piles[i] <= 10^9"]'::jsonb, 
                        hints = '["Binary search on eating speed k. Range [1, max(piles)]."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Koko Eating Bananas';
UPDATE problems SET 
                        examples = '[{"input":"dist = [1,3,2], hour = 6","output":"1"},{"input":"dist = [1,3,2], hour = 2.7","output":"3"}]'::jsonb, 
                        constraints = '["n == dist.length","1 <= n <= 10^5","1 <= dist[i] <= 10^5","1 <= hour <= 10^9"]'::jsonb, 
                        hints = '["Binary search the speed. Range [1, 10^7].","Calculate time taken for a given speed carefully handling ceiling of hours."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Speed to Arrive on Time';
UPDATE problems SET 
                        examples = '[{"input":"nums = [3,4,5,1,2]","output":"1"},{"input":"nums = [4,5,6,7,0,1,2]","output":"0"}]'::jsonb, 
                        constraints = '["n == nums.length","1 <= n <= 5000","-5000 <= nums[i] <= 5000"]'::jsonb, 
                        hints = '["Binary search. If mid > high, min is in right half. Else, in left half."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find Minimum in Rotated Sorted Array';
UPDATE problems SET 
                        examples = '[{"input":"s = \"rabbbit\", t = \"rabbit\"","output":"3"},{"input":"s = \"babgbag\", t = \"bag\"","output":"5"}]'::jsonb, 
                        constraints = '["1 <= s.length, t.length <= 1000","s and t consist of English letters."]'::jsonb, 
                        hints = '["dp[i][j]: number of ways to form t[0..j] using s[0..i].","If s[i] == t[j], we can either use s[i] or skip it."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Distinct Subsequences';
UPDATE problems SET 
                        examples = '[{"input":"s1 = \"aabcc\", s2 = \"dbbca\", s3 = \"aadbbcbcac\"","output":"true"},{"input":"s1 = \"aabcc\", s2 = \"dbbca\", s3 = \"aadbbbaccc\"","output":"false"}]'::jsonb, 
                        constraints = '["0 <= s1.length, s2.length <= 100","0 <= s3.length <= 200","s3.length == s1.length + s2.length"]'::jsonb, 
                        hints = '["dp[i][j] means s1[0..i] and s2[0..j] can form s3[0..i+j]."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Interleaving String';
UPDATE problems SET 
                        examples = '[{"input":"grid = [[1,3,1],[1,5,1],[4,2,1]]","output":"7"},{"input":"grid = [[1,2,3],[4,5,6]]","output":"12"}]'::jsonb, 
                        constraints = '["m == grid.length","n == grid[i].length","1 <= m, n <= 200","0 <= grid[i][j] <= 100"]'::jsonb, 
                        hints = '["dp[i][j] = grid[i][j] + min(dp[i-1][j], dp[i][j-1])."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Path Sum';
UPDATE problems SET 
                        examples = '[{"input":"nums = [3,4,2]","output":"6"},{"input":"nums = [2,2,3,3,3,4]","output":"9"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 2 * 10^4","1 <= nums[i] <= 10^4"]'::jsonb, 
                        hints = '["Reduce to House Robber problem by summing up same values."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Delete and Earn';
UPDATE problems SET 
                        examples = '[{"input":"times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2","output":"2"},{"input":"times = [[1,2,1]], n = 2, k = 1","output":"1"}]'::jsonb, 
                        constraints = '["1 <= k <= n <= 100","1 <= times.length <= 6000"]'::jsonb, 
                        hints = '["Dijkstra''s Algorithm or Bellman-Ford."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Network Delay Time';
UPDATE problems SET 
                        examples = '[{"input":"n = 4, flights = [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], src = 0, dst = 3, k = 1","output":"700"},{"input":"n = 3, flights = [[0,1,100],[1,2,100],[0,2,500]], src = 0, dst = 2, k = 1","output":"200"}]'::jsonb, 
                        constraints = '["1 <= n <= 100","0 <= flights.length <= (n * (n - 1) / 2)","0 <= k < n"]'::jsonb, 
                        hints = '["Run Dijkstra''s but track steps. Or BFS level by level. Or Bellman-Ford k+1 times."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Cheapest Flights Within K Stops';
UPDATE problems SET 
                        examples = '[{"input":"graph = [[1,2,3],[0,2],[0,1,3],[0,2]]","output":"false"},{"input":"graph = [[1,3],[0,2],[1,3],[0,2]]","output":"true"}]'::jsonb, 
                        constraints = '["graph.length == n","1 <= n <= 100"]'::jsonb, 
                        hints = '["Use 2-coloring (BFS/DFS). Assign colors 0 and 1. If neighbors have same color, not bipartite."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Is Graph Bipartite?';
UPDATE problems SET 
                        examples = '[{"input":"matrix = [[1,2,3],[4,5,6],[7,8,9]]","output":"[1,2,3,6,9,8,7,4,5]"},{"input":"matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]","output":"[1,2,3,4,8,12,11,10,9,5,6,7]"}]'::jsonb, 
                        constraints = '["m == matrix.length","n == matrix[i].length","1 <= m, n <= 10","-100 <= matrix[i][j] <= 100"]'::jsonb, 
                        hints = '["Simulate the process with 4 boundaries: top, bottom, left, right."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Spiral Matrix';
UPDATE problems SET 
                        examples = '[{"input":"matrix = [[1,2,3],[4,5,6],[7,8,9]]","output":"[[7,4,1],[8,5,2],[9,6,3]]"}]'::jsonb, 
                        constraints = '["n == matrix.length == matrix[i].length","1 <= n <= 20","-1000 <= matrix[i][j] <= 1000"]'::jsonb, 
                        hints = '["Transpose the matrix, then reverse each row."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Rotate Image';
UPDATE problems SET 
                        examples = '[{"input":"matrix = [[1,1,1],[1,0,1],[1,1,1]]","output":"[[1,0,1],[0,0,0],[1,0,1]]"}]'::jsonb, 
                        constraints = '["m == matrix.length","n == matrix[0].length","1 <= m, n <= 200"]'::jsonb, 
                        hints = '["Use the first row and first column as markers to store states."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Set Matrix Zeroes';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1, 5, 7, 1], k = 6","output":"2"},{"input":"nums = [1, 1, 1, 1], k = 2","output":"6"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^5","1 <= k <= 10^9"]'::jsonb, 
                        hints = '["Use a hash map to store frequencies of elements.","Or sort the array and use two pointers if O(N log N) is acceptable."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Count Pairs with Sum';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,2,3,4,5,6]","output":"[6,1,5,2,4,3]"},{"input":"nums = [10,20,30,40,50,60]","output":"[60,10,50,20,40,30]"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^5","1 <= nums[i] <= 10^7"]'::jsonb, 
                        hints = '["Use the fact that the array is sorted.","Two pointers: one at start (min), one at end (max)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Rearrange Array Alternately';
UPDATE problems SET 
                        examples = '[{"input":"s = \"A man, a plan, a canal: Panama\"","output":"true"},{"input":"s = \"race a car\"","output":"false"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 2 * 10^5","s consists only of printable ASCII characters."]'::jsonb, 
                        hints = '["Use two pointers, one at start and one at end.","Skip non-alphanumeric characters and compare."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Valid Palindrome';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,0,1,1,0]","output":"[0,0,1,1,1]"},{"input":"nums = [1,1,1]","output":"[1,1,1]"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^5","nums[i] is 0 or 1"]'::jsonb, 
                        hints = '["Count 0s and 1s.","Or use two pointers: increment left if 0, decrement right if 1, swap if violation."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sort Array of 0s and 1s';
UPDATE problems SET 
                        examples = '[{"input":"arr1 = [1, 4, 5, 7], arr2 = [10, 20, 30, 40], x = 32","output":"[1, 30]"},{"input":"arr1 = [1, 4, 5, 7], arr2 = [10, 20, 30, 40], x = 50","output":"[7, 40]"}]'::jsonb, 
                        constraints = '["1 <= arr1.length, arr2.length <= 10^5","1 <= x <= 10^9"]'::jsonb, 
                        hints = '["Initialize left pointer for first array and right pointer for second array.","Calculate sum. If sum < x, move left pointer. If sum > x, move right pointer. Update closest."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Closet Pair from Two Sorted Arrays';
UPDATE problems SET 
                        examples = '[{"input":"nums = [3,1,4,1,5], k = 2","output":"2"},{"input":"nums = [1,2,3,4,5], k = 1","output":"4"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^4","0 <= k <= 10^7"]'::jsonb, 
                        hints = '["Sort the array.","Use two pointers. Maintain the difference k between them."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Pair with Given Difference';
UPDATE problems SET 
                        examples = '[{"input":"nums = [-2,0,1,3], target = 2","output":"2"},{"input":"nums = [], target = 0","output":"0"}]'::jsonb, 
                        constraints = '["n == nums.length","0 <= n <= 3500","-100 <= nums[i] <= 100","-100 <= target <= 100"]'::jsonb, 
                        hints = '["Sort the array.","Fix the first element, then use two pointers to find valid pairs for the other two."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = '3Sum Smaller';
UPDATE problems SET 
                        examples = '[{"input":"firstList = [[0,2],[5,10],[13,23],[24,25]], secondList = [[1,5],[8,12],[15,24],[25,26]]","output":"[[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]"},{"input":"firstList = [[1,3],[5,9]], secondList = []","output":"[]"}]'::jsonb, 
                        constraints = '["0 <= firstList.length, secondList.length <= 1000","0 <= start_i < end_i <= 10^9"]'::jsonb, 
                        hints = '["Use two pointers, one for each list.","The intersection of two intervals is [max(start1, start2), min(end1, end2)]."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Interval List Intersections';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,2,3,4,5], k = 2","output":"[4,5,1,2,3]"},{"input":"head = [0,1,2], k = 4","output":"[2,0,1]"}]'::jsonb, 
                        constraints = '["The number of nodes in the list is in the range [0, 500].","-100 <= Node.val <= 100","0 <= k <= 2 * 10^9"]'::jsonb, 
                        hints = '["Connect the tail to the head to make it a circle.","Identify the new tail and break the circle."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Rotate List';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,3,2,3,1]","output":"2"},{"input":"nums = [2,4,3,5,1]","output":"3"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 5 * 10^4","-2^31 <= nums[i] <= 2^31 - 1"]'::jsonb, 
                        hints = '["Use Merge Sort logic. Count pairs during merge step."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reverse Pairs';
UPDATE problems SET 
                        examples = '[{"input":"nums = [-2,5,-1], lower = -2, upper = 2","output":"3"},{"input":"nums = [0], lower = 0, upper = 0","output":"1"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^5","lower <= upper"]'::jsonb, 
                        hints = '["Use Merge Sort or Segment Tree."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Count of Range Sum';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,2,3,4,5]","output":"[1,3,5,2,4]"},{"input":"head = [2,1,3,5,6,4,7]","output":"[2,3,6,7,1,5,4]"}]'::jsonb, 
                        constraints = '["The number of nodes in the linked list is in the range [0, 10^4].","-10^6 <= Node.val <= 10^6"]'::jsonb, 
                        hints = '["Maintain two pointers: odd and even. Connect odd->next to even->next and vice-versa."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Odd Even Linked List';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,2,2,1]","output":"true"},{"input":"head = [1,2]","output":"false"}]'::jsonb, 
                        constraints = '["The number of nodes in the list is in the range [1, 10^5].","0 <= Node.val <= 9"]'::jsonb, 
                        hints = '["Find middle, reverse second half, compare."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Palindrome Linked List';
UPDATE problems SET 
                        examples = '[{"input":"intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5]","output":"Intersected at ''8''"}]'::jsonb, 
                        constraints = '["The number of nodes of listA is in the m.","The number of nodes of listB is in the n.","1 <= m, n <= 3 * 10^4","1 <= Node.val <= 10^5"]'::jsonb, 
                        hints = '["Run two pointers. When one reaches end, switch to other list''s head."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Intersection of Two Linked Lists';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,2,3,3,4,4,5]","output":"[1,2,5]"},{"input":"head = [1,1,1,2,3]","output":"[2,3]"}]'::jsonb, 
                        constraints = '["The number of nodes in the list is in the range [0, 300].","-100 <= Node.val <= 100","The list is guaranteed to be sorted in ascending order."]'::jsonb, 
                        hints = '["Use a dummy head. Pointer ''prev'' tracks last valid node."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Remove Duplicates from Sorted List II';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,2,3,4,5], k = 2","output":"[4,5,1,2,3]"},{"input":"head = [0,1,2], k = 4","output":"[2,0,1]"}]'::jsonb, 
                        constraints = '["The number of nodes in the list is in the range [0, 500].","-100 <= Node.val <= 100","0 <= k <= 2 * 10^9"]'::jsonb, 
                        hints = '["Make it a circle, find length, then break at length - (k % length)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Rotate List';
UPDATE problems SET 
                        examples = '[{"input":"edges = [[1,2],[1,3],[2,3]]","output":"[2,3]"},{"input":"edges = [[1,2],[2,3],[3,4],[1,4],[1,5]]","output":"[1,4]"}]'::jsonb, 
                        constraints = '["n == edges.length","3 <= n <= 1000","edges[i].length == 2","1 <= ai < bi <= n","ai != bi","There are no repeated edges."]'::jsonb, 
                        hints = '["Use Union-Find. Iterate edges; if u and v are already connected, this is the redundant edge."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Redundant Connection';
UPDATE problems SET 
                        examples = '[{"input":"accounts = [[\"John\",\"johnsmith@mail.com\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\",\"john00@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]","output":"[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]"}]'::jsonb, 
                        constraints = '["1 <= accounts.length <= 1000","2 <= accounts[i].length <= 10","1 <= accounts[i][j].length <= 30","accounts[i][0] consists of English letters.","accounts[i][j] (for j > 0) is a valid email."]'::jsonb, 
                        hints = '["Use Union-Find on emails. Map each email to an ID."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Accounts Merge';
UPDATE problems SET 
                        examples = '[{"input":"n = 4, connections = [[0,1],[0,2],[1,2]]","output":"1"},{"input":"n = 6, connections = [[0,1],[0,2],[0,3],[1,2],[1,3]]","output":"2"}]'::jsonb, 
                        constraints = '["1 <= n <= 10^5","1 <= connections.length <= min(n * (n - 1) / 2, 10^5)"]'::jsonb, 
                        hints = '["If connections < n-1, return -1.","Otherwise, find number of connected components C. Answer is C - 1."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Number of Operations to Make Network Connected';
UPDATE problems SET 
                        examples = '[{"input":"s = \"dcab\", pairs = [[0,3],[1,2]]","output":"\"bacd\""},{"input":"s = \"dcab\", pairs = [[0,3],[1,2],[0,2]]","output":"\"abcd\""}]'::jsonb, 
                        constraints = '["1 <= s.length <= 10^5","0 <= pairs.length <= 10^5"]'::jsonb, 
                        hints = '["Union-Find to group indices that can be swapped.","For each group, collect characters, sort them, and place them back in sorted indices."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Smallest String With Swaps';
UPDATE problems SET 
                        examples = '[{"input":"equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"c\"],[\"b\",\"a\"]]","output":"[6.00000,0.50000]"}]'::jsonb, 
                        constraints = '["1 <= equations.length <= 20","equations[i].length == 2","1 <= values.length <= 20"]'::jsonb, 
                        hints = '["Build a graph where edge (a,b) has weight value, (b,a) has weight 1/value.","Use BFS/DFS to find path product."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Evaluate Division';
UPDATE problems SET 
                        examples = '[{"input":"tasks = [\"A\",\"A\",\"A\",\"B\",\"B\",\"B\"], n = 2","output":"8"},{"input":"tasks = [\"A\",\"A\",\"A\",\"B\",\"B\",\"B\"], n = 0","output":"6"}]'::jsonb, 
                        constraints = '["1 <= tasks.length <= 10^4","tasks[i] is upper-case English letter.","0 <= n <= 100"]'::jsonb, 
                        hints = '["Frequency counting. Max frequency determines structure."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Task Scheduler';
UPDATE problems SET 
                        examples = '[{"input":"s = \"aab\"","output":"\"aba\""},{"input":"s = \"aaab\"","output":"\"\""}]'::jsonb, 
                        constraints = '["1 <= s.length <= 500","s consists of lowercase English letters."]'::jsonb, 
                        hints = '["Use Max Heap to store character frequencies. Pick top 2 and place them."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reorganize String';
UPDATE problems SET 
                        examples = '[{"input":"points = [[1,3],[-2,2]], k = 1","output":"[[-2,2]]"},{"input":"points = [[3,3],[5,-1],[-2,4]], k = 2","output":"[[3,3],[-2,4]]"}]'::jsonb, 
                        constraints = '["1 <= k <= points.length <= 10^4","-10^4 < xi, yi < 10^4"]'::jsonb, 
                        hints = '["Calculate distance squared for each point. Use Max Heap of size K to keep smallest distances."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'K Closest Points to Origin';
UPDATE problems SET 
                        examples = '[{"input":"words = [\"i\",\"love\",\"leetcode\",\"i\",\"love\",\"coding\"], k = 2","output":"[\"i\",\"love\"]"},{"input":"words = [\"the\",\"day\",\"is\",\"sunny\",\"the\",\"the\",\"the\",\"sunny\",\"is\",\"is\"], k = 4","output":"[\"the\",\"is\",\"sunny\",\"day\"]"}]'::jsonb, 
                        constraints = '["1 <= words.length <= 500","1 <= words[i].length <= 10"]'::jsonb, 
                        hints = '["Count freq. Use Min Heap of size K with custom comparator."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Top K Frequent Words';
UPDATE problems SET 
                        examples = '[{"input":"nums = [2,2,1]","output":"1"},{"input":"nums = [4,1,2,1,2]","output":"4"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 3 * 10^4","-3 * 10^4 <= nums[i] <= 3 * 10^4"]'::jsonb, 
                        hints = '["XOR all elements. a ^ a = 0."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Single Number';
UPDATE problems SET 
                        examples = '[{"input":"nums = [2,2,3,2]","output":"3"},{"input":"nums = [0,1,0,1,0,1,99]","output":"99"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 3 * 10^4","-2^31 <= nums[i] <= 2^31 - 1"]'::jsonb, 
                        hints = '["Count bits at each position modulo 3."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Single Number II';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,2,1,3,2,5]","output":"[3,5]"},{"input":"nums = [-1,0]","output":"[-1,0]"}]'::jsonb, 
                        constraints = '["2 <= nums.length <= 3 * 10^4","-2^31 <= nums[i] <= 2^31 - 1"]'::jsonb, 
                        hints = '["XOR all. Result is x^y. Find rightmost set bit to separate into two groups."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Single Number III';
UPDATE problems SET 
                        examples = '[{"input":"n = 2","output":"[0,1,1]"},{"input":"n = 5","output":"[0,1,1,2,1,2]"}]'::jsonb, 
                        constraints = '["0 <= n <= 10^5"]'::jsonb, 
                        hints = '["dp[i] = dp[i >> 1] + (i & 1)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Counting Bits';
UPDATE problems SET 
                        examples = '[{"input":"n = 00000010100101000001111010011100","output":"964176192 (00111001011110000010100101000000)"}]'::jsonb, 
                        constraints = '["n is a binary string of length 32"]'::jsonb, 
                        hints = '["Iterate 32 times, extract bit and push to result."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reverse Bits';
UPDATE problems SET 
                        examples = '[{"input":"n = 19","output":"true"},{"input":"n = 2","output":"false"}]'::jsonb, 
                        constraints = '["1 <= n <= 2^31 - 1"]'::jsonb, 
                        hints = '["Floyd''s Cycle Detection (Fast/Slow pointers)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Happy Number';
UPDATE problems SET 
                        examples = '[{"input":"x = 2.00000, n = 10","output":"1024.00000"},{"input":"x = 2.10000, n = 3","output":"9.26100"}]'::jsonb, 
                        constraints = '["-100.0 < x < 100.0","-2^31 <= n <= 2^31-1","-10^4 <= x^n <= 10^4"]'::jsonb, 
                        hints = '["Binary Exponentiation. Recursive or Iterative."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Pow(x, n)';
UPDATE problems SET 
                        examples = '[{"input":"num1 = \"2\", num2 = \"3\"","output":"\"6\""},{"input":"num1 = \"123\", num2 = \"456\"","output":"\"56088\""}]'::jsonb, 
                        constraints = '["1 <= num1.length, num2.length <= 200"]'::jsonb, 
                        hints = '["Start from right to left, perform multiplication like in elementary school."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Multiply Strings';
UPDATE problems SET 
                        examples = '[{"input":"instructions = \"GGLLGG\"","output":"true"},{"input":"instructions = \"GG\"","output":"false"}]'::jsonb, 
                        constraints = '["1 <= instructions.length <= 100"]'::jsonb, 
                        hints = '["It''s a circle if final pos is (0,0) OR final direction is NOT North."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Robot Bounded In Circle';
UPDATE problems SET 
                        examples = '[{"input":"tokens = [100], power = 50","output":"0"},{"input":"tokens = [100,200], power = 150","output":"1"}]'::jsonb, 
                        constraints = '["0 <= tokens.length <= 1000","0 <= tokens[i], power < 10^4"]'::jsonb, 
                        hints = '["Sort tokens. Buy cheapest (smallest) to gain score. Sell most expensive (largest) to gain power."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Bag of Tokens';
UPDATE problems SET 
                        examples = '[{"input":"people = [1,2], limit = 3","output":"1"},{"input":"people = [3,2,2,1], limit = 3","output":"3"}]'::jsonb, 
                        constraints = '["1 <= people.length <= 5 * 10^4","1 <= people[i] <= limit <= 3 * 10^4"]'::jsonb, 
                        hints = '["Sort people. Pair lightest with heaviest. If sum <= limit, both go. Else heaviest goes alone."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Boats to Save People';
UPDATE problems SET 
                        examples = '[{"input":"nums = [2,-1,1,2,2]","output":"true"},{"input":"nums = [-1,2]","output":"false"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 5000","-1000 <= nums[i] <= 1000","nums[i] != 0"]'::jsonb, 
                        hints = '["Use Fast and Slow Pointers for cycle detection. Ensure cycle length > 1 and direction consistently positive or negative."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Circular Array Loop';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,3,4,2,2]","output":"2"},{"input":"nums = [3,1,3,4,2]","output":"3"}]'::jsonb, 
                        constraints = '["1 <= n <= 10^5","nums.length == n + 1","1 <= nums[i] <= n"]'::jsonb, 
                        hints = '["Floyd''s Cycle Detection (Tortoise and Hare). Convert array to linked list idea: index i -> nums[i]."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find the Duplicate Number';
UPDATE problems SET 
                        examples = '[{"input":"s = \"ABAB\", k = 2","output":"4"},{"input":"s = \"AABABBA\", k = 1","output":"4"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 10^5","s consists of only uppercase English letters.","0 <= k <= s.length"]'::jsonb, 
                        hints = '["Sliding Window. Maintain count of most frequent char in window. If (len - maxFreq) > k, shrink window."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Repeating Character Replacement';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,2,5,3,4,null,6]","output":"[1,null,2,null,3,null,4,null,5,null,6]"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 2000].","-100 <= Node.val <= 100"]'::jsonb, 
                        hints = '["Use Morris Traversal or recursive post-order (right, left, root)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Flatten Binary Tree to Linked List';
UPDATE problems SET 
                        examples = '[{"input":"root = [1,2,3,4,5,6,7]","output":"[1,#,2,3,#,4,5,6,7,#]"}]'::jsonb, 
                        constraints = '["The number of nodes is in the range [0, 2^12 - 1].","-1000 <= Node.val <= 1000"]'::jsonb, 
                        hints = '["Level order traversal (BFS). Or rely on the fact that if a node has left child, it has right child. Connect left->next = right. Connect right->next = next->left."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Populating Next Right Pointers in Each Node';
UPDATE problems SET 
                        examples = '[{"input":"root = [5,4,8,11,null,13,4,7,2,5,1], targetSum = 22","output":"[[5,4,11,2],[5,8,4,5]]"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 5000].","-1000 <= Node.val <= 1000","-1000 <= targetSum <= 1000"]'::jsonb, 
                        hints = '["DFS keeping track of current path and current sum."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Path Sum II';
UPDATE problems SET 
                        examples = '[{"input":"root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8","output":"3"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [0, 1000].","-10^9 <= Node.val <= 10^9","-1000 <= targetSum <= 1000"]'::jsonb, 
                        hints = '["Use Prefix Sum HashMap to store path sums encountered so far."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Path Sum III';
UPDATE problems SET 
                        examples = '[{"input":"root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1","output":"3"},{"input":"root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4","output":"5"}]'::jsonb, 
                        constraints = '["The number of nodes in the tree is in the range [2, 10^5].","-10^9 <= Node.val <= 10^9","All Node.val are unique.","p != q","p and q will exist in the tree."]'::jsonb, 
                        hints = '["Bottom-up recursion. If root matches p or q, return root. If both left and right return non-null, root is LCA."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Lowest Common Ancestor of a Binary Tree';
UPDATE problems SET 
                        examples = '[{"input":"s = \"12\"","output":"2"},{"input":"s = \"226\"","output":"3"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 100","s contains only digits and may contain leading zero(s)."]'::jsonb, 
                        hints = '["dp[i] = dp[i-1] (if s[i] valid) + dp[i-2] (if s[i-1:i+1] valid)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Decode Ways';
UPDATE problems SET 
                        examples = '[{"input":"s = \"leetcode\", wordDict = [\"leet\",\"code\"]","output":"true"},{"input":"s = \"applepenapple\", wordDict = [\"apple\",\"pen\"]","output":"true"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 300","1 <= wordDict.length <= 1000"]'::jsonb, 
                        hints = '["dp[i] is true if s[0...i] can be segmented."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Word Break';
UPDATE problems SET 
                        examples = '[{"input":"s = \"catsanddog\", wordDict = [\"cat\",\"cats\",\"and\",\"sand\",\"dog\"]","output":"[\"cats and dog\",\"cat sand dog\"]"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 20","1 <= wordDict.length <= 1000"]'::jsonb, 
                        hints = '["Backtracking with Memoization."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Word Break II';
UPDATE problems SET 
                        examples = '[{"input":"s = \"aab\"","output":"[[\"a\",\"a\",\"b\"],[\"aa\",\"b\"]]"},{"input":"s = \"a\"","output":"[[\"a\"]]"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 16","s contains only lowercase English letters."]'::jsonb, 
                        hints = '["Backtracking. For each prefix that is palindrome, recurse on remainder."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Palindrome Partitioning';
UPDATE problems SET 
                        examples = '[{"input":"s = \"25525511135\"","output":"[\"255.255.11.135\",\"255.255.111.35\"]"},{"input":"s = \"0000\"","output":"[\"0.0.0.0\"]"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 20","s consists of digits only."]'::jsonb, 
                        hints = '["Backtracking. Try placing dot after 1, 2, or 3 digits."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Restore IP Addresses';
UPDATE problems SET 
                        examples = '[{"input":"grid = [[\"1\",\"1\",\"1\",\"1\",\"0\"],[\"1\",\"1\",\"0\",\"1\",\"0\"],[\"1\",\"1\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]","output":"1"}]'::jsonb, 
                        constraints = '["m == grid.length","n == grid[i].length","1 <= m, n <= 300"]'::jsonb, 
                        hints = '["Visit each cell. If ''1'', increment count and launch BFS/DFS to mark all connected ''1''s as ''0''."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Number of Islands';
UPDATE problems SET 
                        examples = '[{"input":"grid = [[2,1,1],[1,1,0],[0,1,1]]","output":"4"},{"input":"grid = [[2,1,1],[0,1,1],[1,0,1]]","output":"-1"}]'::jsonb, 
                        constraints = '["m == grid.length","n == grid[i].length","1 <= m, n <= 10"]'::jsonb, 
                        hints = '["Multi-source BFS. Start BFS from all rotten oranges simultaneously."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Rotting Oranges';
UPDATE problems SET 
                        examples = '[{"input":"adjList = [[2,4],[1,3],[2,4],[1,3]]","output":"[[2,4],[1,3],[2,4],[1,3]]"}]'::jsonb, 
                        constraints = '["The number of nodes in the graph is in the range [0, 100].","1 <= Node.val <= 100"]'::jsonb, 
                        hints = '["Use HashMap to store (originalNode -> cloneNode) mapping. DFS/BFS to traverse."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Clone Graph';
UPDATE problems SET 
                        examples = '[{"input":"board = [[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"O\",\"O\",\"X\"],[\"X\",\"X\",\"O\",\"X\"],[\"X\",\"O\",\"X\",\"X\"]]","output":"[[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"O\",\"X\",\"X\"]]"}]'::jsonb, 
                        constraints = '["m == board.length","n == board[i].length","1 <= m, n <= 200"]'::jsonb, 
                        hints = '["Start from ''O''s on the boundary and mark them as safe. All other ''O''s are captured."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Surrounded Regions';
UPDATE problems SET 
                        examples = '[{"input":"beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\"]","output":"5"},{"input":"beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\"]","output":"0"}]'::jsonb, 
                        constraints = '["1 <= beginWord.length <= 10","endWord.length == beginWord.length","1 <= wordList.length <= 5000"]'::jsonb, 
                        hints = '["BFS to find shortest path. Change one letter at a time."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Word Ladder';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,2,3,4,5]","output":"[1,3,5,2,4]"},{"input":"head = [2,1,3,5,6,4,7]","output":"[2,3,6,7,1,5,4]"}]'::jsonb, 
                        constraints = '["The number of nodes in the linked list is in the range [0, 10^4].","-10^6 <= Node.val <= 10^6"]'::jsonb, 
                        hints = '["Use two pointers, one for odd nodes and one for even nodes.","Maintain the head of the even list to attach it to the end of the odd list."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Odd Even Linked List';
UPDATE problems SET 
                        examples = '[{"input":"arr = [1,2,3,4,5], k = 4, x = 3","output":"[1,2,3,4]"},{"input":"arr = [1,2,3,4,5], k = 4, x = -1","output":"[1,2,3,4]"}]'::jsonb, 
                        constraints = '["1 <= k <= arr.length","1 <= arr.length <= 10^4","arr is sorted in ascending order."]'::jsonb, 
                        hints = '["Use binary search to find the closest element.","Use two pointers to expand outwards from the closest element until k elements are found."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find K Closest Elements';
UPDATE problems SET 
                        examples = '[{"input":"g = [1,2,3], s = [1,1]","output":"1"},{"input":"g = [1,2], s = [1,2,3]","output":"2"}]'::jsonb, 
                        constraints = '["1 <= g.length <= 3 * 10^4","0 <= s.length <= 3 * 10^4"]'::jsonb, 
                        hints = '["Sort both the greed factors and cookie sizes.","Use two pointers to match the smallest cookie that satisfies a child''s greed."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Assign Cookies';
UPDATE problems SET 
                        examples = '[{"input":"n = 6, arr = [16,17,4,3,5,2]","output":"[17,5,2]"},{"input":"n = 5, arr = [1,2,3,4,0]","output":"[4,0]"}]'::jsonb, 
                        constraints = '["1 <= n <= 10^7","0 <= A[i] <= 10^7"]'::jsonb, 
                        hints = '["Scan from right to left.","Keep track of the maximum element seen so far from the right."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Leaders in an Array';
UPDATE problems SET 
                        examples = '[{"input":"words = [\"abcd\",\"dcba\",\"lls\",\"s\",\"sssll\"]","output":"[[0,1],[1,0],[3,2],[2,4]]"},{"input":"words = [\"bat\",\"tab\",\"cat\"]","output":"[[0,1],[1,0]]"}]'::jsonb, 
                        constraints = '["1 <= words.length <= 5000","0 <= words[i].length <= 300"]'::jsonb, 
                        hints = '["Use a hash map to store the reverse of each word.","For each word, check if its prefix or suffix is a palindrome and if the remaining part exists in the map."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Palindrome Pairs';
UPDATE problems SET 
                        examples = '[{"input":"n = 5, arr1 = [1, 2, 3, 4, 5], m = 3, arr2 = [1, 2, 3]","output":"[1, 2, 3, 4, 5]"},{"input":"n = 2, arr1 = [2, 2], m = 1, arr2 = [1]","output":"[1, 2]"}]'::jsonb, 
                        constraints = '["1 <= n, m <= 10^5","-10^9 <= arr1[i], arr2[i] <= 10^9"]'::jsonb, 
                        hints = '["Use two pointers similar to merge sort.","Handle duplicates by skipping them."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Union of Two Sorted Arrays';
UPDATE problems SET 
                        examples = '[{"input":"heightMap = [[1,4,3,1,3,2],[3,2,1,3,2,4],[2,3,3,2,3,1]]","output":"4"}]'::jsonb, 
                        constraints = '["m == heightMap.length","n == heightMap[i].length","1 <= m, n <= 200"]'::jsonb, 
                        hints = '["Min-Heap boundary. Always pick the smallest height from boundary and explore neighbors. If neighbor is lower, water trapped."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Trapping Rain Water II';
UPDATE problems SET 
                        examples = '[{"input":"heights = [2,1,5,6,2,3]","output":"10"},{"input":"heights = [2,4]","output":"4"}]'::jsonb, 
                        constraints = '["1 <= heights.length <= 10^5","0 <= heights[i] <= 10^4"]'::jsonb, 
                        hints = '["Monotonic Stack. Store indices of increasing heights. When decrease, calc area using height[top] * (current - stack.peek - 1)."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Largest Rectangle in Histogram';
UPDATE problems SET 
                        examples = '[{"input":"matrix = [[\"1\",\"0\",\"1\",\"0\",\"0\"],[\"1\",\"0\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"0\",\"0\",\"1\",\"0\"]]","output":"6"}]'::jsonb, 
                        constraints = '["rows == matrix.length","cols == matrix[i].length","1 <= rows, cols <= 200"]'::jsonb, 
                        hints = '["Treat each row as a histogram base. Compute Largest Rectangle in Histogram for each row."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximal Rectangle';
UPDATE problems SET 
                        examples = '[{"input":"buildings = [[2,9,10],[3,7,15],[5,12,12],[15,20,10],[19,24,8]]","output":"[[2,10],[3,15],[7,12],[12,0],[15,10],[20,8],[24,0]]"}]'::jsonb, 
                        constraints = '["1 <= buildings.length <= 10^4","0 <= lefti < righti <= 2^31 - 1"]'::jsonb, 
                        hints = '["Sweep Line algorithm. Use Max Heap to store live buildings'' heights."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'The Skyline Problem';
UPDATE problems SET 
                        examples = '[{"input":"[\"MedianFinder\", \"addNum\", \"addNum\", \"findMedian\", \"addNum\", \"findMedian\"]\n[[], [1], [2], [], [3], []]","output":"[null, null, null, 1.5, null, 2.0]"}]'::jsonb, 
                        constraints = '["-10^5 <= num <= 10^5","There will be at least one element in the data structure before calling findMedian."]'::jsonb, 
                        hints = '["Use two heaps: Max Heap for the left half, Min Heap for the right half."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find Median from Data Stream';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Roman to Integer';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Common Prefix';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Valid Parentheses';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Merge Two Sorted Lists';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Remove Duplicates from Sorted Array';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Remove Element';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Implement strStr()';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Search Insert Position';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Length of Last Word';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Plus One';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Add Binary';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sqrt(x)';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Climbing Stairs';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Remove Duplicates from Sorted List';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Merge Sorted Array';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Tree Inorder Traversal';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Same Tree';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Symmetric Tree';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximum Depth of Binary Tree';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sorted Array to BST';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Balanced Binary Tree';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Depth of Binary Tree';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Path Sum';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Pascal''s Triangle';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Pascal''s Triangle II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Best Time to Buy and Sell Stock';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Valid Palindrome';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Single Number';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Linked List Cycle';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Min Stack';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Intersection of Two Linked Lists';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Missing Number';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Move Zeroes';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reverse String';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Intersection of Two Arrays';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Intersection of Two Arrays II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'First Unique Character in a String';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Fizz Buzz';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reverse Vowels of a String';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Third Maximum Number';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find All Numbers Disappeared in an Array';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Hamming Distance';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Island Perimeter';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Max Consecutive Ones';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Construct the Rectangle';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Teemo Attacking';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Next Greater Element I';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Keyboard Row';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find Mode in Binary Search Tree';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Convert BST to Greater Tree';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Spiral Matrix II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Permutation Sequence';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Partition List';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Gray Code';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Subsets II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Unique Binary Search Trees';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Unique Binary Search Trees II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Recover Binary Search Tree';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Triangle';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Best Time to Buy and Sell Stock with Cooldown';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Coin Change';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Increasing Subsequence';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Additive Number';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Range Sum Query 2D - Immutable';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Super Ugly Number';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Remove Duplicate Letters';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Bulb Switcher';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Wiggle Sort II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Increasing Triplet Subsequence';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'House Robber III';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Counting Bits';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Flatten Nested List Iterator';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Integer Break';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Count Numbers with Unique Digits';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Russian Doll Envelopes';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Design Twitter';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sort Characters By Frequency';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Queue Reconstruction by Height';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Arithmetic Slices';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Partition Equal Subset Sum';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Pacific Atlantic Water Flow';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Battleships in a Board';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find Right Interval';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find All Anagrams in a String';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find All Duplicates in an Array';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'String Compression';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Add Two Numbers II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Number of Boomerangs';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Serialize and Deserialize BST';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Delete Node in a BST';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Frequency of the Most Frequent Element';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum ASCII Delete Sum for Two Strings';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Subarray Product Less Than K';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Random Pick with Weight';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Exam Room';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Score of Parentheses';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Mirror Reflection';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Buddy Strings';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Lemonade Change';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'All Nodes Distance K in Binary Tree';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Smallest Subtree with all the Deepest Nodes';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Score After Flipping Matrix';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Advantage Shuffle';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Boats to Save People';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Spiral Matrix III';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Possible Bipartition';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Construct Binary Tree from Preorder and Postorder Traversal';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find and Replace Pattern';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Fruit Into Baskets';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Snakes and Ladders';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Online Stock Span';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'RLE Iterator';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Add to Make Parentheses Valid';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sort Array By Parity';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = '3Sum With Multiplicity';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Shortest Bridge';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Knight Dialer';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reorder Data in Log Files';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Range Sum of BST';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Area Rectangle';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Arithmetic Subsequence';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximum Binary Tree II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Vowel Spellchecker';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Pancake Sorting';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Powerful Integers';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Flip Binary Tree To Match Preorder Traversal';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Interval List Intersections';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Verifying an Alien Dictionary';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Array of Doubled Pairs';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Turbulent Subarray';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Distribute Coins in Binary Tree';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximize Sum Of Array After K Negations';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Clumsy Factorial';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Domino Rotations For Equal Row';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Construct Binary Search Tree from Preorder Traversal';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Prefix Divisible By 5';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Next Greater Node In Linked List';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Partition Array Into Three Parts With Equal Sum';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Best Sightseeing Pair';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary String With Substrings Representing 1 To N';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Implement Trie (Prefix Tree)';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Design Add and Search Words Data Structure';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Word Search II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Map Sum Pairs';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Replace Words';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Top K Frequent Elements';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Kth Largest Element in an Array';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find K Pairs with Smallest Sums';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Kth Smallest Element in a Sorted Matrix';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Split Array into Consecutive Subsequences';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reorganize String';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Cheapest Flights Within K Stops';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Range Module';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Falling Squares';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Rectangle Area II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Count of Range Sum';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reverse Pairs';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Count Items Matching a Rule';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Check if the Sentence Is Pangram';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sum of Unique Elements';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Shuffle String';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Count Good Triplets';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Kth Missing Positive Number';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Matrix Diagonal Sum';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximum Product Difference Between Two Pairs';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Build Array from Permutation';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Concatenation of Array';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Count of Matches in Tournament';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Check if the Sentence Is Pangram';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sorting the Sentence';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'N-Queens';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'N-Queens II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sudoku Solver';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Scramble String';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Dungeon Game';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Best Time to Buy and Sell Stock IV';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Max Points on a Line';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Palindrome Pairs';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Concatenated Words';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Smallest Good Base';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Freedom Trail';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Super Washing Machines';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Student Attendance Record II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'K Inverse Pairs Array';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Course Schedule III';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Cut Off Trees for Golf Event';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = '24 Game';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Stickers to Spell Word';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Redundant Connection II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Cracking the Safe';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Couples Holding Hands';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reaching Points';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Transform to Chessboard';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Basic Calculator III';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Max Chunks To Make Sorted II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sliding Puzzle';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Swim in Rising Water';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Race Car';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Making A Large Island';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sum of Distances in Tree';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Distinct Subsequences II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Number of Music Playlists';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimize Malibu';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Three Equal Parts';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Cat and Mouse';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Number of Atoms';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reach a Number';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Partition to K Equal Sum Subsets';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Shortest Path Visiting All Nodes';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Prime Palindrome';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reconstruct Itinerary';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Largest Component Size by Common Factor';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Least Operators to Express Number';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Tallest Billboard';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Tree Cameras';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Vertical Order Traversal of a Binary Tree';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Triples with Bitwise AND Equal To Zero';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Cost to Merge Stones';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Number of Squareful Arrays';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Stream of Characters';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Duplicate Substring';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Recover a Tree From Preorder Traversal';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Last Stone Weight II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Shortest Common Supersequence';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Parsing A Boolean Expression';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Critical Connections in a Network';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Remove Invalid Parentheses';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'First Missing Positive';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Trapping Rain Water';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Wildcard Matching';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Tree Maximum Path Sum';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Increasing Path in a Matrix';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Palindrome Partitioning II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Word Break II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Regular Expression Matching';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Distinct Subsequences';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Burst Balloons';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Strange Printer';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Create Maximum Number';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Russian Doll Envelopes';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Frog Jump';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Split Array Largest Sum';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Poor Pigs';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Zuma Game';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Remove Boxes';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Super Egg Drop';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Profitable Schemes';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Numbers At Most N Given Digit Set';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Valid Permutations for DI Sequence';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Tallest Billboard';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Cost to Merge Stones';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Number of Squareful Arrays';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Orderly Queue';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reverse Subarray To Maximize Array Value';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Number of Tap to Open to Water a Garden';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Jump Game IV';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reducing Dishes';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Stone Game III';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Max Dot Product of Two Subsequences';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Number of Days to Disconnect Island';
UPDATE problems SET 
                        examples = '[{"input":"arr1 = [2, 3, 6, 7, 9], arr2 = [1, 4, 8, 10], k = 5","output":"6"},{"input":"arr1 = [100, 112, 256, 349, 770], arr2 = [72, 86, 113, 119, 265, 445, 892], k = 7","output":"256"}]'::jsonb, 
                        constraints = '["1 <= N, M <= 10^5","1 <= K <= N + M","0 <= arr1[i], arr2[i] <= 10^9"]'::jsonb, 
                        hints = '["Use two pointers to simulate merge sort steps until you reach the Kth element.","Or use binary search for a more optimal solution."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Kth Element of Two Sorted Arrays';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,2,3,2]","output":"[1,3]"},{"input":"head = [2,1,1,2]","output":"[]"}]'::jsonb, 
                        constraints = '["The number of nodes in the list is in the range [1, 10^5].","-10^5 <= Node.val <= 10^5"]'::jsonb, 
                        hints = '["Use a hash set to store values encountered so far.","If a value is already in the set, skip the current node."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Remove Duplicates from Unsorted Linked List';
UPDATE problems SET 
                        examples = '[{"input":"head = [1,2,3,4,5,6], p = 2","output":"[3,4,5,6,1,2]"},{"input":"head = [1,2,3], p = 1","output":"[2,3,1]"}]'::jsonb, 
                        constraints = '["1 <= N <= 100","1 <= P <= N"]'::jsonb, 
                        hints = '["Similar to singly linked list rotation.","Ensure both next and prev pointers are updated correctly."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Rotate Doubly Linked List';
UPDATE problems SET 
                        examples = '[{"input":"list = [1,2,4,5,6,8,9], target = 7","output":"[[1,6],[2,5]]"},{"input":"list = [1,5,6], target = 6","output":"[[1,5]]"}]'::jsonb, 
                        constraints = '["1 <= N <= 10^4","1 <= x <= 10^9"]'::jsonb, 
                        hints = '["Use two pointers, one at head and one at tail.","Move them towards each other based on sum comparison with x."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Pairs with Given Sum in Doubly Linked List';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Kth Smallest Instructions';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Initial Energy to Finish Tasks';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Check If Two Expression Trees are Equivalent';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimize Deviation in Array';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Delivering Boxes from Storage to Ports';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximum Number of Non-Overlapping Substrings';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Operations to Make a Subsequence';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Number of Restricted Paths From First to Last Node';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximum Score from Performing Multiplication Operations';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Valid Parentheses';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Candy';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Best Time to Buy and Sell Stock III';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximal Rectangle';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Interleaving String';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Word Ledger';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Window Substring';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Text Justification';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Substring with Concatenation of All Words';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reverse Nodes in k-Group';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Merge k Sorted Lists';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Median of Two Sorted Arrays';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sum of Subarray Minimums';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Super Palindromes';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find the Closest Palindrome';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Tag Validator';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Remove Comments';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Special Binary String';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Parse Lisp Expression';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'My Calendar III';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Cherry Pickup';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Self Crossing';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Patching Array';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Create Sorted Array through Instructions';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximize Grid Happiness';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Rank Transform of a Matrix';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximum Height by Stacking Cuboids';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find Minimum in Rotated Sorted Array II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Search in Rotated Sorted Array II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Contains Duplicate III';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Word Search';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Combinations';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Subsets';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Permutations';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Permutations II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Combination Sum';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Combination Sum II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Combination Sum III';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Letter Combinations of a Phone Number';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Generate Parentheses';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Target Sum';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Partition Equal Subset Sum';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Ones and Zeroes';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Coin Change II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Unique Paths';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Unique Paths II';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Path Sum';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Climbing Stairs';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Fibonacci Number';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'N-th Tribonacci Number';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Pascals Triangle';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Count Odd Numbers in an Interval Range';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Average Salary Excluding the Minimum and Maximum Salary';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Lemonade Change';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Largest Perimeter Triangle';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Check if One String Swap Can Make Strings Equal';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sign of the Product of an Array';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Can Make Arithmetic Progression From Sequence';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Happy Number';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find the Difference';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Reshape the Matrix';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Convert Binary Number in a Linked List to Integer';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Middle of the Linked List';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Subtract the Product and Sum of Digits of an Integer';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Richest Customer Wealth';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Thinking About a Matrix';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Verifying an Alien Dictionary';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Decrypt String from Alphabet to Integer Mapping';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'To Lower Case';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Matrix Block Sum';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sum of All Odd Length Subarrays';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Range Sum Query - Immutable';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Sum of Left Leaves';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Binary Tree Paths';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'First Bad Version';
UPDATE problems SET 
                        examples = '[]'::jsonb, 
                        constraints = '[]'::jsonb, 
                        hints = '[]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Guess Number Higher or Lower';
UPDATE problems SET 
                        examples = '[{"input":"a = [3, 4, 1, 9, 56, 7, 9, 12], n = 8, m = 5","output":"6"},{"input":"a = [7, 3, 2, 4, 9, 12, 56], n = 7, m = 3","output":"2"}]'::jsonb, 
                        constraints = '["1 <= N <= 10^5","1 <= A[i] <= 10^9","1 <= M <= N"]'::jsonb, 
                        hints = '["Sort the array.","Use a sliding window of size M to find the minimum difference between A[i+M-1] and A[i]."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Chocolate Distribution Problem';
UPDATE problems SET 
                        examples = '[{"input":"n = 5, s = 12, arr = [1,2,3,7,5]","output":"[2,4]"},{"input":"n = 10, s = 15, arr = [1,2,3,4,5,6,7,8,9,10]","output":"[1,5]"}]'::jsonb, 
                        constraints = '["1 <= N <= 10^5","0 <= A[i] <= 10^9","0 <= S <= 10^9"]'::jsonb, 
                        hints = '["Use a sliding window. Add elements to variable ''currentSum''.","While ''currentSum'' > S, remove elements from the start."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Subarray with Given Sum';
UPDATE problems SET 
                        examples = '[{"input":"A = [10, 5, 2, 7, 1, 9], K = 15","output":"4"},{"input":"A = [-1, 2, 3], K = 6","output":"0"}]'::jsonb, 
                        constraints = '["1 <= N <= 10^5","-10^5 <= A[i] <= 10^5","-10^9 <= K <= 10^9"]'::jsonb, 
                        hints = '["This works for negative numbers too, so simple sliding window won''t work.","Use a HashMap to store the prefix sum and its first occurrence index."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Subarray with Sum K';
UPDATE problems SET 
                        examples = '[{"input":"s = \"ADOBECODEBANC\", t = \"ABC\"","output":"\"BANC\""},{"input":"s = \"a\", t = \"aa\"","output":"\"\""}]'::jsonb, 
                        constraints = '["m == s.length","n == t.length","1 <= m, n <= 10^5","s and t consist of uppercase and lowercase English letters."]'::jsonb, 
                        hints = '["Use a sliding window and two hash maps (or arrays) for frequency.","Expand window to satisfy counts. Shrink to minimize length."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Window Substring';
UPDATE problems SET 
                        examples = '[{"input":"nums = [10,5,2,6], k = 100","output":"8"},{"input":"nums = [1,2,3], k = 0","output":"0"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 3 * 10^4","1 <= nums[i] <= 1000","0 <= k <= 10^6"]'::jsonb, 
                        hints = '["Use a sliding window. Maintain the product of elements in the window.","If product >= k, divide by nums[left] and increment left.","Add (right - left + 1) to the count at each step."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Subarray Product Less Than K';
UPDATE problems SET 
                        examples = '[{"input":"s = \"eceba\", k = 2","output":"3"},{"input":"s = \"aa\", k = 1","output":"2"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 5 * 10^4","0 <= k <= 50"]'::jsonb, 
                        hints = '["Use a sliding window and a hash map to count character frequencies.","If map size > k, shrink the window from the left."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Substring with At Most K Distinct Characters';
UPDATE problems SET 
                        examples = '[{"input":"s = \"cbaebabacd\", p = \"abc\"","output":"[0,6]"},{"input":"s = \"abab\", p = \"ab\"","output":"[0,1,2]"}]'::jsonb, 
                        constraints = '["1 <= s.length, p.length <= 3 * 10^4","s and p consist of lowercase English letters."]'::jsonb, 
                        hints = '["Sliding window of size p.length.","Maintain frequency counts of characters in the window and compare with p."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Find All Anagrams in a String';
UPDATE problems SET 
                        examples = '[{"input":"N = 4, K = 2, Arr = [100, 200, 300, 400]","output":"700"},{"input":"N = 4, K = 4, Arr = [100, 200, 300, 400]","output":"1000"}]'::jsonb, 
                        constraints = '["1 <= K <= N <= 10^5","0 <= Arr[i] <= 10^5"]'::jsonb, 
                        hints = '["Compute sum of first K elements.","Slide the window by one element: subtract the element going out, add the element coming in. Update Max."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Maximum Sum Subarray of Size K';
UPDATE problems SET 
                        examples = '[{"input":"N = 5, A = [-8, 2, 3, -6, 10], K = 2","output":"[-8, 0, -6, -6]"},{"input":"N = 8, A = [12, -1, -7, 8, -15, 30, 16, 28], K = 3","output":"[-1, -1, -7, -15, -15, 0]"}]'::jsonb, 
                        constraints = '["1 <= N <= 10^5","-10^5 <= A[i] <= 10^5","1 <= K <= N"]'::jsonb, 
                        hints = '["Use a Deque to store indices of negative integers in the current window.","Or just a simple queue storing the negative numbers themselves."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'First Negative Integer in Every Window of Size K';
UPDATE problems SET 
                        examples = '[{"input":"A = [1, 2, 1, 3, 4, 2, 3], K = 4","output":"[3, 4, 4, 3]"},{"input":"A = [4, 1, 1], K = 2","output":"[2, 1]"}]'::jsonb, 
                        constraints = '["1 <= K <= N <= 10^5","1 <= A[i] <= 10^5"]'::jsonb, 
                        hints = '["Use a HashMap to store frequency of elements in the current window.","When sliding, decrease count of outgoing element (remove if 0), increase count of incoming. Map size is answer."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Distinct Elements in Window of size K';
UPDATE problems SET 
                        examples = '[{"input":"n = 6, arr = [0900, 0940, 0950, 1100, 1500, 1800], dep = [0910, 1200, 1120, 1130, 1900, 2000]","output":"3"},{"input":"n = 3, arr = [0900, 1100, 1235], dep = [1000, 1200, 1240]","output":"1"}]'::jsonb, 
                        constraints = '["1 <= n <= 50000","0 <= arr[i] <= dep[i] <= 2359"]'::jsonb, 
                        hints = '["Sort both arrival and departure arrays.","Use two pointers. If arrival[i] <= departure[j], we need a platform. Else, a platform is freed."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Minimum Platforms';
UPDATE problems SET 
                        examples = '[{"input":"nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2","output":"6"},{"input":"nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3","output":"10"}]'::jsonb, 
                        constraints = '["1 <= nums.length <= 10^5","nums[i] is either 0 or 1","0 <= k <= nums.length"]'::jsonb, 
                        hints = '["Use a sliding window. Keep track of the number of zeros in the window.","If zeros > k, shrink window from left until zeros <= k."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Max Consecutive Ones III';
UPDATE problems SET 
                        examples = '[{"input":"s1 = \"ab\", s2 = \"eidbaooo\"","output":"true"},{"input":"s1 = \"ab\", s2 = \"eidboaoo\"","output":"false"}]'::jsonb, 
                        constraints = '["1 <= s1.length, s2.length <= 10^4","s1 and s2 consist of lowercase English letters."]'::jsonb, 
                        hints = '["Use a sliding window of size s1.length on s2.","Compare frequency counts of characters."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Permutation in String';
UPDATE problems SET 
                        examples = '[{"input":"s = \"eceba\"","output":"3"},{"input":"s = \"ccaabbb\"","output":"5"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 10^5","s consists of English letters."]'::jsonb, 
                        hints = '["Sliding window with a hash map to count characters.","If map size > 2, shrink window."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Substring with At Most Two Distinct Characters';
UPDATE problems SET 
                        examples = '[{"input":"txt = \"forxxorfxdofr\", pat = \"for\"","output":"3"},{"input":"txt = \"aabaabaa\", pat = \"aaba\"","output":"4"}]'::jsonb, 
                        constraints = '["1 <= txt.length <= 10^5","1 <= pat.length <= txt.length"]'::jsonb, 
                        hints = '["Sliding window of size pat.length.","Compare frequency maps."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Count Occurrences of Anagrams';
UPDATE problems SET 
                        examples = '[{"input":"s = \"ABAB\", k = 2","output":"4"},{"input":"s = \"AABABBA\", k = 1","output":"4"}]'::jsonb, 
                        constraints = '["1 <= s.length <= 10^5","s consists of only uppercase English letters.","0 <= k <= s.length"]'::jsonb, 
                        hints = '["Sliding window. Maintain count of the most frequent character in the window.","Window length - max freq <= k is valid. If > k, shrink."]'::jsonb,
                        approach = NULL,
                        solution = NULL
                        WHERE title = 'Longest Repeating Character Replacement';
