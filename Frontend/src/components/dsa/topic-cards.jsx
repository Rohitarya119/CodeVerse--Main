import { Link } from "react-router-dom";
import { Card, CardContent } from "@/components/ui/card";
import { ArrowRight } from "lucide-react";
const topics = [
  {
    name: "Arrays",
    count: 0,
    solved: 0,
    gradient: "from-cyan-500/20 to-blue-500/20",
    hoverGradient: "hover:from-cyan-500/30 hover:to-blue-500/30"
  },
  {
    name: "Strings",
    count: 0,
    solved: 0,
    gradient: "from-blue-500/20 to-indigo-500/20",
    hoverGradient: "hover:from-blue-500/30 hover:to-indigo-500/30"
  },
  {
    name: "Linked Lists",
    count: 0,
    solved: 0,
    gradient: "from-pink-500/20 to-rose-500/20",
    hoverGradient: "hover:from-pink-500/30 hover:to-rose-500/30"
  },
  {
    name: "Trees",
    count: 0,
    solved: 0,
    gradient: "from-yellow-500/20 to-orange-500/20",
    hoverGradient: "hover:from-yellow-500/30 hover:to-orange-500/30"
  },
  {
    name: "Graphs",
    count: 0,
    solved: 0,
    gradient: "from-red-500/20 to-rose-500/20",
    hoverGradient: "hover:from-red-500/30 hover:to-rose-500/30"
  },
  {
    name: "Dynamic Programming",
    count: 0,
    solved: 0,
    gradient: "from-purple-500/20 to-violet-500/20",
    hoverGradient: "hover:from-purple-500/30 hover:to-violet-500/30"
  }
];
export function TopicCards() {
  return <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
      {topics.map((topic, index) => <Link key={topic.name} to={`/dsa?topic=${topic.name}`}>
          <Card
    className={`group border-border bg-gradient-to-br ${topic.gradient} ${topic.hoverGradient} transition-all duration-500 hover:scale-105 hover:shadow-2xl hover:shadow-primary/10 hover:border-primary/30 cursor-pointer`}
    style={{ animationDelay: `${index * 0.1}s` }}
  >
            <CardContent className="p-6">
              <div className="flex items-center justify-between">
                <h3 className="font-semibold transition-colors duration-300 group-hover:text-primary">{topic.name}</h3>
                <ArrowRight className="h-4 w-4 transition-all duration-300 group-hover:translate-x-2 group-hover:text-primary" />
              </div>
              <div className="mt-4">
                <div className="flex items-end justify-between">
                  <span className="text-3xl font-bold transition-all duration-300 group-hover:scale-110 group-hover:text-primary">
                    {topic.solved}
                  </span>
                  <span className="text-sm text-muted-foreground">/ {topic.count}</span>
                </div>
                <div className="mt-2 h-2 overflow-hidden rounded-full bg-background/50">
                  <div
    className="h-full rounded-full bg-primary transition-all duration-500 group-hover:shadow-lg group-hover:shadow-primary/50"
    style={{ width: `${topic.count > 0 ? (topic.solved / topic.count) * 100 : 0}%` }}
  />
                </div>
              </div>
            </CardContent>
          </Card>
        </Link>)}
    </div>;
}
