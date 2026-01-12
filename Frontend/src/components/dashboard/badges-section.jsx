"use client";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Award, Flame, Zap, Target, Code, Trophy, Star, Shield, Crown, Rocket, ArrowRight } from "lucide-react";
import { Link } from "react-router-dom";
import { useState } from "react";
const badges = [
  {
    icon: Flame,
    label: "7 Day Streak",
    earned: true,
    color: "text-orange-500",
    bg: "bg-orange-500",
    description: "Maintain a 7-day solving streak"
  },
  {
    icon: Zap,
    label: "Speed Demon",
    earned: true,
    color: "text-yellow-500",
    bg: "bg-yellow-500",
    description: "Solve 5 problems in under 1 hour"
  },
  {
    icon: Target,
    label: "100 Solved",
    earned: true,
    color: "text-green-500",
    bg: "bg-green-500",
    description: "Solve 100 problems"
  },
  {
    icon: Code,
    label: "DSA Master",
    earned: false,
    color: "text-primary",
    bg: "bg-primary",
    description: "Complete all DSA topics"
  },
  {
    icon: Trophy,
    label: "Battle Winner",
    earned: true,
    color: "text-purple-500",
    bg: "bg-purple-500",
    description: "Win 10 battle arena matches"
  },
  {
    icon: Star,
    label: "Rising Star",
    earned: true,
    color: "text-blue-500",
    bg: "bg-blue-500",
    description: "Reach top 10% globally"
  },
  {
    icon: Shield,
    label: "Defender",
    earned: false,
    color: "text-red-500",
    bg: "bg-red-500",
    description: "Win 5 battles without losing"
  },
  {
    icon: Award,
    label: "Legend",
    earned: false,
    color: "text-amber-500",
    bg: "bg-amber-500",
    description: "Solve 500 problems"
  },
  {
    icon: Crown,
    label: "Champion",
    earned: false,
    color: "text-yellow-400",
    bg: "bg-yellow-400",
    description: "Win a weekly tournament"
  },
  {
    icon: Rocket,
    label: "Fast Learner",
    earned: true,
    color: "text-cyan-500",
    bg: "bg-cyan-500",
    description: "Complete 5 handbook chapters in a day"
  }
];
export function BadgesSection() {
  const [hoveredBadge, setHoveredBadge] = useState(null);
  const earnedCount = badges.filter((b) => b.earned).length;

  return (
    <Card className="border-border bg-card transition-all hover:border-primary/30 hover:shadow-lg hover:shadow-primary/5">
      <CardHeader className="flex flex-row items-center justify-between pb-2">
        <CardTitle className="flex items-center gap-2 text-lg">
          <Award className="h-5 w-5 text-primary" />
          Badges
        </CardTitle>
        <span className="text-sm text-muted-foreground">
          {earnedCount}/{badges.length} earned
        </span>
      </CardHeader>
      <CardContent>
        <div className="grid grid-cols-4 sm:grid-cols-5 gap-4">
          {badges.map((badge, i) => (
            <div
              key={i}
              onMouseEnter={() => setHoveredBadge(i)}
              onMouseLeave={() => setHoveredBadge(null)}
              className={`group relative flex flex-col items-center gap-2 p-2 rounded-xl transition-all duration-300 cursor-pointer ${!badge.earned
                  ? "opacity-40 grayscale hover:grayscale-0 hover:opacity-100"
                  : "hover:-translate-y-2"
                }`}
            >
              <div
                className={`rounded-full p-3 transition-all duration-300 ${badge.earned
                    ? `bg-secondary group-hover:bg-primary/10 group-hover:shadow-lg group-hover:shadow-primary/20`
                    : "bg-muted"
                  }`}
              >
                <badge.icon
                  className={`h-6 w-6 transition-all duration-300 ${badge.color} ${badge.earned && "group-hover:scale-110 group-hover:drop-shadow-md"
                    }`}
                />
              </div>
              <span className="text-center text-[10px] sm:text-xs font-medium transition-colors duration-300 group-hover:text-primary line-clamp-1">
                {badge.label}
              </span>

              {/* Tooltip */}
              <div
                className={`absolute -top-14 left-1/2 -translate-x-1/2 z-20 w-max max-w-[150px] rounded-lg bg-popover border border-border px-3 py-2 text-xs shadow-xl transition-all duration-200 pointer-events-none ${hoveredBadge === i ? "opacity-100 translate-y-0" : "opacity-0 translate-y-2"
                  }`}
              >
                <p className="font-semibold mb-0.5 text-foreground">{badge.label}</p>
                <p className="text-muted-foreground text-[10px] whitespace-normal text-center leading-tight">
                  {badge.description}
                </p>
                <div className="absolute -bottom-1.5 left-1/2 -translate-x-1/2 h-3 w-3 rotate-45 bg-popover border-r border-b border-border" />
              </div>
            </div>
          ))}
        </div>

        <Button
          variant="outline"
          className="w-full mt-6 group hover:border-primary hover:bg-primary/5 bg-transparent"
          asChild
        >
          <Link to="/profile#badges">
            View All Badges
            <ArrowRight className="ml-2 h-4 w-4 transition-transform group-hover:translate-x-1" />
          </Link>
        </Button>
      </CardContent>
    </Card>
  );
}
