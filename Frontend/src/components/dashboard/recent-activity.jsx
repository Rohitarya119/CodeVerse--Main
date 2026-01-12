"use client";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { CheckCircle2, Clock, Swords, BookOpen, Target, Trophy, ArrowRight, Brain } from "lucide-react";
import { Link } from "react-router-dom";
const activities = [
  {
    type: "solved",
    title: "Two Sum",
    subtitle: "Arrays & Hashing",
    difficulty: "Easy",
    time: "2 hours ago",
    icon: CheckCircle2,
    xp: 50
  },
  {
    type: "battle",
    title: "Won Battle vs @coder123",
    subtitle: "3 rounds, 2 wins",
    difficulty: null,
    time: "5 hours ago",
    icon: Swords,
    xp: 100
  },
  {
    type: "aptitude",
    title: "Completed Quantitative Quiz",
    subtitle: "8/10 correct",
    difficulty: null,
    time: "6 hours ago",
    icon: Target,
    xp: 30
  },
  {
    type: "solved",
    title: "Binary Tree Level Order",
    subtitle: "Trees",
    difficulty: "Medium",
    time: "Yesterday",
    icon: CheckCircle2,
    xp: 75
  },
  {
    type: "handbook",
    title: "Read: Python Functions",
    subtitle: "Handbook Chapter 3",
    difficulty: null,
    time: "Yesterday",
    icon: BookOpen,
    xp: 20
  },
  {
    type: "solved",
    title: "LRU Cache",
    subtitle: "Design",
    difficulty: "Hard",
    time: "Yesterday",
    icon: CheckCircle2,
    xp: 150
  },
  {
    type: "achievement",
    title: "Earned: Speed Demon Badge",
    subtitle: "Solved 5 problems in 1 hour",
    difficulty: null,
    time: "2 days ago",
    icon: Trophy,
    xp: 200
  },
  {
    type: "battle",
    title: "Lost Battle vs @prodev",
    subtitle: "3 rounds, 1 win",
    difficulty: null,
    time: "2 days ago",
    icon: Swords,
    xp: 25
  }
];
const difficultyColors = {
  Easy: "bg-green-500/10 text-green-500",
  Medium: "bg-yellow-500/10 text-yellow-500",
  Hard: "bg-red-500/10 text-red-500"
};
const typeColors = {
  solved: { bg: "bg-green-500/10", icon: "text-green-500" },
  battle: { bg: "bg-purple-500/10", icon: "text-purple-500" },
  aptitude: { bg: "bg-blue-500/10", icon: "text-blue-500" },
  handbook: { bg: "bg-cyan-500/10", icon: "text-cyan-500" },
  achievement: { bg: "bg-yellow-500/10", icon: "text-yellow-500" }
};
export function RecentActivity() {
  const totalXP = activities.reduce((sum, a) => sum + a.xp, 0);
  return <Card className="border-border bg-card transition-all hover:border-primary/30 hover:shadow-lg hover:shadow-primary/5">
      <CardHeader className="flex flex-row items-center justify-between pb-2">
        <CardTitle className="flex items-center gap-2 text-lg">
          <Brain className="h-5 w-5 text-primary" />
          Recent Activity
        </CardTitle>
        <Badge variant="secondary" className="bg-primary/10 text-primary">
          +{totalXP} XP this week
        </Badge>
      </CardHeader>
      <CardContent>
        <div className="space-y-3 max-h-[400px] overflow-y-auto pr-2">
          {activities.map((activity, i) => {
    const colors = typeColors[activity.type];
    return <div
      key={i}
      className="group flex items-center gap-4 rounded-lg border border-transparent p-3 transition-all duration-300 hover:border-primary/20 hover:bg-primary/5 cursor-pointer"
    >
                <div className={`rounded-lg p-2 transition-all duration-300 ${colors.bg} group-hover:scale-110`}>
                  <activity.icon className={`h-4 w-4 transition-all duration-300 ${colors.icon}`} />
                </div>
                <div className="flex-1 min-w-0">
                  <p className="font-medium truncate group-hover:text-primary transition-colors">{activity.title}</p>
                  <div className="flex items-center gap-2 text-xs text-muted-foreground">
                    <span className="truncate">{activity.subtitle}</span>
                    <span>•</span>
                    <Clock className="h-3 w-3 flex-shrink-0" />
                    <span className="flex-shrink-0">{activity.time}</span>
                  </div>
                </div>
                <div className="flex items-center gap-2 flex-shrink-0">
                  {activity.difficulty && <Badge
      variant="secondary"
      className={difficultyColors[activity.difficulty]}
    >
                      {activity.difficulty}
                    </Badge>}
                  <span className="text-xs font-medium text-primary opacity-0 group-hover:opacity-100 transition-opacity">
                    +{activity.xp} XP
                  </span>
                </div>
              </div>;
  })}
        </div>

        <Button
    variant="outline"
    className="w-full mt-4 group hover:border-primary hover:bg-primary/5 bg-transparent"
    asChild
  >
          <Link to="/profile">
            View Full History
            <ArrowRight className="ml-2 h-4 w-4 transition-transform group-hover:translate-x-1" />
          </Link>
        </Button>
      </CardContent>
    </Card>;
}
