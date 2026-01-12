"use client";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Calendar, Clock, Users, Trophy, ArrowRight } from "lucide-react";
const contests = [
  {
    id: 1,
    title: "Weekly DSA Challenge #47",
    type: "DSA",
    date: "Today",
    time: "7:00 PM",
    participants: 234,
    prize: "500 XP",
    status: "live"
  },
  {
    id: 2,
    title: "TCS Mock Aptitude Test",
    type: "Aptitude",
    date: "Tomorrow",
    time: "10:00 AM",
    participants: 1289,
    prize: "Certificate",
    status: "upcoming"
  },
  {
    id: 3,
    title: "Battle Arena Tournament",
    type: "Battle",
    date: "Dec 8",
    time: "6:00 PM",
    participants: 512,
    prize: "1000 XP + Badge",
    status: "upcoming"
  }
];
export function UpcomingContests() {
  return (
    <Card className="border-border bg-card hover-lift-premium h-full">
      <CardHeader className="pb-2">
        <CardTitle className="flex items-center gap-2 text-lg">
          <Trophy className="h-5 w-5 text-yellow-500" />
          Upcoming Contests
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="space-y-3">
          {contests.map((contest) => (
            <div
              key={contest.id}
              className="group rounded-lg border border-border p-3 transition-all duration-300 hover:border-primary/30 hover:bg-primary/5 hover:translate-x-1 cursor-pointer"
            >
              <div className="flex items-start justify-between mb-2">
                <div className="flex-1">
                  <h4 className="font-medium text-sm group-hover:text-primary transition-colors line-clamp-1">
                    {contest.title}
                  </h4>
                  <div className="flex items-center gap-2 mt-1">
                    <Badge
                      variant="secondary"
                      className={`text-xs ${contest.type === "DSA"
                          ? "bg-blue-500/10 text-blue-500"
                          : contest.type === "Aptitude"
                            ? "bg-green-500/10 text-green-500"
                            : "bg-purple-500/10 text-purple-500"
                        }`}
                    >
                      {contest.type}
                    </Badge>
                    {contest.status === "live" && (
                      <Badge className="bg-red-500 text-white animate-pulse text-xs">LIVE</Badge>
                    )}
                  </div>
                </div>
                <ArrowRight className="h-4 w-4 text-muted-foreground transition-all group-hover:text-primary group-hover:translate-x-1" />
              </div>

              <div className="flex items-center gap-4 text-xs text-muted-foreground">
                <span className="flex items-center gap-1">
                  <Calendar className="h-3 w-3" />
                  {contest.date}
                </span>
                <span className="flex items-center gap-1">
                  <Clock className="h-3 w-3" />
                  {contest.time}
                </span>
                <span className="flex items-center gap-1">
                  <Users className="h-3 w-3" />
                  {contest.participants}
                </span>
              </div>

              <div className="mt-2 text-xs font-medium text-primary">Prize: {contest.prize}</div>
            </div>
          ))}
        </div>

        <Button
          variant="outline"
          className="w-full mt-4 group hover:border-primary hover:bg-primary/5 bg-transparent"
        >
          View All Contests
          <ArrowRight className="h-4 w-4 ml-2 transition-transform group-hover:translate-x-1" />
        </Button>
      </CardContent>
    </Card>
  );
}
