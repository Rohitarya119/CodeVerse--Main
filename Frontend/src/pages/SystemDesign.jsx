"use client";

import { useState } from "react";
import { Link } from "react-router-dom";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import {
    Server,
    Database,
    Globe,
    Shield,
    Zap,
    Layout,
    MessageSquare,
    ArrowRight,
    CheckCircle2,
    BookOpen,
    Layers,
    Cpu,
    Network
} from "lucide-react";

const hldTopics = [
    {
        id: "hld-1",
        title: "Scalability & Load Balancing",
        description: "Horizontal vs Vertical scaling, Load Balancers (L4/L7), Consistent Hashing.",
        icon: Server,
        color: "text-blue-500",
        bg: "bg-blue-500/10"
    },
    {
        id: "hld-2",
        title: "Databases & Caching",
        description: "SQL vs NoSQL, Sharding, Replication, CAP Theorem, Redis/Memcached strategies.",
        icon: Database,
        color: "text-green-500",
        bg: "bg-green-500/10"
    },
    {
        id: "hld-3",
        title: "Message Queues & Event Driven",
        description: "Kafka, RabbitMQ, Pub/Sub models, Async processing, Microservices communication.",
        icon: MessageSquare,
        color: "text-orange-500",
        bg: "bg-orange-500/10"
    },
    {
        id: "hld-4",
        title: "API Design & Protocols",
        description: "REST, GraphQL, gRPC, WebSockets, API Gateway, Rate Limiting.",
        icon: Globe,
        color: "text-purple-500",
        bg: "bg-purple-500/10"
    }
];

const lldTopics = [
    {
        id: "lld-1",
        title: "Object Oriented Design",
        description: "SOLID Principles, Design Patterns (Singleton, Factory, Observer, etc.), UML Diagrams.",
        icon: Layout,
        color: "text-pink-500",
        bg: "bg-pink-500/10"
    },
    {
        id: "lld-2",
        title: "Schema Design",
        description: "ER Diagrams, Normalization, Indexing strategies, Data modeling for specific use cases.",
        icon: Layers,
        color: "text-cyan-500",
        bg: "bg-cyan-500/10"
    },
    {
        id: "lld-3",
        title: "Concurrency & Multithreading",
        description: "Locks, Semaphores, Thread Pools, Deadlocks, Atomic operations.",
        icon: Zap,
        color: "text-yellow-500",
        bg: "bg-yellow-500/10"
    }
];

const caseStudies = [
    {
        id: "cs-1",
        title: "Design URL Shortener (TinyURL)",
        difficulty: "Easy",
        tags: ["Hashing", "Database", "Cache"],
        status: "Completed"
    },
    {
        id: "cs-2",
        title: "Design Instagram / News Feed",
        difficulty: "Medium",
        tags: ["Fan-out", "Sharding", "Feed Generation"],
        status: "In Progress"
    },
    {
        id: "cs-3",
        title: "Design Chat Application (WhatsApp)",
        difficulty: "Medium",
        tags: ["WebSockets", "Real-time", "Storage"],
        status: "Not Started"
    },
    {
        id: "cs-4",
        title: "Design Uber / Ride Sharing",
        difficulty: "Hard",
        tags: ["Geo-hashing", "Matching", "Real-time"],
        status: "Not Started"
    },
    {
        id: "cs-5",
        title: "Design YouTube / Netflix",
        difficulty: "Hard",
        tags: ["CDN", "Streaming", "Transcoding"],
        status: "Not Started"
    }
];

export default function SystemDesignPage() {
    const [activeTab, setActiveTab] = useState("hld");

    return (
        <div className="min-h-[calc(100vh-4rem)] bg-background">
            <div className="container mx-auto p-6 lg:p-8">
                {/* Header */}
                <div className="mb-8">
                    <h1 className="text-3xl font-bold mb-2 flex items-center gap-2">
                        <Network className="h-8 w-8 text-primary" />
                        System Design
                    </h1>
                    <p className="text-muted-foreground">Master High-Level and Low-Level design concepts for scalable systems.</p>
                </div>

                {/* Stats / Progress */}
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
                    {[
                        {
                            label: "Concepts Learned",
                            value: "12/45",
                            icon: BookOpen,
                            trend: "+2 this week",
                            color: "text-blue-500",
                            bg: "bg-blue-500/10",
                            border: "hover:border-blue-500/50"
                        },
                        {
                            label: "Designs Built",
                            value: "3",
                            icon: Cpu,
                            trend: "1 in progress",
                            color: "text-purple-500",
                            bg: "bg-purple-500/10",
                            border: "hover:border-purple-500/50"
                        },
                        {
                            label: "Mock Interviews",
                            value: "5",
                            icon: CheckCircle2,
                            trend: "Avg Score: 8.5/10",
                            color: "text-green-500",
                            bg: "bg-green-500/10",
                            border: "hover:border-green-500/50"
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

                {/* Tabs */}
                <Tabs value={activeTab} onValueChange={setActiveTab} className="space-y-6">
                    <TabsList className="bg-secondary/50 p-1">
                        <TabsTrigger value="hld" className="gap-2 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground">
                            <Globe className="h-4 w-4" /> High Level Design
                        </TabsTrigger>
                        <TabsTrigger value="lld" className="gap-2 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground">
                            <Layout className="h-4 w-4" /> Low Level Design
                        </TabsTrigger>
                        <TabsTrigger value="casestudies" className="gap-2 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground">
                            <BriefcaseIcon className="h-4 w-4" /> Case Studies
                        </TabsTrigger>
                    </TabsList>

                    {/* HLD Content */}
                    <TabsContent value="hld" className="space-y-6">
                        <div className="grid md:grid-cols-2 gap-6">
                            {hldTopics.map((topic) => (
                                <Card key={topic.id} className="group border-border hover:border-primary/30 hover:shadow-lg transition-all cursor-pointer">
                                    <CardHeader>
                                        <div className="flex items-start justify-between">
                                            <div className={`p-3 rounded-xl ${topic.bg} mb-4`}>
                                                <topic.icon className={`h-6 w-6 ${topic.color}`} />
                                            </div>
                                            <Badge variant="outline">Concept</Badge>
                                        </div>
                                        <CardTitle className="group-hover:text-primary transition-colors">{topic.title}</CardTitle>
                                        <CardDescription>{topic.description}</CardDescription>
                                    </CardHeader>
                                    <CardContent>
                                        <Button variant="ghost" className="w-full justify-between group-hover:bg-primary/5">
                                            Start Learning <ArrowRight className="h-4 w-4" />
                                        </Button>
                                    </CardContent>
                                </Card>
                            ))}
                        </div>
                    </TabsContent>

                    {/* LLD Content */}
                    <TabsContent value="lld" className="space-y-6">
                        <div className="grid md:grid-cols-2 gap-6">
                            {lldTopics.map((topic) => (
                                <Card key={topic.id} className="group border-border hover:border-primary/30 hover:shadow-lg transition-all cursor-pointer">
                                    <CardHeader>
                                        <div className="flex items-start justify-between">
                                            <div className={`p-3 rounded-xl ${topic.bg} mb-4`}>
                                                <topic.icon className={`h-6 w-6 ${topic.color}`} />
                                            </div>
                                            <Badge variant="outline">Concept</Badge>
                                        </div>
                                        <CardTitle className="group-hover:text-primary transition-colors">{topic.title}</CardTitle>
                                        <CardDescription>{topic.description}</CardDescription>
                                    </CardHeader>
                                    <CardContent>
                                        <Button variant="ghost" className="w-full justify-between group-hover:bg-primary/5">
                                            Start Learning <ArrowRight className="h-4 w-4" />
                                        </Button>
                                    </CardContent>
                                </Card>
                            ))}
                        </div>
                    </TabsContent>

                    {/* Case Studies Content */}
                    <TabsContent value="casestudies" className="space-y-6">
                        <Card className="border-border">
                            <CardHeader>
                                <CardTitle>Popular System Design Problems</CardTitle>
                                <CardDescription>Real-world interview questions from top tech companies.</CardDescription>
                            </CardHeader>
                            <CardContent>
                                <div className="space-y-4">
                                    {caseStudies.map((study) => (
                                        <div key={study.id} className="flex flex-col sm:flex-row sm:items-center justify-between p-4 rounded-lg border border-border hover:bg-secondary/30 transition-colors gap-4">
                                            <div>
                                                <h3 className="font-semibold text-lg hover:text-primary cursor-pointer transition-colors">
                                                    {study.title}
                                                </h3>
                                                <div className="flex flex-wrap gap-2 mt-2">
                                                    {study.tags.map(tag => (
                                                        <Badge key={tag} variant="secondary" className="text-xs">{tag}</Badge>
                                                    ))}
                                                </div>
                                            </div>
                                            <div className="flex items-center gap-4">
                                                <Badge className={
                                                    study.difficulty === "Easy" ? "bg-green-500/10 text-green-500" :
                                                        study.difficulty === "Medium" ? "bg-yellow-500/10 text-yellow-500" :
                                                            "bg-red-500/10 text-red-500"
                                                }>
                                                    {study.difficulty}
                                                </Badge>
                                                <Button size="sm" variant={study.status === "Completed" ? "outline" : "default"}>
                                                    {study.status === "Completed" ? "Review" : "Start Design"}
                                                </Button>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            </CardContent>
                        </Card>
                    </TabsContent>
                </Tabs>
            </div>
        </div>
    );
}

function BriefcaseIcon(props) {
    return (
        <svg
            {...props}
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
        >
            <rect width="20" height="14" x="2" y="7" rx="2" ry="2" />
            <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16" />
        </svg>
    )
}
