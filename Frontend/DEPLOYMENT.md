# How to Deploy CodeVerse to Vercel

The easiest way to make your React/Vite application live is using [Vercel](https://vercel.com). It connects directly to your GitHub repository and automatically deploys whenever you push changes.

## Step 1: Sign Up / Login to Vercel
1. Go to [vercel.com](https://vercel.com).
2. Sign up or log in using your **GitHub** account.

## Step 2: Import Your Project
1. On your Vercel dashboard, click **"Add New..."** button (usually top right) and select **"Project"**.
2. You will see a list of your GitHub repositories.
3. Find `CodeVerse-Frontend-Final` and click the **"Import"** button next to it.

## Step 3: Configure Project
Vercel is smart and will detect that this is a **Vite** project.
1. **Framework Preset**: It should automatically select `Vite`.
2. **Root Directory**: Leave it as `./` (default).
3. **Build Command**: `npm run build` (default).
4. **Output Directory**: `dist` (default).
5. **Environment Variables**: If you have any API keys (like backend URLs), add them here. 
   - *Note: Since this is currently a frontend-only demo or talking to a local backend, you might need to deploy your backend separately or mock APIs.*

## Step 4: Deploy
1. Click **"Deploy"**.
2. Wait for about a minute. Vercel will build your project.
3. Once done, you will get a live URL (e.g., `codeverse-frontend.vercel.app`).

## Future Updates
- Whenever you make changes and run `git push`, Vercel will automatically detect the change and update your live website!

---

# Alternative: Deploy to Netlify

1. Go to [netlify.com](https://netlify.com) and log in with GitHub.
2. Click **"Add new site"** > **"Import an existing project"**.
3. Select **GitHub**.
4. Allow Netlify to access your repositories and pick `CodeVerse-Frontend-Final`.
5. **Build Command**: `npm run build`
6. **Publish directory**: `dist`
7. Click **"Deploy site"**.
