import { Link } from "react-router-dom";
import { Code2 } from "lucide-react";
export function Footer() {
  return <footer className="border-t border-border bg-card/50">
      <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
        <div className="grid gap-8 md:grid-cols-4">
          <div>
            <Link to="/" className="group flex items-center gap-2">
              <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-primary transition-all duration-300 group-hover:scale-110 group-hover:shadow-lg group-hover:shadow-primary/30">
                <Code2 className="h-5 w-5 text-primary-foreground transition-transform duration-300 group-hover:rotate-12" />
              </div>
              <span className="text-xl font-bold transition-colors duration-300 group-hover:text-primary">
                CodeVerse
              </span>
            </Link>
            <p className="mt-4 text-sm text-muted-foreground">
              Your complete placement preparation platform with AI-powered learning.
            </p>
          </div>
          <div>
            <h4 className="mb-4 font-semibold">Platform</h4>
            <ul className="space-y-2 text-sm text-muted-foreground">
              {["DSA Practice", "Aptitude", "Battle Arena", "Projects"].map((item, i) => <li key={item}>
                  <Link to={`/${item.toLowerCase().replace(" ", "-")}`}
    className="transition-all duration-300 hover:text-primary hover:translate-x-1 inline-block"
  >
                    {item}
                  </Link>
                </li>)}
            </ul>
          </div>
          <div>
            <h4 className="mb-4 font-semibold">Resources</h4>
            <ul className="space-y-2 text-sm text-muted-foreground">
              {["Language Handbooks", "Company Questions", "Blog", "FAQ"].map((item) => <li key={item}>
                  <Link to="#"
    className="transition-all duration-300 hover:text-primary hover:translate-x-1 inline-block"
  >
                    {item}
                  </Link>
                </li>)}
            </ul>
          </div>
          <div>
            <h4 className="mb-4 font-semibold">Company</h4>
            <ul className="space-y-2 text-sm text-muted-foreground">
              {["About Us", "Contact", "Privacy Policy", "Terms of Service"].map((item) => <li key={item}>
                  <Link to="#"
    className="transition-all duration-300 hover:text-primary hover:translate-x-1 inline-block"
  >
                    {item}
                  </Link>
                </li>)}
            </ul>
          </div>
        </div>
        <div className="mt-12 border-t border-border pt-8 text-center text-sm text-muted-foreground">
          © {(/* @__PURE__ */ new Date()).getFullYear()} CodeVerse. All rights reserved.
        </div>
      </div>
    </footer>;
}
