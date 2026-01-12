"use client";
import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { Label } from "@/components/ui/label";
import {
  Brain,
  Calculator,
  Clock,
  Target,
  Trophy,
  Lightbulb,
  BarChart3,
  BookOpen,
  Play,
  CheckCircle2,
  Flame,
  ArrowRight,
  Zap,
  XCircle,
  HelpCircle,
  ChevronRight,
  Star,
  TrendingUp,
  RefreshCw,
  BookMarked,
  Timer,
  Award
} from "lucide-react";
const sampleQuestions = [
  {
    id: 1,
    category: "Quantitative",
    topic: "Percentages",
    difficulty: "Easy",
    question: "A shopkeeper sells an article at 20% profit. If the cost price is Rs. 500, what is the selling price?",
    options: ["Rs. 550", "Rs. 600", "Rs. 650", "Rs. 700"],
    correctAnswer: 1,
    explanation: "Selling Price = Cost Price + Profit = 500 + (20% of 500) = 500 + 100 = Rs. 600",
    hint: "Remember: Profit = (Profit% \xD7 Cost Price) / 100",
    timeLimit: 60
  },
  {
    id: 2,
    category: "Logical",
    topic: "Blood Relations",
    difficulty: "Medium",
    question: "If A is the brother of B, B is the sister of C, and C is the father of D, how is A related to D?",
    options: ["Uncle", "Father", "Grandfather", "Nephew"],
    correctAnswer: 0,
    explanation: "A is B's brother \u2192 A is C's sibling (since B is C's sister) \u2192 A is C's brother \u2192 A is D's uncle",
    hint: "Draw a family tree to visualize the relationships",
    timeLimit: 90
  },
  {
    id: 3,
    category: "Quantitative",
    topic: "Time & Work",
    difficulty: "Medium",
    question: "A can complete a work in 12 days and B can complete it in 18 days. In how many days can they complete the work together?",
    options: ["6.2 days", "7.2 days", "8.2 days", "9.2 days"],
    correctAnswer: 1,
    explanation: "A's 1 day work = 1/12, B's 1 day work = 1/18. Together = 1/12 + 1/18 = (3+2)/36 = 5/36. Days = 36/5 = 7.2 days",
    hint: "Add the individual work rates (1/time) to get combined rate",
    timeLimit: 90
  },
  {
    id: 4,
    category: "Verbal",
    topic: "Sentence Correction",
    difficulty: "Easy",
    question: "Choose the correct sentence:",
    options: [
      "He don't know nothing about it.",
      "He doesn't know anything about it.",
      "He don't knows anything about it.",
      "He doesn't knows nothing about it."
    ],
    correctAnswer: 1,
    explanation: "Correct usage: 'doesn't' (third person singular) + 'anything' (no double negative)",
    hint: "Avoid double negatives and use correct verb agreement",
    timeLimit: 45
  },
  {
    id: 5,
    category: "Quantitative",
    topic: "Profit & Loss",
    difficulty: "Hard",
    question: "A man sells two articles for Rs. 4000 each. On one he gains 25% and on the other he loses 25%. What is his overall gain or loss percentage?",
    options: ["No gain, no loss", "6.25% loss", "6.25% gain", "12.5% loss"],
    correctAnswer: 1,
    explanation: "When SP is same and one has x% profit and x% loss, there's always a loss of (x\xB2/100)% = (25\xD725)/100 = 6.25% loss",
    hint: "This is a classic problem - when selling at same price with equal profit and loss percentages, there's always a loss",
    timeLimit: 120
  },
  {
    id: 6,
    category: "Logical",
    topic: "Coding-Decoding",
    difficulty: "Easy",
    question: "If COMPUTER is coded as RFUVQNPC, how is PRINTER coded?",
    options: ["QSJOUFQ", "SFUOJSQ", "QSJOUFS", "OSJUQFS"],
    correctAnswer: 2,
    explanation: "Each letter is shifted: C\u2192R(+15), O\u2192F(-9), M\u2192U(+8)... The pattern alternates. P\u2192Q, R\u2192S, I\u2192J, N\u2192O, T\u2192U, E\u2192F, R\u2192S",
    hint: "Look for a pattern in how each letter is transformed",
    timeLimit: 90
  }
];
const formulasAndTips = {
  quantitative: [
    { title: "Percentage", formula: "Percentage = (Value/Total) \xD7 100", tip: "To find X% of Y: (X \xD7 Y) / 100" },
    { title: "Simple Interest", formula: "SI = (P \xD7 R \xD7 T) / 100", tip: "P = Principal, R = Rate%, T = Time in years" },
    { title: "Compound Interest", formula: "CI = P(1 + R/100)^T - P", tip: "For 2 years: CI = SI + (SI \xD7 R / 100)" },
    { title: "Profit & Loss", formula: "Profit% = (Profit/CP) \xD7 100", tip: "SP = CP \xD7 (100 + P%)/100" },
    { title: "Time & Work", formula: "Work = Rate \xD7 Time", tip: "If A does in n days, A's 1 day work = 1/n" },
    { title: "Speed Distance", formula: "Speed = Distance / Time", tip: "Average speed = 2\xD7S1\xD7S2 / (S1+S2)" },
    {
      title: "Ratio & Proportion",
      formula: "a:b = c:d means ad = bc",
      tip: "To divide X in ratio a:b: Parts are aX/(a+b) and bX/(a+b)"
    },
    { title: "Averages", formula: "Average = Sum / Count", tip: "Weighted avg = \u03A3(value \xD7 weight) / \u03A3 weights" }
  ],
  logical: [
    {
      title: "Blood Relations",
      formula: "Father's/Mother's brother = Uncle",
      tip: "Draw family trees for complex problems"
    },
    { title: "Direction Sense", formula: "Opposite: N\u2194S, E\u2194W", tip: "Start from origin, track cumulative movement" },
    {
      title: "Coding-Decoding",
      formula: "Check: +1, -1, reverse, position",
      tip: "First identify the pattern with 2-3 letters"
    },
    {
      title: "Syllogisms",
      formula: "All A are B + All B are C = All A are C",
      tip: "Use Venn diagrams for visualization"
    },
    {
      title: "Seating Arrangement",
      formula: "Linear: Consider left-right",
      tip: "Circular: Fix one person, arrange others relative"
    },
    { title: "Inequalities", formula: "< means less, > means greater", tip: "Combine: A>B, B>C gives A>C" }
  ],
  verbal: [
    {
      title: "Subject-Verb Agreement",
      formula: "Singular subject = singular verb",
      tip: "Words between subject and verb don't change agreement"
    },
    { title: "Tenses", formula: "Past: -ed, Present: -s/-es", tip: "Time markers help identify correct tense" },
    {
      title: "Para Jumbles",
      formula: "Find opening & closing first",
      tip: "Look for pronouns - they refer to previously mentioned nouns"
    },
    {
      title: "Reading Comprehension",
      formula: "Read questions first",
      tip: "Locate keywords from questions in passage"
    }
  ]
};
const topPerformers = [
  { rank: 1, name: "Priya Sharma", score: 2847, streak: 45, avatar: "/indian-girl-student.jpg" },
  { rank: 2, name: "Rahul Verma", score: 2756, streak: 38, avatar: "/indian-boy-student.jpg" },
  { rank: 3, name: "Ananya Patel", score: 2698, streak: 42, avatar: "/indian-girl-student-glasses.jpg" },
  { rank: 4, name: "Vikram Singh", score: 2654, streak: 35, avatar: "/indian-boy-student-casual.jpg" },
  { rank: 5, name: "Sneha Reddy", score: 2612, streak: 33, avatar: "/indian-girl-student-smiling.jpg" }
];
const aptitudeCategories = [
  {
    id: "quantitative",
    title: "Quantitative Aptitude",
    icon: Calculator,
    color: "from-cyan-500 to-blue-600",
    bgColor: "bg-cyan-500/10",
    iconColor: "text-cyan-500",
    topics: [
      { name: "Number System", problems: 45, solved: 32, difficulty: "Medium" },
      { name: "Percentages", problems: 38, solved: 28, difficulty: "Easy" },
      { name: "Profit & Loss", problems: 42, solved: 15, difficulty: "Medium" },
      { name: "Ratio & Proportion", problems: 35, solved: 35, difficulty: "Easy" },
      { name: "Time & Work", problems: 40, solved: 22, difficulty: "Hard" },
      { name: "Time, Speed & Distance", problems: 48, solved: 18, difficulty: "Hard" },
      { name: "Simple & Compound Interest", problems: 30, solved: 25, difficulty: "Easy" },
      { name: "Averages", problems: 28, solved: 20, difficulty: "Easy" },
      { name: "Probability", problems: 36, solved: 12, difficulty: "Hard" },
      { name: "Permutation & Combination", problems: 44, solved: 8, difficulty: "Hard" }
    ]
  },
  {
    id: "logical",
    title: "Logical Reasoning",
    icon: Brain,
    color: "from-pink-500 to-rose-600",
    bgColor: "bg-pink-500/10",
    iconColor: "text-pink-500",
    topics: [
      { name: "Blood Relations", problems: 32, solved: 28, difficulty: "Medium" },
      { name: "Coding-Decoding", problems: 40, solved: 35, difficulty: "Easy" },
      { name: "Syllogisms", problems: 38, solved: 20, difficulty: "Medium" },
      { name: "Seating Arrangement", problems: 45, solved: 15, difficulty: "Hard" },
      { name: "Puzzles", problems: 50, solved: 22, difficulty: "Hard" },
      { name: "Direction Sense", problems: 28, solved: 25, difficulty: "Easy" },
      { name: "Data Sufficiency", problems: 35, solved: 18, difficulty: "Medium" },
      { name: "Inequalities", problems: 30, solved: 30, difficulty: "Easy" }
    ]
  },
  {
    id: "verbal",
    title: "Verbal Ability",
    icon: BookOpen,
    color: "from-green-500 to-emerald-600",
    bgColor: "bg-green-500/10",
    iconColor: "text-green-500",
    topics: [
      { name: "Reading Comprehension", problems: 50, solved: 40, difficulty: "Medium" },
      { name: "Sentence Correction", problems: 45, solved: 38, difficulty: "Easy" },
      { name: "Para Jumbles", problems: 35, solved: 20, difficulty: "Medium" },
      { name: "Fill in the Blanks", problems: 40, solved: 35, difficulty: "Easy" },
      { name: "Synonyms & Antonyms", problems: 60, solved: 55, difficulty: "Easy" },
      { name: "Idioms & Phrases", problems: 30, solved: 22, difficulty: "Medium" },
      { name: "Error Spotting", problems: 42, solved: 30, difficulty: "Medium" }
    ]
  },
  {
    id: "data",
    title: "Data Interpretation",
    icon: BarChart3,
    color: "from-orange-500 to-amber-600",
    bgColor: "bg-orange-500/10",
    iconColor: "text-orange-500",
    topics: [
      { name: "Tables", problems: 35, solved: 28, difficulty: "Medium" },
      { name: "Bar Graphs", problems: 40, solved: 32, difficulty: "Easy" },
      { name: "Pie Charts", problems: 38, solved: 30, difficulty: "Easy" },
      { name: "Line Graphs", problems: 42, solved: 25, difficulty: "Medium" },
      { name: "Mixed Charts", problems: 30, solved: 12, difficulty: "Hard" },
      { name: "Caselets", problems: 25, solved: 8, difficulty: "Hard" }
    ]
  }
];
const practiceTests = [
  {
    id: 1,
    title: "TCS NQT Mock Test 1",
    duration: 90,
    questions: 80,
    difficulty: "Medium",
    completed: true,
    score: 78
  },
  {
    id: 2,
    title: "Infosys InfyTQ Pattern",
    duration: 60,
    questions: 50,
    difficulty: "Medium",
    completed: true,
    score: 85
  },
  { id: 3, title: "Wipro NLTH Test", duration: 75, questions: 60, difficulty: "Easy", completed: false },
  { id: 4, title: "Cognizant GenC Test", duration: 90, questions: 70, difficulty: "Medium", completed: false },
  { id: 5, title: "Accenture Assessment", duration: 60, questions: 55, difficulty: "Easy", completed: false },
  { id: 6, title: "Capgemini Game-Based", duration: 45, questions: 40, difficulty: "Hard", completed: false }
];
const dailyChallenges = [
  { day: "Mon", completed: true, streak: true },
  { day: "Tue", completed: true, streak: true },
  { day: "Wed", completed: true, streak: true },
  { day: "Thu", completed: true, streak: true },
  { day: "Fri", completed: false, streak: false },
  { day: "Sat", completed: false, streak: false },
  { day: "Sun", completed: false, streak: false }
];
export default function AptitudePage() {
  const [selectedCategory, setSelectedCategory] = useState(aptitudeCategories[0]);
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);
  const [selectedAnswer, setSelectedAnswer] = useState(null);
  const [showResult, setShowResult] = useState(false);
  const [showHint, setShowHint] = useState(false);
  const [score, setScore] = useState(0);
  const [questionsAttempted, setQuestionsAttempted] = useState(0);
  const [timeLeft, setTimeLeft] = useState(60);
  const [isTimerRunning, setIsTimerRunning] = useState(false);
  const currentQuestion = sampleQuestions[currentQuestionIndex];
  const totalProblems = aptitudeCategories.reduce(
    (acc, cat) => acc + cat.topics.reduce((sum, t) => sum + t.problems, 0),
    0
  );
  const solvedProblems = aptitudeCategories.reduce(
    (acc, cat) => acc + cat.topics.reduce((sum, t) => sum + t.solved, 0),
    0
  );
  const handleSubmitAnswer = () => {
    if (selectedAnswer === null) return;
    setShowResult(true);
    setQuestionsAttempted((prev) => prev + 1);
    if (selectedAnswer === currentQuestion.correctAnswer) {
      setScore((prev) => prev + 1);
    }
    setIsTimerRunning(false);
  };
  const handleNextQuestion = () => {
    setCurrentQuestionIndex((prev) => (prev + 1) % sampleQuestions.length);
    setSelectedAnswer(null);
    setShowResult(false);
    setShowHint(false);
    setTimeLeft(sampleQuestions[(currentQuestionIndex + 1) % sampleQuestions.length].timeLimit);
    setIsTimerRunning(true);
  };
  const handleStartPractice = () => {
    setTimeLeft(currentQuestion.timeLimit);
    setIsTimerRunning(true);
    setSelectedAnswer(null);
    setShowResult(false);
    setShowHint(false);
  };
  return <div className="min-h-[calc(100vh-4rem)] bg-background">
    <div className="container mx-auto p-6 lg:p-8">
      {
        /* Header */
      }
      <div className="mb-8">
        <h1 className="text-3xl font-bold">
          Aptitude <span className="gradient-text">Training</span>
        </h1>
        <p className="mt-2 text-muted-foreground">
          Master quantitative, logical, and verbal reasoning for placements
        </p>
      </div>

      {
        /* Stats Overview */
      }
      <div className="mb-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        {[
          {
            label: "Problems Solved",
            value: solvedProblems,
            total: totalProblems,
            icon: Target,
            trend: "+12 today",
            color: "text-cyan-500",
            bg: "bg-cyan-500/10",
            border: "hover:border-cyan-500/50"
          },
          {
            label: "Current Streak",
            value: "4 Days",
            icon: Flame,
            trend: "Best: 14 Days",
            color: "text-orange-500",
            bg: "bg-orange-500/10",
            border: "hover:border-orange-500/50"
          },
          {
            label: "Accuracy",
            value: "82%",
            icon: Trophy,
            trend: "Top 10%",
            color: "text-yellow-500",
            bg: "bg-yellow-500/10",
            border: "hover:border-yellow-500/50"
          },
          {
            label: "Avg. Speed",
            value: "45s/Q",
            icon: Zap,
            trend: "Improved by 5s",
            color: "text-pink-500",
            bg: "bg-pink-500/10",
            border: "hover:border-pink-500/50"
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
                <p className="text-2xl font-bold tracking-tight">
                  {stat.value}
                  {stat.total && <span className="text-sm font-medium text-muted-foreground ml-1">/{stat.total}</span>}
                </p>
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

      {
        /* Daily Challenge Banner */
      }
      <Card className="mb-8 border-primary/30 bg-gradient-to-r from-primary/10 via-accent/10 to-primary/10 overflow-hidden group hover:shadow-xl hover:shadow-primary/10 transition-all duration-500">
        <CardContent className="p-6">
          <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
            <div className="flex items-center gap-4">
              <div className="p-4 rounded-2xl bg-primary/20 animate-pulse-glow">
                <Lightbulb className="h-8 w-8 text-primary" />
              </div>
              <div>
                <h3 className="text-xl font-bold">Daily Challenge</h3>
                <p className="text-sm text-muted-foreground mt-1">Solve 5 problems to maintain your streak!</p>
              </div>
            </div>
            <div className="flex items-center gap-2">
              {dailyChallenges.map((day, i) => <div
                key={i}
                className={`flex flex-col items-center gap-1 p-2 rounded-lg transition-all duration-300 hover:scale-110 ${day.completed ? "bg-primary/20" : "bg-secondary"}`}
              >
                <span className="text-xs text-muted-foreground">{day.day}</span>
                {day.completed ? <CheckCircle2 className="h-5 w-5 text-primary" /> : <div className="h-5 w-5 rounded-full border-2 border-muted-foreground/30" />}
              </div>)}
            </div>
            <Button className="group/btn bg-primary hover:bg-primary/90 transition-all duration-300 hover:scale-105 hover:shadow-lg hover:shadow-primary/30">
              Start Challenge
              <ArrowRight className="ml-2 h-4 w-4 transition-transform duration-300 group-hover/btn:translate-x-1" />
            </Button>
          </div>
        </CardContent>
      </Card>

      {
        /* Main Content */
      }
      <Tabs defaultValue="practice" className="space-y-6">
        <TabsList className="bg-secondary/50 p-1 flex-wrap">
          <TabsTrigger
            value="practice"
            className="transition-all duration-300 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
          >
            Topic Practice
          </TabsTrigger>
          <TabsTrigger
            value="quiz"
            className="transition-all duration-300 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
          >
            Quick Quiz
          </TabsTrigger>
          <TabsTrigger
            value="formulas"
            className="transition-all duration-300 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
          >
            Formulas & Tips
          </TabsTrigger>
          <TabsTrigger
            value="tests"
            className="transition-all duration-300 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
          >
            Mock Tests
          </TabsTrigger>
          <TabsTrigger
            value="leaderboard"
            className="transition-all duration-300 data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
          >
            Leaderboard
          </TabsTrigger>
        </TabsList>

        {
          /* Topic Practice Tab */
        }
        <TabsContent value="practice" className="space-y-6">
          {
            /* Category Cards */
          }
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            {aptitudeCategories.map((category, index) => {
              const solved = category.topics.reduce((sum, t) => sum + t.solved, 0);
              const total = category.topics.reduce((sum, t) => sum + t.problems, 0);
              const progress = Math.round(solved / total * 100);
              return <Card
                key={category.id}
                onClick={() => setSelectedCategory(category)}
                className={`group cursor-pointer border-2 transition-all duration-500 hover:scale-105 hover:shadow-2xl ${selectedCategory.id === category.id ? "border-primary shadow-lg shadow-primary/20" : "border-border hover:border-primary/50"}`}
                style={{ animationDelay: `${index * 0.1}s` }}
              >
                <CardContent className="p-6">
                  <div
                    className={`inline-flex p-3 rounded-xl ${category.bgColor} transition-all duration-300 group-hover:scale-110 group-hover:rotate-6`}
                  >
                    <category.icon className={`h-6 w-6 ${category.iconColor}`} />
                  </div>
                  <h3 className="mt-4 font-semibold transition-colors duration-300 group-hover:text-primary">
                    {category.title}
                  </h3>
                  <p className="text-sm text-muted-foreground mt-1">
                    {solved}/{total} problems
                  </p>
                  <div className="mt-3">
                    <Progress value={progress} className="h-2" />
                  </div>
                </CardContent>
              </Card>;
            })}
          </div>

          {
            /* Selected Category Topics */
          }
          <Card className="border-border">
            <CardHeader>
              <CardTitle className="flex items-center gap-3">
                <div className={`p-2 rounded-lg ${selectedCategory.bgColor}`}>
                  <selectedCategory.icon className={`h-5 w-5 ${selectedCategory.iconColor}`} />
                </div>
                {selectedCategory.title}
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid gap-3 sm:grid-cols-2">
                {selectedCategory.topics.map((topic, index) => {
                  const progress = Math.round(topic.solved / topic.problems * 100);
                  const isCompleted = progress === 100;
                  return <div
                    key={topic.name}
                    className="group flex items-center gap-4 rounded-xl border border-border p-4 transition-all duration-300 hover:bg-primary/5 hover:border-primary/30 hover:shadow-lg hover:translate-x-1 cursor-pointer"
                    style={{ animationDelay: `${index * 0.05}s` }}
                  >
                    <div
                      className={`p-2 rounded-lg transition-all duration-300 ${isCompleted ? "bg-green-500/20" : "bg-secondary"} group-hover:scale-110`}
                    >
                      {isCompleted ? <CheckCircle2 className="h-5 w-5 text-green-500" /> : <Play className="h-5 w-5 text-muted-foreground group-hover:text-primary transition-colors" />}
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="font-medium truncate transition-colors duration-300 group-hover:text-primary">
                        {topic.name}
                      </p>
                      <div className="flex items-center gap-2 mt-1">
                        <Progress value={progress} className="h-1.5 flex-1" />
                        <span className="text-xs text-muted-foreground whitespace-nowrap">
                          {topic.solved}/{topic.problems}
                        </span>
                      </div>
                    </div>
                    <Badge
                      variant="secondary"
                      className={`transition-all duration-300 ${topic.difficulty === "Easy" ? "bg-green-500/10 text-green-500" : topic.difficulty === "Medium" ? "bg-yellow-500/10 text-yellow-500" : "bg-red-500/10 text-red-500"}`}
                    >
                      {topic.difficulty}
                    </Badge>
                  </div>;
                })}
              </div>
            </CardContent>
          </Card>
        </TabsContent>

        <TabsContent value="quiz" className="space-y-6">
          <div className="grid gap-6 lg:grid-cols-3">
            {
              /* Quiz Card */
            }
            <div className="lg:col-span-2">
              <Card className="border-border overflow-hidden">
                <div className="h-1 bg-gradient-to-r from-primary via-accent to-primary" />
                <CardHeader className="pb-4">
                  <div className="flex items-center justify-between">
                    <div className="flex items-center gap-2">
                      <Badge variant="secondary" className="bg-primary/10 text-primary">
                        {currentQuestion.category}
                      </Badge>
                      <Badge variant="secondary">{currentQuestion.topic}</Badge>
                      <Badge
                        className={`${currentQuestion.difficulty === "Easy" ? "bg-green-500/10 text-green-500" : currentQuestion.difficulty === "Medium" ? "bg-yellow-500/10 text-yellow-500" : "bg-red-500/10 text-red-500"}`}
                      >
                        {currentQuestion.difficulty}
                      </Badge>
                    </div>
                    <div className="flex items-center gap-2">
                      <Timer className="h-4 w-4 text-muted-foreground" />
                      <span className={`font-mono font-bold ${timeLeft < 15 ? "text-red-500" : "text-foreground"}`}>
                        {Math.floor(timeLeft / 60)}:{(timeLeft % 60).toString().padStart(2, "0")}
                      </span>
                    </div>
                  </div>
                  <CardTitle className="text-lg mt-4">
                    Question {currentQuestionIndex + 1} of {sampleQuestions.length}
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-6">
                  <p className="text-lg leading-relaxed">{currentQuestion.question}</p>

                  <RadioGroup
                    value={selectedAnswer?.toString()}
                    onValueChange={(val) => !showResult && setSelectedAnswer(Number.parseInt(val))}
                    className="space-y-3"
                  >
                    {currentQuestion.options.map((option, index) => {
                      const isCorrect = index === currentQuestion.correctAnswer;
                      const isSelected = selectedAnswer === index;
                      let optionClass = "border-border hover:border-primary/50 hover:bg-primary/5";
                      if (showResult) {
                        if (isCorrect) {
                          optionClass = "border-green-500 bg-green-500/10";
                        } else if (isSelected && !isCorrect) {
                          optionClass = "border-red-500 bg-red-500/10";
                        }
                      } else if (isSelected) {
                        optionClass = "border-primary bg-primary/10";
                      }
                      return <div
                        key={index}
                        className={`flex items-center space-x-3 rounded-xl border p-4 transition-all duration-300 cursor-pointer ${optionClass}`}
                        onClick={() => !showResult && setSelectedAnswer(index)}
                      >
                        <RadioGroupItem value={index.toString()} id={`option-${index}`} disabled={showResult} />
                        <Label htmlFor={`option-${index}`} className="flex-1 cursor-pointer font-medium">
                          {option}
                        </Label>
                        {showResult && isCorrect && <CheckCircle2 className="h-5 w-5 text-green-500" />}
                        {showResult && isSelected && !isCorrect && <XCircle className="h-5 w-5 text-red-500" />}
                      </div>;
                    })}
                  </RadioGroup>

                  {
                    /* Hint Section */
                  }
                  {showHint && !showResult && <div className="p-4 rounded-xl bg-yellow-500/10 border border-yellow-500/30">
                    <div className="flex items-start gap-3">
                      <Lightbulb className="h-5 w-5 text-yellow-500 mt-0.5" />
                      <div>
                        <p className="font-semibold text-yellow-500">Hint</p>
                        <p className="text-sm mt-1">{currentQuestion.hint}</p>
                      </div>
                    </div>
                  </div>}

                  {
                    /* Explanation Section */
                  }
                  {showResult && <div
                    className={`p-4 rounded-xl ${selectedAnswer === currentQuestion.correctAnswer ? "bg-green-500/10 border border-green-500/30" : "bg-primary/10 border border-primary/30"}`}
                  >
                    <div className="flex items-start gap-3">
                      <BookMarked className="h-5 w-5 text-primary mt-0.5" />
                      <div>
                        <p className="font-semibold text-primary">Explanation</p>
                        <p className="text-sm mt-1">{currentQuestion.explanation}</p>
                      </div>
                    </div>
                  </div>}

                  {
                    /* Action Buttons */
                  }
                  <div className="flex items-center gap-3 pt-4">
                    {!isTimerRunning && !showResult && <Button
                      onClick={handleStartPractice}
                      className="flex-1 bg-primary hover:bg-primary/90 transition-all duration-300 hover:scale-105 hover:shadow-lg hover:shadow-primary/30"
                    >
                      <Play className="mr-2 h-4 w-4" />
                      Start Question
                    </Button>}
                    {isTimerRunning && !showResult && <>
                      <Button
                        variant="outline"
                        onClick={() => setShowHint(true)}
                        disabled={showHint}
                        className="transition-all duration-300 hover:scale-105"
                      >
                        <HelpCircle className="mr-2 h-4 w-4" />
                        Hint
                      </Button>
                      <Button
                        onClick={handleSubmitAnswer}
                        disabled={selectedAnswer === null}
                        className="flex-1 bg-primary hover:bg-primary/90 transition-all duration-300 hover:scale-105 hover:shadow-lg hover:shadow-primary/30"
                      >
                        Submit Answer
                        <ChevronRight className="ml-2 h-4 w-4" />
                      </Button>
                    </>}
                    {showResult && <Button
                      onClick={handleNextQuestion}
                      className="flex-1 bg-primary hover:bg-primary/90 transition-all duration-300 hover:scale-105 hover:shadow-lg hover:shadow-primary/30"
                    >
                      Next Question
                      <ArrowRight className="ml-2 h-4 w-4" />
                    </Button>}
                  </div>
                </CardContent>
              </Card>
            </div>

            {
              /* Quiz Stats Sidebar */
            }
            <div className="space-y-4">
              <Card className="border-border">
                <CardHeader>
                  <CardTitle className="text-lg flex items-center gap-2">
                    <Trophy className="h-5 w-5 text-yellow-500" />
                    Session Stats
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="flex items-center justify-between p-3 rounded-lg bg-secondary">
                    <span className="text-sm text-muted-foreground">Score</span>
                    <span className="font-bold text-lg text-primary">
                      {score}/{questionsAttempted}
                    </span>
                  </div>
                  <div className="flex items-center justify-between p-3 rounded-lg bg-secondary">
                    <span className="text-sm text-muted-foreground">Accuracy</span>
                    <span className="font-bold text-lg">
                      {questionsAttempted > 0 ? Math.round(score / questionsAttempted * 100) : 0}%
                    </span>
                  </div>
                  <div className="flex items-center justify-between p-3 rounded-lg bg-secondary">
                    <span className="text-sm text-muted-foreground">Questions</span>
                    <span className="font-bold text-lg">{questionsAttempted}</span>
                  </div>
                  <Button
                    variant="outline"
                    className="w-full transition-all duration-300 hover:scale-105 bg-transparent"
                    onClick={() => {
                      setScore(0);
                      setQuestionsAttempted(0);
                      setCurrentQuestionIndex(0);
                      setSelectedAnswer(null);
                      setShowResult(false);
                      setShowHint(false);
                      setIsTimerRunning(false);
                    }}
                  >
                    <RefreshCw className="mr-2 h-4 w-4" />
                    Reset Session
                  </Button>
                </CardContent>
              </Card>

              <Card className="border-border">
                <CardHeader>
                  <CardTitle className="text-lg">Question Navigator</CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="grid grid-cols-6 gap-2">
                    {sampleQuestions.map((_, index) => <button
                      key={index}
                      onClick={() => {
                        setCurrentQuestionIndex(index);
                        setSelectedAnswer(null);
                        setShowResult(false);
                        setShowHint(false);
                        setIsTimerRunning(false);
                      }}
                      className={`h-10 rounded-lg font-medium transition-all duration-300 hover:scale-110 ${currentQuestionIndex === index ? "bg-primary text-primary-foreground" : "bg-secondary hover:bg-primary/20"}`}
                    >
                      {index + 1}
                    </button>)}
                  </div>
                </CardContent>
              </Card>
            </div>
          </div>
        </TabsContent>

        <TabsContent value="formulas" className="space-y-6">
          <div className="grid gap-6 md:grid-cols-2">
            {
              /* Quantitative Formulas */
            }
            <Card className="border-border">
              <CardHeader>
                <CardTitle className="flex items-center gap-3">
                  <div className="p-2 rounded-lg bg-cyan-500/10">
                    <Calculator className="h-5 w-5 text-cyan-500" />
                  </div>
                  Quantitative Aptitude
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                {formulasAndTips.quantitative.map((item, index) => <div
                  key={item.title}
                  className="group p-4 rounded-xl border border-border transition-all duration-300 hover:bg-primary/5 hover:border-primary/30 hover:shadow-lg cursor-pointer"
                  style={{ animationDelay: `${index * 0.05}s` }}
                >
                  <h4 className="font-semibold text-primary">{item.title}</h4>
                  <p className="font-mono text-sm bg-secondary/50 px-3 py-2 rounded-lg mt-2">{item.formula}</p>
                  <p className="text-sm text-muted-foreground mt-2 flex items-start gap-2">
                    <Lightbulb className="h-4 w-4 text-yellow-500 mt-0.5 flex-shrink-0" />
                    {item.tip}
                  </p>
                </div>)}
              </CardContent>
            </Card>

            {
              /* Logical Reasoning Tips */
            }
            <Card className="border-border">
              <CardHeader>
                <CardTitle className="flex items-center gap-3">
                  <div className="p-2 rounded-lg bg-pink-500/10">
                    <Brain className="h-5 w-5 text-pink-500" />
                  </div>
                  Logical Reasoning
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                {formulasAndTips.logical.map((item, index) => <div
                  key={item.title}
                  className="group p-4 rounded-xl border border-border transition-all duration-300 hover:bg-primary/5 hover:border-primary/30 hover:shadow-lg cursor-pointer"
                  style={{ animationDelay: `${index * 0.05}s` }}
                >
                  <h4 className="font-semibold text-pink-500">{item.title}</h4>
                  <p className="font-mono text-sm bg-secondary/50 px-3 py-2 rounded-lg mt-2">{item.formula}</p>
                  <p className="text-sm text-muted-foreground mt-2 flex items-start gap-2">
                    <Lightbulb className="h-4 w-4 text-yellow-500 mt-0.5 flex-shrink-0" />
                    {item.tip}
                  </p>
                </div>)}
              </CardContent>
            </Card>

            {
              /* Verbal Ability Tips */
            }
            <Card className="border-border md:col-span-2">
              <CardHeader>
                <CardTitle className="flex items-center gap-3">
                  <div className="p-2 rounded-lg bg-green-500/10">
                    <BookOpen className="h-5 w-5 text-green-500" />
                  </div>
                  Verbal Ability
                </CardTitle>
              </CardHeader>
              <CardContent>
                <div className="grid gap-4 sm:grid-cols-2">
                  {formulasAndTips.verbal.map((item, index) => <div
                    key={item.title}
                    className="group p-4 rounded-xl border border-border transition-all duration-300 hover:bg-primary/5 hover:border-primary/30 hover:shadow-lg cursor-pointer"
                    style={{ animationDelay: `${index * 0.05}s` }}
                  >
                    <h4 className="font-semibold text-green-500">{item.title}</h4>
                    <p className="font-mono text-sm bg-secondary/50 px-3 py-2 rounded-lg mt-2">{item.formula}</p>
                    <p className="text-sm text-muted-foreground mt-2 flex items-start gap-2">
                      <Lightbulb className="h-4 w-4 text-yellow-500 mt-0.5 flex-shrink-0" />
                      {item.tip}
                    </p>
                  </div>)}
                </div>
              </CardContent>
            </Card>
          </div>
        </TabsContent>

        {
          /* Mock Tests Tab */
        }
        <TabsContent value="tests" className="space-y-6">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {practiceTests.map((test, index) => <Card
              key={test.id}
              className="group border-border transition-all duration-500 hover:scale-105 hover:shadow-xl hover:border-primary/50 cursor-pointer overflow-hidden"
              style={{ animationDelay: `${index * 0.1}s` }}
            >
              <div
                className={`h-1 bg-gradient-to-r ${test.completed ? "from-green-500 to-emerald-500" : "from-primary to-accent"}`}
              />
              <CardContent className="p-6">
                <div className="flex items-start justify-between">
                  <div>
                    <h3 className="font-semibold transition-colors duration-300 group-hover:text-primary">
                      {test.title}
                    </h3>
                    <div className="mt-2 flex flex-wrap gap-2">
                      <Badge variant="secondary" className="gap-1">
                        <Clock className="h-3 w-3" />
                        {test.duration} min
                      </Badge>
                      <Badge variant="secondary">{test.questions} Qs</Badge>
                      <Badge
                        className={`${test.difficulty === "Easy" ? "bg-green-500/10 text-green-500" : test.difficulty === "Medium" ? "bg-yellow-500/10 text-yellow-500" : "bg-red-500/10 text-red-500"}`}
                      >
                        {test.difficulty}
                      </Badge>
                    </div>
                  </div>
                  {test.completed && <div className="text-right">
                    <p className="text-2xl font-bold text-green-500">{test.score}%</p>
                    <p className="text-xs text-muted-foreground">Score</p>
                  </div>}
                </div>
                <Button
                  className={`mt-4 w-full transition-all duration-300 group-hover:scale-105 ${test.completed ? "bg-secondary text-foreground hover:bg-secondary/80" : "bg-primary hover:bg-primary/90 hover:shadow-lg hover:shadow-primary/30"}`}
                >
                  {test.completed ? "Retake Test" : "Start Test"}
                  <ArrowRight className="ml-2 h-4 w-4" />
                </Button>
              </CardContent>
            </Card>)}
          </div>
        </TabsContent>

        <TabsContent value="leaderboard" className="space-y-6">
          <div className="grid gap-6 lg:grid-cols-3">
            {
              /* Top Performers */
            }
            <div className="lg:col-span-2">
              <Card className="border-border">
                <CardHeader>
                  <CardTitle className="flex items-center gap-2">
                    <Trophy className="h-5 w-5 text-yellow-500" />
                    Top Performers - Aptitude
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-3">
                  {topPerformers.map((user, index) => <div
                    key={user.rank}
                    className={`group flex items-center gap-4 rounded-xl border p-4 transition-all duration-300 hover:bg-primary/5 hover:border-primary/30 hover:shadow-lg hover:translate-x-1 cursor-pointer ${index < 3 ? "border-yellow-500/30 bg-yellow-500/5" : "border-border"}`}
                  >
                    <div
                      className={`w-10 h-10 rounded-full flex items-center justify-center font-bold transition-all duration-300 group-hover:scale-110 ${index === 0 ? "bg-yellow-500 text-yellow-950" : index === 1 ? "bg-gray-400 text-gray-950" : index === 2 ? "bg-amber-700 text-amber-100" : "bg-secondary text-foreground"}`}
                    >
                      {user.rank}
                    </div>
                    <img
                      src={user.avatar || "/placeholder.svg"}
                      alt={user.name}
                      className="w-12 h-12 rounded-full object-cover border-2 border-border transition-all duration-300 group-hover:border-primary"
                    />
                    <div className="flex-1">
                      <p className="font-semibold transition-colors duration-300 group-hover:text-primary">
                        {user.name}
                      </p>
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <Flame className="h-4 w-4 text-orange-500" />
                        {user.streak} day streak
                      </div>
                    </div>
                    <div className="text-right">
                      <p className="font-bold text-lg">{user.score.toLocaleString()}</p>
                      <p className="text-xs text-muted-foreground">points</p>
                    </div>
                  </div>)}
                </CardContent>
              </Card>
            </div>

            {
              /* Your Position */
            }
            <div className="space-y-4">
              <Card className="border-primary/30 bg-gradient-to-br from-primary/10 to-accent/10">
                <CardHeader>
                  <CardTitle className="text-lg">Your Position</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="text-center">
                    <p className="text-5xl font-bold gradient-text">#127</p>
                    <p className="text-sm text-muted-foreground mt-1">of 15,432 students</p>
                  </div>
                  <div className="space-y-3">
                    <div className="flex items-center justify-between">
                      <span className="text-sm text-muted-foreground">Score</span>
                      <span className="font-bold">1,847</span>
                    </div>
                    <div className="flex items-center justify-between">
                      <span className="text-sm text-muted-foreground">Streak</span>
                      <span className="font-bold flex items-center gap-1">
                        <Flame className="h-4 w-4 text-orange-500" />4 days
                      </span>
                    </div>
                    <div className="flex items-center justify-between">
                      <span className="text-sm text-muted-foreground">Accuracy</span>
                      <span className="font-bold">82%</span>
                    </div>
                  </div>
                  <div className="flex items-center gap-2 p-3 rounded-lg bg-green-500/10 border border-green-500/30">
                    <TrendingUp className="h-5 w-5 text-green-500" />
                    <span className="text-sm text-green-500 font-medium">Up 23 positions this week!</span>
                  </div>
                </CardContent>
              </Card>

              <Card className="border-border">
                <CardHeader>
                  <CardTitle className="text-lg flex items-center gap-2">
                    <Award className="h-5 w-5 text-primary" />
                    Achievements
                  </CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="grid grid-cols-3 gap-2">
                    {[
                      { icon: Star, label: "100 Qs", unlocked: true },
                      { icon: Flame, label: "7 Day", unlocked: true },
                      { icon: Trophy, label: "Top 200", unlocked: true },
                      { icon: Zap, label: "Speed", unlocked: false },
                      { icon: Target, label: "90% Acc", unlocked: false },
                      { icon: Award, label: "Master", unlocked: false }
                    ].map((badge, i) => <div
                      key={i}
                      className={`flex flex-col items-center gap-1 p-3 rounded-lg transition-all duration-300 hover:scale-110 ${badge.unlocked ? "bg-primary/10 text-primary" : "bg-secondary/50 text-muted-foreground opacity-50"}`}
                    >
                      <badge.icon className="h-6 w-6" />
                      <span className="text-xs font-medium">{badge.label}</span>
                    </div>)}
                  </div>
                </CardContent>
              </Card>
            </div>
          </div>
        </TabsContent>
      </Tabs>
    </div>
  </div>;
}
