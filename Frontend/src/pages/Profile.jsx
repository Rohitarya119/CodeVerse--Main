"use client";
import { useState, useEffect } from "react";
import { useAuth } from "@/context/AuthContext";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import {
  MapPin,
  Building2,
  Calendar,
  Edit,
  Github,
  Linkedin,
  Twitter,
  Flame // Still used in header
} from "lucide-react";
import { ScrollReveal } from "@/components/ui/scroll-reveal";

// Import Dashboard Components for Visual Analytics
import { StatsCards } from "@/components/dashboard/stats-cards";
import { StreakCalendar } from "@/components/dashboard/streak-calendar";
import { BadgesSection } from "@/components/dashboard/badges-section";
import { RecentActivity } from "@/components/dashboard/recent-activity";
import { ProgressSection } from "@/components/dashboard/progress-section";
import { SkillRadar } from "@/components/dashboard/skill-radar";

export default function ProfilePage() {
  const { user } = useAuth();
  const [stats, setStats] = useState({
    totalSolved: 0,
    easySolved: 0,
    mediumSolved: 0,
    hardSolved: 0
  });

  useEffect(() => {
    const fetchStats = async () => {
      if (!user) return;
      try {
        const token = localStorage.getItem("token"); // Or useAuth token if available
        const headers = {};
        if (token) {
           headers["Authorization"] = `Bearer ${token}`;
        }
        
        const response = await fetch("/api/users/me/stats", { headers });
        if (response.ok) {
          const data = await response.json();
          setStats(data);
        }
      } catch (error) {
        console.error("Error fetching stats:", error);
      }
    };
    fetchStats();
  }, []);

  if (!user) return null; // Or a loading spinner

  return (
    <div className="min-h-[calc(100vh-4rem)] bg-background">
      <div className="container mx-auto p-6 lg:p-8">
        
        {/* User Profile Header */}
        <ScrollReveal>
          <Card className="border-border bg-gradient-to-br from-primary/10 via-card to-accent/10 mb-8">
            <CardContent className="p-8">
              <div className="flex flex-col items-center gap-6 md:flex-row md:items-start">
                <div className="relative">
                  <Avatar className="h-32 w-32 border-4 border-background">
                    <AvatarImage src={`https://api.dicebear.com/7.x/avataaars/svg?seed=${user.username}`} />
                    <AvatarFallback className="text-4xl">{user.username?.charAt(0).toUpperCase()}</AvatarFallback>
                  </Avatar>
                  <button className="absolute bottom-0 right-0 rounded-full bg-primary p-2 text-primary-foreground hover:bg-primary/90 transition-transform hover:scale-105">
                    <Edit className="h-4 w-4" />
                  </button>
                </div>

                <div className="flex-1 text-center md:text-left">
                  <div className="flex flex-col items-center gap-4 md:flex-row">
                    <h1 className="text-2xl font-bold">{user.fullName || user.username}</h1>
                    <Badge className="bg-primary/20 text-primary">Member</Badge>
                  </div>
                  <p className="mt-2 text-muted-foreground">@{user.username}</p>

                  <div className="mt-4 flex flex-wrap items-center justify-center gap-4 text-sm text-muted-foreground md:justify-start">
                    <span className="flex items-center gap-1">
                      <Building2 className="h-4 w-4" />
                      CodeVerse
                    </span>
                    <span className="flex items-center gap-1">
                      <MapPin className="h-4 w-4" />
                      Earth
                    </span>
                    <span className="flex items-center gap-1">
                      <Calendar className="h-4 w-4" />
                      Joined Recently
                    </span>
                  </div>

                  <div className="mt-4 flex items-center justify-center gap-2 md:justify-start">
                    <Button variant="outline" size="icon" className="h-9 w-9 bg-transparent hover:text-primary transition-colors">
                      <Github className="h-4 w-4" />
                    </Button>
                    <Button variant="outline" size="icon" className="h-9 w-9 bg-transparent hover:text-blue-600 transition-colors">
                      <Linkedin className="h-4 w-4" />
                    </Button>
                    <Button variant="outline" size="icon" className="h-9 w-9 bg-transparent hover:text-sky-500 transition-colors">
                      <Twitter className="h-4 w-4" />
                    </Button>
                  </div>
                </div>

                {/* Quick Stats in Header */}
                <div className="grid grid-cols-3 gap-4 text-center">
                  <div className="rounded-lg bg-background/50 p-4 backdrop-blur-sm border border-border/50">
                    <p className="text-2xl font-bold text-primary">{stats.totalSolved}</p>
                    <p className="text-xs text-muted-foreground">Solved</p>
                  </div>
                  <div className="rounded-lg bg-background/50 p-4 backdrop-blur-sm border border-border/50">
                    <p className="text-2xl font-bold">N/A</p>
                    <p className="text-xs text-muted-foreground">Rating</p>
                  </div>
                  <div className="rounded-lg bg-background/50 p-4 backdrop-blur-sm border border-border/50">
                    <p className="flex items-center justify-center gap-1 text-2xl font-bold">
                      <Flame className="h-5 w-5 text-orange-500 animate-pulse" />
                      0
                    </p>
                    <p className="text-xs text-muted-foreground">Streak</p>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>
        </ScrollReveal>

        {/* Visual Analytics Section */}
        <ScrollReveal delay={100}>
          <div className="mb-8">
            <h2 className="text-xl font-bold mb-4">Performance Overview</h2>
            <StatsCards stats={stats} />
          </div>
        </ScrollReveal>

        <div className="grid gap-8 lg:grid-cols-2 mb-8">
           <ScrollReveal delay={200} className="h-full">
            <SkillRadar stats={stats} />
          </ScrollReveal>
          <ScrollReveal delay={300} className="h-full">
             <ProgressSection stats={stats} />
          </ScrollReveal>
        </div>

        <div className="grid gap-8 lg:grid-cols-2 mb-8">
           <ScrollReveal delay={400} className="h-full">
            <StreakCalendar />
          </ScrollReveal>
          <ScrollReveal delay={500} className="h-full">
            <BadgesSection />
          </ScrollReveal>
        </div>

        <ScrollReveal delay={600}>
           <div className="mb-8">
            <h2 className="text-xl font-bold mb-4">Recent Activity</h2>
            <RecentActivity />
          </div>
        </ScrollReveal>

      </div>
    </div>
  );
}
