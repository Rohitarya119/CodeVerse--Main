"use client";
import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription, CardFooter } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Progress } from "@/components/ui/progress";
import {
    FolderKanban,
    Search,
    Github,
    ExternalLink,
    Star,
    GitFork,
    Code2,
    Rocket,
    Layout,
    Database,
    Server,
    Cpu,
    Globe,
    Smartphone,
    Zap,
    Plus,
    Filter
} from "lucide-react";

const projects = [
    {
        id: 1,
        title: "E-Commerce Platform",
        description: "Full-stack e-commerce application with payment gateway integration, admin dashboard, and order management.",
        techStack: ["React", "Node.js", "MongoDB", "Stripe"],
        difficulty: "Advanced",
        category: "Full Stack",
        stars: 124,
        forks: 45,
        image: "https://images.unsplash.com/photo-1557821552-17105176677c?w=800&q=80",
        progress: 100,
        status: "Completed"
    },
    {
        id: 2,
        title: "Task Management App",
        description: "Collaborative task manager with real-time updates, drag-and-drop interface, and team features.",
        techStack: ["Next.js", "TypeScript", "Prisma", "Socket.io"],
        difficulty: "Intermediate",
        category: "Web App",
        stars: 89,
        forks: 23,
        image: "https://images.unsplash.com/photo-1540350394557-8d14678e7f91?w=800&q=80",
        progress: 65,
        status: "In Progress"
    },
    {
        id: 3,
        title: "AI Image Generator",
        description: "Web application that uses OpenAI's DALL-E API to generate images from text descriptions.",
        techStack: ["React", "OpenAI API", "Tailwind CSS"],
        difficulty: "Intermediate",
        category: "AI/ML",
        stars: 256,
        forks: 89,
        image: "https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800&q=80",
        progress: 30,
        status: "In Progress"
    },
    {
        id: 4,
        title: "Crypto Portfolio Tracker",
        description: "Real-time cryptocurrency portfolio tracker with price charts, alerts, and market analysis.",
        techStack: ["Vue.js", "Firebase", "CoinGecko API"],
        difficulty: "Beginner",
        category: "Web App",
        stars: 45,
        forks: 12,
        image: "https://images.unsplash.com/photo-1518546305927-5a555bb7020d?w=800&q=80",
        progress: 0,
        status: "Not Started"
    },
    {
        id: 5,
        title: "Social Media Dashboard",
        description: "Analytics dashboard for social media accounts with data visualization and reporting tools.",
        techStack: ["Angular", "D3.js", "Express"],
        difficulty: "Advanced",
        category: "Data Visualization",
        stars: 167,
        forks: 56,
        image: "https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=800&q=80",
        progress: 0,
        status: "Not Started"
    },
    {
        id: 6,
        title: "Weather App",
        description: "Beautiful weather application with location detection, 7-day forecast, and dynamic backgrounds.",
        techStack: ["React Native", "OpenWeatherMap API"],
        difficulty: "Beginner",
        category: "Mobile App",
        stars: 78,
        forks: 34,
        image: "https://images.unsplash.com/photo-1592210454359-9043f067919b?w=800&q=80",
        progress: 0,
        status: "Not Started"
    }
];

const categories = ["All", "Full Stack", "Web App", "Mobile App", "AI/ML", "Data Visualization"];

export default function ProjectsPage() {
    const [search, setSearch] = useState("");
    const [selectedCategory, setSelectedCategory] = useState("All");

    const filteredProjects = projects.filter(project => {
        const matchesSearch = project.title.toLowerCase().includes(search.toLowerCase()) ||
            project.description.toLowerCase().includes(search.toLowerCase());
        const matchesCategory = selectedCategory === "All" || project.category === selectedCategory;
        return matchesSearch && matchesCategory;
    });

    return (
        <div className="min-h-[calc(100vh-4rem)] bg-background">
            <div className="container mx-auto p-6 lg:p-8">
                {/* Header */}
                <div className="mb-8 flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
                    <div>
                        <h1 className="text-3xl font-bold">
                            Project <span className="gradient-text">Portfolio</span>
                        </h1>
                        <p className="mt-2 text-muted-foreground">
                            Build real-world projects to showcase your skills and land your dream job
                        </p>
                    </div>
                    <Button className="bg-primary hover:bg-primary/90 gap-2 shadow-lg shadow-primary/20">
                        <Plus className="h-4 w-4" /> New Project
                    </Button>
                </div>

                {/* Stats Banner */}
                <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8">
                    {[
                        { label: "Total Projects", value: "12", icon: FolderKanban, color: "text-blue-500" },
                        { label: "Completed", value: "5", icon: CheckCircle2, color: "text-green-500" },
                        { label: "In Progress", value: "3", icon: Rocket, color: "text-orange-500" },
                        { label: "Total Stars", value: "450+", icon: Star, color: "text-yellow-500" }
                    ].map((stat) => (
                        <Card key={stat.label} className="border-border bg-card/50 hover:bg-card/80 transition-all duration-300">
                            <CardContent className="p-4 flex items-center gap-4">
                                <div className={`p-3 rounded-xl bg-secondary ${stat.color} bg-opacity-10`}>
                                    <stat.icon className={`h-6 w-6 ${stat.color}`} />
                                </div>
                                <div>
                                    <p className="text-2xl font-bold">{stat.value}</p>
                                    <p className="text-xs text-muted-foreground">{stat.label}</p>
                                </div>
                            </CardContent>
                        </Card>
                    ))}
                </div>

                {/* Filters */}
                <div className="flex flex-col md:flex-row gap-4 mb-8">
                    <div className="relative flex-1">
                        <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                        <Input
                            placeholder="Search projects..."
                            value={search}
                            onChange={(e) => setSearch(e.target.value)}
                            className="pl-9 bg-secondary border-border focus:ring-primary/50"
                        />
                    </div>
                    <div className="flex gap-2 overflow-x-auto pb-2 md:pb-0">
                        {categories.map((cat) => (
                            <Button
                                key={cat}
                                variant={selectedCategory === cat ? "default" : "outline"}
                                onClick={() => setSelectedCategory(cat)}
                                className="whitespace-nowrap"
                            >
                                {cat}
                            </Button>
                        ))}
                    </div>
                </div>

                {/* Projects Grid */}
                <div className="grid gap-6 md:grid-cols-2 xl:grid-cols-3">
                    {filteredProjects.map((project, index) => (
                        <Card
                            key={project.id}
                            className="group border-border overflow-hidden hover:shadow-xl transition-all duration-300 hover:-translate-y-1"
                            style={{ animationDelay: `${index * 0.1}s` }}
                        >
                            <div className="relative h-48 overflow-hidden">
                                <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent z-10" />
                                <img
                                    src={project.image}
                                    alt={project.title}
                                    className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                                />
                                <div className="absolute bottom-4 left-4 z-20">
                                    <Badge className="bg-primary/90 hover:bg-primary text-white border-none mb-2">
                                        {project.category}
                                    </Badge>
                                    <h3 className="text-xl font-bold text-white">{project.title}</h3>
                                </div>
                                <div className="absolute top-4 right-4 z-20 flex gap-2">
                                    <Badge variant="secondary" className="bg-black/50 text-white backdrop-blur-sm border-none">
                                        {project.difficulty}
                                    </Badge>
                                </div>
                            </div>

                            <CardContent className="p-6">
                                <p className="text-muted-foreground text-sm mb-4 line-clamp-2">
                                    {project.description}
                                </p>

                                <div className="flex flex-wrap gap-2 mb-4">
                                    {project.techStack.map((tech) => (
                                        <Badge key={tech} variant="outline" className="text-xs">
                                            {tech}
                                        </Badge>
                                    ))}
                                </div>

                                <div className="space-y-2 mb-4">
                                    <div className="flex justify-between text-xs text-muted-foreground">
                                        <span>Progress</span>
                                        <span>{project.progress}%</span>
                                    </div>
                                    <Progress value={project.progress} className="h-1.5" />
                                </div>

                                <div className="flex items-center justify-between text-sm text-muted-foreground">
                                    <div className="flex items-center gap-4">
                                        <span className="flex items-center gap-1 hover:text-yellow-500 transition-colors">
                                            <Star className="h-4 w-4" /> {project.stars}
                                        </span>
                                        <span className="flex items-center gap-1 hover:text-primary transition-colors">
                                            <GitFork className="h-4 w-4" /> {project.forks}
                                        </span>
                                    </div>
                                    <span className={`flex items-center gap-1 ${project.status === "Completed" ? "text-green-500" :
                                        project.status === "In Progress" ? "text-orange-500" : "text-muted-foreground"
                                        }`}>
                                        {project.status === "Completed" ? <CheckCircle2 className="h-3 w-3" /> :
                                            project.status === "In Progress" ? <Zap className="h-3 w-3" /> : <Clock className="h-3 w-3" />}
                                        {project.status}
                                    </span>
                                </div>
                            </CardContent>

                            <CardFooter className="p-6 pt-0 flex gap-3">
                                <Button className="flex-1 bg-secondary hover:bg-secondary/80 text-foreground">
                                    <Github className="mr-2 h-4 w-4" /> Code
                                </Button>
                                <Button className="flex-1 bg-primary hover:bg-primary/90">
                                    <ExternalLink className="mr-2 h-4 w-4" /> Demo
                                </Button>
                            </CardFooter>
                        </Card>
                    ))}
                </div>
            </div>
        </div>
    );
}

function CheckCircle2(props) {
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
            <circle cx="12" cy="12" r="10" />
            <path d="m9 12 2 2 4-4" />
        </svg>
    )
}

function Clock(props) {
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
            <circle cx="12" cy="12" r="10" />
            <polyline points="12 6 12 12 16 14" />
        </svg>
    )
}
