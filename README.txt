Distro to FTE Tool - easy deploy (Windows)

FREE setup: Vercel free plan + Google Gemini free API key
  1. Get a key at https://aistudio.google.com (sign in with Google > Get API key). No card needed.
  2. Unzip this folder and double-click deploy.bat (needs Node.js and a free Vercel account).
  3. Paste the Gemini key when asked, choose an access code, share the Production URL.
Note: on Google's free tier, inputs may be used to improve Google products, and rate limits apply.

Paid alternative: press Enter at the Gemini prompt and paste an Anthropic API key instead.

No Node? Upload these files to GitHub, import the repo on vercel.com, and add the Environment Variables
GEMINI_API_KEY (or ANTHROPIC_API_KEY) and optionally APP_PASSWORD before deploying.

Without a key the page still works through Manual entry.
