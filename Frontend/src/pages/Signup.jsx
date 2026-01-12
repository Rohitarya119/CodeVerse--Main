import { Link } from "react-router-dom";
import { SignupForm } from "@/components/auth/signup-form";
import { Code2, CheckCircle2 } from "lucide-react";
export default function SignupPage() {
  const benefits = [
    "Access to 10,000+ DSA problems",
    "AI-powered personalized learning",
    "Real-time coding battles",
    "Company-specific question banks"
  ];
  return <div className="flex min-h-[calc(100vh-4rem)]">
    <div className="hidden w-1/2 bg-gradient-to-br from-primary/20 via-background to-accent/20 lg:flex lg:flex-col lg:justify-between lg:p-12">
      <Link to="/" className="flex items-center gap-2">
        <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-primary">
          <Code2 className="h-5 w-5 text-primary-foreground" />
        </div>
        <span className="text-xl font-bold">CodeVerse</span>
      </Link>
      <div>
        <h2 className="mb-6 text-2xl font-bold">Start your placement journey today</h2>
        <ul className="space-y-4">
          {benefits.map((benefit) => <li key={benefit} className="flex items-center gap-3">
            <CheckCircle2 className="h-5 w-5 text-primary" />
            <span>{benefit}</span>
          </li>)}
        </ul>
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
          <h1 className="text-2xl font-bold">Create your account</h1>
          <p className="mt-2 text-muted-foreground">Join thousands of students preparing for placements</p>
        </div>

        <SignupForm />

        <p className="mt-8 text-center text-sm text-muted-foreground">
          Already have an account?{" "}
          <Link to="/login" className="text-primary hover:underline">
            Log in
          </Link>
        </p>
      </div>
    </div>
  </div>;
}
