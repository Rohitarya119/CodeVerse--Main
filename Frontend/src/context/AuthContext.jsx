
import React, { createContext, useContext, useState, useEffect } from "react";
import { API_BASE_URL } from "@/config";
import { useNavigate } from "react-router-dom";

const AuthContext = createContext(null);

export const AuthProvider = ({ children }) => {
    const [user, setUser] = useState(null);
    const [token, setToken] = useState(localStorage.getItem("token"));
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState(null);

    // Helper to load user profile
    const loadUser = async (currentToken) => {
        if (!currentToken) return;
        try {
            const response = await fetch(`${API_BASE_URL}/api/auth/me`, {
                headers: {
                    Authorization: `Bearer ${currentToken}`,
                },
            });
            if (response.ok) {
                const userData = await response.json();
                setUser(userData);
            } else {
                // Token invalid
                logout();
            }
        } catch (err) {
            console.error("Failed to load user", err);
            logout();
        }
    };

    useEffect(() => {
        if (token) {
            loadUser(token);
        }
    }, [token]);

    const login = async (email, password) => {
        setIsLoading(true);
        setError(null);
        try {
            // Backend expects username, but let's try sending email as username or handle both.
            // Looking at AuthController, it takes LoginRequest which has username and password.
            // Usually systems allow email as username. If not, I'll assume username = email for now.
            const response = await fetch(`${API_BASE_URL}/api/auth/login`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ username: email, password }),
            });

            const data = await response.json();

            if (response.ok) {
                setToken(data.accessToken);
                localStorage.setItem("token", data.accessToken);
                setUser(data.user); // data.user is UserDto
                return true;
            } else {
                setError(data.message || "Login failed");
                return false;
            }
        } catch (err) {
            setError("Network error");
            return false;
        } finally {
            setIsLoading(false);
        }
    };

    const signup = async (userData) => {
        setIsLoading(true);
        setError(null);
        try {
            const response = await fetch(`${API_BASE_URL}/api/auth/register`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(userData),
            });

            const data = await response.json();

            if (response.ok) {
                // Auto login or return success
                return true;
            } else {
                setError(data.message || "Signup failed");
                return false;
            }
        } catch (err) {
            setError("Network error");
            return false;
        } finally {
            setIsLoading(false);
        }
    };

    const logout = () => {
        setToken(null);
        setUser(null);
        localStorage.removeItem("token");
    };

    return (
        <AuthContext.Provider value={{ user, token, login, signup, logout, isLoading, error }}>
            {children}
        </AuthContext.Provider>
    );
};

export const useAuth = () => useContext(AuthContext);
