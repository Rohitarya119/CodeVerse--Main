"use client";

import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription, CardFooter } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import {
    Trophy,
    Calendar,
    Clock,
    Users,
    ArrowRight,
    Target,
    Medal,
    Timer,
    AlertCircle,
    CheckCircle2,
    Swords,
    TrendingUp,
    Crown
} from "lucide-react";

const upcomingContests = [
    {
        id: 1,
        title: "Weekly Contest 128",
        startTime: "2025-12-07T10:30:00",
        duration: "1h 30m",
        registered: 1245,
        type: "Weekly",
        status: "Upcoming",
        color: "from-blue-500 to-cyan-500"
    },
    {
        id: 2,
        title: "Biweekly Contest 45",
        startTime: "2025-12-10T20:00:00",
        duration: "2h 00m",
        registered: 856,
        type: "Biweekly",
        status: "Upcoming",
        color: "from-purple-500 to-pink-500"
    },
    {
        id: 3,
        title: "CodeVerse Cup 2025",
        startTime: "2025-12-25T09:00:00",
        duration: "3h 00m",
        registered: 3500,
        type: "Special",
        status: "Upcoming",
        color: "from-yellow-500 to-orange-500"
    }
];

const activeContests = [
    {
        id: 4,
        title: "Daily Challenge: Dynamic Programming",
        endTime: "2025-12-05T23:59:59",
        participants: 543,
        timeLeft: "4h 23m",
        type: "Daily",
        status: "Live",
        color: "from-green-500 to-emerald-500"
    }
];

const pastContests = [
    {
        id: 101,
        title: "Weekly Contest 127",
        date: "2025-11-30",
        participants: 2100,
        winner: "CodeMaster99",
        yourRank: 145,
        type: "Weekly"
    },
    {
        id: 102,
        title: "Biweekly Contest 44",
        date: "2025-11-26",
        participants: 1800,
        winner: "AlgoWizard",
        yourRank: 89,
        type: "Biweekly"
    },
    {
        id: 103,
        title: "Weekly Contest 126",
        date: "2025-11-23",
        participants: 2300,
        winner: "DevNinja",
        yourRank: 312,
        type: "Weekly"
    }
];

export default function ContestPage() {
    const [activeTab, setActiveTab] = useState("upcoming");

    const formatDate = (dateString) => {
        const options = { weekday: 'short', month: 'short', day: 'numeric', hour: 'numeric', minute: 'numeric' };
        return new Date(dateString).toLocaleDateString('en-US', options);
    };

    return (
        <div className="min-h-[calc(100vh-4rem)] bg-background">
            <div className="container mx-auto p-6 lg:p-8">
                {/* Header */}
                <div className="mb-8 flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
                    <div>
                        <h1 className="text-3xl font-bold mb-2 flex items-center gap-2">
                            <Trophy className="h-8 w-8 text-primary" />
                            Contests
                        </h1>
                        <p className="text-muted-foreground">Compete with the best and climb the global leaderboard</p>
                    </div>
                </div>

                {/* Stats Overview */}
                <div className="mb-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                    {[
                        {
                            label: "Contest Rating",
                            value: "1450",
                            icon: Target,
                            trend: "+25 last contest",
                            color: "text-orange-500",
                            bg: "bg-orange-500/10",
                            border: "hover:border-orange-500/50"
                        },
                        {
                            label: "Global Rank",
                            value: "#1,245",
                            icon: Medal,
                            trend: "Top 15%",
                            color: "text-blue-500",
                            bg: "bg-blue-500/10",
                            border: "hover:border-blue-500/50"
                        },
                        {
                            label: "Contests Attended",
                            value: "12",
                            icon: Trophy,
                            trend: "Monthly Active",
                            color: "text-yellow-500",
                            bg: "bg-yellow-500/10",
                            border: "hover:border-yellow-500/50"
                        },
                        {
                            label: "Best Rank",
                            value: "#89",
                            icon: Crown,
                            trend: "Biweekly Contest 44",
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


                {/* Active Contests Banner */}
                {activeContests.length > 0 && (
                    <div className="mb-8">
                        <h2 className="text-lg font-semibold mb-4 flex items-center gap-2">
                            <span className="relative flex h-3 w-3">
                                <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-green-400 opacity-75"></span>
                                <span className="relative inline-flex rounded-full h-3 w-3 bg-green-500"></span>
                            </span>
                            Live Now
                        </h2>
                        <div className="grid gap-4">
                            {activeContests.map((contest) => (
                                <Card key={contest.id} className="border-green-500/30 bg-gradient-to-r from-green-500/10 to-emerald-500/5 overflow-hidden relative">
                                    <div className="absolute top-0 right-0 p-4 opacity-10">
                                        <Swords className="h-32 w-32" />
                                    </div>
                                    <CardContent className="p-6 flex flex-col md:flex-row items-center justify-between gap-6 relative z-10">
                                        <div>
                                            <div className="flex items-center gap-2 mb-2">
                                                <Badge className="bg-green-500 hover:bg-green-600 animate-pulse">LIVE</Badge>
                                                <Badge variant="outline" className="border-green-500/50 text-green-600 dark:text-green-400">{contest.type}</Badge>
                                            </div>
                                            <h3 className="text-2xl font-bold mb-2">{contest.title}</h3>
                                            <div className="flex items-center gap-4 text-sm text-muted-foreground">
                                                <span className="flex items-center gap-1">
                                                    <Users className="h-4 w-4" /> {contest.participants} participating
                                                </span>
                                                <span className="flex items-center gap-1 text-green-600 dark:text-green-400 font-medium">
                                                    <Timer className="h-4 w-4" /> Ends in {contest.timeLeft}
                                                </span>
                                            </div>
                                        </div>
                                        <Button size="lg" className="bg-green-600 hover:bg-green-700 text-white shadow-lg shadow-green-500/20 w-full md:w-auto">
                                            Enter Contest <ArrowRight className="ml-2 h-4 w-4" />
                                        </Button>
                                    </CardContent>
                                </Card>
                            ))}
                        </div>
                    </div>
                )}

                {/* Tabs */}
                <Tabs value={activeTab} onValueChange={setActiveTab} className="space-y-6">
                    <TabsList className="bg-secondary/50 p-1">
                        <TabsTrigger value="upcoming" className="gap-2 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground">
                            <Calendar className="h-4 w-4" /> Upcoming
                        </TabsTrigger>
                        <TabsTrigger value="past" className="gap-2 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground">
                            <Clock className="h-4 w-4" /> Past Contests
                        </TabsTrigger>
                        <TabsTrigger value="my-contests" className="gap-2 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground">
                            <Target className="h-4 w-4" /> My Contests
                        </TabsTrigger>
                    </TabsList>

                    <TabsContent value="upcoming" className="space-y-6">
                        <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
                            {upcomingContests.map((contest, index) => (
                                <Card key={contest.id} className="group border-border bg-card hover:border-primary/30 hover:shadow-lg transition-all duration-300 overflow-hidden">
                                    <div className={`h-2 w-full bg-gradient-to-r ${contest.color}`} />
                                    <CardHeader>
                                        <div className="flex justify-between items-start mb-2">
                                            <Badge variant="secondary" className="mb-2">{contest.type}</Badge>
                                            <div className="p-2 rounded-full bg-secondary group-hover:bg-primary/10 transition-colors">
                                                <Trophy className="h-4 w-4 text-muted-foreground group-hover:text-primary transition-colors" />
                                            </div>
                                        </div>
                                        <CardTitle className="text-xl group-hover:text-primary transition-colors">{contest.title}</CardTitle>
                                        <CardDescription className="flex items-center gap-2 mt-2">
                                            <Calendar className="h-4 w-4" /> {formatDate(contest.startTime)}
                                        </CardDescription>
                                    </CardHeader>
                                    <CardContent>
                                        <div className="flex justify-between text-sm text-muted-foreground mb-4">
                                            <span className="flex items-center gap-1">
                                                <Clock className="h-4 w-4" /> {contest.duration}
                                            </span>
                                            <span className="flex items-center gap-1">
                                                <Users className="h-4 w-4" /> {contest.registered} registered
                                            </span>
                                        </div>
                                    </CardContent>
                                    <CardFooter>
                                        <Button className="w-full group-hover:bg-primary group-hover:text-primary-foreground transition-all">
                                            Register Now
                                        </Button>
                                    </CardFooter>
                                </Card>
                            ))}
                        </div>
                    </TabsContent>

                    <TabsContent value="past" className="space-y-6">
                        <div className="rounded-md border border-border overflow-hidden">
                            <div className="grid grid-cols-5 bg-secondary/50 p-4 text-sm font-medium text-muted-foreground">
                                <div className="col-span-2">Contest Name</div>
                                <div>Date</div>
                                <div>Participants</div>
                                <div className="text-right">Winner</div>
                            </div>
                            <div className="divide-y divide-border">
                                {pastContests.map((contest) => (
                                    <div key={contest.id} className="grid grid-cols-5 p-4 items-center hover:bg-secondary/20 transition-colors">
                                        <div className="col-span-2 font-medium flex items-center gap-2">
                                            <span className="p-1.5 rounded bg-secondary">
                                                <Trophy className="h-4 w-4 text-muted-foreground" />
                                            </span>
                                            {contest.title}
                                        </div>
                                        <div className="text-sm text-muted-foreground">{new Date(contest.date).toLocaleDateString()}</div>
                                        <div className="text-sm text-muted-foreground">{contest.participants.toLocaleString()}</div>
                                        <div className="text-right text-sm font-medium text-primary">{contest.winner}</div>
                                    </div>
                                ))}
                            </div>
                        </div>
                    </TabsContent>
                    <TabsContent value="my-contests" className="space-y-6">
                        <div className="flex flex-col items-center justify-center py-12 text-center">
                            <div className="bg-secondary/50 p-6 rounded-full mb-4">
                                <Target className="h-12 w-12 text-muted-foreground" />
                            </div>
                            <h3 className="text-xl font-bold mb-2">No Contest History</h3>
                            <p className="text-muted-foreground max-w-md mb-6">You haven't participated in any contests yet. Register for an upcoming contest to start building your rating!</p>
                            <Button onClick={() => setActiveTab("upcoming")}>
                                View Upcoming Contests
                            </Button>
                        </div>
                    </TabsContent>
                </Tabs>
            </div>
        </div >
    );
}
