"use client";
import { useState } from "react";
import { Link } from "react-router-dom";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Search, CheckCircle2, Circle, Building2 } from "lucide-react";
const problems = [
  {
    id: 1,
    title: "Two Sum",
    difficulty: "Easy",
    topic: "Arrays",
    solved: true,
    companies: ["Google", "Amazon", "Meta"]
  },
  {
    id: 2,
    title: "Add Two Numbers",
    difficulty: "Medium",
    topic: "Linked Lists",
    solved: true,
    companies: ["Microsoft", "Amazon"]
  },
  {
    id: 3,
    title: "Longest Substring Without Repeating Characters",
    difficulty: "Medium",
    topic: "Strings",
    solved: false,
    companies: ["Google", "Apple"]
  },
  {
    id: 4,
    title: "Median of Two Sorted Arrays",
    difficulty: "Hard",
    topic: "Arrays",
    solved: false,
    companies: ["Google", "Meta"]
  },
  {
    id: 5,
    title: "Longest Palindromic Substring",
    difficulty: "Medium",
    topic: "Dynamic Programming",
    solved: true,
    companies: ["Amazon", "Microsoft"]
  },
  {
    id: 6,
    title: "Container With Most Water",
    difficulty: "Medium",
    topic: "Arrays",
    solved: false,
    companies: ["Adobe", "Apple"]
  },
  {
    id: 7,
    title: "Valid Parentheses",
    difficulty: "Easy",
    topic: "Stacks",
    solved: true,
    companies: ["Google", "Meta"]
  },
  {
    id: 8,
    title: "Merge Two Sorted Lists",
    difficulty: "Easy",
    topic: "Linked Lists",
    solved: true,
    companies: ["Amazon", "Microsoft"]
  }
];
const difficultyColors = {
  Easy: "bg-green-500/10 text-green-500 hover:bg-green-500/20",
  Medium: "bg-yellow-500/10 text-yellow-500 hover:bg-yellow-500/20",
  Hard: "bg-red-500/10 text-red-500 hover:bg-red-500/20"
};
export function ProblemList() {
  const [search, setSearch] = useState("");
  const [difficulty, setDifficulty] = useState("all");
  const [topic, setTopic] = useState("all");
  const filteredProblems = problems.filter((p) => {
    const matchesSearch = p.title.toLowerCase().includes(search.toLowerCase());
    const matchesDifficulty = difficulty === "all" || p.difficulty === difficulty;
    const matchesTopic = topic === "all" || p.topic === topic;
    return matchesSearch && matchesDifficulty && matchesTopic;
  });
  return <Card className="border-border bg-card">
      <CardHeader>
        <CardTitle>Problems</CardTitle>
        <div className="mt-4 flex flex-col gap-4 sm:flex-row">
          <div className="relative flex-1 group">
            <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground transition-colors duration-300 group-focus-within:text-primary" />
            <Input
    placeholder="Search problems..."
    value={search}
    onChange={(e) => setSearch(e.target.value)}
    className="pl-9 bg-secondary transition-all duration-300 focus:ring-2 focus:ring-primary/50 focus:border-primary hover:border-primary/50"
  />
          </div>
          <Select value={difficulty} onValueChange={setDifficulty}>
            <SelectTrigger className="w-full sm:w-40 bg-secondary transition-all duration-300 hover:border-primary/50">
              <SelectValue placeholder="Difficulty" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All Difficulties</SelectItem>
              <SelectItem value="Easy">Easy</SelectItem>
              <SelectItem value="Medium">Medium</SelectItem>
              <SelectItem value="Hard">Hard</SelectItem>
            </SelectContent>
          </Select>
          <Select value={topic} onValueChange={setTopic}>
            <SelectTrigger className="w-full sm:w-40 bg-secondary transition-all duration-300 hover:border-primary/50">
              <SelectValue placeholder="Topic" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All Topics</SelectItem>
              <SelectItem value="Arrays">Arrays</SelectItem>
              <SelectItem value="Strings">Strings</SelectItem>
              <SelectItem value="Linked Lists">Linked Lists</SelectItem>
              <SelectItem value="Dynamic Programming">DP</SelectItem>
              <SelectItem value="Stacks">Stacks</SelectItem>
            </SelectContent>
          </Select>
        </div>
      </CardHeader>
      <CardContent>
        <div className="space-y-2">
          {filteredProblems.map((problem, index) => <Link key={problem.id} to={`/dsa/${problem.id}`}>
              <div
    className="group flex items-center gap-4 rounded-lg border border-border p-4 transition-all duration-300 hover:bg-primary/5 hover:border-primary/30 hover:shadow-lg hover:shadow-primary/5 hover:translate-x-1 cursor-pointer"
    style={{ animationDelay: `${index * 0.05}s` }}
  >
                {problem.solved ? <CheckCircle2 className="h-5 w-5 text-green-500 transition-transform duration-300 group-hover:scale-110" /> : <Circle className="h-5 w-5 text-muted-foreground transition-all duration-300 group-hover:text-primary group-hover:scale-110" />}
                <div className="flex-1">
                  <p className="font-medium transition-colors duration-300 group-hover:text-primary">{problem.title}</p>
                  <div className="mt-1 flex items-center gap-2">
                    <Badge
    variant="secondary"
    className="text-xs transition-colors duration-300 group-hover:bg-primary/20"
  >
                      {problem.topic}
                    </Badge>
                    <div className="flex items-center gap-1 text-xs text-muted-foreground">
                      <Building2 className="h-3 w-3" />
                      {problem.companies.slice(0, 2).join(", ")}
                      {problem.companies.length > 2 && ` +${problem.companies.length - 2}`}
                    </div>
                  </div>
                </div>
                <Badge
    className={`transition-all duration-300 ${difficultyColors[problem.difficulty]}`}
  >
                  {problem.difficulty}
                </Badge>
              </div>
            </Link>)}
        </div>
      </CardContent>
    </Card>;
}
