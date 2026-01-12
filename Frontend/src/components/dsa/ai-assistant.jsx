"use client";
import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Brain, Send, Sparkles, Lightbulb, Bug, BookOpen } from "lucide-react";
export function AIAssistant() {
  const [messages, setMessages] = useState([
    {
      role: "assistant",
      content: "Hi! I'm your AI coding assistant. I can help you understand the problem, give hints, debug your code, or explain concepts. How can I help you today?"
    }
  ]);
  const [input, setInput] = useState("");
  const quickActions = [
    { label: "Give me a hint", icon: Lightbulb },
    { label: "Debug my code", icon: Bug },
    { label: "Explain approach", icon: BookOpen }
  ];
  const handleSend = () => {
    if (!input.trim()) return;
    setMessages([...messages, { role: "user", content: input }]);
    setInput("");
    setTimeout(() => {
      setMessages((prev) => [
        ...prev,
        {
          role: "assistant",
          content: "Great question! For the Two Sum problem, think about using a hash map to store numbers you've seen. As you iterate through the array, check if the complement (target - current number) exists in the hash map. This gives you O(n) time complexity."
        }
      ]);
    }, 1e3);
  };
  const handleQuickAction = (action) => {
    setMessages([...messages, { role: "user", content: action }]);
    setTimeout(() => {
      setMessages((prev) => [
        ...prev,
        {
          role: "assistant",
          content: action.includes("hint") ? "Here's a hint: Think about what data structure allows O(1) lookup time. If you're looking for a number that complements your current number to reach the target, how can you quickly check if that complement exists in your previously seen numbers?" : action.includes("Debug") ? "I'll analyze your code. I see you're using a hash map approach which is correct! Make sure you're storing the index as the value and the number as the key. Also, check if you're returning the indices in the correct order." : "The optimal approach uses a hash map (dictionary in Python). Here's the strategy:\n1. Iterate through the array once\n2. For each number, calculate complement = target - num\n3. Check if complement exists in hash map\n4. If yes, return both indices. If no, add current number and index to hash map\nThis is O(n) time and O(n) space."
        }
      ]);
    }, 1e3);
  };
  return <Card className="flex h-full flex-col border-border bg-card">
      <CardHeader className="pb-3">
        <CardTitle className="flex items-center gap-2 text-lg">
          <Brain className="h-5 w-5 text-primary" />
          AI Assistant
        </CardTitle>
      </CardHeader>
      <CardContent className="flex flex-1 flex-col gap-4">
        <div className="flex flex-wrap gap-2">
          {quickActions.map((action) => <Button
    key={action.label}
    variant="outline"
    size="sm"
    onClick={() => handleQuickAction(action.label)}
    className="gap-1.5"
  >
              <action.icon className="h-3.5 w-3.5" />
              {action.label}
            </Button>)}
        </div>

        <ScrollArea className="flex-1 rounded-lg border border-border bg-secondary/50 p-4">
          <div className="space-y-4">
            {messages.map((message, i) => <div key={i} className={`flex gap-3 ${message.role === "user" ? "justify-end" : ""}`}>
                {message.role === "assistant" && <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-primary/10">
                    <Sparkles className="h-4 w-4 text-primary" />
                  </div>}
                <div
    className={`rounded-lg px-4 py-2 ${message.role === "user" ? "bg-primary text-primary-foreground" : "bg-card"}`}
  >
                  <p className="text-sm whitespace-pre-wrap">{message.content}</p>
                </div>
              </div>)}
          </div>
        </ScrollArea>

        <div className="flex gap-2">
          <Input
    placeholder="Ask anything about the problem..."
    value={input}
    onChange={(e) => setInput(e.target.value)}
    onKeyDown={(e) => e.key === "Enter" && handleSend()}
    className="bg-secondary"
  />
          <Button onClick={handleSend} size="icon" className="bg-primary">
            <Send className="h-4 w-4" />
          </Button>
        </div>
      </CardContent>
    </Card>;
}
