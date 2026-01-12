"use client";
import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Play, RotateCcw, Send } from "lucide-react";
export function CodeEditor({ onRun, onSubmit }) {
  const [language, setLanguage] = useState("python");
  const [code, setCode] = useState(`def twoSum(nums, target):
    """
    :type nums: List[int]
    :type target: int
    :rtype: List[int]
    """
    # Write your solution here
    seen = {}
    for i, num in enumerate(nums):
        complement = target - num
        if complement in seen:
            return [seen[complement], i]
        seen[num] = i
    return []`);
  return <div className="flex flex-col rounded-lg border border-border bg-card">
      <div className="flex items-center justify-between border-b border-border px-4 py-2">
        <Select value={language} onValueChange={setLanguage}>
          <SelectTrigger className="w-32 bg-secondary">
            <SelectValue />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="python">Python</SelectItem>
            <SelectItem value="javascript">JavaScript</SelectItem>
            <SelectItem value="java">Java</SelectItem>
            <SelectItem value="cpp">C++</SelectItem>
          </SelectContent>
        </Select>
        <div className="flex items-center gap-2">
          <Button variant="ghost" size="sm" onClick={() => setCode("")}>
            <RotateCcw className="mr-2 h-4 w-4" />
            Reset
          </Button>
        </div>
      </div>
      <textarea
    value={code}
    onChange={(e) => setCode(e.target.value)}
    className="min-h-[300px] flex-1 resize-none bg-transparent p-4 font-mono text-sm focus:outline-none"
    spellCheck={false}
  />
      <div className="flex items-center justify-end gap-2 border-t border-border px-4 py-2">
        <Button variant="outline" onClick={onRun}>
          <Play className="mr-2 h-4 w-4" />
          Run
        </Button>
        <Button onClick={onSubmit} className="bg-primary hover:bg-primary/90">
          <Send className="mr-2 h-4 w-4" />
          Submit
        </Button>
      </div>
    </div>;
}
