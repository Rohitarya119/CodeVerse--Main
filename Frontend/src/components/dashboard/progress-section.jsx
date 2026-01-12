"use client";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { TrendingUp, ArrowRight, ChevronUp, ChevronDown } from "lucide-react";
import { Link } from "react-router-dom";
export function ProgressSection({ stats = { easySolved: 0, mediumSolved: 0, hardSolved: 0 } }) {
  const difficultyTopics = [
    { name: "Easy", solved: stats.easySolved || 0, total: 50, color: "bg-green-500", trend: "same", change: 0 },
    { name: "Medium", solved: stats.mediumSolved || 0, total: 100, color: "bg-yellow-500", trend: "same", change: 0 },
    { name: "Hard", solved: stats.hardSolved || 0, total: 30, color: "bg-red-500", trend: "same", change: 0 }
  ];

  const totalSolved = difficultyTopics.reduce((sum, t) => sum + t.solved, 0);
  const totalProblems = difficultyTopics.reduce((sum, t) => sum + t.total, 0);

  return <Card className="border-border bg-card transition-all hover:border-primary/30 hover:shadow-lg hover:shadow-primary/5">
      <CardHeader className="pb-2">
        <CardTitle className="flex items-center justify-between text-lg">
          <span className="flex items-center gap-2">
            <TrendingUp className="h-5 w-5 text-primary" />
            Problem Difficulty
          </span>
          <span className="text-sm font-normal text-muted-foreground">
            {totalSolved} Solved
          </span>
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="space-y-4">
          {difficultyTopics.map((topic) => {
    const percentage = topic.total > 0 ? Math.round((topic.solved / topic.total) * 100) : 0;
    return <div
      key={topic.name}
      className="group cursor-pointer rounded-lg p-2 -mx-2 transition-all duration-300 hover:bg-primary/5"
    >
                <div className="mb-1.5 flex items-center justify-between text-sm">
                  <span className="font-medium group-hover:text-primary transition-colors">{topic.name}</span>
                  <div className="flex items-center gap-2">
                    <span className="text-muted-foreground mr-2">
                      {topic.solved} solved
                    </span>
                    {topic.trend === "up" && <span className="flex items-center text-xs text-green-500">
                        <ChevronUp className="h-3 w-3" />
                        {topic.change}
                      </span>}
                    {topic.trend === "down" && <span className="flex items-center text-xs text-red-500">
                        <ChevronDown className="h-3 w-3" />
                        {topic.change}
                      </span>}
                  </div>
                </div>
                <div className="relative h-2 overflow-hidden rounded-full bg-secondary">
                  <div
      className={`h-full rounded-full ${topic.color} transition-all duration-500 group-hover:shadow-lg`}
      style={{ width: `${percentage}%` }}
    />
                  {
      /* Animated shine effect on hover */
    }
                  <div className="absolute inset-0 -translate-x-full bg-gradient-to-r from-transparent via-white/20 to-transparent transition-transform duration-700 group-hover:translate-x-full" />
                </div>
                <p className="mt-1 text-xs text-muted-foreground text-right">{percentage}% of goal</p>
              </div>;
  })}
        </div>

        <Button
    variant="outline"
    className="w-full mt-4 group hover:border-primary hover:bg-primary/5 bg-transparent"
    asChild
  >
          <Link to="/dsa">
            Practice More
            <ArrowRight className="ml-2 h-4 w-4 transition-transform group-hover:translate-x-1" />
          </Link>
        </Button>
      </CardContent>
    </Card>;
}
