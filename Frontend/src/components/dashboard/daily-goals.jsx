"use client";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { CheckCircle2, Circle, Target, Plus } from "lucide-react";
import { useState } from "react";
const initialGoals = [
  { id: 1, title: "Solve 2 DSA Problems", completed: true, xp: 50 },
  { id: 2, title: "Complete 1 Aptitude Quiz", completed: true, xp: 30 },
  { id: 3, title: "Practice 1 Mock Interview", completed: false, xp: 100 },
  { id: 4, title: "Read a Handbook Chapter", completed: false, xp: 20 },
  { id: 5, title: "Win a Battle Arena Match", completed: false, xp: 75 }
];
export function DailyGoals() {
  const [goals, setGoals] = useState(initialGoals);
  const completedCount = goals.filter((g) => g.completed).length;
  const totalXP = goals.filter((g) => g.completed).reduce((sum, g) => sum + g.xp, 0);
  const potentialXP = goals.reduce((sum, g) => sum + g.xp, 0);
  const toggleGoal = (id) => {
    setGoals(goals.map((g) => g.id === id ? { ...g, completed: !g.completed } : g));
  };
  return (
    <Card className="border-border bg-card hover-lift-premium h-full">
      <CardHeader className="flex flex-row items-center justify-between pb-2">
        <CardTitle className="flex items-center gap-2 text-lg">
          <Target className="h-5 w-5 text-primary" />
          Daily Goals
        </CardTitle>
        <span className="text-sm text-muted-foreground">
          {completedCount}/{goals.length}
        </span>
      </CardHeader>
      <CardContent>
        <div className="mb-4">
          <div className="flex items-center justify-between text-sm mb-2">
            <span className="text-muted-foreground">Progress</span>
            <span className="font-medium text-primary">
              {totalXP}/{potentialXP} XP
            </span>
          </div>
          <div className="h-2 rounded-full bg-secondary overflow-hidden">
            <div
              className="h-full bg-gradient-to-r from-primary to-cyan-400 transition-all duration-500"
              style={{ width: `${(completedCount / goals.length) * 100}%` }}
            />
          </div>
        </div>

        <div className="space-y-3">
          {goals.map((goal) => (
            <div
              key={goal.id}
              onClick={() => toggleGoal(goal.id)}
              className={`group flex items-center gap-3 rounded-lg border p-3 cursor-pointer transition-all duration-300 ${goal.completed
                  ? "border-green-500/30 bg-green-500/5 hover:bg-green-500/10"
                  : "border-border hover:border-primary/30 hover:bg-primary/5 hover:translate-x-1"
                }`}
            >
              {goal.completed ? (
                <CheckCircle2 className="h-5 w-5 text-green-500 transition-transform group-hover:scale-110" />
              ) : (
                <Circle className="h-5 w-5 text-muted-foreground transition-all group-hover:text-primary group-hover:scale-110" />
              )}
              <span
                className={`flex-1 text-sm transition-colors ${goal.completed ? "line-through text-muted-foreground" : "group-hover:text-primary"
                  }`}
              >
                {goal.title}
              </span>
              <span
                className={`text-xs font-medium ${goal.completed ? "text-green-500" : "text-primary"
                  }`}
              >
                +{goal.xp} XP
              </span>
            </div>
          ))}
        </div>

        <Button
          variant="outline"
          className="w-full mt-4 group hover:border-primary hover:bg-primary/5 bg-transparent"
        >
          <Plus className="h-4 w-4 mr-2 transition-transform group-hover:rotate-90" />
          Add Custom Goal
        </Button>
      </CardContent>
    </Card>
  );
}
