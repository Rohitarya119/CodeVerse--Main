# 📋 Copy-Paste Values for Render Blueprint

Copy these values into the Render "New Blueprint" form.

## 🗄️ Database (Supabase)
*Note: You must get these from your Supabase Dashboard -> Settings -> Database -> JDBC Connection String*

| Key | Value to Enter (Example) |
| :--- | :--- |
| `SPRING_DATASOURCE_URL` | `jdbc:postgresql://[YOUR-HOST]:5432/postgres` <br> *(e.g. jdbc:postgresql://aws-0-us-east-1.pooler.supabase.com:5432/postgres)* |
| `SPRING_DATASOURCE_USERNAME` | `postgres` (or whatever username Supabase gives) |
| `SPRING_DATASOURCE_PASSWORD` | `[YOUR_SUPABASE_PASSWORD]` |

---

## 🔐 OAuth Keys (Google & GitHub)
*Note: These are the keys I found earlier in your project. If you haven't refreshed them, these are the old local ones.*

| Key | Value to Enter |
| :--- | :--- |
| `GOOGLE_CLIENT_ID` | `626246085996-7t5g2p22ipa2v6bug3qgjr7p7nrqlh6l.apps.googleusercontent.com` |
| `GOOGLE_CLIENT_SECRET` | `PLACEHOLDER_SECRET_FOR_SECURITY` |
| `GITHUB_CLIENT_ID` | `Ov23liF7knVm9rq1gyIO` |
| `GITHUB_CLIENT_SECRET` | `91be107202af8c93be4087cd35b095d13912551c` |

---

## 🌐 URLs (Placeholders for First Deploy)
*Since the app isn't live yet, you don't have the real domains. Use these placeholders to pass the check.*

| Key | Value to Enter |
| :--- | :--- |
| `FRONTEND_URL` | `https://temp-frontend.onrender.com` |
| `CORS_ALLOWED_ORIGINS` | `https://temp-frontend.onrender.com` |
| `VITE_API_BASE_URL` | `https://temp-backend.onrender.com` |
