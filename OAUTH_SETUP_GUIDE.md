# 🔐 OAuth Configuration Guide

To enable "Login with Google" and "Login with GitHub" in production, you need to create OAuth Applications in their respective developer consoles.

---

## 🌐 Generic Setup Info
For both providers, you will need your **Deployed Backend URL**.
-   **Example Backend URL**: `https://codeverse-backend.up.railway.app` (This is hypothetical; us yours).

### Important Redirect URIs
You must whitelist these exact URLs in the provider settings:
1.  **Google**: `https://[YOUR_BACKEND_DOMAIN]/login/oauth2/code/google`
2.  **GitHub**: `https://[YOUR_BACKEND_DOMAIN]/login/oauth2/code/github`

> **Note**: For local development, you also add: `http://localhost:8081/login/oauth2/code/google`

---

## 1️⃣ Google OAuth Setup

1.  Go to the **[Google Cloud Console](https://console.cloud.google.com/)**.
2.  **Create a New Project** (e.g., "CodeVerse").
3.  **OAuth Consent Screen**:
    -   Go to **APIs & Services** -> **OAuth consent screen**.
    -   Select **External** -> Create.
    -   Fill in App Name ("CodeVerse"), User Support Email (your email), and Developer Contact Info.
    -   Click **Save and Continue** (You can skip scopes/test users for now).
4.  **Create Credentials**:
    -   Go to **Credentials** -> **+ Create Credentials** -> **OAuth client ID**.
    -   **Application Type**: Web application.
    -   **Name**: "CodeVerse Web".
    -   **Authorized JavaScript origins**:
        -   `https://[YOUR_FRONTEND_DOMAIN]` (e.g., `https://codeverse-frontend.up.railway.app`)
    -   **Authorized redirect URIs** (CRITICAL):
        -   `https://[YOUR_BACKEND_DOMAIN]/login/oauth2/code/google`
    -   Click **Create**.
5.  **Copy Secrets**:
    -   Copy **Client ID** and **Client Secret**.
    -   Add them to Railway Variables as `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET`.

---

## 2️⃣ GitHub OAuth Setup

1.  Go to **[GitHub Developer Settings](https://github.com/settings/developers)**.
2.  Click **New OAuth App**.
3.  **Fill Config**:
    -   **Application Name**: CodeVerse
    -   **Homepage URL**: `https://[YOUR_FRONTEND_DOMAIN]`
    -   **Authorization callback URL** (CRITICAL):
        -   `https://[YOUR_BACKEND_DOMAIN]/login/oauth2/code/github`
4.  Click **Register application**.
5.  **Copy Secrets**:
    -   Copy **Client ID**.
    -   Click **Generate a new client secret** and copy it.
    -   Add them to Railway Variables as `GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET`.

---

## 3️⃣ Update Railway Variables
Once you have the keys, go to your **Backend Service** in Railway -> **Variables** and add:

| Key | Value |
| :--- | :--- |
| `GOOGLE_CLIENT_ID` | `[Paste Google Client ID]` |
| `GOOGLE_CLIENT_SECRET` | `[Paste Google Client Secret]` |
| `GITHUB_CLIENT_ID` | `[Paste GitHub Client ID]` |
| `GITHUB_CLIENT_SECRET` | `[Paste GitHub Client Secret]` |
