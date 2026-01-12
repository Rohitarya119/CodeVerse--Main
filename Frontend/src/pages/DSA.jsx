"use client";
import { useState, useEffect } from "react";
import { API_BASE_URL } from "@/config";
import axios from "axios";
import { Link, useSearchParams } from "react-router-dom";
import { MagicCard } from "@/components/magic-card";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Progress } from "@/components/ui/progress";
import {
  Search,
  CheckCircle2,
  Circle,
  Building2,
  Brain,
  BookOpen,
  Zap,
  ArrowRight,
  Sparkles,
  Target,
  TrendingUp,
  Clock,
  Star,
  Filter,
  ChevronRight,
  Lock,
  Play,
  Trophy,
  Flame
} from "lucide-react";
const learningModes = [
  {
    id: "self",
    name: "Self Learning",
    icon: BookOpen,
    description: "Practice on your own without AI assistance",
    color: "from-blue-500 to-cyan-500",
    features: ["No hints or guidance", "Full control over learning", "Track your own progress", "Best for revision"]
  },
  {
    id: "ai",
    name: "AI Learning",
    icon: Brain,
    description: "Get real-time AI assistance while solving problems",
    color: "from-purple-500 to-pink-500",
    features: ["Real-time code analysis", "Approach suggestions", "Error detection", "Personalized hints"]
  }
];
const initialDsaPatterns = [
  {
    name: "Two Pointers",
    icon: "\u{1F446}\u{1F446}",
    count: 0,
    solved: 0,
    description: "Use two pointers to traverse array from both ends",
    difficulty: "Easy-Medium",
    gradient: "from-cyan-500/20 to-blue-500/20",
    problems: ["Two Sum II", "3Sum", "Container With Most Water", "Remove Duplicates"]
  },
  {
    name: "Sliding Window",
    icon: "\u{1FA9F}",
    count: 0,
    solved: 0,
    description: "Fixed or variable size window traversal",
    difficulty: "Medium",
    gradient: "from-green-500/20 to-emerald-500/20",
    problems: ["Maximum Sum Subarray", "Longest Substring", "Minimum Window Substring"]
  },
  {
    name: "Fast & Slow Pointers",
    icon: "\u{1F422}\u{1F407}",
    count: 0,
    solved: 0,
    description: "Detect cycles and find middle elements",
    difficulty: "Easy-Medium",
    gradient: "from-yellow-500/20 to-orange-500/20",
    problems: ["Linked List Cycle", "Find Middle", "Happy Number", "Palindrome Linked List"]
  },
  {
    name: "Binary Search",
    icon: "\u{1F50D}",
    count: 0,
    solved: 0,
    description: "Divide and conquer on sorted arrays",
    difficulty: "Easy-Hard",
    gradient: "from-red-500/20 to-pink-500/20",
    problems: ["Search in Rotated Array", "Find Peak Element", "Koko Eating Bananas"]
  },
  {
    name: "BFS/DFS",
    icon: "\u{1F333}",
    count: 0,
    solved: 0,
    description: "Tree and graph traversal techniques",
    difficulty: "Medium-Hard",
    gradient: "from-purple-500/20 to-violet-500/20",
    problems: ["Level Order Traversal", "Number of Islands", "Clone Graph"]
  },
  {
    name: "Dynamic Programming",
    icon: "\u{1F4CA}",
    count: 0,
    solved: 0,
    description: "Break down problems into subproblems",
    difficulty: "Medium-Hard",
    gradient: "from-indigo-500/20 to-blue-500/20",
    problems: ["Climbing Stairs", "Coin Change", "Longest Common Subsequence"]
  },
  {
    name: "Backtracking",
    icon: "\u{1F519}",
    count: 0,
    solved: 0,
    description: "Explore all possibilities with pruning",
    difficulty: "Medium-Hard",
    gradient: "from-pink-500/20 to-rose-500/20",
    problems: ["Permutations", "Subsets", "N-Queens", "Sudoku Solver"]
  },
  {
    name: "Greedy",
    icon: "\u{1F4B0}",
    count: 0,
    solved: 0,
    description: "Make locally optimal choices",
    difficulty: "Easy-Medium",
    gradient: "from-amber-500/20 to-yellow-500/20",
    problems: ["Jump Game", "Gas Station", "Task Scheduler"]
  },
  {
    name: "Monotonic Stack",
    icon: "\u{1F4DA}",
    count: 0,
    solved: 0,
    description: "Maintain sorted order in stack",
    difficulty: "Medium-Hard",
    gradient: "from-teal-500/20 to-cyan-500/20",
    problems: ["Next Greater Element", "Largest Rectangle", "Daily Temperatures"]
  },
  {
    name: "Union Find",
    icon: "\u{1F517}",
    count: 0,
    solved: 0,
    description: "Disjoint set operations",
    difficulty: "Medium-Hard",
    gradient: "from-slate-500/20 to-gray-500/20",
    problems: ["Number of Provinces", "Redundant Connection", "Accounts Merge"]
  },
  {
    name: "Trie",
    icon: "\u{1F524}",
    count: 0,
    solved: 0,
    description: "Prefix tree for string operations",
    difficulty: "Medium",
    gradient: "from-lime-500/20 to-green-500/20",
    problems: ["Implement Trie", "Word Search II", "Design Search Autocomplete"]
  },
  {
    name: "Heap/Priority Queue",
    icon: "\u26F0\uFE0F",
    count: 0,
    solved: 0,
    description: "Maintain top K elements efficiently",
    difficulty: "Medium",
    gradient: "from-orange-500/20 to-red-500/20",
    problems: ["Kth Largest Element", "Merge K Sorted Lists", "Find Median"]
  }
];

// Add detailed explanations for patterns
const patternDetails = {
  "Two Pointers": {
    explanation: "The Two Pointers pattern involves using two pointers to iterate through a data structure, typically an array or linked list, often from different ends or at different speeds. This technique is highly efficient for solving problems involving sorted arrays, finding pairs, or reversing data.",
    keyPoints: [
      "Reduces time complexity from O(n²) to O(n) in many cases.",
      "Commonly used in sorted arrays to find pairs that sum to a target.",
      "Used in string manipulation (e.g., checking palindromes).",
      "Essential for linked list cycle detection (Fast & Slow pointers)."
    ],
    example: "Given a sorted array [1, 2, 3, 4, 6] and target 6, start pointers at 1 (left) and 6 (right). 1+6=7 > 6, so move right pointer left. 1+4=5 < 6, so move left pointer right. 2+4=6 (Found)."
  },
  "Sliding Window": {
    explanation: "The Sliding Window pattern is used to perform an operation on a specific window size of a given array or linked list. It can be a fixed-size window or a dynamic-size window that grows or shrinks based on certain conditions.",
    keyPoints: [
      "Optimizes nested loops (O(n²)) to a single loop (O(n)).",
      "Useful for finding longest/shortest substrings or subarrays satisfying a condition.",
      "Commonly involves a 'start' and 'end' pointer defining the window boundaries.",
      "Requires maintaining state (e.g., sum, count) within the window."
    ],
    example: "Find the max sum of a subarray of size k. Instead of recalculating the sum for every window, subtract the element leaving the window and add the element entering it."
  },
  "Fast & Slow Pointers": {
    explanation: "Also known as the Hare & Tortoise algorithm, this pattern uses two pointers moving at different speeds (usually 1 step vs 2 steps). It is particularly useful for detecting cycles in linked lists or finding the middle element.",
    keyPoints: [
      "Detects cycles in O(n) time and O(1) space.",
      "Finds the middle of a linked list in a single pass.",
      "Used to determine if a number is a 'Happy Number'.",
      "Can identify the start of a cycle in a linked list."
    ],
    example: "To find the middle of a linked list: Move 'slow' one step and 'fast' two steps. When 'fast' reaches the end, 'slow' will be at the middle."
  },
  "Binary Search": {
    explanation: "Binary Search is a divide-and-conquer algorithm used to find an element in a sorted array. It repeatedly divides the search interval in half, reducing the search space exponentially.",
    keyPoints: [
      "Time complexity is O(log n), making it extremely fast.",
      "Requires the dataset to be sorted (or have a monotonic property).",
      "Can be applied to find answers in a range (e.g., Koko Eating Bananas).",
      "Careful handling of boundary conditions (low <= high) is crucial."
    ],
    example: "Searching for 5 in [1, 3, 5, 7, 9]. Mid is 5. Match found immediately."
  },
  // Add defaults for others to avoid errors
  "BFS/DFS": { explanation: "Graph traversal algorithms. BFS explores neighbors level by level (using Queue), while DFS explores as deep as possible (using Stack/Recursion).", keyPoints: ["BFS: Shortest path in unweighted graphs.", "DFS: Path finding, topological sort.", "Both run in O(V+E)."], example: "Level order traversal of a tree uses BFS." },
  "Dynamic Programming": { explanation: "DP solves complex problems by breaking them down into simpler subproblems and storing their solutions (memoization) or building up from base cases (tabulation).", keyPoints: ["Overlapping Subproblems", "Optimal Substructure", "Memoization vs Tabulation"], example: "Fibonacci: F(n) = F(n-1) + F(n-2)." },
  "Backtracking": { explanation: "Backtracking builds candidates for a solution incrementally and abandons a candidate ('backtracks') as soon as it determines that the candidate cannot lead to a valid solution.", keyPoints: ["Explore all possibilities.", "Pruning invalid paths.", "Recursive approach."], example: "N-Queens puzzle, Sudoku solver." },
  "Greedy": { explanation: "Greedy algorithms make the locally optimal choice at each step with the hope of finding a global optimum.", keyPoints: ["Simple and fast.", "Does not always guarantee global optimum.", "Useful for optimization problems."], example: "Activity Selection, Huffman Coding." },
  "Monotonic Stack": { explanation: "A stack that keeps elements sorted (increasing or decreasing). Useful for finding the 'next greater' or 'next smaller' element.", keyPoints: ["O(n) time complexity.", "Maintains monotonic property.", "Next Greater Element problem."], example: "Finding the next warmer day." },
  "Union Find": { explanation: "A data structure that tracks a set of elements partitioned into a number of disjoint (non-overlapping) subsets.", keyPoints: ["Find: Determine which subset an element is in.", "Union: Join two subsets.", "Path compression and rank optimization."], example: "Counting connected components in a graph." },
  "Trie": { explanation: "A tree-like data structure used to store a dynamic set of strings where the keys are usually strings.", keyPoints: ["Efficient prefix search.", "O(L) lookup time where L is word length.", "Used in autocomplete."], example: "Storing a dictionary of words." },
  "Heap/Priority Queue": { explanation: "A specialized tree-based data structure that satisfies the heap property. Useful for efficiently finding the min or max element.", keyPoints: ["Min-Heap vs Max-Heap.", "Insert and Extract-Min/Max in O(log n).", "Top K elements."], example: "Merging K sorted lists." }
};

const topicDetails = {
  "Arrays": {
    explanation: "An array is a collection of items stored at contiguous memory locations. It is one of the most fundamental data structures.",
    keyPoints: ["Fixed size (in many languages).", "O(1) access time by index.", "O(n) insertion/deletion (shifting required).", "Basis for many other structures (ArrayList, Heap, Hash Table)."]
  },
  "Strings": {
    explanation: "A string is a sequence of characters. String manipulation is a very common topic in interviews.",
    keyPoints: ["Immutable in some languages (Java, Python).", "Common operations: Substring, Concatenation, Reverse.", "Pattern matching algorithms (KMP, Rabin-Karp)."]
  },
  "Linked Lists": {
    explanation: "A linear data structure where elements are not stored at contiguous memory locations. The elements are linked using pointers.",
    keyPoints: ["Dynamic size.", "O(1) insertion/deletion if pointer is known.", "O(n) access time.", "Singly vs Doubly Linked Lists."]
  },
  "Trees": {
    explanation: "A hierarchical data structure consisting of nodes connected by edges. The top node is the root.",
    keyPoints: ["Binary Trees, BST, AVL, Red-Black Trees.", "Traversals: Inorder, Preorder, Postorder, Level Order.", "Recursion is key."]
  },
  "Graphs": {
    explanation: "A non-linear data structure consisting of nodes (vertices) and edges. Used to represent networks.",
    keyPoints: ["Directed vs Undirected.", "Weighted vs Unweighted.", "Representations: Adjacency Matrix vs List.", "Traversals: BFS, DFS."]
  },
  "Dynamic Programming": {
    explanation: "A method for solving complex problems by breaking them down into simpler subproblems.",
    keyPoints: ["See Pattern section for more details.", "1D DP vs 2D DP.", "State definition and transition equation."]
  },
  "BFS": {
    explanation: "Breadth-First Search is an algorithm for searching a tree or graph data structure. It starts at the tree root (or some arbitrary node of a graph) and explores all of the neighbor nodes at the present depth prior to moving on to the nodes at the next depth level.",
    keyPoints: ["Uses a Queue.", "Finds shortest path in unweighted graphs.", "Time Complexity: O(V+E)."]
  },
  "DFS": {
    explanation: "Depth-First Search is an algorithm for traversing or searching tree or graph data structures. The algorithm starts at the root node and explores as far as possible along each branch before backtracking.",
    keyPoints: ["Uses a Stack (or recursion).", "Good for path finding, topological sort, cycle detection.", "Time Complexity: O(V+E)."]
  },
  "Binary Search": {
    explanation: "Binary Search is a divide-and-conquer algorithm used to find an element in a sorted array. It repeatedly divides the search interval in half, reducing the search space exponentially.",
    keyPoints: [
      "Time complexity is O(log n), making it extremely fast.",
      "Requires the dataset to be sorted (or have a monotonic property).",
      "Can be applied to find answers in a range (e.g., Koko Eating Bananas).",
      "Careful handling of boundary conditions (low <= high) is crucial."
    ]
  }
};
const initialTopics = [
  { name: "Arrays", count: 0, solved: 0, gradient: "from-cyan-500/20 to-blue-500/20" },
  { name: "Strings", count: 0, solved: 0, gradient: "from-blue-500/20 to-indigo-500/20" },
  { name: "Linked Lists", count: 0, solved: 0, gradient: "from-pink-500/20 to-rose-500/20" },
  { name: "Trees", count: 0, solved: 0, gradient: "from-yellow-500/20 to-orange-500/20" },
  { name: "Graphs", count: 0, solved: 0, gradient: "from-red-500/20 to-rose-500/20" },
  { name: "Dynamic Programming", count: 0, solved: 0, gradient: "from-purple-500/20 to-violet-500/20" }
];
// problems ref removed

const difficultyColors = {
  Easy: "bg-green-500/10 text-green-500 hover:bg-green-500/20",
  Medium: "bg-yellow-500/10 text-yellow-500 hover:bg-yellow-500/20",
  Hard: "bg-red-500/10 text-red-500 hover:bg-red-500/20"
};

// Helper to match problems to patterns
const matchesPattern = (problemTopics, patternName) => {
  if (!problemTopics) return false;

  const patternMapping = {
    "Two Pointers": ["Two Pointers"],
    "Sliding Window": ["Sliding Window"],
    "Fast & Slow Pointers": ["Fast & Slow Pointers", "Linked List", "Cycle"],
    "Binary Search": ["Binary Search"],
    "BFS/DFS": ["BFS", "DFS", "Breadth-First Search", "Depth-First Search", "Tree", "Graph"],
    "Dynamic Programming": ["Dynamic Programming", "DP"],
    "Backtracking": ["Backtracking"],
    "Greedy": ["Greedy"],
    "Monotonic Stack": ["Monotonic Stack", "Stack"],
    "Union Find": ["Union Find", "Disjoint Set"],
    "Trie": ["Trie"],
    "Heap/Priority Queue": ["Heap", "Priority Queue"]
  };

  const targetTopics = patternMapping[patternName];
  if (!targetTopics) return false;

  return problemTopics.some(t => targetTopics.some(tt => t.toLowerCase().includes(tt.toLowerCase())));
};
export default function DSAPage() {
  const [searchParams, setSearchParams] = useSearchParams();
  const selectedMode = searchParams.get("mode");
  const patternParam = searchParams.get("pattern");
  const topicParam = searchParams.get("topic");

  const setSelectedMode = (mode) => {
    const newParams = new URLSearchParams(searchParams);
    if (mode) {
      newParams.set("mode", mode);
    } else {
      newParams.delete("mode");
    }
    setSearchParams(newParams);
  };

  const clearFilters = () => {
    setSearch("");
    setDifficulty("all");
    setPatternFilter("all");
    setSelectedCompany("all");
    setSortBy("frequency");
    setSearchParams({}); // Clear URL params
  };

  /* ----------------------------------------------------------------------------------
     STATE: Sorting, Pagination, Filtering (Company/Difficulty/Search)
     ---------------------------------------------------------------------------------- */
  const [activeTab, setActiveTab] = useState("patterns");
  const [search, setSearch] = useState("");
  const [difficulty, setDifficulty] = useState("all");
  const [patternFilter, setPatternFilter] = useState("all");
  const [selectedCompany, setSelectedCompany] = useState("all");
  const [sortBy, setSortBy] = useState("frequency"); // new: frequency, likes, difficulty, alpha
  const [currentPage, setCurrentPage] = useState(1); // new: pagination
  const itemsPerPage = 10;

  const [expandedPattern, setExpandedPattern] = useState(null);
  const [dsaPatterns, setDsaPatterns] = useState(initialDsaPatterns);
  const [topics, setTopics] = useState(initialTopics);
  const [problems, setProblems] = useState([]);

  // Fetch problems from API
  useEffect(() => {
    const fetchProblems = async () => {
      try {
        const response = await axios.get(`${API_BASE_URL}/api/problems`);
        const allProblems = response.data.map(p => ({
          ...p,
          topics: p.topics || [],
          difficulty: p.difficulty ? (p.difficulty.charAt(0).toUpperCase() + p.difficulty.slice(1).toLowerCase()) : p.difficulty
        }));
        setProblems(allProblems);

        // Update Pattern Counts
        const updatedPatterns = initialDsaPatterns.map(pattern => {
          const matchingProblems = allProblems.filter(p => matchesPattern(p.topics, pattern.name));
          return {
            ...pattern,
            count: matchingProblems.length,
            solved: matchingProblems.filter(p => p.solved).length
          };
        });
        setDsaPatterns(updatedPatterns);

        // Update Topic Counts
        const updatedTopics = initialTopics.map(topic => {
          const matchingProblems = allProblems.filter(p =>
            p.topics && p.topics.some(t => t.toLowerCase() === topic.name.toLowerCase() || t.toLowerCase().includes(topic.name.toLowerCase()))
          );
          return {
            ...topic,
            count: matchingProblems.length,
            solved: matchingProblems.filter(p => p.solved).length
          };
        });
        setTopics(updatedTopics);

      } catch (error) {
        console.error("Error fetching problems:", error);
      }
    };
    fetchProblems();
  }, []);

  // Extract unique companies for dropdown
  const allCompanies = Array.from(new Set(problems.flatMap(p => p.companies || []))).sort();

  // Reset pagination when filters change
  useEffect(() => {
    setVisibleCount(20);
    window.scrollTo(0, 0);
  }, [search, difficulty, patternFilter, selectedCompany, sortBy, patternParam, topicParam]);

  /* ----------------------------------------------------------------------------------
     LOGIC: Filter -> Sort -> Load More
     ---------------------------------------------------------------------------------- */
  const [visibleCount, setVisibleCount] = useState(20);

  const filteredProblems = problems.filter((p) => {
    const matchesSearch = p.title.toLowerCase().includes(search.toLowerCase());
    const matchesDifficulty = difficulty === "all" || p.difficulty === difficulty;
    const matchesCompany = selectedCompany === "all" || (p.companies && p.companies.includes(selectedCompany));

    let contextMatch = true;
    if (patternParam) {
      contextMatch = matchesPattern(p.topics, patternParam);
    } else if (topicParam) {
      contextMatch = p.topic === topicParam;
    } else {
      // Dashboard view: simple pattern filter
      const matchesPatternFilter = patternFilter === "all" || matchesPattern(p.topics, patternFilter) || p.pattern === patternFilter;
      contextMatch = matchesPatternFilter;
    }

    return matchesSearch && matchesDifficulty && matchesCompany && contextMatch;
  });

  const sortedProblems = [...filteredProblems].sort((a, b) => {
    switch (sortBy) {
      case "frequency": // High -> Low
        return (b.frequency || 0) - (a.frequency || 0);
      case "likes": // High -> Low (Likes - Dislikes ratio or raw likes)
        return (b.likes || 0) - (a.likes || 0);
      case "difficulty": // Easy -> Medium -> Hard
        const diffMap = { "Easy": 1, "Medium": 2, "Hard": 3 };
        return (diffMap[a.difficulty] || 0) - (diffMap[b.difficulty] || 0);
      case "alpha": // A -> Z
        return a.title.localeCompare(b.title);
      default:
        return 0;
    }
  });

  const paginatedProblems = sortedProblems.slice(0, visibleCount);

  const handleLoadMore = () => {
    setVisibleCount(prev => prev + 20);
  };

  /* ----------------------------------------------------------------------------------
     SHARED UI COMPONENTS
     ---------------------------------------------------------------------------------- */
  const LoadMoreButton = () => {
    if (visibleCount >= sortedProblems.length) return null;

    return (
      <div className="flex flex-col items-center justify-center gap-2 mt-8">
        <Button
          variant="outline"
          size="lg"
          onClick={handleLoadMore}
          className="min-w-[200px] border-primary/20 hover:bg-primary/5 hover:text-primary transition-all duration-300"
        >
          Load More Problems ({sortedProblems.length - visibleCount} remaining)
        </Button>
        <p className="text-xs text-muted-foreground">
          Showing {visibleCount} of {sortedProblems.length} problems
        </p>
      </div>
    );
  };

  const ProblemListItem = ({ problem }) => (
    <Link to={`/dsa/${problem.id}?mode=${selectedMode}`}>
      <div className="group flex items-center gap-4 rounded-lg border border-border p-4 transition-all duration-300 hover:bg-primary/5 hover:border-primary/30 hover:shadow-lg hover:translate-x-1 bg-card">
        {problem.solved ? (
          <CheckCircle2 className="h-5 w-5 text-green-500 shrink-0" />
        ) : (
          <Circle className="h-5 w-5 text-muted-foreground group-hover:text-primary shrink-0" />
        )}

        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2 mb-1">
            <p className="font-medium truncate group-hover:text-primary transition-colors">{problem.title}</p>
            {/* Hot Badge based on frequency */}
            {problem.frequency > 50 && (
              <Badge variant="secondary" className="bg-orange-500/10 text-orange-500 hover:bg-orange-500/20 text-[10px] px-1 py-0 h-5">
                <Flame className="w-3 h-3 mr-1" /> Hot
              </Badge>
            )}
          </div>

          <div className="flex flex-wrap gap-2 items-center">
            <Badge variant="outline" className={`text-xs ${difficultyColors[problem.difficulty]}`}>
              {problem.difficulty}
            </Badge>

            {/* Stats */}
            <span className="text-xs text-muted-foreground flex items-center gap-1" title="Likes">
              <Star className="h-3 w-3 text-yellow-500" /> {problem.likes || 0}
            </span>
            <span className="text-xs text-muted-foreground flex items-center gap-1" title="Frequency">
              <TrendingUp className="h-3 w-3 text-blue-500" /> {problem.frequency || 0}
            </span>

            {/* Company Tag (First one) */}
            {problem.companies && problem.companies.length > 0 && (
              <span className="text-xs text-muted-foreground flex items-center gap-1 bg-secondary/50 px-1.5 py-0.5 rounded">
                <Building2 className="h-3 w-3" /> {problem.companies[0]}
                {problem.companies.length > 1 && <span className="text-[10px] opacity-70">+{problem.companies.length - 1}</span>}
              </span>
            )}
          </div>
        </div>

        <Button size="sm" variant="ghost" className="opacity-0 group-hover:opacity-100 transition-opacity shrink-0">
          Solve <ArrowRight className="ml-1 h-4 w-4" />
        </Button>
      </div>
    </Link>
  );

  // Render Pattern Detail View
  if (patternParam) {
    const details = patternDetails[patternParam] || { explanation: "Detailed guide coming soon.", keyPoints: [], example: "" };
    const patternInfo = dsaPatterns.find(p => p.name === patternParam);

    return (
      <div className="min-h-[calc(100vh-4rem)] bg-background">
        <main className="">
          <div className="p-6 lg:p-8">
            <Button variant="ghost" onClick={clearFilters} className="mb-4 pl-0 hover:pl-2 transition-all">
              ← Back to Dashboard
            </Button>

            <div className="mb-8">
              {/* Header Section */}
              <div className="flex items-center gap-3 mb-4">
                <div className={`p-3 rounded-xl bg-gradient-to-br ${patternInfo?.gradient || "from-primary/20 to-primary/10"}`}>
                  <span className="text-3xl">{patternInfo?.icon || <Zap className="h-8 w-8 text-primary" />}</span>
                </div>
                <div>
                  <h1 className="text-3xl font-bold">{patternParam}</h1>
                  <p className="text-muted-foreground">Master this pattern to solve complex problems efficiently</p>
                </div>
              </div>

              {/* Concept Card */}
              <Card className="border-border bg-card mb-8">
                <CardHeader>
                  <CardTitle className="flex items-center gap-2">
                    <BookOpen className="h-5 w-5 text-primary" />
                    Concept Explanation
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-6">
                  <p className="text-lg leading-relaxed">{details.explanation}</p>
                  <div className="grid md:grid-cols-2 gap-6">
                    <div className="bg-secondary/50 p-4 rounded-lg">
                      <h3 className="font-semibold mb-3 flex items-center gap-2">
                        <CheckCircle2 className="h-4 w-4 text-green-500" /> Key Takeaways
                      </h3>
                      <ul className="space-y-2">
                        {details.keyPoints.map((point, i) => (
                          <li key={i} className="text-sm text-muted-foreground flex items-start gap-2">
                            <span className="mt-1.5 h-1.5 w-1.5 rounded-full bg-primary flex-shrink-0" />
                            {point}
                          </li>
                        ))}
                      </ul>
                    </div>
                    {details.example && (
                      <div className="bg-secondary/50 p-4 rounded-lg">
                        <h3 className="font-semibold mb-3 flex items-center gap-2">
                          <Sparkles className="h-4 w-4 text-yellow-500" /> Example Scenario
                        </h3>
                        <p className="text-sm text-muted-foreground italic border-l-2 border-primary/30 pl-3 py-1">
                          "{details.example}"
                        </p>
                      </div>
                    )}
                  </div>
                </CardContent>
              </Card>

              {/* Controls Section */}
              <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6">
                <div className="flex items-center gap-2">
                  <h2 className="text-xl font-bold flex items-center gap-2">
                    <Target className="h-5 w-5 text-primary" />
                    Practice Problems
                  </h2>
                  <Badge variant="outline">{filteredProblems.length} Found</Badge>
                </div>

                <div className="flex flex-wrap items-center gap-2">
                  {/* Search */}
                  <div className="relative w-full md:w-48">
                    <Search className="absolute left-2 top-2.5 h-4 w-4 text-muted-foreground" />
                    <Input
                      placeholder="Search problems..."
                      className="pl-8 h-9"
                      value={search}
                      onChange={(e) => setSearch(e.target.value)}
                    />
                  </div>

                  {/* Company Filter */}
                  <Select value={selectedCompany} onValueChange={setSelectedCompany}>
                    <SelectTrigger className="w-[140px] h-9">
                      <div className="flex items-center gap-2 truncate">
                        <Building2 className="h-3.5 w-3.5 text-muted-foreground" />
                        <SelectValue placeholder="Company" />
                      </div>
                    </SelectTrigger>
                    <SelectContent className="max-h-[300px]">
                      <SelectItem value="all">All Companies</SelectItem>
                      {allCompanies.map(c => <SelectItem key={c} value={c}>{c}</SelectItem>)}
                    </SelectContent>
                  </Select>

                  {/* Difficulty Filter */}
                  <Select value={difficulty} onValueChange={setDifficulty}>
                    <SelectTrigger className="w-[110px] h-9">
                      <SelectValue placeholder="Difficulty" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="all">All Levels</SelectItem>
                      <SelectItem value="Easy">Easy</SelectItem>
                      <SelectItem value="Medium">Medium</SelectItem>
                      <SelectItem value="Hard">Hard</SelectItem>
                    </SelectContent>
                  </Select>

                  {/* Sort Filter */}
                  <Select value={sortBy} onValueChange={setSortBy}>
                    <SelectTrigger className="w-[130px] h-9">
                      <div className="flex items-center gap-2">
                        <Filter className="h-3.5 w-3.5 text-muted-foreground" />
                        <SelectValue placeholder="Sort By" />
                      </div>
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="frequency">Most Frequent</SelectItem>
                      <SelectItem value="likes">Most Popular</SelectItem>
                      <SelectItem value="difficulty">Difficulty</SelectItem>
                      <SelectItem value="alpha">A-Z</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
              </div>

              {/* List */}
              <div className="space-y-3">
                {paginatedProblems.map((problem) => (
                  <ProblemListItem key={problem.id} problem={problem} />
                ))}
                {paginatedProblems.length === 0 && (
                  <div className="text-center py-12 text-muted-foreground bg-card/50 rounded-lg border border-dashed">
                    No problems found matching your filters.
                  </div>
                )}
              </div>

              <LoadMoreButton />
            </div>
          </div>
        </main>
      </div>
    );
  }

  // Render Topic Detail View
  if (topicParam) {
    const details = topicDetails[topicParam] || { explanation: "Detailed guide coming soon.", keyPoints: [] };
    const topicInfo = topics.find(t => t.name === topicParam);

    return (
      <div className="min-h-[calc(100vh-4rem)] bg-background animate-fade-in-up">
        <div className="container mx-auto p-6 lg:p-8">
          <Button variant="ghost" onClick={clearFilters} className="mb-4 pl-0 hover:pl-2 transition-all">
            ← Back to Dashboard
          </Button>

          <div className="mb-8">
            <div className="flex items-center gap-3 mb-4">
              <div className={`p-3 rounded-xl bg-gradient-to-br ${topicInfo?.gradient || "from-primary/20 to-primary/10"}`}>
                <Target className="h-8 w-8 text-primary" />
              </div>
              <div>
                <h1 className="text-3xl font-bold">{topicParam}</h1>
                <p className="text-muted-foreground">Deep dive into {topicParam} concepts and problems</p>
              </div>
            </div>

            <Card className="border-border bg-card mb-8">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <BookOpen className="h-5 w-5 text-primary" />
                  Topic Overview
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-6">
                <p className="text-lg leading-relaxed">{details.explanation}</p>
                <div className="bg-secondary/50 p-4 rounded-lg">
                  <h3 className="font-semibold mb-3 flex items-center gap-2">
                    <CheckCircle2 className="h-4 w-4 text-green-500" /> Key Concepts
                  </h3>
                  <div className="grid sm:grid-cols-2 gap-2">
                    {details.keyPoints.map((point, i) => (
                      <div key={i} className="text-sm text-muted-foreground flex items-start gap-2">
                        <span className="mt-1.5 h-1.5 w-1.5 rounded-full bg-primary flex-shrink-0" />
                        {point}
                      </div>
                    ))}
                  </div>
                </div>
              </CardContent>
            </Card>

            {/* Controls */}
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6">
              <div className="flex items-center gap-2">
                <h2 className="text-xl font-bold flex items-center gap-2">
                  <Target className="h-5 w-5 text-primary" />
                  Practice Problems
                </h2>
                <Badge variant="outline">{filteredProblems.length} Found</Badge>
              </div>

              <div className="flex flex-wrap items-center gap-2">
                <div className="relative w-full md:w-48">
                  <Search className="absolute left-2 top-2.5 h-4 w-4 text-muted-foreground" />
                  <Input
                    placeholder="Search problems..."
                    className="pl-8 h-9"
                    value={search}
                    onChange={(e) => setSearch(e.target.value)}
                  />
                </div>
                <Select value={selectedCompany} onValueChange={setSelectedCompany}>
                  <SelectTrigger className="w-[140px] h-9">
                    <div className="flex items-center gap-2 truncate">
                      <Building2 className="h-3.5 w-3.5 text-muted-foreground" />
                      <SelectValue placeholder="Company" />
                    </div>
                  </SelectTrigger>
                  <SelectContent className="max-h-[300px]">
                    <SelectItem value="all">All Companies</SelectItem>
                    {allCompanies.map(c => <SelectItem key={c} value={c}>{c}</SelectItem>)}
                  </SelectContent>
                </Select>
                <Select value={difficulty} onValueChange={setDifficulty}>
                  <SelectTrigger className="w-[110px] h-9">
                    <SelectValue placeholder="Difficulty" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Levels</SelectItem>
                    <SelectItem value="Easy">Easy</SelectItem>
                    <SelectItem value="Medium">Medium</SelectItem>
                    <SelectItem value="Hard">Hard</SelectItem>
                  </SelectContent>
                </Select>
                <Select value={sortBy} onValueChange={setSortBy}>
                  <SelectTrigger className="w-[130px] h-9">
                    <div className="flex items-center gap-2">
                      <Filter className="h-3.5 w-3.5 text-muted-foreground" />
                      <SelectValue placeholder="Sort By" />
                    </div>
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="frequency">Most Frequent</SelectItem>
                    <SelectItem value="likes">Most Popular</SelectItem>
                    <SelectItem value="difficulty">Difficulty</SelectItem>
                    <SelectItem value="alpha">A-Z</SelectItem>
                  </SelectContent>
                </Select>
              </div>
            </div>

            <div className="space-y-3">
              {paginatedProblems.map((problem) => (
                <ProblemListItem key={problem.id} problem={problem} />
              ))}
              {paginatedProblems.length === 0 && (
                <div className="text-center py-12 text-muted-foreground bg-card/50 rounded-lg border border-dashed">
                  No problems found matching your filters.
                </div>
              )}
            </div>

            <PaginationControls />
          </div>
        </div>
      </div>
    );
  }
  if (!selectedMode) {
    return <div className="min-h-[calc(100vh-4rem)] bg-background animate-fade-in-up">
      <div className="container mx-auto p-6 lg:p-8">
        {
          /* Header */
        }
        <div className="mb-8 text-center">
          <h1 className="text-3xl font-bold mb-2">Choose Your Learning Mode</h1>
          <p className="text-muted-foreground">Select how you want to practice DSA today</p>
        </div>

        {
          /* Stats Banner */
        }
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
          {[
            {
              label: "Total Problems",
              value: "500+",
              icon: Target,
              trend: "+15 this week",
              color: "text-blue-500",
              bg: "bg-blue-500/10",
              border: "hover:border-blue-500/50"
            },
            {
              label: "Patterns Mastered",
              value: "4/12",
              icon: Zap,
              trend: "3 in progress",
              color: "text-yellow-500",
              bg: "bg-yellow-500/10",
              border: "hover:border-yellow-500/50"
            },
            {
              label: "Current Streak",
              value: "15 Days",
              icon: Flame,
              trend: "Best: 21 Days",
              color: "text-orange-500",
              bg: "bg-orange-500/10",
              border: "hover:border-orange-500/50"
            },
            {
              label: "Problems Solved",
              value: "142",
              icon: CheckCircle2,
              trend: "Top 5% Global",
              color: "text-green-500",
              bg: "bg-green-500/10",
              border: "hover:border-green-500/50"
            }
          ].map((stat, index) => (
            <Card
              key={stat.label}
              className={`relative overflow-hidden border-border bg-card/50 backdrop-blur-sm transition-all duration-300 hover-lift-premium ${stat.border} group`}
            >
              <div className={`absolute top-0 right-0 p-3 opacity-10 group-hover:opacity-20 transition-opacity duration-300`}>
                <stat.icon className={`h-16 w-16 ${stat.color}`} />
              </div>
              <CardContent className="p-5 relative z-10">
                <div className={`mb-3 inline-flex rounded-lg p-2.5 ${stat.bg} ${stat.color} ring-1 ring-inset ring-black/5`}>
                  <stat.icon className="h-6 w-6" />
                </div>
                <div className="space-y-1">
                  <p className="text-2xl font-bold tracking-tight">{stat.value}</p>
                  <p className="text-sm font-medium text-muted-foreground">{stat.label}</p>
                  <p className={`text-xs font-medium ${stat.color} pt-1 flex items-center gap-1`}>
                    <TrendingUp className="h-3 w-3" />
                    {stat.trend}
                  </p>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>

        {
          /* Mode Selection Cards */
        }
        <div className="grid md:grid-cols-2 gap-6 max-w-4xl mx-auto">
          {learningModes.map((mode) => <Card
            key={mode.id}
            className={`relative overflow-hidden border-border cursor-pointer transition-all duration-500 hover:scale-105 hover:shadow-2xl hover:shadow-primary/20 group`}
            onClick={() => setSelectedMode(mode.id)}
          >
            <div
              className={`absolute inset-0 bg-gradient-to-br ${mode.color} opacity-10 group-hover:opacity-20 transition-opacity duration-500`}
            />
            <CardContent className="p-8 relative z-10">
              <div
                className={`w-16 h-16 rounded-2xl bg-gradient-to-br ${mode.color} flex items-center justify-center mb-6 transition-transform duration-500 group-hover:scale-110 group-hover:rotate-3`}
              >
                <mode.icon className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold mb-2 group-hover:text-primary transition-colors duration-300">
                {mode.name}
              </h3>
              <p className="text-muted-foreground mb-6">{mode.description}</p>
              <ul className="space-y-2 mb-6">
                {mode.features.map((feature) => <li key={feature} className="flex items-center gap-2 text-sm">
                  <CheckCircle2 className="h-4 w-4 text-primary" />
                  {feature}
                </li>)}
              </ul>
              <Button
                className={`w-full bg-gradient-to-r ${mode.color} hover:opacity-90 transition-all duration-300 group-hover:shadow-lg`}
              >
                Start {mode.name}
                <ArrowRight className="ml-2 h-4 w-4 transition-transform duration-300 group-hover:translate-x-1" />
              </Button>
            </CardContent>
          </Card>)}
        </div>

        {
          /* Quick Stats */
        }
        <div className="mt-12 text-center">
          <p className="text-sm text-muted-foreground mb-4">Your Progress This Week</p>
          <div className="flex items-center justify-center gap-8">
            <div>
              <p className="text-3xl font-bold text-primary">23</p>
              <p className="text-xs text-muted-foreground">Problems Solved</p>
            </div>
            <div className="h-12 w-px bg-border" />
            <div>
              <p className="text-3xl font-bold text-green-500">85%</p>
              <p className="text-xs text-muted-foreground">Accuracy</p>
            </div>
            <div className="h-12 w-px bg-border" />
            <div>
              <p className="text-3xl font-bold text-yellow-500">4</p>
              <p className="text-xs text-muted-foreground">Patterns Mastered</p>
            </div>
          </div>
        </div>
      </div>
    </div>;
  }
  return <div className="min-h-[calc(100vh-4rem)] bg-background animate-fade-in-up">
    <div className="container mx-auto p-6 lg:p-8">
      {
        /* Header with Mode Indicator */
      }
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-8">
        <div>
          <div className="flex items-center gap-3 mb-2">
            <Button
              variant="ghost"
              size="sm"
              onClick={() => setSelectedMode(null)}
              className="text-muted-foreground hover:text-foreground"
            >
              ← Change Mode
            </Button>
            <Badge
              className={`bg-gradient-to-r ${selectedMode === "ai" ? "from-purple-500 to-pink-500" : "from-blue-500 to-cyan-500"} text-white`}
            >
              {selectedMode === "ai" ? <>
                <Brain className="h-3 w-3 mr-1" /> AI Learning
              </> : <>
                <BookOpen className="h-3 w-3 mr-1" /> Self Learning
              </>}
            </Badge>
          </div>
          <h1 className="text-2xl font-bold">DSA Practice</h1>
          <p className="text-muted-foreground">
            {selectedMode === "ai" ? "AI will guide you through each problem with real-time assistance" : "Practice on your own and test your skills independently"}
          </p>
        </div>
        <div className="flex items-center gap-2">
          <Badge variant="outline" className="gap-1">
            <TrendingUp className="h-3 w-3" /> 15 Day Streak
          </Badge>
          <Badge variant="outline" className="gap-1">
            <Trophy className="h-3 w-3 text-yellow-500" /> Rank #234
          </Badge>
        </div>
      </div>

      {
        /* Tabs for Patterns, Topics, Problems */
      }
      <Tabs value={activeTab} onValueChange={setActiveTab} className="space-y-6">
        <TabsList className="bg-secondary/50 p-1">
          <TabsTrigger
            value="patterns"
            className="gap-2 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
          >
            <Zap className="h-4 w-4" /> Patterns
          </TabsTrigger>
          <TabsTrigger
            value="topics"
            className="gap-2 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
          >
            <Target className="h-4 w-4" /> Topics
          </TabsTrigger>
          <TabsTrigger
            value="problems"
            className="gap-2 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
          >
            <BookOpen className="h-4 w-4" /> All Problems
          </TabsTrigger>
        </TabsList>

        {
          /* Patterns Tab */
        }
        <TabsContent value="patterns" className="space-y-6">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
            {dsaPatterns.map((p, index) => <MagicCard
              key={p.name}
              className={`group border-border bg-gradient-to-br ${p.gradient} overflow-hidden`}
              style={{ animationDelay: `${index * 0.05}s` }}
              onClick={() => setExpandedPattern(expandedPattern === p.name ? null : p.name)}
            >
              <CardContent className="p-5">
                <div className="flex items-start justify-between mb-3">
                  <span className="text-2xl transition-transform duration-300 group-hover:scale-125">
                    {p.icon}
                  </span>
                  <Badge variant="outline" className="text-xs">
                    {p.difficulty}
                  </Badge>
                </div>
                <h3 className="font-semibold mb-1 group-hover:text-primary transition-colors duration-300">
                  {p.name}
                </h3>
                <p className="text-xs text-muted-foreground mb-3 line-clamp-2">{p.description}</p>
                <div className="flex items-end justify-between mb-2">
                  <span className="text-2xl font-bold group-hover:text-primary transition-colors duration-300">
                    {p.solved}
                  </span>
                  <span className="text-sm text-muted-foreground">/ {p.count}</span>
                </div>
                <Progress value={p.count > 0 ? (p.solved / p.count * 100) : 0} className="h-1.5" />

                {
                  /* Expanded Content */
                }
                <div
                  className={`mt-4 pt-4 border-t border-border/50 transition-all duration-300 ${expandedPattern === p.name ? "opacity-100 max-h-40" : "opacity-0 max-h-0 overflow-hidden"}`}
                >
                  <p className="text-xs text-muted-foreground mb-2">Popular Problems:</p>
                  <div className="space-y-1">
                    {p.problems.slice(0, 3).map((prob) => <Link
                      key={prob.id}
                      to={`/dsa/${prob.id}?mode=${selectedMode}&pattern=${encodeURIComponent(p.name)}`}
                      className="flex items-center gap-2 text-xs hover:text-primary transition-colors"
                      onClick={(e) => e.stopPropagation()}
                    >
                      <Play className="h-3 w-3" /> {prob.title}
                    </Link>)}
                  </div>
                </div>

                <div className="flex items-center justify-between mt-3">
                  <Link to={`/dsa?pattern=${encodeURIComponent(p.name)}&mode=${selectedMode}`}
                    className="text-xs text-primary hover:underline flex items-center gap-1"
                    onClick={(e) => {
                      e.stopPropagation();
                      setDifficulty("all");
                      setSearch("");
                      setSelectedCompany("all");
                      setSortBy("frequency");
                    }}
                  >
                    View all <ChevronRight className="h-3 w-3" />
                  </Link>
                  <span className="text-xs text-muted-foreground">{p.count - p.solved} left</span>
                </div>
              </CardContent>
            </MagicCard>)}
          </div>

          {
            /* Pattern Roadmap */
          }
          <Card className="border-border bg-card/50">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <TrendingUp className="h-5 w-5 text-primary" />
                Recommended Pattern Learning Path
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="flex flex-wrap items-center gap-2">
                {[
                  "Two Pointers",
                  "Sliding Window",
                  "Fast & Slow Pointers",
                  "Binary Search",
                  "BFS/DFS",
                  "Dynamic Programming",
                  "Backtracking"
                ].map((p, i) => <div key={p} className="flex items-center gap-2">
                  <Badge
                    variant={i < 3 ? "default" : "outline"}
                    className={`${i < 3 ? "bg-primary" : ""} transition-all duration-300 hover:scale-105 cursor-pointer`}
                    onClick={() => {
                      setPatternFilter(p);
                      setActiveTab("problems");
                    }}
                  >
                    {i < 3 && <CheckCircle2 className="h-3 w-3 mr-1" />}
                    {i === 3 && <Clock className="h-3 w-3 mr-1 animate-pulse" />}
                    {i > 3 && <Lock className="h-3 w-3 mr-1" />}
                    {p}
                  </Badge>
                  {i < 6 && <ArrowRight className="h-4 w-4 text-muted-foreground" />}
                </div>)}
              </div>
            </CardContent>
          </Card>
        </TabsContent>

        {
          /* Topics Tab */
        }
        <TabsContent value="topics" className="space-y-6">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {topics.map((topic, index) => <Link key={topic.name} to={`/dsa?topic=${topic.name}&mode=${selectedMode}`}>
              <Card
                className={`group border-border bg-gradient-to-br ${topic.gradient} hover:from-opacity-30 hover:to-opacity-30 transition-all duration-500 hover:scale-105 hover:shadow-2xl hover:shadow-primary/10 hover:border-primary/30 cursor-pointer`}
                style={{ animationDelay: `${index * 0.1}s` }}
              >
                <CardContent className="p-6">
                  <div className="flex items-center justify-between">
                    <h3 className="font-semibold transition-colors duration-300 group-hover:text-primary">
                      {topic.name}
                    </h3>
                    <ArrowRight className="h-4 w-4 transition-all duration-300 group-hover:translate-x-2 group-hover:text-primary" />
                  </div>
                  <div className="mt-4">
                    <div className="flex items-end justify-between">
                      <span className="text-3xl font-bold transition-all duration-300 group-hover:scale-110 group-hover:text-primary">
                        {topic.solved}
                      </span>
                      <span className="text-sm text-muted-foreground">/ {topic.count}</span>
                    </div>
                    <div className="mt-2 h-2 overflow-hidden rounded-full bg-background/50">
                      <div
                        className="h-full rounded-full bg-primary transition-all duration-500 group-hover:shadow-lg group-hover:shadow-primary/50"
                        style={{ width: `${topic.solved / topic.count * 100}%` }}
                      />
                    </div>
                  </div>
                </CardContent>
              </Card>
            </Link>)}
          </div>
        </TabsContent>

        {
          /* All Problems Tab */
        }
        <TabsContent value="problems" className="space-y-6">
          <Card className="border-border bg-card">
            <CardHeader className="flex flex-col gap-4">
              <div className="flex items-center justify-between">
                <CardTitle className="flex items-center gap-2">
                  <BookOpen className="h-5 w-5" />
                  All Problems
                </CardTitle>
              </div>

              <div className="flex flex-col sm:flex-row gap-4 w-full md:w-auto">
                <div className="relative w-full sm:w-64">
                  <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                  <Input
                    placeholder="Search problems..."
                    value={search}
                    onChange={(e) => setSearch(e.target.value)}
                    className="pl-9 bg-secondary/50 border-white/10 transition-all duration-300 focus:ring-2 focus:ring-primary/50 focus:border-primary hover:border-primary/50"
                  />
                </div>
                <Select value={difficulty} onValueChange={setDifficulty}>
                  <SelectTrigger className="w-full sm:w-40 bg-secondary/50 border-white/10 transition-all duration-300 hover:border-primary/50">
                    <SelectValue placeholder="Difficulty" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Difficulties</SelectItem>
                    <SelectItem value="Easy">Easy</SelectItem>
                    <SelectItem value="Medium">Medium</SelectItem>
                    <SelectItem value="Hard">Hard</SelectItem>
                  </SelectContent>
                </Select>
                <Select value={selectedCompany} onValueChange={setSelectedCompany}>
                  <SelectTrigger className="w-full sm:w-48 bg-secondary/50 border-white/10 transition-all duration-300 hover:border-primary/50">
                    <Building2 className="h-4 w-4 mr-2" />
                    <SelectValue placeholder="Company" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Companies</SelectItem>
                    {allCompanies.map((c) => <SelectItem key={c} value={c}>
                      {c}
                    </SelectItem>)}
                  </SelectContent>
                </Select>
              </div>
            </CardHeader>
            <CardContent>
              <Tabs defaultValue="all" className="space-y-8">
                <TabsList className="grid w-full grid-cols-2 lg:w-[400px] p-1 bg-secondary/50 border border-white/10">
                  <TabsTrigger value="patterns" className="data-[state=active]:bg-primary data-[state=active]:text-primary-foreground transition-all duration-300">
                    <Target className="w-4 h-4 mr-2" />
                    Patterns
                  </TabsTrigger>
                  <TabsTrigger value="all" className="data-[state=active]:bg-primary data-[state=active]:text-primary-foreground transition-all duration-300">
                    <Filter className="w-4 h-4 mr-2" />
                    All Problems
                  </TabsTrigger>
                </TabsList>

                <TabsContent value="patterns" className="space-y-8 mt-6">
                  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                    {dsaPatterns.map((pattern, index) => (
                      <div
                        key={pattern.name}
                        onClick={() => {
                          const newParams = new URLSearchParams(searchParams);
                          newParams.set("pattern", pattern.name);
                          setSearchParams(newParams);
                          setDifficulty("all");
                          setSearch("");
                          setSelectedCompany("all");
                          setSortBy("frequency");
                        }}
                        className="cursor-pointer group relative"
                        style={{ animationDelay: `${index * 0.05}s` }}
                      >
                        <div className={`absolute inset-0 bg-gradient-to-br ${pattern.gradient} opacity-0 group-hover:opacity-100 transition-opacity duration-500 rounded-xl blur-xl -z-10`} />
                        <MagicCard
                          className="h-full overflow-hidden border-white/10 bg-black/40 backdrop-blur-md hover:scale-[1.02] transition-transform duration-300"
                          gradientColor={"#262626"}
                        >
                          <div className="p-6 space-y-4">
                            <div className="flex justify-between items-start">
                              <div className={`p-3 rounded-xl bg-gradient-to-br ${pattern.gradient} bg-opacity-20`}>
                                <span className="text-2xl">{pattern.icon}</span>
                              </div>
                              <Badge variant="outline" className="bg-background/50 backdrop-blur border-white/10">
                                {pattern.count} Questions
                              </Badge>
                            </div>

                            <div>
                              <h3 className="font-bold text-lg group-hover:text-primary transition-colors">{pattern.name}</h3>
                              <p className="text-sm text-muted-foreground line-clamp-2 mt-1">{pattern.description}</p>
                            </div>

                            <div className="space-y-2">
                              <div className="flex justify-between text-xs text-muted-foreground">
                                <span>Progress</span>
                                <span>{pattern.solved} / {pattern.count}</span>
                              </div>
                              <Progress value={pattern.count > 0 ? (pattern.solved / pattern.count) * 100 : 0} className="h-1.5 bg-secondary" />
                            </div>

                            <div className="pt-2 flex flex-wrap gap-2">
                              {pattern.problems.slice(0, 2).map((prob, i) => (
                                <span key={i} className="text-[10px] px-2 py-1 rounded-full bg-secondary/50 border border-white/5 text-muted-foreground whitespace-nowrap">
                                  {prob}
                                </span>
                              ))}
                              {pattern.problems.length > 2 && (
                                <span className="text-[10px] px-2 py-1 rounded-full bg-secondary/50 border border-white/5 text-muted-foreground">
                                  +{pattern.problems.length - 2}
                                </span>
                              )}
                            </div>
                          </div>
                        </MagicCard>
                      </div>
                    ))}
                  </div>
                </TabsContent>

                <TabsContent value="all">
                  <div className="space-y-4">
                    {paginatedProblems.map((problem, index) => (
                      <Link key={problem.id} to={`/dsa/${problem.id}?mode=${selectedMode}`}>
                        <div
                          className="group flex items-center gap-4 rounded-xl border border-white/10 bg-black/20 p-4 transition-all duration-300 hover:bg-white/5 hover:border-primary/30 hover:translate-x-1"
                        >
                          {problem.solved ? (
                            <CheckCircle2 className="h-5 w-5 text-green-500" />
                          ) : (
                            <Circle className="h-5 w-5 text-muted-foreground group-hover:text-primary transition-colors" />
                          )}
                          <div className="flex-1">
                            <h4 className="font-medium group-hover:text-primary transition-colors">{problem.title}</h4>
                            <div className="flex flex-wrap gap-2 mt-2">
                              <Badge variant="secondary" className="text-xs bg-secondary/50">{problem.topic}</Badge>
                              <Badge variant="outline" className={`text-xs ${difficultyColors[problem.difficulty]}`}>{problem.difficulty}</Badge>
                              {problem.companies && problem.companies.slice(0, 2).map((c, i) => (
                                <Badge key={i} variant="outline" className="text-xs border-blue-500/20 text-blue-400 flex items-center gap-1">
                                  <Building2 className="h-3 w-3" /> {c}
                                </Badge>
                              ))}
                              {problem.frequency > 80 && (
                                <Badge variant="outline" className="text-xs border-yellow-500/20 text-yellow-500 flex items-center gap-1">
                                  <TrendingUp className="h-3 w-3" /> Hot
                                </Badge>
                              )}
                            </div>
                          </div>
                          <ChevronRight className="h-5 w-5 text-muted-foreground opacity-0 group-hover:opacity-100 transition-all -translate-x-2 group-hover:translate-x-0" />
                        </div>
                      </Link>
                    ))}
                  </div>
                  <LoadMoreButton />
                </TabsContent>
              </Tabs>
            </CardContent>

          </Card>
        </TabsContent>
      </Tabs>

      {
        /* AI Mode Floating Helper (only in AI mode) */
      }
      {selectedMode === "ai" && <div className="fixed bottom-6 right-6 z-50">
        <Button
          size="lg"
          className="rounded-full bg-gradient-to-r from-purple-500 to-pink-500 hover:from-purple-600 hover:to-pink-600 shadow-xl hover:shadow-2xl hover:shadow-purple-500/30 transition-all duration-300 hover:scale-110 gap-2"
        >
          <Sparkles className="h-5 w-5 animate-pulse" />
          Ask AI
        </Button>
      </div>}
    </div>
  </div>;
}
