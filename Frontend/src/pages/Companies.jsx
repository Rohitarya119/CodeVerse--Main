"use client";
import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Progress } from "@/components/ui/progress";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import {
  Search,
  Building2,
  MapPin,
  DollarSign,
  Star,
  CheckCircle2,
  Clock,
  ArrowRight,
  Bookmark,
  TrendingUp,
  Code2,
  Brain,
  FileText
} from "lucide-react";
const companies = [
  {
    id: "google",
    name: "Google",
    logo: "G",
    color: "from-blue-500 to-green-500",
    bgColor: "bg-blue-500",
    location: "Multiple Locations",
    employees: "150K+",
    avgPackage: "\u20B935-45 LPA",
    rating: 4.8,
    difficulty: "Hard",
    totalProblems: 245,
    solvedProblems: 67,
    categories: { DSA: 180, Aptitude: 40, System: 25 },
    hiringFor: ["SDE", "SWE", "ML Engineer"],
    upcomingDrive: true,
    driveDate: "Oct 25, 2025"
  },
  {
    id: "amazon",
    name: "Amazon",
    logo: "a",
    color: "from-orange-500 to-yellow-500",
    bgColor: "bg-orange-500",
    location: "Bangalore, Hyderabad",
    employees: "1.5M+",
    avgPackage: "\u20B928-40 LPA",
    rating: 4.5,
    difficulty: "Hard",
    totalProblems: 320,
    solvedProblems: 89,
    categories: { DSA: 250, Aptitude: 45, System: 25 },
    hiringFor: ["SDE I", "SDE II", "Data Engineer"],
    upcomingDrive: true,
    driveDate: "Nov 12, 2025"
  },
  {
    id: "microsoft",
    name: "Microsoft",
    logo: "M",
    color: "from-blue-600 to-cyan-500",
    bgColor: "bg-blue-600",
    location: "Bangalore, Noida",
    employees: "220K+",
    avgPackage: "\u20B930-42 LPA",
    rating: 4.7,
    difficulty: "Hard",
    totalProblems: 210,
    solvedProblems: 45,
    categories: { DSA: 160, Aptitude: 30, System: 20 },
    hiringFor: ["SDE", "PM", "Data Scientist"],
    upcomingDrive: false
  },
  {
    id: "meta",
    name: "Meta",
    logo: "M",
    color: "from-blue-500 to-purple-500",
    bgColor: "bg-blue-500",
    location: "Remote / Bangalore",
    employees: "80K+",
    avgPackage: "\u20B945-60 LPA",
    rating: 4.6,
    difficulty: "Hard",
    totalProblems: 185,
    solvedProblems: 32,
    categories: { DSA: 150, Aptitude: 20, System: 15 },
    hiringFor: ["SWE", "ML Engineer"],
    upcomingDrive: false
  },
  {
    id: "apple",
    name: "Apple",
    logo: "",
    color: "from-gray-600 to-gray-800",
    bgColor: "bg-gray-700",
    location: "Bangalore, Hyderabad",
    employees: "160K+",
    avgPackage: "\u20B935-50 LPA",
    rating: 4.7,
    difficulty: "Hard",
    totalProblems: 145,
    solvedProblems: 28,
    categories: { DSA: 110, Aptitude: 20, System: 15 },
    hiringFor: ["SWE", "iOS Developer"],
    upcomingDrive: false
  },
  {
    id: "netflix",
    name: "Netflix",
    logo: "N",
    color: "from-red-600 to-red-800",
    bgColor: "bg-red-600",
    location: "Remote",
    employees: "12K+",
    avgPackage: "\u20B950-70 LPA",
    rating: 4.9,
    difficulty: "Hard",
    totalProblems: 95,
    solvedProblems: 15,
    categories: { DSA: 70, Aptitude: 15, System: 10 },
    hiringFor: ["Senior SWE"],
    upcomingDrive: false
  },
  {
    id: "adobe",
    name: "Adobe",
    logo: "A",
    color: "from-red-500 to-pink-500",
    bgColor: "bg-red-500",
    location: "Noida, Bangalore",
    employees: "28K+",
    avgPackage: "\u20B922-35 LPA",
    rating: 4.5,
    difficulty: "Medium",
    totalProblems: 175,
    solvedProblems: 52,
    categories: { DSA: 130, Aptitude: 30, System: 15 },
    hiringFor: ["SDE", "SMTS"],
    upcomingDrive: true,
    driveDate: "Dec 05, 2025"
  },
  {
    id: "salesforce",
    name: "Salesforce",
    logo: "S",
    color: "from-blue-400 to-blue-600",
    bgColor: "bg-blue-500",
    location: "Bangalore, Hyderabad",
    employees: "75K+",
    avgPackage: "\u20B925-38 LPA",
    rating: 4.6,
    difficulty: "Medium",
    totalProblems: 140,
    solvedProblems: 48,
    categories: { DSA: 100, Aptitude: 25, System: 15 },
    hiringFor: ["AMTS", "MTS"],
    upcomingDrive: true,
    driveDate: "Sep 30, 2025"
  },
  {
    id: "tcs",
    name: "TCS",
    logo: "TCS",
    color: "from-blue-700 to-indigo-700",
    bgColor: "bg-blue-700",
    location: "Pan India",
    employees: "600K+",
    avgPackage: "\u20B94-12 LPA",
    rating: 3.9,
    difficulty: "Easy",
    totalProblems: 280,
    solvedProblems: 210,
    categories: { DSA: 120, Aptitude: 120, System: 40 },
    hiringFor: ["Trainee", "ASE"],
    upcomingDrive: true,
    driveDate: "Ongoing"
  },
  {
    id: "infosys",
    name: "Infosys",
    logo: "I",
    color: "from-blue-500 to-blue-700",
    bgColor: "bg-blue-600",
    location: "Pan India",
    employees: "340K+",
    avgPackage: "\u20B94-15 LPA",
    rating: 4,
    difficulty: "Easy",
    totalProblems: 250,
    solvedProblems: 185,
    categories: { DSA: 100, Aptitude: 110, System: 40 },
    hiringFor: ["SE", "SSE", "Specialist"],
    upcomingDrive: true,
    driveDate: "Ongoing"
  },
  {
    id: "wipro",
    name: "Wipro",
    logo: "W",
    color: "from-purple-500 to-purple-700",
    bgColor: "bg-purple-600",
    location: "Pan India",
    employees: "250K+",
    avgPackage: "\u20B94-10 LPA",
    rating: 3.8,
    difficulty: "Easy",
    totalProblems: 220,
    solvedProblems: 165,
    categories: { DSA: 90, Aptitude: 100, System: 30 },
    hiringFor: ["Project Engineer"],
    upcomingDrive: true,
    driveDate: "Ongoing"
  },
  {
    id: "flipkart",
    name: "Flipkart",
    logo: "F",
    color: "from-yellow-500 to-blue-600",
    bgColor: "bg-yellow-500",
    location: "Bangalore",
    employees: "45K+",
    avgPackage: "\u20B925-40 LPA",
    rating: 4.4,
    difficulty: "Hard",
    totalProblems: 165,
    solvedProblems: 42,
    categories: { DSA: 130, Aptitude: 20, System: 15 },
    hiringFor: ["SDE I", "SDE II"],
    upcomingDrive: false
  }
];
const companyQuestions = [
  { id: 1, title: "Two Sum", company: "Google", difficulty: "Easy", topic: "Arrays", solved: true, frequency: 95 },
  { id: 2, title: "LRU Cache", company: "Amazon", difficulty: "Medium", topic: "Design", solved: true, frequency: 88 },
  {
    id: 3,
    title: "Merge K Sorted Lists",
    company: "Meta",
    difficulty: "Hard",
    topic: "Heap",
    solved: false,
    frequency: 82
  },
  {
    id: 4,
    title: "Valid Parentheses",
    company: "Microsoft",
    difficulty: "Easy",
    topic: "Stack",
    solved: true,
    frequency: 90
  },
  { id: 5, title: "Word Break", company: "Google", difficulty: "Medium", topic: "DP", solved: false, frequency: 75 },
  { id: 6, title: "Clone Graph", company: "Meta", difficulty: "Medium", topic: "Graph", solved: false, frequency: 70 },
  {
    id: 7,
    title: "Trapping Rain Water",
    company: "Amazon",
    difficulty: "Hard",
    topic: "Arrays",
    solved: false,
    frequency: 85
  },
  {
    id: 8,
    title: "Serialize Binary Tree",
    company: "Microsoft",
    difficulty: "Hard",
    topic: "Trees",
    solved: false,
    frequency: 72
  }
];
export default function CompaniesPage() {
  const [search, setSearch] = useState("");
  const [selectedCompany, setSelectedCompany] = useState(null);
  const [filter, setFilter] = useState("all");
  const filteredCompanies = companies.filter((c) => {
    const matchesSearch = c.name.toLowerCase().includes(search.toLowerCase());
    const matchesFilter = filter === "all" || filter === "upcoming" && c.upcomingDrive || filter === "easy" && c.difficulty === "Easy" || filter === "medium" && c.difficulty === "Medium" || filter === "hard" && c.difficulty === "Hard";
    return matchesSearch && matchesFilter;
  });
  return <div className="min-h-[calc(100vh-4rem)] bg-background">
    <div className="container mx-auto p-6 lg:p-8">
      {
        /* Header */
      }
      <div className="mb-8">
        <h1 className="text-3xl font-bold">
          Company <span className="gradient-text">Specific Questions</span>
        </h1>
        <p className="mt-2 text-muted-foreground">Practice interview questions from 500+ top tech companies</p>
      </div>

      {
        /* Stats Banner */
      }
      <div className="mb-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        {[
          { icon: Building2, label: "Companies", value: "500+", color: "text-cyan-500" },
          { icon: Code2, label: "Total Questions", value: "2,500+", color: "text-pink-500" },
          { icon: CheckCircle2, label: "Solved", value: "486", color: "text-green-500" },
          { icon: TrendingUp, label: "Success Rate", value: "78%", color: "text-yellow-500" }
        ].map((stat, index) => <Card
          key={stat.label}
          className="group border-border bg-card transition-all duration-500 hover:scale-105 hover:shadow-xl hover:shadow-primary/10 hover:border-primary/50 cursor-pointer"
        >
          <CardContent className="p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm text-muted-foreground">{stat.label}</p>
                <p className="text-2xl font-bold mt-1 transition-colors duration-300 group-hover:text-primary">
                  {stat.value}
                </p>
              </div>
              <div
                className={`p-3 rounded-xl bg-secondary transition-all duration-300 group-hover:scale-110 group-hover:rotate-6 ${stat.color}`}
              >
                <stat.icon className="h-6 w-6" />
              </div>
            </div>
          </CardContent>
        </Card>)}
      </div>

      <Tabs defaultValue="companies" className="space-y-6">
        <TabsList className="bg-secondary/50 p-1">
          <TabsTrigger
            value="companies"
            className="transition-all duration-300 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
          >
            Browse Companies
          </TabsTrigger>
          <TabsTrigger
            value="questions"
            className="transition-all duration-300 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
          >
            Top Questions
          </TabsTrigger>
          <TabsTrigger
            value="upcoming"
            className="transition-all duration-300 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
          >
            Upcoming Drives
          </TabsTrigger>
        </TabsList>

        <TabsContent value="companies" className="space-y-6">
          {
            /* Search and Filter */
          }
          <div className="flex flex-col sm:flex-row gap-4">
            <div className="relative flex-1 group">
              <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground transition-colors duration-300 group-focus-within:text-primary" />
              <Input
                placeholder="Search companies..."
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                className="pl-9 bg-secondary transition-all duration-300 focus:ring-2 focus:ring-primary/50"
              />
            </div>
            <div className="flex gap-2 flex-wrap">
              {["all", "upcoming", "easy", "medium", "hard"].map((f) => <Button
                key={f}
                variant={filter === f ? "default" : "secondary"}
                size="sm"
                onClick={() => setFilter(f)}
                className="transition-all duration-300 hover:scale-105"
              >
                {f === "all" ? "All" : f === "upcoming" ? "Upcoming Drives" : f.charAt(0).toUpperCase() + f.slice(1)}
              </Button>)}
            </div>
          </div>

          {
            /* Companies Grid */
          }
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {filteredCompanies.map((company, index) => {
              const progress = Math.round(company.solvedProblems / company.totalProblems * 100);
              return <Card
                key={company.id}
                onClick={() => setSelectedCompany(selectedCompany?.id === company.id ? null : company)}
                className={`group cursor-pointer border-2 transition-all duration-500 hover:shadow-2xl overflow-hidden ${selectedCompany?.id === company.id ? "border-primary shadow-lg shadow-primary/20" : "border-border hover:border-primary/50 hover:scale-[1.02]"}`}
                style={{ animationDelay: `${index * 0.05}s` }}
              >
                {company.upcomingDrive && <div className="bg-gradient-to-r from-green-500 to-emerald-500 text-white text-xs text-center py-1 font-medium">
                  Upcoming Drive
                </div>}
                <CardContent className="p-6">
                  <div className="flex items-start justify-between">
                    <div className="flex items-center gap-3">
                      <div
                        className={`h-12 w-12 rounded-xl bg-gradient-to-br ${company.color} flex items-center justify-center text-white font-bold text-lg transition-transform duration-300 group-hover:scale-110 group-hover:rotate-3`}
                      >
                        {company.logo}
                      </div>
                      <div>
                        <h3 className="font-semibold text-lg transition-colors duration-300 group-hover:text-primary">
                          {company.name}
                        </h3>
                        <div className="flex items-center gap-1 text-sm text-muted-foreground">
                          <MapPin className="h-3 w-3" />
                          {company.location}
                        </div>
                      </div>
                    </div>
                    <Button
                      variant="ghost"
                      size="icon"
                      className="transition-all duration-300 hover:scale-110 hover:text-primary"
                      onClick={(e) => e.stopPropagation()}
                    >
                      <Bookmark className="h-4 w-4" />
                    </Button>
                  </div>

                  <div className="mt-4 flex flex-wrap gap-2">
                    <Badge variant="secondary" className="gap-1">
                      <Star className="h-3 w-3 text-yellow-500" />
                      {company.rating}
                    </Badge>
                    <Badge variant="secondary" className="gap-1">
                      <DollarSign className="h-3 w-3 text-green-500" />
                      {company.avgPackage}
                    </Badge>
                    <Badge
                      className={`${company.difficulty === "Easy" ? "bg-green-500/10 text-green-500" : company.difficulty === "Medium" ? "bg-yellow-500/10 text-yellow-500" : "bg-red-500/10 text-red-500"}`}
                    >
                      {company.difficulty}
                    </Badge>
                  </div>

                  <div className="mt-4">
                    <div className="flex items-center justify-between text-sm mb-2">
                      <span className="text-muted-foreground">Progress</span>
                      <span className="font-medium">
                        {company.solvedProblems}/{company.totalProblems}
                      </span>
                    </div>
                    <Progress value={progress} className="h-2" />
                  </div>

                  <div className="mt-4 flex flex-wrap gap-1">
                    {company.hiringFor.map((role) => <Badge key={role} variant="outline" className="text-xs">
                      {role}
                    </Badge>)}
                  </div>

                  {
                    /* Expanded Content */
                  }
                  {selectedCompany?.id === company.id && <div className="mt-4 pt-4 border-t border-border space-y-4 animate-in slide-in-from-top-2 duration-300">
                    <div className="grid grid-cols-3 gap-2">
                      <div className="text-center p-3 rounded-lg bg-secondary">
                        <Code2 className="h-4 w-4 mx-auto mb-1 text-cyan-500" />
                        <p className="text-xs text-muted-foreground">DSA</p>
                        <p className="font-semibold">{company.categories.DSA}</p>
                      </div>
                      <div className="text-center p-3 rounded-lg bg-secondary">
                        <Brain className="h-4 w-4 mx-auto mb-1 text-pink-500" />
                        <p className="text-xs text-muted-foreground">Aptitude</p>
                        <p className="font-semibold">{company.categories.Aptitude}</p>
                      </div>
                      <div className="text-center p-3 rounded-lg bg-secondary">
                        <FileText className="h-4 w-4 mx-auto mb-1 text-orange-500" />
                        <p className="text-xs text-muted-foreground">System</p>
                        <p className="font-semibold">{company.categories.System}</p>
                      </div>
                    </div>
                    <Button className="w-full bg-primary hover:bg-primary/90 transition-all duration-300 hover:shadow-lg hover:shadow-primary/30">
                      Start Practicing
                      <ArrowRight className="ml-2 h-4 w-4" />
                    </Button>
                  </div>}
                </CardContent>
              </Card>;
            })}
          </div>
        </TabsContent>

        <TabsContent value="questions" className="space-y-6">
          <Card className="border-border">
            <CardHeader>
              <CardTitle>Most Frequently Asked Questions</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-2">
                {companyQuestions.map((q, index) => <div
                  key={q.id}
                  className="group flex items-center gap-4 rounded-xl border border-border p-4 transition-all duration-300 hover:bg-primary/5 hover:border-primary/30 hover:shadow-lg hover:translate-x-1 cursor-pointer"
                  style={{ animationDelay: `${index * 0.05}s` }}
                >
                  <div
                    className={`p-2 rounded-lg transition-all duration-300 ${q.solved ? "bg-green-500/20" : "bg-secondary"} group-hover:scale-110`}
                  >
                    {q.solved ? <CheckCircle2 className="h-5 w-5 text-green-500" /> : <Code2 className="h-5 w-5 text-muted-foreground group-hover:text-primary transition-colors" />}
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="font-medium truncate transition-colors duration-300 group-hover:text-primary">
                      {q.title}
                    </p>
                    <div className="flex items-center gap-2 mt-1">
                      <Badge variant="secondary" className="text-xs">
                        {q.topic}
                      </Badge>
                      <span className="text-xs text-muted-foreground flex items-center gap-1">
                        <Building2 className="h-3 w-3" />
                        {q.company}
                      </span>
                    </div>
                  </div>
                  <div className="text-right">
                    <div className="flex items-center gap-1 text-sm">
                      <TrendingUp className="h-3 w-3 text-green-500" />
                      <span className="font-medium">{q.frequency}%</span>
                    </div>
                    <p className="text-xs text-muted-foreground">frequency</p>
                  </div>
                  <Badge
                    className={`transition-all duration-300 ${q.difficulty === "Easy" ? "bg-green-500/10 text-green-500" : q.difficulty === "Medium" ? "bg-yellow-500/10 text-yellow-500" : "bg-red-500/10 text-red-500"}`}
                  >
                    {q.difficulty}
                  </Badge>
                </div>)}
              </div>
            </CardContent>
          </Card>
        </TabsContent>

        <TabsContent value="upcoming" className="space-y-6">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {companies.filter((c) => c.upcomingDrive).map((company, index) => <Card
              key={company.id}
              className="group border-border overflow-hidden transition-all duration-500 hover:scale-[1.02] hover:shadow-xl hover:border-primary/50"
            >
              <div className="h-2 bg-gradient-to-r from-green-500 to-emerald-500" />
              <CardContent className="p-6">
                <div className="flex items-center gap-3 mb-4">
                  <div
                    className={`h-12 w-12 rounded-xl bg-gradient-to-br ${company.color} flex items-center justify-center text-white font-bold text-lg transition-transform duration-300 group-hover:scale-110`}
                  >
                    {company.logo}
                  </div>
                  <div>
                    <h3 className="font-semibold text-lg">{company.name}</h3>
                    <p className="text-sm text-muted-foreground">{company.hiringFor.join(", ")}</p>
                  </div>
                </div>
                <div className="space-y-3">
                  <div className="flex items-center justify-between text-sm">
                    <span className="text-muted-foreground flex items-center gap-2">
                      <Clock className="h-4 w-4" />
                      Drive Date
                    </span>
                    <span className="font-medium">{company.driveDate || "TBA"}</span>
                  </div>
                  <div className="flex items-center justify-between text-sm">
                    <span className="text-muted-foreground flex items-center gap-2">
                      <DollarSign className="h-4 w-4" />
                      Package
                    </span>
                    <span className="font-medium">{company.avgPackage}</span>
                  </div>
                  <div className="flex items-center justify-between text-sm">
                    <span className="text-muted-foreground">Your Progress</span>
                    <span className="font-medium">
                      {company.solvedProblems}/{company.totalProblems} solved
                    </span>
                  </div>
                </div>
                <Button className="w-full mt-4 bg-primary hover:bg-primary/90 transition-all duration-300 hover:shadow-lg hover:shadow-primary/30 group-hover:scale-105">
                  Prepare Now
                  <ArrowRight className="ml-2 h-4 w-4" />
                </Button>
              </CardContent>
            </Card>)}
          </div>
        </TabsContent>
      </Tabs>
    </div>
  </div>;
}
