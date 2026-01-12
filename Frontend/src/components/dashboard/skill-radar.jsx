"use client";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Radar, RadarChart, PolarGrid, PolarAngleAxis, PolarRadiusAxis, ResponsiveContainer, Tooltip } from "recharts";
import { TrendingUp } from "lucide-react";
const skillData = [
  { skill: "Arrays", value: 0, fullMark: 100 },
  { skill: "Strings", value: 0, fullMark: 100 },
  { skill: "Trees", value: 0, fullMark: 100 },
  { skill: "Graphs", value: 0, fullMark: 100 },
  { skill: "DP", value: 0, fullMark: 100 },
  { skill: "Math", value: 0, fullMark: 100 },
  { skill: "Sorting", value: 0, fullMark: 100 },
  { skill: "Searching", value: 0, fullMark: 100 }
];

export function SkillRadar({ stats }) {
    // Ideally we would calculate these from real user submission data
    // For now, render the chart with 0s or minimal values to remove fake data
    
  return (
    <Card className="border-border bg-card transition-all hover:border-primary/30 hover:shadow-lg hover:shadow-primary/5">
      <CardHeader className="pb-2">
        <CardTitle className="flex items-center gap-2 text-lg">
          <TrendingUp className="h-5 w-5 text-primary" />
          Skill Assessment
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="h-[280px] w-full">
          <ResponsiveContainer width="100%" height="100%">
            <RadarChart cx="50%" cy="50%" outerRadius="70%" data={skillData}>
              <PolarGrid stroke="var(--border)" />
              <PolarAngleAxis
                dataKey="skill"
                tick={{ fill: "var(--muted-foreground)", fontSize: 12, fontWeight: 500 }}
              />
              <PolarRadiusAxis
                angle={30}
                domain={[0, 100]}
                tick={{ fill: "var(--muted-foreground)", fontSize: 10 }}
              />
              <Tooltip
                contentStyle={{
                  backgroundColor: "var(--popover)",
                  borderColor: "var(--border)",
                  borderRadius: "8px",
                  color: "var(--popover-foreground)",
                  boxShadow: "0 4px 12px rgba(0,0,0,0.1)"
                }}
                itemStyle={{ color: "var(--primary)" }}
              />
              <Radar
                name="Skill Level"
                dataKey="value"
                stroke="var(--primary)"
                fill="var(--primary)"
                fillOpacity={0.4}
              />
            </RadarChart>
          </ResponsiveContainer>
        </div>

        <div className="mt-4 grid grid-cols-2 gap-2">
          <div className="rounded-lg bg-green-500/10 p-2 text-center border border-green-500/20">
            <p className="text-xs text-muted-foreground">Strongest</p>
            <p className="text-sm font-bold text-green-500">N/A</p>
          </div>
          <div className="rounded-lg bg-red-500/10 p-2 text-center border border-red-500/20">
            <p className="text-xs text-muted-foreground">Needs Work</p>
            <p className="text-sm font-bold text-red-500">Practice!</p>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}
