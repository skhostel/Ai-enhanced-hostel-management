@echo off
REM Quick Deployment Script for Vercel (Windows)
REM Usage: deploy.bat

setlocal enabledelayedexpansion

echo.
echo 🚀 SK Hostel Management System - Deployment Script
echo ==================================================
echo.

REM Check if .env exists
if not exist .env (
    echo ❌ Error: .env file not found
    echo    Copy .env.example to .env and update values
    exit /b 1
)

echo 📦 Step 1: Installing dependencies...
pip install -r requirements.txt -q
if errorlevel 1 (
    echo ❌ Failed to install dependencies
    exit /b 1
)
echo ✅ Dependencies installed
echo.

echo 📊 Step 2: Running Django checks...
python manage.py check
if errorlevel 1 (
    echo ❌ Django checks failed
    exit /b 1
)
echo ✅ Django checks passed
echo.

echo 🗄️  Step 3: Running migrations...
python manage.py migrate
if errorlevel 1 (
    echo ❌ Migrations failed
    exit /b 1
)
echo ✅ Migrations applied
echo.

echo 📁 Step 4: Collecting static files...
python manage.py collectstatic --noinput -q
if errorlevel 1 (
    echo ❌ Static files collection failed
    exit /b 1
)
echo ✅ Static files collected
echo.

echo 📋 Step 5: Deployment files check...
echo.

if exist ".env" (
    echo   ✅ .env
) else (
    echo   ❌ .env missing
)

if exist ".env.example" (
    echo   ✅ .env.example
) else (
    echo   ❌ .env.example missing
)

if exist ".gitignore" (
    echo   ✅ .gitignore
) else (
    echo   ❌ .gitignore missing
)

if exist ".vercelignore" (
    echo   ✅ .vercelignore
) else (
    echo   ❌ .vercelignore missing
)

if exist "requirements.txt" (
    echo   ✅ requirements.txt
) else (
    echo   ❌ requirements.txt missing
)

if exist "runtime.txt" (
    echo   ✅ runtime.txt
) else (
    echo   ❌ runtime.txt missing
)

if exist "vercel.json" (
    echo   ✅ vercel.json
) else (
    echo   ❌ vercel.json missing
)

if exist "manage.py" (
    echo   ✅ manage.py
) else (
    echo   ❌ manage.py missing
)

if exist "GITHUB_DEPLOYMENT.md" (
    echo   ✅ GITHUB_DEPLOYMENT.md
) else (
    echo   ❌ GITHUB_DEPLOYMENT.md missing
)

if exist "DEPLOYMENT_CHECKLIST.md" (
    echo   ✅ DEPLOYMENT_CHECKLIST.md
) else (
    echo   ❌ DEPLOYMENT_CHECKLIST.md missing
)

echo.
echo 🎉 Pre-deployment checks complete!
echo.
echo Next steps:
echo 1. Commit changes:  git add . && git commit -m "Deployment: ready"
echo 2. Push to GitHub:  git push origin main
echo 3. Vercel will auto-deploy (check Vercel dashboard^)
echo.
echo To deploy manually:
echo   npm install -g vercel
echo   vercel --prod
echo.
pause
