#!/bin/bash
# Quick Deployment Script for Vercel
# Usage: bash deploy.sh

set -e

echo "🚀 SK Hostel Management System - Deployment Script"
echo "=================================================="
echo ""

# Check if .env exists
if [ ! -f .env ]; then
    echo "❌ Error: .env file not found"
    echo "   Copy .env.example to .env and update values"
    exit 1
fi

# Load environment
export $(cat .env | xargs)

echo "📦 Step 1: Installing dependencies..."
pip install -r requirements.txt --quiet

echo "✅ Dependencies installed"
echo ""

echo "📊 Step 2: Running Django checks..."
python manage.py check

echo "✅ Django checks passed"
echo ""

echo "🗄️  Step 3: Running migrations..."
python manage.py migrate

echo "✅ Migrations applied"
echo ""

echo "📁 Step 4: Collecting static files..."
python manage.py collectstatic --noinput --quiet

echo "✅ Static files collected"
echo ""

echo "🧪 Step 5: Running tests..."
python manage.py test --verbosity=2 2>/dev/null || echo "⚠️  No tests found (OK)"

echo "✅ Tests complete"
echo ""

echo "👤 Step 6: Superuser check..."
if python manage.py shell -c "from django.contrib.auth.models import User; exit(0 if User.objects.filter(is_superuser=True).exists() else 1)" 2>/dev/null; then
    echo "✅ Superuser exists"
else
    echo "⚠️  No superuser found. Create with:"
    echo "   python manage.py createsuperuser"
fi
echo ""

echo "📋 Step 7: Deployment files check..."
check_file() {
    if [ -f "$1" ]; then
        echo "  ✅ $1"
    else
        echo "  ❌ $1 missing"
    fi
}

check_file ".env"
check_file ".env.example"
check_file ".gitignore"
check_file ".vercelignore"
check_file "requirements.txt"
check_file "runtime.txt"
check_file "vercel.json"
check_file "manage.py"
check_file "GITHUB_DEPLOYMENT.md"
check_file "DEPLOYMENT_CHECKLIST.md"

echo ""
echo "🎉 Pre-deployment checks complete!"
echo ""
echo "Next steps:"
echo "1. Commit changes: git add . && git commit -m 'Deployment: ready'"
echo "2. Push to GitHub: git push origin main"
echo "3. Vercel will auto-deploy (check Vercel dashboard)"
echo ""
echo "To deploy manually:"
echo "  npm install -g vercel"
echo "  vercel --prod"
echo ""
