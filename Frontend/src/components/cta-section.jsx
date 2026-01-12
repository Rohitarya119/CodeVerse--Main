import { Link } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { ArrowRight } from "lucide-react";
export function CTASection() {
  return <section className="py-20 md:py-32">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-primary/20 via-card to-accent/20 p-8 md:p-16 transition-all duration-500 hover:shadow-2xl hover:shadow-primary/20 group">
          {
    /* Animated background elements */
  }
          <div className="absolute top-0 right-0 h-64 w-64 rounded-full bg-primary/10 blur-3xl animate-pulse-glow" />
          <div
    className="absolute bottom-0 left-0 h-64 w-64 rounded-full bg-accent/10 blur-3xl animate-pulse-glow"
    style={{ animationDelay: "1s" }}
  />

          <div className="relative z-10 mx-auto max-w-2xl text-center">
            <h2 className="text-3xl font-bold sm:text-4xl transition-all duration-300 group-hover:scale-105">
              Ready to ace your placements?
            </h2>
            <p className="mt-4 text-muted-foreground">
              Join thousands of students who have landed their dream jobs at top tech companies. Start your journey
              today.
            </p>
            <div className="mt-8 flex flex-col items-center justify-center gap-4 sm:flex-row">
              <Link to="/signup">
                <Button
    size="lg"
    className="group/btn h-12 gap-2 bg-primary px-8 transition-all duration-300 hover:bg-primary/90 hover:scale-105 hover:shadow-xl hover:shadow-primary/30"
  >
                  Start Learning Free
                  <ArrowRight className="h-4 w-4 transition-transform duration-300 group-hover/btn:translate-x-1" />
                </Button>
              </Link>
              <Link to="/login">
                <Button
    variant="outline"
    size="lg"
    className="h-12 px-8 bg-transparent transition-all duration-300 hover:bg-primary/10 hover:text-primary hover:scale-105 hover:border-primary/50"
  >
                  I already have an account
                </Button>
              </Link>
            </div>
          </div>
        </div>
      </div>
    </section>;
}
