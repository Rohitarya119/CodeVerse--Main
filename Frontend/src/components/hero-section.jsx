import { Link } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { ArrowRight, Sparkles } from "lucide-react";
export function HeroSection() {
  return <section className="relative overflow-hidden pt-16 pb-20 md:pt-24 md:pb-32">
    <div className="absolute inset-0 -z-10">
      <div className="absolute top-1/4 left-1/4 h-96 w-96 rounded-full bg-primary/20 blur-3xl animate-pulse-glow" />
      <div
        className="absolute bottom-1/4 right-1/4 h-96 w-96 rounded-full bg-accent/20 blur-3xl animate-pulse-glow"
        style={{ animationDelay: "1s" }}
      />
      <div
        className="absolute top-1/2 left-1/2 h-64 w-64 -translate-x-1/2 -translate-y-1/2 rounded-full bg-primary/10 blur-3xl animate-pulse-glow"
        style={{ animationDelay: "0.5s" }}
      />
    </div>

    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
      <div className="mx-auto max-w-4xl text-center">
        <div className="mb-6 inline-flex items-center gap-2 rounded-full border border-primary/30 bg-primary/10 px-4 py-1.5 text-sm text-primary transition-all duration-300 hover:scale-105 hover:bg-primary/20 hover:shadow-lg hover:shadow-primary/20 cursor-pointer">
          <Sparkles className="h-4 w-4 animate-pulse" />
          AI-Powered Placement Preparation
        </div>

        <h1 className="text-balance text-4xl font-bold tracking-tight sm:text-6xl lg:text-7xl">
          Master Your <span className="gradient-text">Placements</span> with AI
        </h1>

        <p className="mx-auto mt-6 max-w-2xl text-pretty text-lg text-muted-foreground sm:text-xl">
          Your complete toolkit for placement success. AI-powered DSA learning, aptitude training, real-time coding
          battles, and company-specific preparation.
        </p>

        <div className="mt-10 flex flex-col items-center justify-center gap-4 sm:flex-row">
          <Link to="/signup">
            <Button
              size="lg"
              className="group h-12 gap-2 bg-primary px-8 text-base transition-all duration-300 hover:bg-primary/90 hover:scale-105 hover:shadow-xl hover:shadow-primary/30"
            >
              Get Started Free
              <ArrowRight className="h-4 w-4 transition-transform duration-300 group-hover:translate-x-1" />
            </Button>
          </Link>
          <Link to="/dashboard">
            <Button
              variant="outline"
              size="lg"
              className="h-12 px-8 text-base bg-transparent transition-all duration-300 hover:bg-primary/10 hover:text-primary hover:scale-105 hover:border-primary/50"
            >
              Explore Platform
            </Button>
          </Link>
        </div>

        <div className="mt-16 grid grid-cols-2 gap-8 sm:grid-cols-4">
          {[
            { value: "50K+", label: "Active Users" },
            { value: "10K+", label: "Problems" },
            { value: "500+", label: "Companies" },
            { value: "95%", label: "Success Rate" }
          ].map((stat, index) => <div
            key={stat.label}
            className="group cursor-pointer transition-all duration-300 hover:-translate-y-2"
            style={{ animationDelay: `${index * 0.1}s` }}
          >
            <div className="text-3xl font-bold text-primary transition-all duration-300 group-hover:scale-110">
              {stat.value}
            </div>
            <div className="mt-1 text-sm text-muted-foreground transition-colors duration-300 group-hover:text-foreground">
              {stat.label}
            </div>
          </div>)}
        </div>
      </div>
    </div>
  </section>;
}
