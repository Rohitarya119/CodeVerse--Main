
import { useEffect } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";
import { useAuth } from "@/context/AuthContext";

export default function OAuthCallback() {
    const [searchParams] = useSearchParams();
    const navigate = useNavigate();
    const { loadUser, setToken } = useAuth(); // Assuming useAuth exposes setToken or I need to manually update local storage and then reload?

    // Actually, standard AuthContext should expose a way to set token directly.
    // But our simple Implementation Plan above didn't expose setToken explicitly in return, 
    // though it did set it inside login. 
    // Let's assume I need to modify AuthContext to allow setting token directly OR I just write to localStorage and force a reload/re-check.
    // Or better, let's update AuthContext first to export `setToken` or a `handleOAuthLogin`.

    // Let's try writing to localStorage and calling a loadUser exposed from context.

    useEffect(() => {
        const token = searchParams.get("token");
        if (token) {
            localStorage.setItem("token", token);
            window.location.href = "/dashboard"; // Hard reload to ensure context picks it up or I can update context if I modify it.
        } else {
            navigate("/login?error=No token found");
        }
    }, [searchParams, navigate]);

    return (
        <div className="flex min-h-screen items-center justify-center">
            <div className="text-center">
                <h2 className="text-xl font-semibold mb-2">Authenticating...</h2>
                <p className="text-muted-foreground">Please wait while we log you in.</p>
            </div>
        </div>
    );
}
