# 🗄️ PostgreSQL Setup Guide - SK Hostel Management System

Your Django project has been configured to use **PostgreSQL** instead of SQLite!

---

## ✅ What's Been Done

- Updated `settings.py` to support PostgreSQL
- Configured `dj-database-url` for environment-based configuration
- Added fallback to local PostgreSQL development database
- All required packages already in `requirements.txt`:
  - ✅ `psycopg2-binary==2.9.9`
  - ✅ `dj-database-url==2.1.0`

---

## 📋 Installation Options

Choose one based on your needs:

### **Option 1: Install PostgreSQL Locally (Windows)**

#### 1.1 Download PostgreSQL
1. Go to https://www.postgresql.org/download/windows/
2. Download PostgreSQL (version 14 or 15)
3. Run the installer
4. Remember your password for the `postgres` user!

#### 1.2 Create Database and User
1. Open **pgAdmin** (installed with PostgreSQL)
2. Connect to the default server
3. Right-click "Databases" → "Create" → "Database"
4. Name: `hostel_db`
5. Owner: `postgres`
6. Click "Save"

#### 1.3 Verify Connection
Open Command Prompt and test:
```bash
psql -U postgres -d hostel_db -c "SELECT 1;"
```

---

### **Option 2: Use Free Cloud Database (Recommended for Production)**

#### 2.1 ElephantSQL (Easy & Free)
1. Go to https://www.elephantsql.com/
2. Sign up (free account)
3. Create a new instance:
   - Provider: Any
   - Plan: Tiny Turtle (Free)
   - Region: Closest to you
4. Copy the connection URL

#### 2.2 Railway.app
1. Go to https://railway.app/
2. Sign up with GitHub
3. Create new project → Add PostgreSQL
4. Get connection details

#### 2.3 Supabase
1. Go to https://supabase.com/
2. Sign up
3. Create new project
4. Copy database URL

---

## ⚙️ Configuration

### Development (Local PostgreSQL)

**Default credentials in settings.py:**
```python
'NAME': 'hostel_db',
'USER': 'postgres',
'PASSWORD': 'postgres',
'HOST': 'localhost',
'PORT': '5432',
```

If your credentials are different, create a `.env` file:
```
DATABASE_URL=postgresql://username:password@localhost:5432/hostel_db
```

### Production (Cloud Database)

Set the environment variable in Vercel/hosting platform:

```
DATABASE_URL=postgresql://user:password@host:port/database_name
```

---

## 🚀 Running Migrations

### Step 1: Ensure PostgreSQL is Running
```bash
# Windows: PostgreSQL should auto-start
# Or start it manually from Windows Services
```

### Step 2: Install Python Dependencies
```bash
pip install -r requirements.txt
```

### Step 3: Create Migrations (if needed)
```bash
python manage.py makemigrations
```

### Step 4: Run Migrations
```bash
python manage.py migrate
```

### Step 5: Create Superuser (Admin)
```bash
python manage.py createsuperuser
```
Then follow the prompts to create an admin account.

### Step 6: Start the Server
```bash
python manage.py runserver
```

---

## 🧪 Testing the Database

### Check Database Connection
```bash
python manage.py dbshell
```

This should open a PostgreSQL prompt if connected correctly.

### Run Tests
```bash
python manage.py test
```

---

## 📊 Database Schema

Your database will have these tables (created by migrations):
- `auth_user` - User accounts
- `management_student` - Student data
- `management_room` - Room information
- `management_complaint` - Complaints
- `management_fees` - Fee records
- `management_announcement` - Announcements
- ... (other management tables)

---

## 🐛 Troubleshooting

### Issue: "connection refused"
**Solution:**
```bash
# Make sure PostgreSQL is running:
# On Windows: Services > PostgreSQL
# Test connection:
psql -U postgres -d hostel_db
```

### Issue: "FATAL: role 'postgres' does not exist"
**Solution:**
```bash
# Update settings.py with correct username:
'USER': 'your_actual_username',
```

### Issue: "FATAL: database 'hostel_db' does not exist"
**Solution:**
```bash
# Create the database:
psql -U postgres -c "CREATE DATABASE hostel_db;"
```

### Issue: Permission Denied
**Solution:**
```bash
# If using cloud database, verify connection string format:
postgresql://user:password@host:port/database
```

### Issue: "psycopg2 not found"
**Solution:**
```bash
pip install psycopg2-binary
```

---

## 🔍 Verify Installation

Run these commands to verify setup:

```bash
# 1. Check Python packages
pip list | grep psycopg2
pip list | grep dj-database

# 2. Check Django sees PostgreSQL
python manage.py dbshell

# 3. Check migrations
python manage.py showmigrations

# 4. Run system check
python manage.py check
```

All should show no errors! ✅

---

## 📝 Environment Variables (for Production)

Create `.env` file for local development:
```
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/hostel_db
DEBUG=False
SECRET_KEY=your-secret-key-here
```

For Vercel/production, add these in dashboard environment variables.

---

## 🎯 Quick Start Commands

```bash
# 1. Navigate to project
cd c:\Users\saroj\OneDrive\Desktop\scoder\hostel_pg_system

# 2. Install requirements
pip install -r requirements.txt

# 3. Run migrations
python manage.py migrate

# 4. Create superuser
python manage.py createsuperuser

# 5. Start server
python manage.py runserver

# 6. Visit in browser
# http://127.0.0.1:8000/
```

---

## ✨ Benefits of PostgreSQL

✅ **Reliability** - Production-grade database  
✅ **Scalability** - Handles large datasets  
✅ **Performance** - Faster than SQLite for concurrent users  
✅ **Features** - Advanced data types and functions  
✅ **Cloud Ready** - Works with Vercel, Railway, etc.  
✅ **Free Options** - ElephantSQL, Supabase, Railway offer free tiers  

---

## 📚 Documentation

- [PostgreSQL Official](https://www.postgresql.org/)
- [ElephantSQL Docs](https://www.elephantsql.com/docs/index.html)
- [Django PostgreSQL Guide](https://docs.djangoproject.com/en/6.0/ref/databases/#postgresql-notes)
- [dj-database-url](https://github.com/jacobian/dj-database-url)

---

**Next Steps:**
1. ✅ Choose installation method above
2. ✅ Set up PostgreSQL
3. ✅ Create database `hostel_db`
4. ✅ Run `python manage.py migrate`
5. ✅ Test the site

Your system is now PostgreSQL-ready! 🎉
