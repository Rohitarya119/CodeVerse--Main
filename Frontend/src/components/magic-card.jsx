import { useState } from "react";
import { cn } from "@/lib/utils";

export function MagicCard({ children, className, ...props }) {
    const [isFlipped, setIsFlipped] = useState(false);

    const handleClick = () => {
        setIsFlipped(!isFlipped);
    };

    return (
        <div
            className={cn(
                "relative group cursor-pointer",
                className
            )}
            onClick={handleClick}
            {...props}
        >
            <div
                className={cn(
                    "relative w-full h-full transition-all duration-200 ease-out",
                    isFlipped ? "rotate-y-180" : ""
                )}
                style={{
                    transform: isFlipped ? `rotateY(180deg)` : `none`,
                    transformStyle: "preserve-3d"
                }}
            >
                {/* Front */}
                <div className="relative w-full h-full backface-hidden bg-card rounded-xl overflow-hidden">
                    {children}
                </div>

                {/* Back */}
                <div className="absolute inset-0 w-full h-full backface-hidden rotate-y-180 bg-card rounded-xl overflow-hidden flex items-center justify-center border border-primary/20"
                     style={{ backfaceVisibility: "hidden", transform: "rotateY(180deg)" }}>
                    <div className="absolute inset-0 bg-gradient-to-br from-primary/10 to-accent/10" />
                    <div className="text-center p-6">
                        <h3 className="text-xl font-bold text-primary">CodeVerse</h3>
                        <p className="text-muted-foreground mt-2">Keep coding!</p>
                    </div>
                </div>
            </div>
        </div>
    );
}
