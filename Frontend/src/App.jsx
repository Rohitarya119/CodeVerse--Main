import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { ThemeProvider } from './components/theme-provider';
import { Toaster } from './components/ui/sonner';
import { MouseFollower } from './components/ui/mouse-follower';

import { TopLoader } from './components/ui/top-loader';

import Home from './pages/Home';
import Login from './pages/Login';
import Signup from './pages/Signup';
import Dashboard from './pages/Dashboard';
import DSA from './pages/DSA';
import Companies from './pages/Companies';
import Battle from './pages/Battle';
import Leaderboard from './pages/Leaderboard';
import Aptitude from './pages/Aptitude';
import Handbook from './pages/Handbook';
import Projects from './pages/Projects';
import Contest from './pages/Contest';
import SystemDesign from './pages/SystemDesign';
import ProblemDetail from './pages/ProblemDetail';
import Profile from './pages/Profile';
import OAuthCallback from './pages/OAuthCallback';

import { MainLayout } from './components/layout/main-layout';

import { AuthProvider } from './context/AuthContext';

function App() {
  return (
    <ThemeProvider attribute="class" defaultTheme="dark" enableSystem disableTransitionOnChange>
      <AuthProvider>
        <Router>
          <TopLoader />
          <MouseFollower />
          <MainLayout>
            <Routes>
              <Route path="/" element={<Home />} />
              <Route path="/login" element={<Login />} />
              <Route path="/signup" element={<Signup />} />
              <Route path="/dashboard" element={<Dashboard />} />
              <Route path="/dsa" element={<DSA />} />
              <Route path="/dsa/:id" element={<ProblemDetail />} />
              <Route path="/companies" element={<Companies />} />
              <Route path="/battle" element={<Battle />} />
              <Route path="/leaderboard" element={<Leaderboard />} />
              <Route path="/aptitude" element={<Aptitude />} />
              <Route path="/handbook" element={<Handbook />} />
              <Route path="/projects" element={<Projects />} />
              <Route path="/contest" element={<Contest />} />
              <Route path="/system-design" element={<SystemDesign />} />
              <Route path="/profile" element={<Profile />} />
              <Route path="/oauth-callback" element={<OAuthCallback />} />
            </Routes>
          </MainLayout>
          <Toaster />
        </Router>
      </AuthProvider>
    </ThemeProvider>
  );
}

export default App;
