# 🚀 PostgreSQL Database Setup - Getting Started Now

## ✅ What's Been Done for You

Your Django application is now configured to use PostgreSQL. All you need to do is:

1. **Install PostgreSQL** (if not already installed)
2. **Create a database**
3. **Run migrations**
4. **Start the server**

---

## 📋 Step-by-Step Instructions

### STEP 1: Install PostgreSQL (First Time Only)

**Skip this if you already have PostgreSQL installed**

1. **Download PostgreSQL 15:**
   - Go to: https://www.postgresql.org/download/windows/
   - Click the big red "Download the installer" button
   - Choose your Windows version (64-bit)

2. **Run the installer:**
   - Find downloaded file in Downloads folder
   - Right-click → "Run as Administrator"
   - Follow the installer:
     - ✅ Click Next through all screens
     - ✅ When asked for password, use: `postgres`
     - ✅ Port: `5432` (default)
   - Wait for installation to complete (~3 minutes)

3. **Verify installation:**
   Open Command Prompt and run:
   ```bash
   psql --version
   ```
   Should show: `psql (PostgreSQL) 15.x`

**See full details:** `WINDOWS_POSTGRESQL_INSTALL.md`

---

### STEP 2: Create Database

#### Option A: Using pgAdmin (Easy)
1. Open **pgAdmin 4** (search Windows Start Menu)
2. Login with `postgres` / `postgres`
3. Right-click **Databases** → Create → Database
4. Name: `hostel_db`
5. Owner: `postgres`
6. Click Save

#### Option B: Using Command Line
```bash
psql -U postgres
```
Enter password: `postgres`

Then type:
```sql
CREATE DATABASE hostel_db;
\q
```

---

### STEP 3: Install Dependencies

Open Command Prompt/PowerShell:

```bash
cd c:\Users\saroj\OneDrive\Desktop\scoder\hostel_pg_system
pip install -r requirements.txt
```

---

### STEP 4: Run Migrations

```bash
python manage.py migrate
```

You should see output like:
```
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, management, sessions
...
✅ All migrations applied successfully!
```

---

### STEP 5: Create Admin Account

```bash
python manage.py createsuperuser
```

Follow prompts:
```
Username: admin
Email: admin@example.com
Password: (enter a strong password)
Password (again): (confirm)
```

---

### STEP 6: Start the Server

```bash
python manage.py runserver
```

You should see:
```
Starting development server at http://127.0.0.1:8000/
```

---

### STEP 7: Test Your Site

1. **Open browser** to: http://127.0.0.1:8000/
2. **Test registration & login** with the admin account
3. **Check database connection:** Run `python manage.py dbshell`
   - Should open PostgreSQL prompt
   - Type `\q` to exit

---

## 🧪 Verify Everything Works

Run these commands to verify:

```bash
# 1. Check database connection
python manage.py dbshell

# 2. Check migrations are applied
python manage.py showmigrations

# 3. Run system check
python manage.py check

# 4. See database info
python manage.py shell
>>> from django.db import connection
>>> connection.ensure_connection()
>>> print("✅ Connected!")
>>> exit()
```

---

## 🔐 Different Password?

If you used a different password during PostgreSQL installation:

Create a `.env` file in your project root:
```
DATABASE_URL=postgresql://postgres:YOUR_PASSWORD@localhost:5432/hostel_db
```

Replace `YOUR_PASSWORD` with your actual password.

---

## 📊 Current Configuration

Your `settings.py` now:
- ✅ Uses PostgreSQL locally
- ✅ Supports `DATABASE_URL` for production
- ✅ Has connection pooling
- ✅ Optimized for Vercel deployment

**Local defaults:**
```
Host: localhost
Port: 5432
Database: hostel_db
User: postgres
Password: postgres
```

---

## 📁 Important Files Created

New documentation files in your project:
- 📖 `POSTGRESQL_MIGRATION_SUMMARY.md` - Overview
- 📖 `POSTGRESQL_QUICK_START.md` - Quick reference
- 📖 `POSTGRESQL_SETUP.md` - Detailed guide
- 📖 `WINDOWS_POSTGRESQL_INSTALL.md` - Installation steps

---

## 🎯 Commands Quick Reference

```bash
# Install PostgreSQL (Windows)
# Download: https://www.postgresql.org/download/windows/

# Create database
# Use pgAdmin or: psql -U postgres -c "CREATE DATABASE hostel_db;"

# Install Python dependencies
pip install -r requirements.txt

# Run migrations
python manage.py migrate

# Create admin user
python manage.py createsuperuser

# Start development server
python manage.py runserver

# Open browser
http://127.0.0.1:8000/

# Stop server
Ctrl + C (or Ctrl + Break on Windows)
```

---

## 🚨 Common Issues & Fixes

### Issue: `psql: command not found`
**Fix:** PostgreSQL not installed or not in PATH
- Install PostgreSQL or restart Command Prompt

### Issue: `FATAL: role 'postgres' does not exist`
**Fix:** PostgreSQL not started
- Windows Services → PostgreSQL → Start

### Issue: `FATAL: password authentication failed`
**Fix:** Wrong password
- Create `.env` with correct password
- Or reset password in pgAdmin

### Issue: `FATAL: database 'hostel_db' does not exist`
**Fix:** Database not created
- Create it in pgAdmin or with SQL command above

---

## 🌍 Ready for Vercel?

When you deploy to Vercel:

1. In Vercel dashboard → Environment Variables
2. Add: `DATABASE_URL=postgresql://...` (from cloud provider)
3. Django will automatically use it

Options:
- ☁️ ElephantSQL: https://www.elephantsql.com/
- 🚂 Railway: https://railway.app/
- 🗄️ Supabase: https://supabase.com/

See: `VERCEL_SETUP_SUMMARY.md`

---

## ✨ What's Next?

- [ ] Install PostgreSQL (if needed)
- [ ] Create `hostel_db` database
- [ ] Run `pip install -r requirements.txt`
- [ ] Run `python manage.py migrate`
- [ ] Run `python manage.py createsuperuser`
- [ ] Run `python manage.py runserver`
- [ ] Test at http://127.0.0.1:8000/
- [ ] Deploy to Vercel (optional)

---

## 📞 Need Help?

1. **Installation issues?** → See `WINDOWS_POSTGRESQL_INSTALL.md`
2. **Configuration issues?** → See `POSTGRESQL_SETUP.md`
3. **Quick reference?** → See `POSTGRESQL_QUICK_START.md`
4. **Deployment?** → See `VERCEL_SETUP_SUMMARY.md`

---

## 🎉 That's It!

Once you complete these steps:
✅ Your database is PostgreSQL  
✅ Your data persists  
✅ You're ready for production  
✅ You're ready for Vercel deployment  

**Start with Step 1 now!** 🚀
