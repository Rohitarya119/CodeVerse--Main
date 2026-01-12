UPDATE problems 
SET topics = topics || '["Fast & Slow Pointers"]'::jsonb
WHERE title IN (
    'Middle of the Linked List',
    'Remove Nth Node From End of List',
    'Happy Number',
    'Palindrome Linked List',
    'Reorder List',
    'Intersection of Two Linked Lists',
    'Check if Linked List is Circular',
    'Find the Duplicate Number',
    'Circular Array Loop',
    'Linked List Cycle',
    'Linked List Cycle II',
    'Detect Loop',
    'Find Loop Starting Point',
    'Remove Loop'
) AND NOT (topics @> '["Fast & Slow Pointers"]'::jsonb);
