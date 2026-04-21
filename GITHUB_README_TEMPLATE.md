# SK Hostel Management System

![Django](https://img.shields.io/badge/Django-6.0.4-green)
![Python](https://img.shields.io/badge/Python-3.11+-blue)
![License](https://img.shields.io/badge/License-MIT-purple)
![Status](https://img.shields.io/badge/Status-Active-brightgreen)

A comprehensive Django-based hostel management system for handling student accommodations, fees, complaints, maintenance, and daily operations.

## 🌟 Features

### For Students
- 📅 **Daily Attendance Tracking** - Check-in/check-out system
- 🍽️ **Meal Booking** - Plan and manage meals
- 👥 **Guest Pass Management** - Request and track visitor passes
- 📝 **Leave Requests** - Apply for and manage leave
- 📋 **Task Management** - View assigned tasks
- 💬 **Complaints System** - Report and track complaints
- 👛 **Fee Management** - View and manage hostel fees
- 🏠 **Room Details** - View room information and occupants

### For Administrators
- 👨‍💼 **Student Management** - Add, update, and manage students
- 🏠 **Room Allocation** - Assign rooms to students
- 💰 **Fee Management** - Create and track fees
- ⚠️ **Complaint Handling** - Review and resolve complaints
- 🔧 **Maintenance Tracking** - Manage maintenance requests
- 📢 **Announcements** - Post important updates
- 📊 **Dashboard Analytics** - View comprehensive statistics
- 📁 **Expense Tracking** - Monitor daily expenses

## 🚀 Quick Start

### Prerequisites
- Python 3.11+
- pip
- PostgreSQL (optional, SQLite for development)

### Local Development

```bash
# Clone repository
git clone https://github.com/YOUR_USERNAME/hostel-management-system.git
cd hostel-management-system

# Create virtual environment
python -m venv venv

# Activate virtual environment
venv\Scripts\activate          # Windows
source venv/bin/activate       # Mac/Linux

# Install dependencies
pip install -r requirements.txt

# Copy environment template
cp .env.example .env

# Run migrations
python manage.py migrate

# Create superuser (admin account)
python manage.py createsuperuser

# Collect static files
python manage.py collectstatic --noinput

# Run development server
python manage.py runserver

# Visit http://localhost:8000
```

## 📦 Project Structure

```
hostel-management-system/
├── .github/
│   └── workflows/
│       └── tests.yml              # CI/CD Pipeline
├── hostel_pg_system/              # Main Django project
│   ├── settings.py                # Django settings
│   ├── wsgi.py                    # WSGI configuration
│   ├── asgi.py                    # ASGI configuration
│   └── urls.py                    # URL routing
├── management/                    # Main Django application
│   ├── models.py                  # Database models
│   ├── views.py                   # View functions
│   ├── forms.py                   # Form definitions
│   ├── urls.py                    # App URLs
│   ├── admin.py                   # Admin configuration
│   ├── migrations/                # Database migrations
│   ├── static/                    # CSS, JavaScript, Images
│   └── templates/                 # HTML templates
├── requirements.txt               # Python dependencies
├── runtime.txt                    # Python version
├── vercel.json                    # Vercel configuration
├── .env.example                   # Environment template
├── .gitignore                     # Git ignore rules
├── manage.py                      # Django management script
└── README.md                      # This file
```

## 🗄️ Database

### Development
- SQLite (configured by default)
- Automatic database creation

### Production
- PostgreSQL (recommended)
- Set `DATABASE_URL` environment variable
- Supported providers: Supabase, Railway, Neon, Vercel Postgres

## 🔐 Environment Variables

Create `.env` file from `.env.example`:

```env
SECRET_KEY=your-unique-secret-key
DEBUG=False                          # Set to True for development
ALLOWED_HOSTS=localhost,127.0.0.1
SITE_URL=http://localhost:8000

# Database
DATABASE_URL=postgresql://user:pass@localhost:5432/hostel_db
# OR for SQLite:
USE_SQLITE=true
```

## 🚀 Deployment

### Quick Start
See [`QUICK_START_DEPLOYMENT.md`](./QUICK_START_DEPLOYMENT.md) for 5-minute deployment guide.

### Detailed Guides
- **[GitHub Setup](./GITHUB_DEPLOYMENT.md)** - Complete GitHub & Vercel configuration
- **[Deployment Checklist](./DEPLOYMENT_CHECKLIST.md)** - Pre-deployment verification
- **[Deployment Resources](./DEPLOYMENT_RESOURCES.md)** - All deployment documentation

### Deploy to Vercel (Recommended)

1. **Connect GitHub**
   - Go to https://vercel.com
   - Import this repository

2. **Set Environment Variables**
   - `SECRET_KEY` - Random secret key
   - `DEBUG` - False
   - `ALLOWED_HOSTS` - Your domain
   - `DATABASE_URL` - PostgreSQL connection string

3. **Deploy**
   - Click "Deploy"
   - Site will be live at `https://your-project.vercel.app`

## 🧪 Testing

```bash
# Run tests
python manage.py test

# Run with coverage
pip install coverage
coverage run --source='.' manage.py test
coverage report
```

## 🛠️ Development

### Create New Migration
```bash
python manage.py makemigrations
python manage.py migrate
```

### Access Django Admin
```
http://localhost:8000/admin/
```

### Collect Static Files
```bash
python manage.py collectstatic --noinput
```

## 📊 Models

### Core Models
- **Room** - Hostel rooms with capacity and pricing
- **StudentProfile** - Student information and room assignment
- **Fee** - Monthly hostel fees
- **Complaint** - Student complaints and issues
- **Announcement** - Administrative announcements

### Daily Operations
- **DailyAttendance** - Student check-in/check-out
- **LeaveRequest** - Leave applications and approvals
- **GuestPass** - Visitor pass requests
- **MealBooking** - Student meal preferences
- **DailyTask** - Task assignments
- **DailyExpense** - Expense tracking
- **Maintenance** - Maintenance requests
- **EmergencyContact** - Emergency contact information

## 🔗 API Endpoints

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/` | GET | Homepage |
| `/register/` | POST | Student registration |
| `/login/` | POST | User authentication |
| `/dashboard/` | GET | Main dashboard |
| `/rooms/` | GET | List rooms |
| `/complaints/` | GET | List complaints |
| `/fees/` | GET | View fees |
| `/profile/` | GET, POST | User profile |
| `/admin/` | GET | Django admin panel |

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🐛 Troubleshooting

### Port Already in Use
```bash
# Use different port
python manage.py runserver 8001
```

### Database Errors
```bash
# Reset database (development only)
rm db.sqlite3
python manage.py migrate
```

### Static Files Not Loading
```bash
python manage.py collectstatic --noinput
```

### Import Errors
```bash
# Reinstall dependencies
pip install -r requirements.txt --force-reinstall
```

## 📚 Documentation

- [Django Documentation](https://docs.djangoproject.com/)
- [Vercel Documentation](https://vercel.com/docs)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)

## 🆘 Support

For issues and questions:
1. Check [Troubleshooting](##-troubleshooting)
2. Review [Deployment Resources](./DEPLOYMENT_RESOURCES.md)
3. Open an [Issue](../../issues)

## 📞 Contact

- **Email**: admin@example.com
- **Support**: See [Support Resources](./DEPLOYMENT_RESOURCES.md#-support-resources)

## 🎉 Acknowledgments

- Django framework and community
- Vercel for hosting
- PostgreSQL team
- All contributors

---

**Version**: 1.0  
**Last Updated**: April 21, 2026  
**Status**: ✅ Production Ready  
**Python**: 3.11  
**Django**: 6.0.4
