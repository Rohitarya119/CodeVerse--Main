import { useEffect } from "react";
import { useLocation } from "react-router-dom";
import NProgress from "nprogress";
import "nprogress/nprogress.css";

// Configure NProgress
NProgress.configure({
    showSpinner: false,
    minimum: 0.1,
    easing: 'ease',
    speed: 500,
});

export function TopLoader() {
    const location = useLocation();

    useEffect(() => {
        // Start progress bar when location changes
        NProgress.start();

        // Finish progress bar after a small delay to simulate loading/ensure visibility
        const timer = setTimeout(() => {
            NProgress.done();
        }, 500);

        return () => {
            clearTimeout(timer);
            NProgress.done();
        };
    }, [location]);

    return null;
}
