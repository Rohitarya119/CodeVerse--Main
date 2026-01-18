const providedUrl = import.meta.env.VITE_API_BASE_URL;
export const API_BASE_URL = providedUrl
    ? (providedUrl.startsWith("http") ? providedUrl : `https://${providedUrl}`)
    : "http://localhost:8081";
