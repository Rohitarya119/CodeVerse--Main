import { Navbar } from "@/components/navbar";

export function MainLayout({ children }) {
    return (
        <div className="min-h-screen bg-background flex flex-col">
            <Navbar />
            <main className="flex-1 pt-16">
                {children}
            </main>
        </div>
    );
}
