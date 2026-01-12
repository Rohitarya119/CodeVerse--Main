"use client";
import { Link, useLocation } from "react-router-dom";
import { useState } from "react";
import { Button } from "@/components/ui/button";
import {
  Code2, Menu, X, Zap, Trophy, BookOpen, Swords, Brain, Library, Network, ChevronDown, User, LogOut, Settings
} from "lucide-react";
import { ModeToggle } from "@/components/mode-toggle";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
  DropdownMenuSeparator,
  DropdownMenuLabel
} from "@/components/ui/dropdown-menu";
import { cn } from "@/lib/utils";
import { useAuth } from "@/context/AuthContext";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";

export function Navbar() {
  const [isOpen, setIsOpen] = useState(false);
  const location = useLocation();
  const { user, logout } = useAuth();

  const isActive = (path) => location.pathname === path;

  const navGroups = [
    {
      label: "Learn",
      items: [
        { href: "/dsa", label: "DSA", icon: Brain },
        { href: "/system-design", label: "System Design", icon: Network },
        { href: "/handbook", label: "Handbook", icon: Library },
      ]
    },
    {
      label: "Practice",
      items: [
        { href: "/battle", label: "Battle Arena", icon: Swords },
        { href: "/contest", label: "Contests", icon: Trophy },
        { href: "/aptitude", label: "Aptitude", icon: BookOpen },
      ]
    }
  ];

  return <nav className="fixed top-0 left-0 right-0 z-50 border-b border-border/40 bg-background/60 backdrop-blur-md supports-[backdrop-filter]:bg-background/60 transition-all duration-300">
    <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
      <div className="flex h-16 items-center justify-between">
        {/* Logo */}
        <Link to="/" className="group flex items-center gap-2">
          <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-gradient-to-br from-primary to-purple-600 transition-all duration-300 group-hover:scale-110 group-hover:shadow-lg group-hover:shadow-primary/30">
            <Code2 className="h-5 w-5 text-white transition-transform duration-300 group-hover:rotate-12" />
          </div>
          <span className="text-xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-foreground to-foreground/70 transition-all duration-300 group-hover:from-primary group-hover:to-purple-600">
            CodeVerse
          </span>
        </Link>

        {/* Desktop Navigation */}
        <div className="hidden items-center gap-6 md:flex">
          <Link
            to="/dashboard"
            className={cn(
              "text-sm font-medium transition-colors hover:text-primary flex items-center gap-2",
              isActive("/dashboard") ? "text-primary" : "text-muted-foreground"
            )}
          >
            <Zap className="h-4 w-4" />
            Dashboard
          </Link>

          {navGroups.map((group) => (
            <DropdownMenu key={group.label}>
              <DropdownMenuTrigger className="flex items-center gap-1 text-sm font-medium text-muted-foreground transition-colors hover:text-primary outline-none data-[state=open]:text-primary">
                {group.label}
                <ChevronDown className="h-3 w-3 transition-transform duration-300 group-data-[state=open]:rotate-180" />
              </DropdownMenuTrigger>
              <DropdownMenuContent align="center" className="w-48 p-2 animate-in fade-in-80 zoom-in-95">
                {group.items.map((item) => (
                  <DropdownMenuItem key={item.href} asChild>
                    <Link
                      to={item.href}
                      className={cn(
                        "flex items-center gap-2 cursor-pointer rounded-md px-3 py-2 text-sm transition-colors",
                        isActive(item.href) ? "bg-primary/10 text-primary" : "text-muted-foreground hover:text-primary hover:bg-primary/5"
                      )}
                    >
                      <item.icon className="h-4 w-4" />
                      {item.label}
                    </Link>
                  </DropdownMenuItem>
                ))}
              </DropdownMenuContent>
            </DropdownMenu>
          ))}

          <Link
            to="/leaderboard"
            className={cn(
              "text-sm font-medium transition-colors hover:text-primary flex items-center gap-2",
              isActive("/leaderboard") ? "text-primary" : "text-muted-foreground"
            )}
          >
            <Trophy className="h-4 w-4" />
            Leaderboard
          </Link>
        </div>

        {/* Right Side Actions */}
        <div className="hidden items-center gap-4 md:flex">
          <ModeToggle />

          {user ? (
            <DropdownMenu>
              <DropdownMenuTrigger asChild>
                <Button variant="ghost" className="relative h-8 w-8 rounded-full">
                  <Avatar className="h-8 w-8">
                    <AvatarImage src={`https://api.dicebear.com/7.x/avataaars/svg?seed=${user.username}`} alt={user.username} />
                    <AvatarFallback>{user.username?.charAt(0).toUpperCase()}</AvatarFallback>
                  </Avatar>
                </Button>
              </DropdownMenuTrigger>
              <DropdownMenuContent className="w-56" align="end" forceMount>
                <DropdownMenuLabel className="font-normal">
                  <div className="flex flex-col space-y-1">
                    <p className="text-sm font-medium leading-none">{user.fullName || user.username}</p>
                    <p className="text-xs leading-none text-muted-foreground">
                      {user.email}
                    </p>
                  </div>
                </DropdownMenuLabel>
                <DropdownMenuSeparator />
                <DropdownMenuItem asChild>
                  <Link to="/profile" className="cursor-pointer">
                    <User className="mr-2 h-4 w-4" />
                    <span>Profile</span>
                  </Link>
                </DropdownMenuItem>
                <DropdownMenuItem>
                  <Settings className="mr-2 h-4 w-4" />
                  <span>Settings</span>
                </DropdownMenuItem>
                <DropdownMenuSeparator />
                <DropdownMenuItem className="text-red-600 focus:text-red-500 cursor-pointer" onClick={logout}>
                  <LogOut className="mr-2 h-4 w-4" />
                  <span>Log out</span>
                </DropdownMenuItem>
              </DropdownMenuContent>
            </DropdownMenu>
          ) : (
            <div className="flex items-center gap-2">
              <Link to="/login">
                <Button
                  variant="ghost"
                  size="sm"
                  className="text-muted-foreground hover:text-foreground hover:bg-primary/10 transition-all duration-300"
                >
                  Log in
                </Button>
              </Link>
              <Link to="/signup">
                <Button
                  size="sm"
                  className="bg-gradient-to-r from-primary to-purple-600 hover:from-primary/90 hover:to-purple-600/90 text-white shadow-lg shadow-primary/20 transition-all duration-300 hover:scale-105 hover:shadow-primary/40"
                >
                  Sign up free
                </Button>
              </Link>
            </div>
          )}
        </div>

        {/* Mobile Menu Button */}
        <div className="flex items-center gap-2 md:hidden">
          <ModeToggle />
          <button
            className="rounded-lg p-2 text-muted-foreground transition-all duration-300 hover:bg-primary/10 hover:text-primary"
            onClick={() => setIsOpen(!isOpen)}
          >
            {isOpen ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
          </button>
        </div>
      </div>
    </div>

    {/* Mobile Navigation */}
    {isOpen && <div className="border-t border-border bg-background/95 backdrop-blur-xl md:hidden animate-in slide-in-from-top-5">
      <div className="space-y-4 px-4 py-6">
        <Link
          to="/dashboard"
          className="flex items-center gap-2 text-sm font-medium text-muted-foreground hover:text-primary"
          onClick={() => setIsOpen(false)}
        >
          <Zap className="h-4 w-4" />
          Dashboard
        </Link>

        {navGroups.map((group) => (
          <div key={group.label} className="space-y-2">
            <h4 className="text-xs font-semibold text-muted-foreground uppercase tracking-wider pl-1">
              {group.label}
            </h4>
            <div className="grid grid-cols-1 gap-2 pl-2 border-l-2 border-border/50 ml-1">
              {group.items.map((item) => (
                <Link
                  key={item.href}
                  to={item.href}
                  className={cn(
                    "flex items-center gap-2 rounded-lg px-3 py-2 text-sm transition-colors",
                    isActive(item.href) ? "bg-primary/10 text-primary" : "text-muted-foreground hover:text-primary hover:bg-primary/5"
                  )}
                  onClick={() => setIsOpen(false)}
                >
                  <item.icon className="h-4 w-4" />
                  {item.label}
                </Link>
              ))}
            </div>
          </div>
        ))}

        <Link
          to="/leaderboard"
          className="flex items-center gap-2 text-sm font-medium text-muted-foreground hover:text-primary"
          onClick={() => setIsOpen(false)}
        >
          <Trophy className="h-4 w-4" />
          Leaderboard
        </Link>

        <div className="flex flex-col gap-2 pt-4 border-t border-border">
          {user ? (
            <Button variant="destructive" className="w-full justify-center" onClick={() => { logout(); setIsOpen(false); }}>
              Log out
            </Button>
          ) : (
            <>
              <Link to="/login">
                <Button variant="outline" className="w-full justify-center">
                  Log in
                </Button>
              </Link>
              <Link to="/signup">
                <Button className="w-full justify-center bg-gradient-to-r from-primary to-purple-600">
                  Sign up free
                </Button>
              </Link>
            </>
          )}
        </div>
      </div>
    </div>}
  </nav>;
}
