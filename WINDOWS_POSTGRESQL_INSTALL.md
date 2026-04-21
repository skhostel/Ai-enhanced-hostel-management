# 📥 PostgreSQL Installation Guide for Windows

PostgreSQL was not detected on your system. Follow these steps to install it.

---

## Step 1: Download PostgreSQL

1. **Open Browser** and go to:
   ```
   https://www.postgresql.org/download/windows/
   ```

2. **Click "Download the installer"** (red button)

3. **Choose Version 15 or Latest**

4. **Click Download** for your Windows version (64-bit recommended)

---

## Step 2: Run the Installer

1. **Find** the downloaded file (usually in Downloads folder)
2. **Right-click** → "Run as Administrator"
3. **Click "Next"** at welcome screen

### Installation Folder
- Default: `C:\Program Files\PostgreSQL\15`
- ✅ Leave as default

### Select Components
- ✅ PostgreSQL Server (required)
- ✅ pgAdmin 4 (GUI tool for database management)
- ✅ Stack Builder (for extra tools)
- ✅ Command Line Tools

Click **Next**

### Data Directory
- Default: `C:\Program Files\PostgreSQL\15\data`
- ✅ Leave as default

Click **Next**

### Password Setup ⚠️ IMPORTANT

**Set password for `postgres` user:**
```
Password: postgres
Confirm: postgres
```

(You can use a different password, but remember it!)

Click **Next**

### Port Selection
- Default: `5432`
- ✅ Leave as default

Click **Next**

### Locale
- Default: English, United States
- ✅ Leave as default

Click **Next**

### Review & Install
- ✅ Review all settings
- Click **Install**

Wait for installation to complete (~2-3 minutes)

### Stack Builder (optional)
- ✅ Can skip or click "Finish"

---

## Step 3: Verify Installation

**Open Command Prompt** and run:
```bash
psql --version
```

Should show: `psql (PostgreSQL) 15.x` or similar ✅

---

## Step 4: Create Database

### Method 1: Using pgAdmin (Easiest)

1. **Open pgAdmin 4**
   - Windows Start Menu → Search "pgAdmin"
   - Or go to: http://localhost:5050 in browser

2. **Connect to PostgreSQL**
   - Right-click "Servers" → Create → Server
   - Name: `PostgreSQL 15`
   - Host name: `localhost`
   - Username: `postgres`
   - Password: (what you set during installation)
   - Click "Save"

3. **Create Database**
   - Expand PostgreSQL server
   - Right-click "Databases" → Create → Database
   - **Database name:** `hostel_db`
   - **Owner:** `postgres`
   - Click "Save"

### Method 2: Using Command Line

1. **Open Command Prompt** (Run as Administrator)

2. **Connect to PostgreSQL:**
   ```bash
   psql -U postgres
   ```
   Enter password: (password you set)

3. **Create database:**
   ```sql
   CREATE DATABASE hostel_db;
   ```

4. **Verify:**
   ```sql
   \l
   ```
   Should see `hostel_db` in the list

5. **Exit:**
   ```sql
   \q
   ```

---

## Step 5: Test Connection

### Test from Command Prompt
```bash
psql -U postgres -d hostel_db -c "SELECT 1;"
```

Should output: `?column?`
               `--------`
               `1`

✅ If you see this, PostgreSQL is working!

---

## Step 6: Configure Django

Your `settings.py` is already configured! It will:
1. Look for `DATABASE_URL` environment variable
2. Fall back to local PostgreSQL credentials:
   ```python
   'NAME': 'hostel_db',
   'USER': 'postgres',
   'PASSWORD': 'postgres',
   'HOST': 'localhost',
   'PORT': '5432',
   ```

---

## Step 7: Run Django Migrations

### In Terminal/Command Prompt:

```bash
cd c:\Users\saroj\OneDrive\Desktop\scoder\hostel_pg_system

# Install requirements (already done, but just in case)
pip install -r requirements.txt

# Run migrations
python manage.py migrate

# Create admin user
python manage.py createsuperuser

# Start server
python manage.py runserver
```

---

## ✅ Verify Everything Works

```bash
# Test database connection
python manage.py dbshell
```

Should open PostgreSQL prompt:
```
hostel_db=#
```

Type `\q` to exit

---

## 📝 If Password is Different

If you used a different password than "postgres", create a `.env` file in your project:

```
DATABASE_URL=postgresql://postgres:YOUR_PASSWORD@localhost:5432/hostel_db
```

---

## 🐛 Troubleshooting

### Issue: "psql is not recognized"
**Solution:** PostgreSQL not in PATH
1. Restart Command Prompt
2. If still fails: Add to PATH manually or use full path:
   ```bash
   "C:\Program Files\PostgreSQL\15\bin\psql" --version
   ```

### Issue: "FATAL: role 'postgres' does not exist"
**Solution:** Wrong username or PostgreSQL not started
```bash
# Restart PostgreSQL service:
# Windows Services → PostgreSQL → Start
```

### Issue: "FATAL: password authentication failed"
**Solution:** Wrong password
```bash
# Reset password in pgAdmin:
# Right-click postgres user → Properties → Change password
```

### Issue: "FATAL: database 'hostel_db' does not exist"
**Solution:** Database not created yet
```bash
psql -U postgres -c "CREATE DATABASE hostel_db;"
```

### Issue: PostgreSQL won't start
**Solution:** Check Services
1. Press Windows + R
2. Type: `services.msc`
3. Look for "postgresql-x64-15"
4. If not running: Right-click → Start

---

## 🎯 Next Steps After Installation

1. ✅ Install PostgreSQL (above steps)
2. ✅ Create `hostel_db` database
3. Run migrations:
   ```bash
   python manage.py migrate
   ```
4. Create superuser:
   ```bash
   python manage.py createsuperuser
   ```
5. Start server:
   ```bash
   python manage.py runserver
   ```

---

## ✨ Useful pgAdmin Tips

- **View data:** Expand database → Schemas → public → Tables → Right-click table → View/Edit Data
- **Run SQL:** Tools → Query Tool (write custom SQL)
- **Backup:** Right-click database → Backup
- **Restore:** Right-click database → Restore

---

## 📚 Need Help?

- PostgreSQL Docs: https://www.postgresql.org/docs/
- pgAdmin Docs: https://www.pgadmin.org/docs/
- Python psycopg2: https://www.psycopg.org/

---

**Start installation now!** 🚀

Then come back and run:
```bash
cd c:\Users\saroj\OneDrive\Desktop\scoder\hostel_pg_system
python manage.py migrate
```
