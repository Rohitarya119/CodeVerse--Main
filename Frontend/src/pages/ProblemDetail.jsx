"use client";

import { useState, useEffect, useRef } from "react";
import Editor from "@monaco-editor/react";
import { useParams, Link, useSearchParams } from "react-router-dom";
import { useAuth } from "@/context/AuthContext";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import {
    ResizableHandle,
    ResizablePanel,
    ResizablePanelGroup,
} from "@/components/ui/resizable";
import {
    ArrowLeft,
    Play,
    CheckCircle2,
    RotateCcw,
    Settings,
    Code2,
    Zap,
    MessageSquare,
    ThumbsUp,
    ThumbsDown,
    Send,
    Sparkles,
    Bot,
    Lightbulb,
    AlertTriangle,
    Check
} from "lucide-react";


export default function ProblemDetail() {
    const { id } = useParams();
    const { token } = useAuth();
    const [searchParams] = useSearchParams();
    const mode = searchParams.get("mode");
    const [boilerplate, setBoilerplate] = useState({});
    const [selectedLanguage, setSelectedLanguage] = useState("python");
    const [problem, setProblem] = useState(null);
    const [code, setCode] = useState("");
    const [output, setOutput] = useState(null);
    const [isRunning, setIsRunning] = useState(false);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [activeTab, setActiveTab] = useState("description");
    const [activeCaseIndex, setActiveCaseIndex] = useState(0);
    const [chatMessages, setChatMessages] = useState([
        { role: "ai", content: "Hi! I'm your AI coding assistant. I'll help you understand the problem and guide you through the solution. What would you like to know?" }
    ]);
    const [chatInput, setChatInput] = useState("");
    const scrollAreaRef = useRef(null);

    useEffect(() => {
        const fetchProblem = async () => {
            try {
                const response = await fetch(`/api/problems/${id}`);
                if (!response.ok) throw new Error("Failed to fetch problem");
                const data = await response.json();

                // Adapt backend data to frontend structure
                const adaptedProblem = {
                    ...data,
                    difficulty: data.difficulty.charAt(0) + data.difficulty.slice(1).toLowerCase(),
                    tags: data.topics || [],
                    starterCode: data.boilerplateCode["python"]
                };

                setProblem(adaptedProblem);
                setBoilerplate(data.boilerplateCode || {});
                setCode(data.boilerplateCode["python"] || "");
                setSelectedLanguage("python");
            } catch (error) {
                console.error("Error fetching problem:", error);
                // Fallback or error handling could go here
            }
        };

        if (id) {
            fetchProblem();
        }
    }, [id]);

    const handleLanguageChange = (value) => {
        setSelectedLanguage(value);
        setCode(boilerplate[value] || "");
    };

    const handleRun = async () => {
        setIsRunning(true);
        setOutput(null);
        setActiveCaseIndex(0);
        try {
            // Note: /execute runs against all DB test cases, ignoring 'stdin'
            const payload = {
                code: code,
                language: selectedLanguage
            };

            const response = await fetch(`/api/problems/${id}/execute`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(payload)
            });

            const result = await response.json();

            if (result.results) {
                // Calculate overall status since /execute doesn't return it directly
                const allPassed = result.results.every(r => r.passed);
                const passedCount = result.results.filter(r => r.passed).length;
                const totalCount = result.results.length;

                setOutput({
                    status: allPassed ? "Passed" : "Wrong Answer",
                    details: `${passedCount}/${totalCount} test cases passed.`,
                    results: result.results
                });
            } else if (result.message) {
                setOutput({
                    status: "Error",
                    details: result.message
                });
            } else {
                setOutput({
                    status: "Error",
                    details: "Unknown error occurred"
                });
            }

        } catch (error) {
            setOutput({
                status: "Error",
                details: error.message
            });
        } finally {
            setIsRunning(false);
        }
    };

    const handleSubmit = async () => {
        setIsSubmitting(true);
        setOutput(null);
        try {
            const headers = { "Content-Type": "application/json" };
            if (token) {
                headers["Authorization"] = `Bearer ${token}`;
            }

            const response = await fetch(`/api/problems/${id}/submit`, {
                method: "POST",
                headers: headers,
                body: JSON.stringify({
                    code: code,
                    language: selectedLanguage
                })
            });

            const result = await response.json();

            if (result.results) {
                const passedCount = result.results.filter(r => r.passed).length;
                const totalCount = result.results.length;

                setOutput({
                    status: result.passed ? "Accepted" : "Wrong Answer",
                    details: `${passedCount}/${totalCount} test cases passed.`,
                    results: result.results
                });
            } else if (result.message) {
                setOutput({
                    status: "Error",
                    details: result.message
                });
            } else {
                setOutput({
                    status: "Error",
                    details: "Received unexpected response from server. Check console for details."
                });
                console.error("Unexpected submit response:", result);
            }

        } catch (error) {
            console.error("Submit error:", error);
            setOutput({
                status: "Error",
                details: error.message || "Failed to submit code"
            });
        } finally {
            setIsSubmitting(false);
        }
    };

    const handleSendMessage = () => {
        if (!chatInput.trim()) return;
        const newMessages = [...chatMessages, { role: "user", content: chatInput }];
        setChatMessages(newMessages);
        setChatInput("");

        // Simulate AI response
        setTimeout(() => {
            setChatMessages([...newMessages, { role: "ai", content: "That's a great question! Try using a hash map to store the complements of the numbers you've seen so far. This allows you to find the solution in a single pass." }]);
        }, 1000);
    };

    const handleQuickAction = (action) => {
        const prompts = {
            hint: "Can you give me a hint without solving it?",
            approach: "Check my approach: I'm thinking of using a nested loop.",
            wrong: "What's wrong with my code?"
        };
        const message = prompts[action];
        const newMessages = [...chatMessages, { role: "user", content: message }];
        setChatMessages(newMessages);

        setTimeout(() => {
            let response = "";
            if (action === "hint") response = "Consider using a Hash Map to store elements as you iterate. What value would you look for in the map for each element?";
            if (action === "approach") response = "A nested loop would work (O(n²)), but we can do better! Can we trade some space for time to achieve O(n)?";
            if (action === "wrong") response = "I see a potential issue with the return statement. Make sure you're returning the indices, not the values.";
            setChatMessages([...newMessages, { role: "ai", content: response }]);
        }, 1000);
    };

    if (!problem) {
        return (
            <div className="flex items-center justify-center h-screen bg-background text-foreground">
                <div className="flex flex-col items-center gap-4">
                    <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary"></div>
                    <p className="text-muted-foreground animate-pulse">Loading Problem...</p>
                </div>
            </div>
        );
    }

    return (
        <div className="h-[calc(100vh-4rem)] bg-background flex flex-col overflow-hidden">
            {/* Header */}
            <header className="h-14 border-b border-border flex items-center justify-between px-4 bg-card flex-shrink-0">
                <div className="flex items-center gap-4">
                    <Link to="/dsa" className="text-muted-foreground hover:text-foreground flex items-center gap-2 transition-colors">
                        <ArrowLeft className="h-4 w-4" /> Back
                    </Link>
                    {mode === 'ai' && (
                        <Badge variant="secondary" className="bg-purple-500/10 text-purple-400 border-purple-500/20 gap-1.5 px-3 py-1">
                            <Sparkles className="h-3 w-3" /> AI Mode
                        </Badge>
                    )}
                </div>
                <div className="flex items-center gap-2">
                    {/* Like/Dislike buttons removed as requested */}
                    {mode === 'ai' && (
                        <Button variant="outline" size="sm" className="gap-2 border-purple-500/20 hover:bg-purple-500/10 text-purple-400">
                            <Zap className="h-4 w-4" /> Hide AI
                        </Button>
                    )}
                </div>
            </header>

            {/* Main Content Resizable Panels */}
            <div className="flex-1 overflow-hidden p-2">
                <ResizablePanelGroup direction="horizontal" className="h-full gap-2">
                    {/* Left Panel: Problem Description */}
                    <ResizablePanel defaultSize={30} minSize={20} className="bg-card rounded-xl border border-border overflow-hidden flex flex-col shadow-sm">
                        <div className="h-full flex flex-col">
                            <div className="p-4 border-b border-border bg-card">
                                <div className="flex justify-between items-start mb-4">
                                    <div>
                                        <h1 className="text-xl font-bold mb-2">{problem.id}. {problem.title}</h1>
                                        <div className="flex flex-wrap items-center gap-2">
                                            <Badge className={`
                                                ${problem.difficulty === 'Easy' ? 'bg-green-500/10 text-green-500 border-green-500/20' : ''}
                                                ${problem.difficulty === 'Medium' ? 'bg-yellow-500/10 text-yellow-500 border-yellow-500/20' : ''}
                                                ${problem.difficulty === 'Hard' ? 'bg-red-500/10 text-red-500 border-red-500/20' : ''}
                                            `}>
                                                {problem.difficulty}
                                            </Badge>
                                        </div>
                                    </div>
                                </div>
                                <Tabs value={activeTab} onValueChange={setActiveTab} className="w-full">
                                    <TabsList className="w-full justify-start bg-transparent border-b border-border rounded-none h-auto p-0 gap-4">
                                        {["Description", "Hints", "Approaches", "Solutions"].map((tab) => (
                                            <TabsTrigger
                                                key={tab}
                                                value={tab.toLowerCase()}
                                                className="rounded-none border-b-2 border-transparent data-[state=active]:border-primary data-[state=active]:text-foreground text-muted-foreground px-1 py-2 text-sm font-medium transition-none"
                                            >
                                                {tab}
                                            </TabsTrigger>
                                        ))}
                                    </TabsList>
                                </Tabs>
                            </div>

                            {/* Replaced ScrollArea with standard div for robust scrolling */}
                            <div className="flex-1 overflow-y-auto p-4 custom-scrollbar">
                                {activeTab === 'description' && (
                                    <div className="prose prose-invert prose-sm max-w-none pb-4">
                                        <p className="whitespace-pre-wrap leading-relaxed text-foreground/90">
                                            {problem.description}
                                        </p>
                                        <h3 className="text-foreground font-semibold mt-6 mb-3">Examples:</h3>
                                        <div className="space-y-4">
                                            {problem.examples.map((ex, i) => (
                                                <div key={i} className="bg-secondary/20 rounded-lg p-4 font-mono text-sm border border-border/50">
                                                    <div className="mb-2"><span className="text-muted-foreground font-semibold">Input:</span> <span className="text-foreground">{ex.input}</span></div>
                                                    <div className="mb-2"><span className="text-muted-foreground font-semibold">Output:</span> <span className="text-foreground">{ex.output}</span></div>
                                                    {ex.explanation && <div><span className="text-muted-foreground font-semibold">Explanation:</span> <span className="text-muted-foreground">{ex.explanation}</span></div>}
                                                </div>
                                            ))}
                                        </div>
                                        <h3 className="text-foreground font-semibold mt-6 mb-3">Constraints:</h3>
                                        <ul className="list-disc list-inside space-y-1 text-muted-foreground">
                                            {problem.constraints.map((c, i) => <li key={i}>{c}</li>)}
                                        </ul>
                                    </div>
                                )}
                                {activeTab === 'hints' && (
                                    <div className="prose prose-invert prose-sm max-w-none pb-4">
                                        <h3 className="text-foreground font-semibold mb-3">Hints</h3>
                                        {problem.hints && problem.hints.length > 0 ? (
                                            <ul className="list-disc list-inside space-y-3">
                                                {problem.hints.map((hint, i) => (
                                                    <li key={i} className="text-foreground/90 bg-secondary/10 p-3 rounded-md border border-border/50">
                                                        {hint}
                                                    </li>
                                                ))}
                                            </ul>
                                        ) : (
                                            <div className="flex flex-col items-center justify-center py-10 text-muted-foreground">
                                                <Lightbulb className="h-10 w-10 mb-2 opacity-20" />
                                                <p>No hints available for this problem.</p>
                                            </div>
                                        )}
                                    </div>
                                )}
                                {activeTab === 'approaches' && (
                                    <div className="prose prose-invert prose-sm max-w-none pb-4">
                                        <h3 className="text-foreground font-semibold mb-3">Approach</h3>
                                        {problem.approach ? (
                                            <div className="whitespace-pre-wrap leading-relaxed text-foreground/90">
                                                {problem.approach}
                                            </div>
                                        ) : (
                                            <div className="flex flex-col items-center justify-center py-10 text-muted-foreground">
                                                <Code2 className="h-10 w-10 mb-2 opacity-20" />
                                                <p>No approach available for this problem yet.</p>
                                            </div>
                                        )}
                                    </div>
                                )}
                                {activeTab === 'solutions' && (
                                    <div className="prose prose-invert prose-sm max-w-none pb-4">
                                        <h3 className="text-foreground font-semibold mb-3">Solution</h3>
                                        {problem.solution ? (
                                            <div className="whitespace-pre-wrap leading-relaxed text-foreground/90">
                                                {problem.solution}
                                            </div>
                                        ) : (
                                            <div className="flex flex-col items-center justify-center py-10 text-muted-foreground">
                                                <Code2 className="h-10 w-10 mb-2 opacity-20" />
                                                <p>No solution available for this problem yet.</p>
                                            </div>
                                        )}
                                    </div>
                                )}
                            </div>
                        </div>
                    </ResizablePanel>

                    <ResizableHandle className="w-2 bg-transparent hover:bg-primary/20 transition-colors rounded-full mx-0.5" />

                    {/* Middle Panel: Code Editor */}
                    <ResizablePanel defaultSize={45} minSize={30} className="bg-card rounded-xl border border-border overflow-hidden shadow-sm">
                        <ResizablePanelGroup direction="vertical">
                            <ResizablePanel defaultSize={65} minSize={30}>
                                <div className="h-full flex flex-col">
                                    {/* Editor Toolbar */}
                                    <div className="flex items-center justify-between px-3 py-2 border-b border-border bg-secondary/10 flex-shrink-0">
                                        <div className="flex items-center gap-2">
                                            <Select value={selectedLanguage} onValueChange={handleLanguageChange}>
                                                <SelectTrigger className="w-[120px] h-8 bg-transparent border-none focus:ring-0 text-sm font-medium hover:bg-secondary/50 transition-colors">
                                                    <SelectValue placeholder="Language" />
                                                </SelectTrigger>
                                                <SelectContent>
                                                    <SelectItem value="python">Python</SelectItem>
                                                    <SelectItem value="javascript">JavaScript</SelectItem>
                                                    <SelectItem value="java">Java</SelectItem>
                                                    <SelectItem value="cpp">C++</SelectItem>
                                                </SelectContent>
                                            </Select>
                                        </div>
                                        <div className="flex items-center gap-1">
                                            <Button variant="ghost" size="sm" onClick={() => setCode(problem.starterCode)} className="h-8 w-8 p-0 text-muted-foreground hover:text-foreground">
                                                <RotateCcw className="h-4 w-4" />
                                            </Button>
                                            <Button variant="ghost" size="icon" className="h-8 w-8 text-muted-foreground hover:text-foreground">
                                                <Settings className="h-4 w-4" />
                                            </Button>
                                        </div>
                                    </div>



                                    {/* Editor Area */}
                                    <div className="flex-1 relative bg-[#1e1e1e] min-h-0">
                                        <Editor
                                            height="100%"
                                            defaultLanguage="python"
                                            language={selectedLanguage === 'cpp' ? 'cpp' : selectedLanguage}
                                            theme="vs-dark"
                                            value={code}
                                            onChange={(value) => setCode(value || "")}
                                            options={{
                                                minimap: { enabled: false },
                                                fontSize: 14,
                                                lineNumbers: "on",
                                                roundedSelection: false,
                                                scrollBeyondLastLine: false,
                                                readOnly: false,
                                                automaticLayout: true,
                                            }}
                                        />
                                    </div>
                                </div>
                            </ResizablePanel>

                            <ResizableHandle withHandle className="h-1.5 bg-transparent hover:bg-primary/20 transition-colors rounded-full my-0.5 justify-center" />

                            <ResizablePanel defaultSize={35} minSize={10}>
                                <div className="h-full flex flex-col bg-card">
                                    {/* Output / Console Section */}
                                    <div className="h-full flex flex-col bg-card">
                                        {/* Console Header */}
                                        <div className="flex items-center justify-between px-4 py-2 border-b border-border bg-secondary/10 flex-shrink-0">
                                            <div className="flex items-center gap-4">
                                                <button className="text-sm font-medium flex items-center gap-2 text-foreground border-b-2 border-primary pb-2 -mb-2.5 z-10">
                                                    <CheckCircle2 className="h-4 w-4 text-green-500" />
                                                    Testcase
                                                </button>
                                                {output && (
                                                    <button className={`text-sm font-medium flex items-center gap-2 border-b-2 pb-2 -mb-2.5 z-10 ${output.status === 'Accepted' || output.status === 'Completed' ? 'text-green-500 border-green-500' : 'text-red-500 border-red-500'}`}>
                                                        Result
                                                    </button>
                                                )}
                                            </div>
                                            {output && output.runtime && (
                                                <span className="text-xs text-muted-foreground">Runtime: {output.runtime || 'N/A'}</span>
                                            )}
                                        </div>

                                        {/* Console Content */}
                                        <div className="flex-1 overflow-y-auto p-4 bg-card/50 min-h-0">
                                            {!output ? (
                                                <div className="h-full flex flex-col items-center justify-center text-muted-foreground opacity-50">
                                                    <Code2 className="h-8 w-8 mb-2" />
                                                    <p className="text-xs">Run code to see output</p>
                                                </div>
                                            ) : (
                                                <div className="space-y-4">
                                                    <div className="flex items-center gap-2">
                                                        <span className={`text-lg font-bold ${output.status === "Error" || output.status === "Wrong Answer" ? "text-red-500" : "text-green-500"}`}>
                                                            {output.status}
                                                        </span>
                                                    </div>

                                                    {output.details && (
                                                        <div className="bg-secondary/30 rounded-lg p-3 font-mono text-sm border border-border/50">
                                                            <pre className="whitespace-pre-wrap text-foreground/90">{output.details}</pre>
                                                        </div>
                                                    )}

                                                    {output.results && (
                                                        <div className="mt-4">
                                                            <div className="flex gap-2 mb-2 overflow-x-auto pb-2">
                                                                {output.results.map((res, idx) => (
                                                                    <button
                                                                        key={idx}
                                                                        onClick={() => setActiveCaseIndex(idx)}
                                                                        className={`px-3 py-1.5 text-xs font-medium rounded-md transition-colors whitespace-nowrap ${activeCaseIndex === idx
                                                                            ? 'bg-secondary text-foreground shadow-sm'
                                                                            : 'bg-transparent text-muted-foreground hover:bg-secondary/50 hover:text-foreground'
                                                                            }`}
                                                                    >
                                                                        <span className={`inline-block w-2 h-2 rounded-full mr-2 ${res.passed ? 'bg-green-500' : 'bg-red-500'}`}></span>
                                                                        Case {idx + 1}
                                                                    </button>
                                                                ))}
                                                            </div>

                                                            {output.results[activeCaseIndex] && (
                                                                <div className="bg-secondary/20 rounded-lg p-4 font-mono text-sm border border-border/50">
                                                                    <div className="space-y-4">
                                                                        <div>
                                                                            <span className="text-xs text-muted-foreground uppercase tracking-wide block mb-1">Input</span>
                                                                            <div className="bg-card p-2 rounded border border-border/50 text-foreground overflow-x-auto">
                                                                                {output.results[activeCaseIndex].input}
                                                                            </div>
                                                                        </div>
                                                                        <div>
                                                                            <span className="text-xs text-muted-foreground uppercase tracking-wide block mb-1">Output</span>
                                                                            <div className={`p-2 rounded border border-border/50 overflow-x-auto ${output.results[activeCaseIndex].passed ? 'bg-card text-foreground' : 'bg-red-500/10 text-red-500 border-red-500/20'}`}>
                                                                                {output.results[activeCaseIndex].stdout || "null"}
                                                                            </div>
                                                                        </div>
                                                                        <div>
                                                                            <span className="text-xs text-muted-foreground uppercase tracking-wide block mb-1">Expected</span>
                                                                            <div className="bg-card p-2 rounded border border-border/50 text-foreground overflow-x-auto">
                                                                                {output.results[activeCaseIndex].expectedOutput}
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            )}
                                                        </div>
                                                    )}
                                                </div>
                                            )}
                                        </div>

                                        {/* Bottom Action Bar */}
                                        <div className="p-3 border-t border-border bg-card flex justify-between items-center flex-shrink-0">
                                            <Button variant="ghost" size="sm" className="text-muted-foreground hover:text-foreground text-xs">
                                                Console
                                            </Button>
                                            <div className="flex gap-2">
                                                <Button
                                                    variant="secondary"
                                                    size="sm"
                                                    onClick={handleRun}
                                                    disabled={isRunning}
                                                    className="px-6 font-medium bg-secondary hover:bg-secondary/80 text-secondary-foreground"
                                                >
                                                    <Play className="h-4 w-4 mr-2 fill-current" /> {isRunning ? "Running..." : "Run"}
                                                </Button>
                                                <Button
                                                    size="sm"
                                                    onClick={handleSubmit}
                                                    disabled={isSubmitting}
                                                    className="px-6 font-medium bg-green-600 hover:bg-green-700 text-white shadow-lg shadow-green-900/20"
                                                >
                                                    {isSubmitting ? "Submitting..." : "Submit"}
                                                </Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ResizablePanel>
                        </ResizablePanelGroup>
                    </ResizablePanel>

                    {mode === 'ai' && (
                        <>
                            <ResizableHandle className="w-2 bg-transparent hover:bg-primary/20 transition-colors rounded-full mx-0.5" />
                            {/* Right Panel: AI Assistant */}
                            <ResizablePanel defaultSize={25} minSize={20} className="bg-card rounded-xl border border-border overflow-hidden flex flex-col shadow-sm">
                                <div className="h-full flex flex-col bg-card">
                                    <div className="py-3 px-4 border-b border-border bg-purple-500/5">
                                        <div className="flex items-center gap-2">
                                            <div className="p-1.5 rounded-lg bg-purple-500/20">
                                                <Bot className="h-5 w-5 text-purple-400" />
                                            </div>
                                            <h2 className="text-base font-semibold">AI Assistant</h2>
                                        </div>
                                    </div>
                                    <ScrollArea className="flex-1 p-4" ref={scrollAreaRef}>
                                        <div className="space-y-4">
                                            {chatMessages.map((msg, idx) => (
                                                <div key={idx} className={`flex gap-3 ${msg.role === 'user' ? 'flex-row-reverse' : ''}`}>
                                                    <div className={`h-8 w-8 rounded-full flex items-center justify-center flex-shrink-0 ${msg.role === 'ai' ? 'bg-purple-500/20 text-purple-400' : 'bg-primary/20 text-primary'}`}>
                                                        {msg.role === 'ai' ? <Sparkles className="h-4 w-4" /> : <div className="text-xs font-bold">You</div>}
                                                    </div>
                                                    <div className={`rounded-2xl px-4 py-2.5 text-sm max-w-[85%] ${msg.role === 'ai'
                                                        ? 'bg-secondary text-foreground rounded-tl-none'
                                                        : 'bg-primary text-primary-foreground rounded-tr-none'
                                                        }`}>
                                                        {msg.content}
                                                    </div>
                                                </div>
                                            ))}
                                        </div>
                                    </ScrollArea>
                                    <div className="p-4 border-t border-border space-y-4 bg-card">
                                        <div className="flex flex-col gap-2">
                                            <Button variant="outline" size="sm" className="justify-start h-auto py-2 px-3 text-xs border-dashed border-border hover:border-purple-500/50 hover:bg-purple-500/5 hover:text-purple-400 transition-colors" onClick={() => handleQuickAction('hint')}>
                                                <Lightbulb className="h-3 w-3 mr-2" /> Give me a hint
                                            </Button>
                                            <Button variant="outline" size="sm" className="justify-start h-auto py-2 px-3 text-xs border-dashed border-border hover:border-blue-500/50 hover:bg-blue-500/5 hover:text-blue-400 transition-colors" onClick={() => handleQuickAction('approach')}>
                                                <Zap className="h-3 w-3 mr-2" /> Check my approach
                                            </Button>
                                            <Button variant="outline" size="sm" className="justify-start h-auto py-2 px-3 text-xs border-dashed border-border hover:border-red-500/50 hover:bg-red-500/5 hover:text-red-400 transition-colors" onClick={() => handleQuickAction('wrong')}>
                                                <AlertTriangle className="h-3 w-3 mr-2" /> What's wrong?
                                            </Button>
                                        </div>
                                        <div className="relative">
                                            <input
                                                type="text"
                                                placeholder="Ask anything..."
                                                className="w-full bg-secondary/50 border border-border rounded-full pl-4 pr-10 py-2.5 text-sm focus:outline-none focus:border-purple-500/50 focus:ring-1 focus:ring-purple-500/20 transition-all"
                                                value={chatInput}
                                                onChange={(e) => setChatInput(e.target.value)}
                                                onKeyDown={(e) => e.key === 'Enter' && handleSendMessage()}
                                            />
                                            <Button
                                                size="icon"
                                                className="absolute right-1 top-1 h-7 w-7 rounded-full bg-purple-600 hover:bg-purple-700 text-white"
                                                onClick={handleSendMessage}
                                            >
                                                <Send className="h-3 w-3" />
                                            </Button>
                                        </div>
                                    </div>
                                </div>
                            </ResizablePanel>
                        </>
                    )}
                </ResizablePanelGroup>
            </div>
        </div>
    );
}
