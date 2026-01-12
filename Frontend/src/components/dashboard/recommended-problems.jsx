"use client";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Sparkles, ArrowRight, Flame, Building2 } from "lucide-react";
import { Link } from "react-router-dom";
const problems = [
  {
    id: 1,
    title: "Longest Substring Without Repeating",
    difficulty: "Medium",
    topic: "Strings",
    reason: "Based on your weak areas",
    company: "Amazon",
    hot: true
  },
  {
    id: 2,
    title: "Binary Tree Maximum Path Sum",
    difficulty: "Hard",
    topic: "Trees",
    reason: "Frequently asked",
    company: "Google",
    hot: false
  },
  {
    id: 3,
    title: "Coin Change",
    difficulty: "Medium",
    topic: "DP",
    reason: "Continue your DP journey",
    company: "Microsoft",
    hot: true
  }
];
const difficultyColors = {
  Easy: "bg-green-500/10 text-green-500",
  Medium: "bg-yellow-500/10 text-yellow-500",
  Hard: "bg-red-500/10 text-red-500"
};
export function RecommendedProblems() {
  return (
    <Card className="border-border bg-card hover-lift-premium h-full">
      <CardHeader className="pb-2">
        <CardTitle className="flex items-center gap-2 text-lg">
          <Sparkles className="h-5 w-5 text-primary" />
          AI Recommended
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="space-y-3">
          {problems.map((problem) => (
            <Link
              key={problem.id}
              to={`/dsa/${problem.id}`}
              className="group block rounded-lg border border-border p-3 transition-all duration-300 hover:border-primary/30 hover:bg-primary/5 hover:translate-x-1"
            >
              <div className="flex items-start justify-between mb-2">
                <div className="flex-1">
                  <div className="flex items-center gap-2">
                    <h4 className="font-medium text-sm group-hover:text-primary transition-colors line-clamp-1">
                      {problem.title}
                    </h4>
                    {problem.hot && <Flame className="h-4 w-4 text-orange-500 animate-pulse" />}
                  </div>
                  <p className="text-xs text-muted-foreground mt-1">{problem.reason}</p>
                </div>
                <ArrowRight className="h-4 w-4 text-muted-foreground transition-all group-hover:text-primary group-hover:translate-x-1" />
              </div>

              <div className="flex items-center gap-2 flex-wrap">
                <Badge variant="secondary" className={difficultyColors[problem.difficulty]}>
                  {problem.difficulty}
                </Badge>
                <Badge variant="outline" className="text-xs">
                  {problem.topic}
                </Badge>
                <Badge variant="outline" className="text-xs flex items-center gap-1">
                  <Building2 className="h-3 w-3" />
                  {problem.company}
                </Badge>
              </div>
            </Link>
          ))}
        </div>

        <Button
          variant="outline"
          className="w-full mt-4 group hover:border-primary hover:bg-primary/5 bg-transparent"
          asChild
        >
          <Link to="/dsa">
            Browse All Problems
            <ArrowRight className="h-4 w-4 ml-2 transition-transform group-hover:translate-x-1" />
          </Link>
        </Button>
      </CardContent>
    </Card>
  );
}
