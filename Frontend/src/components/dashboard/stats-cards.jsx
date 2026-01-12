import { MagicCard } from "@/components/magic-card";
import { CardContent } from "@/components/ui/card";
import { Brain, CheckCircle2, Flame, Trophy } from "lucide-react";
import { cn } from "@/lib/utils";

export function StatsCards({ stats }) {
  const dynamicStats = [
    {
      label: "Problems Solved",
      value: stats?.totalSolved?.toString() || "0",
      change: "Keep going!",
      icon: CheckCircle2,
      color: "text-green-500",
      bgColor: "bg-green-500/10",
      hoverBg: "group-hover:bg-green-500"
    },
    {
      label: "Current Streak",
      value: (stats?.streak || 0) + " days", 
      change: "Maintain consistency", 
      icon: Flame,
      color: "text-orange-500",
      bgColor: "bg-orange-500/10",
      hoverBg: "group-hover:bg-orange-500"
    },
    {
      label: "Total XP",
      value: (parseInt(stats?.totalSolved || 0) * 10).toString(), 
      change: "Based on problems solved",
      icon: Trophy,
      color: "text-yellow-500",
      bgColor: "bg-yellow-500/10",
      hoverBg: "group-hover:bg-yellow-500"
    },
    {
      label: "AI Sessions",
      value: "0", 
      change: "Explore AI help",
      icon: Brain,
      color: "text-primary",
      bgColor: "bg-primary/10",
      hoverBg: "group-hover:bg-primary"
    }
  ];

  return <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
    {dynamicStats.map((stat, index) => <MagicCard
      key={stat.label}
      className="border-border bg-card"
      style={{ animationDelay: `${index * 0.1}s` }}
    >
      <CardContent className="p-6">
        <div className="flex items-center justify-between">
          <div>
            <p className="text-sm text-muted-foreground transition-colors duration-300 group-hover:text-foreground">
              {stat.label}
            </p>
            <p className="mt-1 text-2xl font-bold transition-all duration-300 group-hover:scale-105 group-hover:text-primary">
              {stat.value}
            </p>
            <p className="mt-1 text-xs text-muted-foreground">{stat.change}</p>
          </div>
          <div
            className={cn(
              "rounded-lg p-3 transition-all duration-300",
              stat.bgColor,
              stat.hoverBg,
              "group-hover:scale-110 group-hover:shadow-lg"
            )}
          >
            <stat.icon
              className={cn("h-6 w-6 transition-colors duration-300", stat.color, "group-hover:text-white")}
            />
          </div>
        </div>
      </CardContent>
    </MagicCard>)}
  </div>;
}
