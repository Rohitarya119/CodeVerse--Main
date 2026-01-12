import { StatsCards } from "@/components/dashboard/stats-cards";
import { StreakCalendar } from "@/components/dashboard/streak-calendar";
import { BadgesSection } from "@/components/dashboard/badges-section";
import { RecentActivity } from "@/components/dashboard/recent-activity";
import { ProgressSection } from "@/components/dashboard/progress-section";
import { DailyGoals } from "@/components/dashboard/daily-goals";
import { UpcomingContests } from "@/components/dashboard/upcoming-contests";
import { RecommendedProblems } from "@/components/dashboard/recommended-problems";
import { SkillRadar } from "@/components/dashboard/skill-radar";
import { ScrollReveal } from "@/components/ui/scroll-reveal";

export default function DashboardPage() {
  return (
    <div className="min-h-[calc(100vh-4rem)] bg-background">
      <div className="p-6 lg:p-8 container mx-auto">
        <ScrollReveal>
          <div className="mb-8 flex flex-col gap-4 lg:flex-row lg:items-center lg:justify-between">
            <div>
              <h1 className="text-2xl font-bold">Welcome back, John!</h1>
              <p className="text-muted-foreground">Ready to continue your placement prep journey?</p>
            </div>
            <div className="flex gap-3">
              <div className="rounded-lg border border-primary/20 bg-primary/5 px-4 py-2 transition-all hover:border-primary/40 hover:bg-primary/10 hover:scale-105 cursor-pointer">
                <p className="text-xs text-muted-foreground">Today's Goal</p>
                <p className="text-lg font-bold text-primary">3/5 Problems</p>
              </div>
              <div className="rounded-lg border border-orange-500/20 bg-orange-500/5 px-4 py-2 transition-all hover:border-orange-500/40 hover:bg-orange-500/10 hover:scale-105 cursor-pointer">
                <p className="text-xs text-muted-foreground">Streak</p>
                <p className="text-lg font-bold text-orange-500">7 Days</p>
              </div>
            </div>
          </div>
        </ScrollReveal>

        <ScrollReveal delay={100}>
          <StatsCards />
        </ScrollReveal>

        <div className="mt-8 grid gap-8 lg:grid-cols-3">
          <ScrollReveal delay={200} className="h-full">
            <DailyGoals />
          </ScrollReveal>
          <ScrollReveal delay={300} className="h-full">
            <UpcomingContests />
          </ScrollReveal>
          <ScrollReveal delay={400} className="h-full">
            <RecommendedProblems />
          </ScrollReveal>
        </div>

        <div className="mt-8 grid gap-8 lg:grid-cols-2">
          <ScrollReveal delay={500} className="h-full">
            <StreakCalendar />
          </ScrollReveal>
          <ScrollReveal delay={600} className="h-full">
            <BadgesSection />
          </ScrollReveal>
        </div>

        <div className="mt-8 grid gap-8 lg:grid-cols-2">
          <ScrollReveal delay={700} className="h-full">
            <SkillRadar />
          </ScrollReveal>
          <ScrollReveal delay={800} className="h-full">
            <ProgressSection />
          </ScrollReveal>
        </div>

        <div className="mt-8">
          <ScrollReveal delay={900}>
            <RecentActivity />
          </ScrollReveal>
        </div>
      </div>
    </div>
  );
}
