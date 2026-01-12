"use client";

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { cn } from "@/lib/utils";
import { useState, useMemo } from "react";
import { Flame, Calendar, TrendingUp, ChevronLeft, ChevronRight } from "lucide-react";
import { Button } from "@/components/ui/button";
import {
  Tooltip,
  TooltipContent,
  TooltipProvider,
  TooltipTrigger,
} from "@/components/ui/tooltip";

export function StreakCalendar() {
  const [yearOffset, setYearOffset] = useState(0);

  // Generate data for the last 365 days based on the offset
  const { data, totalSolved, maxStreak, currentStreak, activeDays } = useMemo(() => {
    const today = new Date();
    const endDate = new Date(today);
    endDate.setFullYear(today.getFullYear() - yearOffset);

    // Adjust to end on Saturday to align the grid properly if needed, 
    // but usually contribution graphs end on the current day.
    // For a clean 52-week grid, we often start from 52 weeks ago Sunday.

    const startDate = new Date(endDate);
    startDate.setDate(endDate.getDate() - 364); // Approx 1 year

    // Align start date to the previous Sunday to make the grid nice
    const dayOfWeek = startDate.getDay(); // 0 is Sunday
    startDate.setDate(startDate.getDate() - dayOfWeek);

    const days = [];
    let total = 0;
    let current = 0;
    let max = 0;
    let active = 0;

    // We need 53 weeks to cover the full year including overlap
    const totalDays = 53 * 7;

    for (let i = 0; i < totalDays; i++) {
      const date = new Date(startDate);
      date.setDate(startDate.getDate() + i);

      // Real data logic would go here. For now, 0.
      const hasSubmission = false; 
      const count = 0;

      if (count > 0) {
        total += count;
        active++;
        current++;
      } else {
        max = Math.max(max, current);
        current = 0;
      }

      // Don't show future dates if offset is 0
      const isFuture = yearOffset === 0 && date > new Date();

      days.push({
        date,
        count: isFuture ? 0 : count,
        level: isFuture ? 0 : 0, 
        isFuture
      });
    }

    // Recalculate current streak from the end backwards
    let realCurrentStreak = 0;
    if (yearOffset === 0) {
      // Find today's index
      const todayStr = new Date().toDateString();
      const todayIndex = days.findIndex(d => d.date.toDateString() === todayStr);

      if (todayIndex !== -1) {
        for (let i = todayIndex; i >= 0; i--) {
          if (days[i].count > 0) realCurrentStreak++;
          else break;
        }
      }
    }

    return {
      data: days,
      totalSolved: total,
      maxStreak: Math.max(max, realCurrentStreak),
      currentStreak: realCurrentStreak,
      activeDays: active
    };
  }, [yearOffset]);

  const weeks = useMemo(() => {
    const weeksArray = [];
    for (let i = 0; i < data.length; i += 7) {
      weeksArray.push(data.slice(i, i + 7));
    }
    return weeksArray;
  }, [data]);

  const months = useMemo(() => {
    const monthLabels = [];
    let currentMonth = -1;

    weeks.forEach((week, weekIndex) => {
      const firstDayOfWeek = week[0].date;
      const month = firstDayOfWeek.getMonth();

      if (month !== currentMonth) {
        monthLabels.push({
          name: firstDayOfWeek.toLocaleString('default', { month: 'short' }),
          index: weekIndex
        });
        currentMonth = month;
      }
    });
    return monthLabels;
  }, [weeks]);

  const getLevelColor = (level) => {
    switch (level) {
      case 0: return "bg-secondary/50"; // Empty
      case 1: return "bg-green-500/30"; // Low
      case 2: return "bg-green-500/50"; // Medium
      case 3: return "bg-green-500/70"; // High
      case 4: return "bg-green-500";    // Max
      default: return "bg-secondary/50";
    }
  };

  return (
    <Card className="border-border bg-card transition-all hover:border-primary/30 hover:shadow-lg hover:shadow-primary/5">
      <CardHeader className="pb-4">
        <div className="flex items-center justify-between">
          <CardTitle className="flex items-center gap-2 text-lg">
            <Calendar className="h-5 w-5 text-primary" />
            Activity Calendar
          </CardTitle>
          <div className="flex items-center gap-2">
            <div className="flex items-center gap-1 rounded-full bg-orange-500/10 px-3 py-1">
              <Flame className="h-4 w-4 text-orange-500 animate-pulse" />
              <span className="text-sm font-bold text-orange-500">{currentStreak} Day Streak</span>
            </div>
            <div className="flex gap-1">
              <Button variant="ghost" size="icon" className="h-8 w-8" onClick={() => setYearOffset(prev => prev + 1)}>
                <ChevronLeft className="h-4 w-4" />
              </Button>
              <Button variant="ghost" size="icon" className="h-8 w-8" disabled={yearOffset === 0} onClick={() => setYearOffset(prev => prev - 1)}>
                <ChevronRight className="h-4 w-4" />
              </Button>
            </div>
          </div>
        </div>
      </CardHeader>
      <CardContent>
        {/* Stats Row */}
        <div className="flex gap-6 mb-6 overflow-x-auto pb-2">
          <div>
            <p className="text-xs text-muted-foreground">Total Solved</p>
            <p className="text-xl font-bold text-foreground">{totalSolved}</p>
          </div>
          <div>
            <p className="text-xs text-muted-foreground">Max Streak</p>
            <p className="text-xl font-bold text-foreground">{maxStreak}</p>
          </div>
          <div>
            <p className="text-xs text-muted-foreground">Active Days</p>
            <p className="text-xl font-bold text-foreground">{activeDays}</p>
          </div>
          <div>
            <p className="text-xs text-muted-foreground">Current Year</p>
            <p className="text-xl font-bold text-foreground">{new Date().getFullYear() - yearOffset}</p>
          </div>
        </div>

        {/* Calendar Grid */}
        <div className="w-full overflow-x-auto pb-2">
          <div className="min-w-[700px]">
            {/* Month Labels */}
            <div className="flex text-xs text-muted-foreground mb-2 relative h-5">
              {months.map((month, i) => (
                <span
                  key={i}
                  className="absolute"
                  style={{ left: `${month.index * 14}px` }} // 14px is roughly the width of a column (10px cell + 4px gap)
                >
                  {month.name}
                </span>
              ))}
            </div>

            <div className="flex gap-1">
              {/* Day Labels */}
              <div className="flex flex-col gap-1 mr-2 pt-[14px]"> {/* Offset for alignment */}
                <span className="text-[10px] text-muted-foreground h-[10px] leading-[10px]">Mon</span>
                <span className="h-[10px]"></span>
                <span className="text-[10px] text-muted-foreground h-[10px] leading-[10px]">Wed</span>
                <span className="h-[10px]"></span>
                <span className="text-[10px] text-muted-foreground h-[10px] leading-[10px]">Fri</span>
              </div>

              {/* The Grid */}
              <div className="flex gap-1">
                <TooltipProvider>
                  {weeks.map((week, weekIndex) => (
                    <div key={weekIndex} className="flex flex-col gap-1">
                      {week.map((day, dayIndex) => (
                        <Tooltip key={dayIndex}>
                          <TooltipTrigger asChild>
                            <div
                              className={cn(
                                "w-[10px] h-[10px] rounded-[2px] transition-all hover:ring-1 hover:ring-foreground/50",
                                getLevelColor(day.level)
                              )}
                            />
                          </TooltipTrigger>
                          <TooltipContent>
                            <p className="text-xs font-medium">
                              {day.count} submissions on {day.date.toLocaleDateString(undefined, { month: 'short', day: 'numeric', year: 'numeric' })}
                            </p>
                          </TooltipContent>
                        </Tooltip>
                      ))}
                    </div>
                  ))}
                </TooltipProvider>
              </div>
            </div>
          </div>
        </div>

        {/* Legend */}
        <div className="mt-4 flex items-center justify-between text-xs text-muted-foreground">
          <div className="flex items-center gap-1">
            <TrendingUp className="h-3 w-3 text-green-500" />
            <span>Top 5% of active users</span>
          </div>
          <div className="flex items-center gap-2">
            <span>Less</span>
            <div className="flex gap-1">
              {[0, 1, 2, 3, 4].map((level) => (
                <div
                  key={level}
                  className={cn("w-[10px] h-[10px] rounded-[2px]", getLevelColor(level))}
                />
              ))}
            </div>
            <span>More</span>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}
