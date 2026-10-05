@echo off
setlocal
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is not installed. Install the LTS version from https://nodejs.org then run this file again.
  pause
  exit /b 1
)
echo.
echo Step 1/4: log in to Vercel and link this folder (a browser window may open)
call npx vercel@latest link --yes
if errorlevel 1 goto fail
echo.
set /p GKEY=Step 2/4: paste your FREE GEMINI_API_KEY from aistudio.google.com (or press Enter to use an Anthropic key instead): 
if not "%GKEY%"=="" (
  echo %GKEY%| call npx vercel@latest env add GEMINI_API_KEY production
) else (
  set /p KEY=Paste your ANTHROPIC_API_KEY: 
  echo %KEY%| call npx vercel@latest env add ANTHROPIC_API_KEY production
)
set /p CODE=Step 3/4: choose an access code for co-workers (Enter to skip): 
if not "%CODE%"=="" echo %CODE%| call npx vercel@latest env add APP_PASSWORD production
echo.
echo Step 4/4: deploying...
call npx vercel@latest deploy --prod --yes
if errorlevel 1 goto fail
echo.
echo Done. Share the Production URL shown above with your co-workers.
pause
exit /b 0
:fail
echo Something went wrong. Read the message above.
pause
exit /b 1
