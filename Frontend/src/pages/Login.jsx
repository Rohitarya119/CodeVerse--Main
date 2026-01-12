import { Link } from "react-router-dom";
import { LoginForm } from "@/components/auth/login-form";
import { Code2 } from "lucide-react";
export default function LoginPage() {
  return <div className="flex min-h-[calc(100vh-4rem)]">
    <div className="hidden w-1/2 bg-gradient-to-br from-primary/20 via-background to-accent/20 lg:flex lg:flex-col lg:justify-between lg:p-12">
      <Link to="/" className="flex items-center gap-2">
        <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-primary">
          <Code2 className="h-5 w-5 text-primary-foreground" />
        </div>
        <span className="text-xl font-bold">CodeVerse</span>
      </Link>
      <div>
        <blockquote className="text-lg">
          "CodeVerse helped me crack my dream job at Google. The AI-powered practice and battle arena made learning
          DSA actually fun!"
        </blockquote>
        <p className="mt-4 text-sm text-muted-foreground">— Priya Sharma, Software Engineer at Google</p>
      </div>
    </div>

    <div className="flex w-full flex-col justify-center px-4 lg:w-1/2 lg:px-12">
      <div className="mx-auto w-full max-w-md">
        <div className="mb-8 lg:hidden">
          <Link to="/" className="flex items-center gap-2">
            <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-primary">
              <Code2 className="h-5 w-5 text-primary-foreground" />
            </div>
            <span className="text-xl font-bold">CodeVerse</span>
          </Link>
        </div>

        <div className="mb-8">
          <h1 className="text-2xl font-bold">Welcome back</h1>
          <p className="mt-2 text-muted-foreground">Enter your credentials to access your account</p>
        </div>

        <LoginForm />

        <p className="mt-8 text-center text-sm text-muted-foreground">
          Don't have an account?{" "}
          <Link to="/signup" className="text-primary hover:underline">
            Sign up for free
          </Link>
        </p>
      </div>
    </div>
  </div>;
}
