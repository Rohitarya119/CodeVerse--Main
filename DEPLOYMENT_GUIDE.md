# 🚀 Deployment Guide

This guide explains how to deploy the **CodeVerse** project (Frontend + Backend + Executor) to **Railway**.

## 📋 Prerequisites
-   **GitHub Account** (The project should be pushed to a repository).
-   **Railway Account** ([railway.app](https://railway.app)).
-   **Supabase Account** (For the database).

---

## ⚡ Option 1: Automated "One-Click" Deployment (Recommended)
This approach uses the `railway.json` file included in your project to set up all services automatically.

1.  **Push Code**: Ensure your latest code (including `railway.json`) is pushed to GitHub.
2.  **Start Deployment**:
    -   Go to [Railway Dashboard](https://railway.app/new).
    -   Select **"Deploy from GitHub repo"**.
    -   Choose your `CodeVerse` repository.
3.  **Configure Services**:
    -   Railway will read `railway.json` and prepare the services: `backend`, `frontend`, `executor`, and `codeverse-db`.
4.  **Use Supabase (Crucial Step)**:
    -   The template attempts to create a *new* Railway Database (`codeverse-db`). **Remove/Deselect** this service if you want to use Supabase.
    -   Locate the **Backend** service configuration.
    -   Replace the `${{codeverse-db...}}` variables with your **Supabase credentials**:
        -   `SPRING_DATASOURCE_URL`: `jdbc:postgresql://...` (From Supabase -> Settings -> Database -> JDBC)
        -   `SPRING_DATASOURCE_USERNAME`: `postgres`
        -   `SPRING_DATASOURCE_PASSWORD`: `[YOUR_PASSWORD]`
5.  **Deploy**: Click **Deploy**. Railway will handle the linking (Frontend domain -> Backend, Backend -> Frontend) automatically once the services generate their public domains.

---

## 🛠️ Option 2: Manual Deployment (Step-by-Step)
If you prefer full control or the automated method fails, follow these steps.

### 1️⃣ Backend Deployment (Spring Boot)
1.  **Create Service**: On Railway, click **+ New** -> **GitHub Repo** -> Select Repo.
2.  **Settings**: Set **Root Directory** to `/Backend/codeverse-backend`.
3.  **Variables**: Add the following:
    | Variable | Value |
    | :--- | :--- |
    | `PORT` | `8081` |
    | `SPRING_DATASOURCE_URL` | Your Supabase JDBC URL |
    | `SPRING_DATASOURCE_USERNAME` | `postgres` |
    | `SPRING_DATASOURCE_PASSWORD` | Your Supabase Password |
    | `FRONTEND_URL` | *Add after deploying Frontend* |
    | `CORS_ALLOWED_ORIGINS` | *Add after deploying Frontend* |
    | `CODEVERSE_EXECUTOR_URL` | *Add after deploying Executor* |
4.  **Domain**: Go to **Networking** -> **Generate Domain**.

### 2️⃣ Frontend Deployment (React + Vite)
1.  **Create Service**: **+ New** -> **GitHub Repo** -> Select Repo.
2.  **Settings**: Set **Root Directory** to `/Frontend`.
3.  **Variables**:
    | Variable | Value |
    | :--- | :--- |
    | `VITE_API_BASE_URL` | `https://[YOUR_BACKEND_DOMAIN]` (No trailing slash) |
4.  **Domain**: Go to **Networking** -> **Generate Domain**.

### 3️⃣ Executor Deployment (Optional)
1.  **Create Service**: **+ New** -> **GitHub Repo** -> Select Repo.
2.  **Settings**: Set **Root Directory** to `/server`.
3.  **Variables**: Add `JUDGE0_API_KEY` (if required).
4.  **Domain**: Go to **Networking** -> **Generate Domain**.

### 4️⃣ Final Link-Up
Once all services are running and have domains:
1.  Go back to **Backend** -> **Variables**.
2.  Update:
    -   `FRONTEND_URL` = `https://[YOUR_FRONTEND_DOMAIN]`
    -   `CORS_ALLOWED_ORIGINS` = `https://[YOUR_FRONTEND_DOMAIN]`
    -   `CODEVERSE_EXECUTOR_URL` = `https://[YOUR_EXECUTOR_DOMAIN]/execute`
3.  **Redeploy Backend**.

---

## 🐞 Troubleshooting
-   **CORS Errors?** Check that `CORS_ALLOWED_ORIGINS` in Backend matches the Frontend URL exactly (https, no trailing slash).
-   **Redirects (OAuth) Failing?** Ensure `FRONTEND_URL` in Backend matches your Frontend URL.
-   **Database Connection?** Verify Supabase "Pool Mode" vs "Direct". For Spring Boot (JDBC), standard port `5432` usually works best.
