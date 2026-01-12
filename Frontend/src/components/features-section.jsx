import { Link } from "react-router-dom";
import { Brain, Swords, Trophy, BookOpen, Target, Code2, Flame, Building2, Network } from "lucide-react";
import { Card, CardContent } from "@/components/ui/card";
const features = [
  {
    icon: Brain,
    title: "AI-Powered DSA",
    description: "Learn data structures and algorithms with an AI tutor that adapts to your learning pace and code quality.",
    gradient: "from-cyan-500/20 to-blue-500/20",
    link: "/dsa"
  },
  {
    icon: Swords,
    title: "Battle Arena",
    description: "Compete with peers in real-time coding battles. Test your skills under pressure with timed challenges.",
    gradient: "from-pink-500/20 to-rose-500/20",
    link: "/battle"
  },
  {
    icon: Trophy,
    title: "Leaderboards",
    description: "University-wise and global rankings. Climb the ladder and showcase your skills to recruiters.",
    gradient: "from-yellow-500/20 to-orange-500/20",
    link: "/leaderboard"
  },
  {
    icon: Target,
    title: "Aptitude Training",
    description: "Comprehensive quantitative, logical, and verbal aptitude practice with detailed solutions.",
    gradient: "from-green-500/20 to-emerald-500/20",
    link: "/aptitude"
  },
  {
    icon: BookOpen,
    title: "Language Handbooks",
    description: "In-depth guides for Python, Java, C++, JavaScript and more. From basics to advanced concepts.",
    gradient: "from-blue-500/20 to-indigo-500/20",
    link: "/handbook"
  },
  {
    icon: Code2,
    title: "Project Learning",
    description: "Build real-world projects with AI guidance. Strengthen your portfolio for interviews.",
    gradient: "from-purple-500/20 to-violet-500/20",
    link: "/projects"
  },
  {
    icon: Flame,
    title: "Streaks & Badges",
    description: "Stay motivated with daily streaks, achievement badges, and progress milestones like LeetCode.",
    gradient: "from-orange-500/20 to-red-500/20",
    link: "/dashboard"
  },
  {
    icon: Building2,
    title: "Company Specific",
    description: "Practice questions from Google, Amazon, Microsoft, and 500+ companies with interview patterns.",
    gradient: "from-teal-500/20 to-cyan-500/20",
    link: "/companies"
  },
  {
    icon: Network,
    title: "System Design",
    description: "Master HLD & LLD concepts. Learn to design scalable systems like Uber, Netflix, and WhatsApp.",
    gradient: "from-indigo-500/20 to-purple-500/20",
    link: "/system-design"
  },
  {
    icon: Trophy,
    title: "Contests",
    description: "Participate in weekly and biweekly contests. Compete globally and improve your rating.",
    gradient: "from-yellow-500/20 to-orange-500/20",
    link: "/contest"
  }
];
import { ScrollReveal } from "@/components/ui/scroll-reveal";

export function FeaturesSection() {
  return <section className="py-20 md:py-32">
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
      <ScrollReveal>
        <div className="mx-auto max-w-2xl text-center">
          <h2 className="text-3xl font-bold sm:text-4xl">
            Everything you need to <span className="gradient-text">crack placements</span>
          </h2>
          <p className="mt-4 text-muted-foreground">
            A complete platform designed to transform you from a beginner to placement-ready in weeks.
          </p>
        </div>
      </ScrollReveal>

      <div className="mt-16 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {features.map((feature, index) => (
          <ScrollReveal key={feature.title} delay={index * 100}>
            <Link to={feature.link}>
              <Card
                className={`h-full group border-border bg-gradient-to-br ${feature.gradient} backdrop-blur-sm hover-lift-premium cursor-pointer`}
              >
                <CardContent className="p-6">
                  <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-xl bg-background/80 text-primary transition-all duration-500 group-hover:bg-primary group-hover:text-primary-foreground group-hover:scale-110 group-hover:rotate-3 group-hover:shadow-lg group-hover:shadow-primary/30">
                    <feature.icon className="h-6 w-6 transition-transform duration-300 group-hover:scale-110" />
                  </div>
                  <h3 className="mb-2 font-semibold transition-colors duration-300 group-hover:text-primary">
                    {feature.title}
                  </h3>
                  <p className="text-sm text-muted-foreground transition-colors duration-300 group-hover:text-foreground/80">
                    {feature.description}
                  </p>
                </CardContent>
              </Card>
            </Link>
          </ScrollReveal>
        ))}
      </div>
    </div>
  </section>;
}
