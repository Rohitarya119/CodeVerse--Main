# 🚀 Deployment Guide (Render + Supabase)

This guide explains how to deploy **CodeVerse** to **Render.com** (Free Plan) and connect it to your **Supabase** database.

## 📋 Prerequisites
-   **GitHub Account** (The project must be pushed to a repository).
-   **Render Account** ([render.com](https://render.com)).
-   **Supabase Account** (For the free database).

---

## ⚡ Deployment Method: "Blueprints" (Recommended)
Render supports `render.yaml` (Blueprints) which automates the setup, similar to Railway.

1.  **Push Code**: Ensure `render.yaml` is in your GitHub repository.
2.  **Go to Render Dashboard**:
    -   Click **New +** -> **Blueprint**.
    -   Connect your `CodeVerse--Main` repository.
3.  **Configure Credentials**:
    -   Render will detect the services (`codeverse-backend`, `codeverse-frontend`, etc.).
    -   It will ask you for **Input Environment Variables**. You MUST fill these:
        -   `SPRING_DATASOURCE_URL`: Your Supabase JDBC URL.
        -   `SPRING_DATASOURCE_USERNAME`: `postgres`
        -   `SPRING_DATASOURCE_PASSWORD`: `[YOUR_PASSWORD]`
        -   `GOOGLE_CLIENT_ID` / `SECRET`: (Optional initially, add later)
        -   `GITHUB_CLIENT_ID` / `SECRET`: (Optional initially, add later)
4.  **Click Apply**:
    -   Render will deploy:
        -   **Backend** as a Web Service (Free Tier, sleeps after inactivity).
        -   **Executor** as a Web Service (Free Tier).
        -   **Frontend** as a Static Site (Free, Unlimited).

---

## 🛠️ Manual Deployment (Fallback)

### 1️⃣ Backend (Web Service)
1.  **New** -> **Web Service**.
2.  **Repo**: `CodeVerse--Main`.
3.  **Root Directory**: `Backend/codeverse-backend`.
4.  **Runtime**: Docker.
5.  **Plan**: Free.
6.  **Environment Variables**:
    -   `PORT`: `8081`
    -   `SPRING_DATASOURCE_URL`: (Supabase JDBC URL)
    -   `SPRING_DATASOURCE_PASSWORD`: (Supabase Password)
    -   `SPRING_DATASOURCE_USERNAME`: `postgres`
    -   `JWT_SECRET`: (Generate a random string)

### 2️⃣ Frontend (Static Site)
1.  **New** -> **Static Site**.
2.  **Repo**: `CodeVerse--Main`.
3.  **Root Directory**: `Frontend`.
4.  **Build Command**: `npm install && npm run build`
5.  **Publish Directory**: `dist`
6.  **Environment Variables**:
    -   `VITE_API_BASE_URL`: (Your Backend URL, e.g., `https://codeverse-backend.onrender.com`)

### 3️⃣ Final Configuration
1.  Get your **Frontend URL** (e.g., `https://codeverse-frontend.onrender.com`).
2.  Go to **Backend** -> **Environment**.
3.  Add/Update:
    -   `FRONTEND_URL`: `https://codeverse-frontend.onrender.com`
    -   `CORS_ALLOWED_ORIGINS`: `https://codeverse-frontend.onrender.com`
    -   `GOOGLE_CLIENT_ID`, etc. (See `OAUTH_SETUP_GUIDE.md`).

---

## ⚠️ Free Tier Limitations
-   **Spin Down**: Your Backend will "sleep" after 15 mins of inactivity. The first request after sleep will take ~30-50 seconds.
-   **Database**: Supabase is always on (Free). Frontend is always on (Free). Only the API sleeps.
