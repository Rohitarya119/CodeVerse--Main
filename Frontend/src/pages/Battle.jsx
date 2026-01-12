"use client";
import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Swords, Users, Clock, Trophy, Zap, Crown, Timer, Play, TrendingUp, Flame } from "lucide-react";
const activeBattles = [
  { id: 1, name: "Quick Match", players: "2", duration: "10 min", difficulty: "Random", playersWaiting: 45 },
  { id: 2, name: "Team Battle", players: "4v4", duration: "30 min", difficulty: "Medium", playersWaiting: 28 },
  { id: 3, name: "Speed Round", players: "5", duration: "5 min", difficulty: "Easy", playersWaiting: 67 },
  { id: 4, name: "Championship", players: "8", duration: "45 min", difficulty: "Hard", playersWaiting: 12 }
];
const recentBattles = [
  {
    id: 1,
    opponent: "coder123",
    result: "Won",
    score: "3-1",
    time: "2 hours ago",
    avatar: "/diverse-group-avatars.png"
  },
  {
    id: 2,
    opponent: "devmaster",
    result: "Lost",
    score: "2-3",
    time: "5 hours ago",
    avatar: "/diverse-group-avatars.png"
  },
  {
    id: 3,
    opponent: "algoqueen",
    result: "Won",
    score: "4-0",
    time: "Yesterday",
    avatar: "/diverse-group-avatars.png"
  },
  {
    id: 4,
    opponent: "bytewizard",
    result: "Won",
    score: "3-2",
    time: "2 days ago",
    avatar: "/diverse-group-avatars.png"
  }
];
const topPlayers = [
  { rank: 1, name: "CodeMaster", rating: 2847, wins: 234, avatar: "/diverse-group-avatars.png" },
  { rank: 2, name: "AlgoQueen", rating: 2756, wins: 198, avatar: "/diverse-group-avatars.png" },
  { rank: 3, name: "ByteKing", rating: 2698, wins: 187, avatar: "/diverse-group-avatars.png" },
  { rank: 4, name: "DevNinja", rating: 2654, wins: 176, avatar: "/diverse-group-avatars.png" },
  { rank: 5, name: "StackOverflow", rating: 2612, wins: 165, avatar: "/diverse-group-avatars.png" }
];
export default function BattlePage() {
  const [isSearching, setIsSearching] = useState(false);
  return <div className="min-h-[calc(100vh-4rem)] bg-background">
    <div className="container mx-auto p-6 lg:p-8">
      <div className="mb-8 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <h1 className="flex items-center gap-2 text-2xl font-bold">
            <Swords className="h-6 w-6 text-primary" />
            Battle Arena
          </h1>
          <p className="text-muted-foreground">Challenge other coders in real-time coding battles</p>
        </div>
        <div className="flex items-center gap-4">
          <div className="flex items-center gap-2 rounded-full bg-primary/10 px-4 py-2">
            <Trophy className="h-4 w-4 text-primary" />
            <span className="font-semibold">Rating: 1,847</span>
          </div>
        </div>
      </div>

      <div className="mb-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        {[
          {
            label: "Total Battles",
            value: "64",
            icon: Swords,
            trend: "5 this week",
            color: "text-blue-500",
            bg: "bg-blue-500/10",
            border: "hover:border-blue-500/50"
          },
          {
            label: "Battles Won",
            value: "47",
            icon: Trophy,
            trend: "73% Win Rate",
            color: "text-yellow-500",
            bg: "bg-yellow-500/10",
            border: "hover:border-yellow-500/50"
          },
          {
            label: "Current Streak",
            value: "5",
            icon: Flame,
            trend: "Best: 12",
            color: "text-orange-500",
            bg: "bg-orange-500/10",
            border: "hover:border-orange-500/50"
          },
          {
            label: "Global Rank",
            value: "#234",
            icon: Crown,
            trend: "Top 5%",
            color: "text-purple-500",
            bg: "bg-purple-500/10",
            border: "hover:border-purple-500/50"
          }
        ].map((stat, index) => (
          <Card
            key={stat.label}
            className={`relative overflow-hidden border-border bg-card/50 backdrop-blur-sm transition-all duration-300 hover-lift-premium ${stat.border} group`}
          >
            <div className={`absolute top-0 right-0 p-3 opacity-10 group-hover:opacity-20 transition-opacity duration-300`}>
              <stat.icon className={`h-16 w-16 ${stat.color}`} />
            </div>
            <CardContent className="p-5 relative z-10">
              <div className={`mb-3 inline-flex rounded-lg p-2.5 ${stat.bg} ${stat.color} ring-1 ring-inset ring-black/5`}>
                <stat.icon className="h-6 w-6" />
              </div>
              <div className="space-y-1">
                <p className="text-2xl font-bold tracking-tight">{stat.value}</p>
                <p className="text-sm font-medium text-muted-foreground">{stat.label}</p>
                <p className={`text-xs font-medium ${stat.color} pt-1 flex items-center gap-1`}>
                  <Zap className="h-3 w-3" />
                  {stat.trend}
                </p>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        <div className="lg:col-span-2 space-y-6">
          <Card className="border-border bg-card">
            <CardHeader>
              <CardTitle>Join a Battle</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid gap-4 sm:grid-cols-2">
                {activeBattles.map((battle) => <div
                  key={battle.id}
                  className="group relative rounded-xl border border-border bg-secondary/50 p-4 transition-all hover:border-primary/50 hover:bg-secondary"
                >
                  <div className="flex items-start justify-between">
                    <div>
                      <h3 className="font-semibold">{battle.name}</h3>
                      <div className="mt-2 flex flex-wrap items-center gap-3 text-sm text-muted-foreground">
                        <span className="flex items-center gap-1">
                          <Users className="h-3.5 w-3.5" />
                          {battle.players}
                        </span>
                        <span className="flex items-center gap-1">
                          <Clock className="h-3.5 w-3.5" />
                          {battle.duration}
                        </span>
                      </div>
                    </div>
                    <Badge variant="secondary">{battle.difficulty}</Badge>
                  </div>
                  <div className="mt-4 flex items-center justify-between">
                    <span className="text-xs text-muted-foreground">{battle.playersWaiting} waiting</span>
                    <Button
                      size="sm"
                      className="bg-primary hover:bg-primary/90"
                      onClick={() => setIsSearching(true)}
                    >
                      <Play className="mr-1 h-3 w-3" />
                      Join
                    </Button>
                  </div>
                </div>)}
              </div>

              {isSearching && <div className="mt-6 flex flex-col items-center justify-center rounded-xl border border-primary/50 bg-primary/10 p-8">
                <div className="relative">
                  <div className="h-16 w-16 animate-spin rounded-full border-4 border-primary border-t-transparent" />
                  <Swords className="absolute left-1/2 top-1/2 h-6 w-6 -translate-x-1/2 -translate-y-1/2 text-primary" />
                </div>
                <p className="mt-4 font-semibold">Finding opponent...</p>
                <p className="text-sm text-muted-foreground">Average wait time: 30s</p>
                <Button variant="outline" className="mt-4 bg-transparent" onClick={() => setIsSearching(false)}>
                  Cancel
                </Button>
              </div>}
            </CardContent>
          </Card>

          <Card className="border-border bg-card">
            <CardHeader>
              <CardTitle>Recent Battles</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {recentBattles.map((battle) => <div
                  key={battle.id}
                  className="flex items-center justify-between rounded-lg border border-border p-4"
                >
                  <div className="flex items-center gap-4">
                    <Avatar>
                      <AvatarImage src={battle.avatar || "/placeholder.svg"} />
                      <AvatarFallback>{battle.opponent[0].toUpperCase()}</AvatarFallback>
                    </Avatar>
                    <div>
                      <p className="font-medium">vs @{battle.opponent}</p>
                      <p className="text-sm text-muted-foreground">{battle.time}</p>
                    </div>
                  </div>
                  <div className="flex items-center gap-4">
                    <span className="font-mono">{battle.score}</span>
                    <Badge
                      className={battle.result === "Won" ? "bg-green-500/10 text-green-500" : "bg-red-500/10 text-red-500"}
                    >
                      {battle.result}
                    </Badge>
                  </div>
                </div>)}
              </div>
            </CardContent>
          </Card>
        </div>

        <div className="space-y-6">
          <Card className="border-border bg-card">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Crown className="h-5 w-5 text-yellow-500" />
                Top Players
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {topPlayers.map((player) => <div key={player.rank} className="flex items-center gap-4">
                  <span
                    className={`flex h-8 w-8 items-center justify-center rounded-full text-sm font-bold ${player.rank === 1 ? "bg-yellow-500/20 text-yellow-500" : player.rank === 2 ? "bg-gray-400/20 text-gray-400" : player.rank === 3 ? "bg-amber-600/20 text-amber-600" : "bg-secondary text-muted-foreground"}`}
                  >
                    {player.rank}
                  </span>
                  <Avatar className="h-8 w-8">
                    <AvatarImage src={player.avatar || "/placeholder.svg"} />
                    <AvatarFallback>{player.name[0]}</AvatarFallback>
                  </Avatar>
                  <div className="flex-1">
                    <p className="text-sm font-medium">{player.name}</p>
                    <p className="text-xs text-muted-foreground">{player.wins} wins</p>
                  </div>
                  <span className="font-mono text-sm text-primary">{player.rating}</span>
                </div>)}
              </div>
            </CardContent>
          </Card>

          <Card className="border-border bg-gradient-to-br from-primary/10 to-accent/10">
            <CardContent className="p-6 text-center">
              <Timer className="mx-auto h-12 w-12 text-primary" />
              <h3 className="mt-4 font-semibold">Daily Tournament</h3>
              <p className="mt-2 text-sm text-muted-foreground">Starts in 2h 34m</p>
              <Button className="mt-4 w-full bg-primary hover:bg-primary/90">Register Now</Button>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  </div>;
}
