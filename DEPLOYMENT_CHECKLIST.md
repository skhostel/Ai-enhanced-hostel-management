# Deployment Checklist

## Pre-Deployment (Local Testing)

### Environment Setup
- [ ] Python 3.11+ installed
- [ ] Virtual environment created and activated
- [ ] `pip install -r requirements.txt` successful
- [ ] `.env` file created with proper values
- [ ] All environment variables set

### Code Quality
- [ ] No syntax errors: `python manage.py check`
- [ ] All imports work: `python manage.py shell` runs without errors
- [ ] Migrations applied: `python manage.py migrate`
- [ ] Static files collected: `python manage.py collectstatic --noinput`
- [ ] Django admin loads: `python manage.py runserver` and visit `/admin/`

### Database
- [ ] Database selected (PostgreSQL for production)
- [ ] Database credentials verified
- [ ] All migrations applied: `python manage.py migrate`
- [ ] Superuser created: `python manage.py createsuperuser`
- [ ] Database backup created (if migrating existing data)

### Settings Configuration
- [ ] `DEBUG = False` in production
- [ ] `SECRET_KEY` is random and secure
- [ ] `ALLOWED_HOSTS` includes all domains
- [ ] `SECURE_SSL_REDIRECT = True`
- [ ] `SESSION_COOKIE_SECURE = True`
- [ ] `CSRF_COOKIE_SECURE = True`

### Static & Media Files
- [ ] `STATIC_URL` set correctly
- [ ] `STATIC_ROOT` configured
- [ ] Static files collected successfully
- [ ] WhiteNoise middleware enabled
- [ ] Media files handler configured (if needed)

### Security
- [ ] `.gitignore` includes `.env` and sensitive files
- [ ] No hardcoded secrets in code
- [ ] `requirements.txt` doesn't include dev-only packages
- [ ] Security headers configured
- [ ] CORS settings configured (if needed)

### Testing
- [ ] Unit tests pass: `python manage.py test`
- [ ] Views load without errors
- [ ] Admin interface works
- [ ] Forms validate correctly
- [ ] Authentication flow works

---

## GitHub Setup

### Repository Configuration
- [ ] GitHub repository created
- [ ] `.gitignore` file present
- [ ] `.env.example` file present
- [ ] `README.md` with setup instructions
- [ ] `GITHUB_DEPLOYMENT.md` with deployment guide
- [ ] All code committed: `git add . && git commit -m "..."`
- [ ] Code pushed to main branch: `git push -u origin main`

### GitHub Secrets (for Actions)
- [ ] `VERCEL_TOKEN` added
- [ ] `VERCEL_ORG_ID` added
- [ ] `VERCEL_PROJECT_ID` added

### GitHub Workflows
- [ ] `.github/workflows/tests.yml` created
- [ ] Workflow file syntax valid
- [ ] Actions tab shows workflow running

---

## Vercel Deployment

### Project Setup
- [ ] Vercel account created
- [ ] GitHub connected to Vercel
- [ ] Repository imported
- [ ] Python runtime selected (3.11)

### Environment Variables in Vercel
- [ ] `SECRET_KEY` set
- [ ] `DEBUG=False` set
- [ ] `ALLOWED_HOSTS` includes domain
- [ ] `SITE_URL` set to Vercel domain
- [ ] `DATABASE_URL` set (PostgreSQL)
- [ ] `USE_SQLITE=false` set

### Build Configuration
- [ ] Build command: `pip install -r requirements.txt && python manage.py collectstatic --noinput`
- [ ] Output directory: `staticfiles`
- [ ] Python version: 3.11

### vercel.json Configuration
- [ ] WSGI path correct: `hostel_pg_system/wsgi.py`
- [ ] Static files routes configured
- [ ] Environment variables referenced correctly

### Deployment
- [ ] First deployment successful
- [ ] Site loads without 500 error
- [ ] Static files load (CSS/JS)
- [ ] Admin interface accessible
- [ ] No error logs in Vercel console

---

## Post-Deployment

### Verify Deployment
- [ ] Site accessible at Vercel domain
- [ ] HTTPS/SSL working
- [ ] All pages load without errors
- [ ] Navigation works
- [ ] Forms submit correctly
- [ ] Admin panel accessible

### Database
- [ ] Database migrations applied on Vercel
- [ ] Superuser account works
- [ ] Data persists between requests
- [ ] Queries complete without timeout

### Static Files
- [ ] CSS loads and styles page
- [ ] JavaScript works
- [ ] Images display correctly
- [ ] Admin CSS/JS functional

### Monitoring
- [ ] Set up error tracking (optional: Sentry)
- [ ] Check Vercel analytics
- [ ] Monitor logs for errors
- [ ] Set up uptime monitoring

### Domain Configuration (Optional)
- [ ] Custom domain added to Vercel
- [ ] DNS records configured
- [ ] SSL certificate auto-generated
- [ ] Domain redirect working

---

## Continuous Integration

### GitHub Actions
- [ ] Tests run on push
- [ ] Tests run on pull requests
- [ ] All tests pass before merge
- [ ] Coverage reports generated
- [ ] Code quality checks enabled

### Auto-Deployment
- [ ] Merges to main trigger Vercel deployment
- [ ] Deployment completes successfully
- [ ] No manual deployments needed
- [ ] Rollback procedure tested

---

## Maintenance

### Regular Tasks
- [ ] Weekly backup of database
- [ ] Monitor error logs
- [ ] Check for security updates
- [ ] Review and update dependencies monthly
- [ ] Monitor resource usage/costs

### Version Updates
- [ ] Django updates tested locally first
- [ ] Dependencies kept up-to-date
- [ ] Breaking changes reviewed before upgrade
- [ ] Changelog documented

---

## Quick Deployment Command Reference

### First Time Deploy
```bash
# 1. GitHub
git add .
git commit -m "Initial commit"
git push -u origin main

# 2. Vercel (via web interface)
# - Import repository
# - Set environment variables
# - Deploy

# 3. Verify
# - Visit https://your-project.vercel.app
# - Check admin at /admin/
# - Test key features
```

### Redeployment
```bash
# Make changes locally
git add .
git commit -m "Update: description"
git push origin main

# Vercel auto-deploys (if configured)
# OR manually trigger: vercel --prod
```

### Rollback
```bash
vercel rollback
# Select previous deployment from list
```

---

## Common Issues & Solutions

| Issue | Solution |
|-------|----------|
| 500 Server Error | Check Vercel logs: `vercel logs` |
| Static files missing | Run `collectstatic` in build command |
| Database connection failed | Verify `DATABASE_URL` format and credentials |
| Import errors | Ensure all packages in `requirements.txt` |
| Migrations not applied | Add migration command to build |
| Domain not working | Check DNS configuration |
| CSRF errors | Verify `CSRF_TRUSTED_ORIGINS` setting |

---

## Emergency Contacts & Resources

- **Vercel Support:** https://vercel.com/support
- **Django Docs:** https://docs.djangoproject.com/
- **PostgreSQL:** https://www.postgresql.org/docs/
- **GitHub Issues:** In repository Issues tab

---

**Last Updated:** April 21, 2026  
**Status:** ✅ Ready for Deployment
