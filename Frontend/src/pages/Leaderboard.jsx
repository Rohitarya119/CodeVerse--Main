"use client";
import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Input } from "@/components/ui/input";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Trophy, Medal, Crown, Search, TrendingUp, TrendingDown, Minus, Flame, Building2, Target } from "lucide-react";
const globalLeaderboard = [
  {
    rank: 1,
    name: "CodeMaster",
    university: "IIT Delhi",
    solved: 2847,
    streak: 156,
    rating: 2847,
    change: "up",
    avatar: "/placeholder.svg?key=o6k6k"
  },
  {
    rank: 2,
    name: "AlgoQueen",
    university: "IIT Bombay",
    solved: 2756,
    streak: 89,
    rating: 2756,
    change: "up",
    avatar: "/placeholder.svg?key=hx1js"
  },
  {
    rank: 3,
    name: "ByteKing",
    university: "NIT Trichy",
    solved: 2698,
    streak: 234,
    rating: 2698,
    change: "down",
    avatar: "/placeholder.svg?key=n3hok"
  },
  {
    rank: 4,
    name: "DevNinja",
    university: "BITS Pilani",
    solved: 2654,
    streak: 67,
    rating: 2654,
    change: "same",
    avatar: "/placeholder.svg?key=hl2b6"
  },
  {
    rank: 5,
    name: "StackOverflow",
    university: "IIT Madras",
    solved: 2612,
    streak: 45,
    rating: 2612,
    change: "up",
    avatar: "/placeholder.svg?key=3jfcn"
  },
  {
    rank: 6,
    name: "RecursiveRaj",
    university: "IIT Kanpur",
    solved: 2589,
    streak: 112,
    rating: 2589,
    change: "down",
    avatar: "/placeholder.svg?key=mxdq2"
  },
  {
    rank: 7,
    name: "HashMapHero",
    university: "VIT Vellore",
    solved: 2534,
    streak: 78,
    rating: 2534,
    change: "up",
    avatar: "/placeholder.svg?key=2ykp7"
  },
  {
    rank: 8,
    name: "DPDynamo",
    university: "NIT Warangal",
    solved: 2498,
    streak: 56,
    rating: 2498,
    change: "same",
    avatar: "/placeholder.svg?key=mknaq"
  },
  {
    rank: 9,
    name: "GraphGuru",
    university: "IIIT Hyderabad",
    solved: 2467,
    streak: 34,
    rating: 2467,
    change: "up",
    avatar: "/placeholder.svg?key=swh3g"
  },
  {
    rank: 10,
    name: "TreeTraverser",
    university: "DTU Delhi",
    solved: 2445,
    streak: 89,
    rating: 2445,
    change: "down",
    avatar: "/placeholder.svg?key=vdojn"
  }
];
const universities = [
  { name: "IIT Delhi", students: 1234, avgRating: 1876 },
  { name: "IIT Bombay", students: 1156, avgRating: 1845 },
  { name: "NIT Trichy", students: 987, avgRating: 1723 },
  { name: "BITS Pilani", students: 876, avgRating: 1698 },
  { name: "IIT Madras", students: 1098, avgRating: 1834 }
];
export default function LeaderboardPage() {
  const [search, setSearch] = useState("");
  const [timeFilter, setTimeFilter] = useState("all");
  const filteredLeaderboard = globalLeaderboard.filter((user) => user.name.toLowerCase().includes(search.toLowerCase()));
  const getRankIcon = (rank) => {
    if (rank === 1) return <Crown className="h-5 w-5 text-yellow-500" />;
    if (rank === 2) return <Medal className="h-5 w-5 text-gray-400" />;
    if (rank === 3) return <Medal className="h-5 w-5 text-amber-600" />;
    return null;
  };
  const getChangeIcon = (change) => {
    if (change === "up") return <TrendingUp className="h-4 w-4 text-green-500" />;
    if (change === "down") return <TrendingDown className="h-4 w-4 text-red-500" />;
    return <Minus className="h-4 w-4 text-muted-foreground" />;
  };
  return <div className="min-h-[calc(100vh-4rem)] bg-background">
    <div className="container mx-auto p-6 lg:p-8">
      <div className="mb-8">
        <h1 className="flex items-center gap-2 text-2xl font-bold">
          <Trophy className="h-6 w-6 text-primary" />
          Leaderboard
        </h1>
        <p className="text-muted-foreground">See where you stand among the best coders</p>
      </div>

      {/* Stats Overview */}
      <div className="mb-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        {[
          {
            label: "Global Rank",
            value: "#234",
            icon: Crown,
            trend: "Top 5%",
            color: "text-yellow-500",
            bg: "bg-yellow-500/10",
            border: "hover:border-yellow-500/50"
          },
          {
            label: "Your Rating",
            value: "1847",
            icon: Trophy,
            trend: "+42 this week",
            color: "text-blue-500",
            bg: "bg-blue-500/10",
            border: "hover:border-blue-500/50"
          },
          {
            label: "Problems Solved",
            value: "247",
            icon: Target,
            trend: "Daily Active",
            color: "text-green-500",
            bg: "bg-green-500/10",
            border: "hover:border-green-500/50"
          },
          {
            label: "University Rank",
            value: "#42",
            icon: Building2,
            trend: "IIT Delhi",
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
                  <TrendingUp className="h-3 w-3" />
                  {stat.trend}
                </p>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      <div className="mb-6 grid gap-4 sm:grid-cols-3">
        {globalLeaderboard.slice(0, 3).map((user, i) => <Card
          key={user.rank}
          className={`border-border ${i === 0 ? "bg-gradient-to-br from-yellow-500/20 to-orange-500/20" : i === 1 ? "bg-gradient-to-br from-gray-400/20 to-gray-500/20" : "bg-gradient-to-br from-amber-600/20 to-amber-700/20"}`}
        >
          <CardContent className="p-6 text-center">
            <div className="relative mx-auto mb-4 w-fit">
              <Avatar className="h-20 w-20 border-4 border-background">
                <AvatarImage src={user.avatar || "/placeholder.svg"} />
                <AvatarFallback className="text-2xl">{user.name[0]}</AvatarFallback>
              </Avatar>
              <div
                className={`absolute -bottom-2 -right-2 flex h-8 w-8 items-center justify-center rounded-full ${i === 0 ? "bg-yellow-500" : i === 1 ? "bg-gray-400" : "bg-amber-600"}`}
              >
                <span className="text-sm font-bold text-background">{user.rank}</span>
              </div>
            </div>
            <h3 className="font-semibold">{user.name}</h3>
            <p className="text-sm text-muted-foreground">{user.university}</p>
            <div className="mt-4 flex items-center justify-center gap-4">
              <div>
                <p className="text-2xl font-bold text-primary">{user.rating}</p>
                <p className="text-xs text-muted-foreground">Rating</p>
              </div>
              <div className="h-8 w-px bg-border" />
              <div>
                <p className="flex items-center gap-1 text-lg font-semibold">
                  <Flame className="h-4 w-4 text-orange-500" />
                  {user.streak}
                </p>
                <p className="text-xs text-muted-foreground">Streak</p>
              </div>
            </div>
          </CardContent>
        </Card>)}
      </div>

      <Tabs defaultValue="global" className="space-y-6">
        <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
          <TabsList className="bg-secondary">
            <TabsTrigger value="global">Global</TabsTrigger>
            <TabsTrigger value="university">University</TabsTrigger>
            <TabsTrigger value="friends">Friends</TabsTrigger>
          </TabsList>
          <div className="flex gap-2">
            <div className="relative">
              <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
              <Input
                placeholder="Search users..."
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                className="w-64 bg-secondary pl-9"
              />
            </div>
            <Select value={timeFilter} onValueChange={setTimeFilter}>
              <SelectTrigger className="w-32 bg-secondary">
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">All Time</SelectItem>
                <SelectItem value="month">This Month</SelectItem>
                <SelectItem value="week">This Week</SelectItem>
                <SelectItem value="today">Today</SelectItem>
              </SelectContent>
            </Select>
          </div>
        </div>

        <TabsContent value="global">
          <Card className="border-border bg-card">
            <CardContent className="p-0">
              <div className="overflow-x-auto">
                <table className="w-full">
                  <thead>
                    <tr className="border-b border-border">
                      <th className="px-6 py-4 text-left text-sm font-medium text-muted-foreground">Rank</th>
                      <th className="px-6 py-4 text-left text-sm font-medium text-muted-foreground">User</th>
                      <th className="px-6 py-4 text-left text-sm font-medium text-muted-foreground">University</th>
                      <th className="px-6 py-4 text-left text-sm font-medium text-muted-foreground">Problems</th>
                      <th className="px-6 py-4 text-left text-sm font-medium text-muted-foreground">Streak</th>
                      <th className="px-6 py-4 text-left text-sm font-medium text-muted-foreground">Rating</th>
                      <th className="px-6 py-4 text-left text-sm font-medium text-muted-foreground">Change</th>
                    </tr>
                  </thead>
                  <tbody>
                    {filteredLeaderboard.map((user) => <tr
                      key={user.rank}
                      className="border-b border-border transition-colors hover:bg-secondary/50"
                    >
                      <td className="px-6 py-4">
                        <div className="flex items-center gap-2">
                          {getRankIcon(user.rank)}
                          <span className={user.rank <= 3 ? "font-bold" : ""}>{user.rank}</span>
                        </div>
                      </td>
                      <td className="px-6 py-4">
                        <div className="flex items-center gap-3">
                          <Avatar className="h-8 w-8">
                            <AvatarImage src={user.avatar || "/placeholder.svg"} />
                            <AvatarFallback>{user.name[0]}</AvatarFallback>
                          </Avatar>
                          <span className="font-medium">{user.name}</span>
                        </div>
                      </td>
                      <td className="px-6 py-4 text-muted-foreground">{user.university}</td>
                      <td className="px-6 py-4">{user.solved}</td>
                      <td className="px-6 py-4">
                        <div className="flex items-center gap-1">
                          <Flame className="h-4 w-4 text-orange-500" />
                          {user.streak}
                        </div>
                      </td>
                      <td className="px-6 py-4 font-semibold text-primary">{user.rating}</td>
                      <td className="px-6 py-4">{getChangeIcon(user.change)}</td>
                    </tr>)}
                  </tbody>
                </table>
              </div>
            </CardContent>
          </Card>
        </TabsContent>

        <TabsContent value="university">
          <div className="grid gap-4 md:grid-cols-2">
            <Card className="border-border bg-card">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Building2 className="h-5 w-5" />
                  Top Universities
                </CardTitle>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  {universities.map((uni, i) => <div
                    key={uni.name}
                    className="flex items-center justify-between rounded-lg border border-border p-4"
                  >
                    <div className="flex items-center gap-4">
                      <span
                        className={`flex h-8 w-8 items-center justify-center rounded-full text-sm font-bold ${i === 0 ? "bg-yellow-500/20 text-yellow-500" : i === 1 ? "bg-gray-400/20 text-gray-400" : i === 2 ? "bg-amber-600/20 text-amber-600" : "bg-secondary text-muted-foreground"}`}
                      >
                        {i + 1}
                      </span>
                      <div>
                        <p className="font-medium">{uni.name}</p>
                        <p className="text-sm text-muted-foreground">{uni.students} students</p>
                      </div>
                    </div>
                    <div className="text-right">
                      <p className="font-semibold text-primary">{uni.avgRating}</p>
                      <p className="text-xs text-muted-foreground">Avg Rating</p>
                    </div>
                  </div>)}
                </div>
              </CardContent>
            </Card>

            <Card className="border-border bg-card">
              <CardHeader>
                <CardTitle>Your University Rank</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="rounded-lg bg-gradient-to-br from-primary/20 to-accent/20 p-6 text-center">
                  <Badge className="mb-4 bg-primary/20 text-primary">IIT Delhi</Badge>
                  <p className="text-5xl font-bold">#42</p>
                  <p className="mt-2 text-muted-foreground">out of 1,234 students</p>
                  <div className="mt-6 grid grid-cols-2 gap-4">
                    <div className="rounded-lg bg-background/50 p-3">
                      <p className="text-2xl font-bold">247</p>
                      <p className="text-xs text-muted-foreground">Problems Solved</p>
                    </div>
                    <div className="rounded-lg bg-background/50 p-3">
                      <p className="text-2xl font-bold">1,847</p>
                      <p className="text-xs text-muted-foreground">Your Rating</p>
                    </div>
                  </div>
                </div>
              </CardContent>
            </Card>
          </div>
        </TabsContent>

        <TabsContent value="friends">
          <Card className="border-border bg-card">
            <CardContent className="py-12 text-center">
              <p className="text-muted-foreground">Connect with friends to see their rankings</p>
              <Button className="mt-4 bg-primary hover:bg-primary/90">Find Friends</Button>
            </CardContent>
          </Card>
        </TabsContent>
      </Tabs>
    </div>
  </div>;
}
