# GitHub & Vercel Deployment Guide

## Table of Contents
1. [GitHub Setup](#github-setup)
2. [Vercel Deployment](#vercel-deployment)
3. [Environment Variables](#environment-variables)
4. [Database Configuration](#database-configuration)
5. [Troubleshooting](#troubleshooting)

---

## GitHub Setup

### Step 1: Initialize Git Repository

```bash
cd hostel_pg_system
git init
git add .
git commit -m "Initial commit: SK Hostel Management System"
```

### Step 2: Create GitHub Repository

1. Go to [GitHub](https://github.com/new)
2. Create a new repository named `hostel-management-system`
3. Do NOT initialize with README (we have one)
4. Copy the repository URL

### Step 3: Push to GitHub

```bash
git remote add origin https://github.com/YOUR_USERNAME/hostel-management-system.git
git branch -M main
git push -u origin main
```

### Step 4: Repository Structure

Ensure your repository has:
```
hostel-management-system/
├── .gitignore              # ✅ Excludes sensitive files
├── .env.example            # ✅ Environment template
├── .vercelignore           # ✅ Vercel-specific ignores
├── requirements.txt        # ✅ Python dependencies
├── runtime.txt             # ✅ Python version specification
├── vercel.json             # ✅ Vercel configuration
├── manage.py               # Django management script
├── README.md               # Project documentation
├── GITHUB_DEPLOYMENT.md    # This file
├── hostel_pg_system/       # Main Django project
│   ├── settings.py         # ✅ Production-ready
│   ├── wsgi.py             # ✅ For Vercel
│   └── urls.py
├── management/             # Main app
│   ├── models.py
│   ├── views.py
│   ├── forms.py
│   ├── urls.py
│   ├── admin.py
│   └── templates/
└── staticfiles/            # Static files storage
```

### Step 5: Critical Files Checklist

- ✅ `.gitignore` - Prevents committing sensitive data
- ✅ `.env.example` - Shows required environment variables
- ✅ `requirements.txt` - All Python dependencies listed
- ✅ `runtime.txt` - Python 3.11 specified
- ✅ `vercel.json` - Vercel deployment config
- ✅ `manage.py` - Django management
- ✅ `hostel_pg_system/settings.py` - Production settings
- ✅ `hostel_pg_system/wsgi.py` - WSGI application

---

## Vercel Deployment

### Step 1: Connect Vercel to GitHub

1. Go to [Vercel](https://vercel.com)
2. Sign up/Login with GitHub
3. Click "Add New..." → "Project"
4. Import your GitHub repository
5. Select `hostel-management-system` repository

### Step 2: Configure Project Settings

**Framework Preset:** Django (or None/Other)

**Build Command:**
```bash
pip install -r requirements.txt && python manage.py collectstatic --noinput
```

**Output Directory:** `staticfiles`

**Install Command:**
```bash
pip install -r requirements.txt
```

### Step 3: Set Environment Variables in Vercel

In Vercel Project Settings → Environment Variables, add:

```
SECRET_KEY=your-unique-secret-key-here
DEBUG=False
ALLOWED_HOSTS=your-project.vercel.app,www.your-project.vercel.app
SITE_URL=https://your-project.vercel.app
DATABASE_URL=postgresql://user:password@host:5432/dbname
USE_SQLITE=false
```

### Step 4: Deploy

Click "Deploy" on Vercel. Your app will be live at:
```
https://your-project.vercel.app
```

---

## Environment Variables

### Required Variables

| Variable | Example | Purpose |
|----------|---------|---------|
| `SECRET_KEY` | `django-insecure-abc123...` | Django security key |
| `DEBUG` | `False` | Production flag |
| `ALLOWED_HOSTS` | `yourdomain.vercel.app` | Allowed domains |
| `SITE_URL` | `https://yourdomain.vercel.app` | Base URL |
| `DATABASE_URL` | `postgresql://user:pass@host/db` | Database connection |

### Optional Variables

```env
USE_SQLITE=true              # Use SQLite instead of PostgreSQL
LANGUAGE_CODE=en-us          # Language setting
TIME_ZONE=UTC                # Timezone
```

### Generate SECRET_KEY

```python
from django.core.management.utils import get_random_secret_key
print(get_random_secret_key())
```

---

## Database Configuration

### Option 1: PostgreSQL (Recommended for Production)

**Recommended Providers:**
- [Supabase](https://supabase.com) - Free tier available
- [Railway](https://railway.app) - Pay-as-you-go
- [Neon](https://neon.tech) - Serverless PostgreSQL
- [ElephantSQL](https://www.elephantsql.com) - Legacy (free tier closing)

**Setup:**
1. Create database with your provider
2. Get `DATABASE_URL`
3. Add to Vercel environment variables
4. Run migrations on Vercel:

```bash
vercel env pull        # Pull environment variables
python manage.py migrate
```

### Option 2: SQLite (Local Development Only)

Set `USE_SQLITE=true` in environment variables.

**Note:** SQLite doesn't persist on Vercel. Use PostgreSQL for production.

---

## Production Checklist

- [ ] Django `DEBUG = False` in production
- [ ] `SECRET_KEY` is strong and random
- [ ] `ALLOWED_HOSTS` includes all domains
- [ ] PostgreSQL database configured
- [ ] `requirements.txt` up to date
- [ ] `.gitignore` prevents `.env` commits
- [ ] `collectstatic` runs during build
- [ ] Static files served correctly
- [ ] HTTPS enabled (default with Vercel)
- [ ] Database migrations applied
- [ ] Admin account created
- [ ] Email/SMTP configured (optional)

---

## Deployment Commands Reference

### Local Testing

```bash
# Activate virtual environment
python -m venv venv
venv\Scripts\activate          # Windows
source venv/bin/activate       # Mac/Linux

# Install dependencies
pip install -r requirements.txt

# Set environment
$env:DEBUG='True'
$env:USE_SQLITE='true'

# Run migrations
python manage.py migrate

# Create superuser
python manage.py createsuperuser

# Collect static files
python manage.py collectstatic --noinput

# Run development server
python manage.py runserver
```

### Vercel Deployment

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel

# Deploy to production
vercel --prod

# View logs
vercel logs

# Pull environment variables
vercel env pull
```

---

## Continuous Deployment (CI/CD)

### GitHub Actions (Automatic Testing)

Create `.github/workflows/tests.yml`:

```yaml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    - uses: actions/setup-python@v2
      with:
        python-version: 3.11
    
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt
    
    - name: Run migrations
      run: python manage.py migrate
    
    - name: Run tests
      run: python manage.py test
    
    - name: Collect static files
      run: python manage.py collectstatic --noinput
```

---

## Troubleshooting

### 503 Bad Gateway / Application Error

**Check Vercel logs:**
```bash
vercel logs
```

**Common causes:**
- Missing environment variables
- Database connection failed
- Missing migrations
- Import errors in settings.py

### Database Connection Error

```
psycopg2.OperationalError: connection to server at "host", port 5432 failed
```

**Solutions:**
1. Verify `DATABASE_URL` format: `postgresql://user:pass@host:port/dbname`
2. Check database is running
3. Verify credentials
4. Check firewall rules (allow Vercel IPs)

### Static Files Not Loading

**Solutions:**
1. Run `collectstatic` in build command
2. Verify `STATIC_URL` and `STATIC_ROOT` in settings
3. Check `vercel.json` routes for static files

### Import Errors

**Ensure all dependencies in `requirements.txt`:**
```bash
pip freeze > requirements.txt
```

### Migrations Not Applied

**In Vercel logs, add migration command:**

Update `vercel.json` builds section:
```json
{
  "src": "manage.py",
  "use": "@vercel/python",
  "config": {
    "maxLambdaSize": "15mb",
    "runtime": "python3.11"
  }
}
```

---

## Rollback

If deployment fails:

```bash
# View deployment history
vercel list

# Rollback to previous version
vercel rollback
```

---

## Support & Resources

- [Django Deployment Checklist](https://docs.djangoproject.com/en/6.0/howto/deployment/checklist/)
- [Vercel Python Documentation](https://vercel.com/docs/concepts/functions/serverless-functions/python)
- [PostgreSQL Setup Guides](./POSTGRESQL_SETUP.md)
- [Django Documentation](https://docs.djangoproject.com/)

---

**Last Updated:** April 21, 2026  
**Version:** 1.0
