# Quick Setup & Deployment Guide

## 🚀 5-Minute Quick Start

### 1. **Local Setup**

```bash
# Create virtual environment
python -m venv venv

# Activate it
venv\Scripts\activate          # Windows
source venv/bin/activate       # Mac/Linux

# Install dependencies
pip install -r requirements.txt

# Copy environment template
cp .env.example .env

# Update .env with your values (if needed)
# For local development, defaults should work with SQLite
```

### 2. **Run Locally**

```bash
# Run migrations
python manage.py migrate

# Create admin user (optional for local)
python manage.py createsuperuser

# Start server
python manage.py runserver

# Visit http://localhost:8000
```

### 3. **Push to GitHub**

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/hostel-management-system.git
git branch -M main
git push -u origin main
```

### 4. **Deploy to Vercel**

```bash
# Option A: Via Vercel Web Dashboard (Easiest)
1. Go to https://vercel.com
2. Click "Add New" → "Project"
3. Import your GitHub repository
4. Add environment variables:
   - SECRET_KEY: (generate random value)
   - DEBUG: False
   - ALLOWED_HOSTS: your-project.vercel.app
   - DATABASE_URL: (PostgreSQL connection string)
5. Click "Deploy"

# Option B: Via Vercel CLI
npm install -g vercel
vercel --prod
```

---

## 📁 Project Structure

```
hostel-management-system/
├── .github/
│   └── workflows/
│       └── tests.yml              # CI/CD Pipeline
├── .gitignore                     # Exclude sensitive files
├── .env.example                   # Environment template
├── .vercelignore                  # Vercel-specific ignores
├── requirements.txt               # Python dependencies
├── runtime.txt                    # Python version (3.11)
├── vercel.json                    # Vercel configuration
├── manage.py                      # Django command runner
├── README.md                      # Project documentation
├── GITHUB_DEPLOYMENT.md           # GitHub setup guide
├── DEPLOYMENT_CHECKLIST.md        # Pre-deployment checklist
├── deploy.sh                      # Deployment script (Unix)
├── deploy.bat                     # Deployment script (Windows)
├── hostel_pg_system/              # Main Django project
│   ├── settings.py                # Production-ready settings
│   ├── wsgi.py                    # WSGI application
│   ├── asgi.py                    # ASGI application
│   └── urls.py                    # URL configuration
├── management/                    # Main Django app
│   ├── models.py                  # Database models
│   ├── views.py                   # View functions
│   ├── forms.py                   # Form definitions
│   ├── urls.py                    # App URL patterns
│   ├── admin.py                   # Django admin config
│   ├── migrations/                # Database migrations
│   ├── static/                    # CSS, JS, images
│   └── templates/                 # HTML templates
└── staticfiles/                   # Compiled static files
```

---

## 🔑 Environment Variables

Create `.env` file from `.env.example`:

```env
# Django Settings
SECRET_KEY=your-unique-secret-key-here
DEBUG=False                                    # Set to True only for local dev
ALLOWED_HOSTS=your-domain.vercel.app

# Database (Choose One)
# Option 1: PostgreSQL (Production)
DATABASE_URL=postgresql://user:password@host:5432/dbname

# Option 2: SQLite (Local Development Only)
USE_SQLITE=true

# Site Configuration
SITE_URL=https://your-domain.vercel.app
```

### Generate SECRET_KEY

```python
from django.core.management.utils import get_random_secret_key
print(get_random_secret_key())
```

---

## 🗄️ Database Setup

### Option 1: PostgreSQL (Recommended for Production)

**Choose a Provider:**
- **[Supabase](https://supabase.com)** - Free tier, 50K rows
- **[Railway](https://railway.app)** - Pay-as-you-go, simple
- **[Neon](https://neon.tech)** - Serverless PostgreSQL
- **[Vercel Postgres](https://vercel.com/storage/postgres)** - Integrated with Vercel

**Setup Steps:**
1. Create account with provider
2. Create new PostgreSQL database
3. Copy connection string (DATABASE_URL)
4. Add to `.env` and Vercel environment variables
5. Run migrations: `python manage.py migrate`

### Option 2: SQLite (Local Development)

```bash
# Already configured for local dev
USE_SQLITE=true
```

**Note:** SQLite doesn't persist on Vercel. Use PostgreSQL for production.

---

## ✅ Pre-Deployment Checklist

### Code Quality
- [ ] `python manage.py check` passes
- [ ] No import errors
- [ ] All migrations applied locally
- [ ] Static files collected locally

### Configuration
- [ ] `DEBUG = False` in production settings
- [ ] `SECRET_KEY` is random and strong
- [ ] `ALLOWED_HOSTS` includes all domains
- [ ] `DATABASE_URL` is set correctly

### Files Present
- [ ] `.gitignore` includes `.env`
- [ ] `.env.example` has all required keys
- [ ] `requirements.txt` updated
- [ ] `vercel.json` configured
- [ ] GitHub workflows enabled

---

## 🎯 Deployment Steps

### Step 1: Prepare Repository

```bash
# Update files
python manage.py collectstatic --noinput
pip freeze > requirements.txt  # Update dependencies

# Commit and push
git add .
git commit -m "Deployment: final preparation"
git push origin main
```

### Step 2: Configure Vercel

**Via Web Dashboard:**
1. Go to https://vercel.com/new
2. Import repository
3. Select framework: "Other"
4. Configure build settings:
   - Build command: `pip install -r requirements.txt && python manage.py migrate && python manage.py collectstatic --noinput`
   - Output: `staticfiles`
5. Add environment variables:
   ```
   SECRET_KEY=your-secret-key
   DEBUG=False
   ALLOWED_HOSTS=your-project.vercel.app
   DATABASE_URL=your-postgres-connection
   ```
6. Deploy

### Step 3: Post-Deployment

```bash
# Verify deployment
1. Visit: https://your-project.vercel.app
2. Check admin: https://your-project.vercel.app/admin/
3. Test login functionality

# View logs
vercel logs your-project
```

---

## 🔄 Continuous Deployment

### Auto-Deploy on GitHub Push

GitHub Actions are configured to:
1. Run tests on every push
2. Deploy to Vercel on merge to `main` (if all tests pass)

**Required Vercel Secrets (in GitHub):**
- `VERCEL_TOKEN` - Get from Vercel account
- `VERCEL_ORG_ID` - Your Vercel organization ID
- `VERCEL_PROJECT_ID` - Your Vercel project ID

**Add to GitHub:**
1. Go to repository → Settings → Secrets
2. Click "New repository secret"
3. Add each secret

---

## 🐛 Troubleshooting

### 500 Server Error

**Check logs:**
```bash
vercel logs your-project
```

**Common causes:**
- Missing environment variables
- Database connection failed
- Import error in code
- Syntax error in Python files

### Static Files Not Loading

**Solutions:**
1. Ensure static files collected: `python manage.py collectstatic`
2. Check `vercel.json` routes
3. Verify `STATIC_URL` and `STATIC_ROOT`

### Database Connection Failed

**Check:**
1. `DATABASE_URL` format: `postgresql://user:pass@host:port/db`
2. Database is running
3. Credentials are correct
4. Firewall allows Vercel IP addresses

### Import Errors

**Solutions:**
1. Update `requirements.txt`: `pip freeze > requirements.txt`
2. Test imports locally: `python manage.py shell`
3. Ensure all packages installed

---

## 📊 Monitoring & Maintenance

### Weekly Checks
- [ ] Review Vercel analytics
- [ ] Check error logs
- [ ] Verify site is accessible
- [ ] Test key functionality

### Monthly Tasks
- [ ] Update dependencies
- [ ] Backup database
- [ ] Review security updates
- [ ] Analyze usage metrics

### Commands Reference

```bash
# Development
python manage.py runserver                    # Start dev server
python manage.py test                         # Run tests
python manage.py migrate                      # Apply migrations
python manage.py createsuperuser              # Create admin

# Production (Vercel)
vercel                                         # Deploy to staging
vercel --prod                                  # Deploy to production
vercel logs                                    # View logs
vercel rollback                                # Rollback to previous version
vercel env pull                                # Pull environment variables
```

---

## 📚 Helpful Resources

- [Django Deployment Checklist](https://docs.djangoproject.com/en/6.0/howto/deployment/checklist/)
- [Vercel Python Documentation](https://vercel.com/docs/concepts/functions/serverless-functions/python)
- [PostgreSQL Providers](./POSTGRESQL_SETUP.md)
- [GitHub Deployment Guide](./GITHUB_DEPLOYMENT.md)
- [Deployment Checklist](./DEPLOYMENT_CHECKLIST.md)

---

## 🆘 Need Help?

**Getting Started:**
- Read [GITHUB_DEPLOYMENT.md](./GITHUB_DEPLOYMENT.md)
- Check [DEPLOYMENT_CHECKLIST.md](./DEPLOYMENT_CHECKLIST.md)
- Review [README.md](./README.md)

**Stuck?**
1. Check Vercel logs: `vercel logs`
2. Run local tests: `python manage.py check`
3. Review error messages carefully
4. Check GitHub Issues for similar problems

---

**Status:** ✅ Ready to Deploy  
**Last Updated:** April 21, 2026  
**Python Version:** 3.11  
**Django Version:** 6.0.4
