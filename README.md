# FastAPI React Starter Template

A modern, full-featured starter template featuring FastAPI backend and React 19 frontend with TypeScript, Tailwind CSS, and shadcn/ui components.

![image](frontend/public/starter.svg)

## 🚀 GitHub Codespaces Ready

This template is optimized for GitHub Codespaces with automatic setup and HTTPS configuration.

**Quick Start in Codespaces:**
```bash
./codespace-setup.sh
```

**Codespace URLs:**
- Frontend: `https://YOUR_CODESPACE_NAME-5173.app.github.dev`
- Backend: `https://YOUR_CODESPACE_NAME-8000.app.github.dev`
- API Docs: `https://YOUR_CODESPACE_NAME-8000.app.github.dev/docs`

See [CODESPACE.md](CODESPACE.md) for detailed Codespace setup instructions.

## Features

- **Backend (FastAPI)**

  - Fast and modern Python web framework
  - PostgreSQL/SQLite database with async SQLAlchemy ORM
  - JWT-based authentication system
  - Role-based access control
  - Async database operations
  - Proper connection pooling and cleanup
  - Environment configuration with pydantic
  - Structured logging
  - Health check endpoint
  - Graceful shutdown handling
  - Modular project structure

- **Frontend (React 19)**
  - Latest React features including `use` hook
  - TypeScript for type safety and better developer experience
  - React Router 7 for client-side routing
  - shadcn/ui components for beautiful, accessible UI
  - Component-based architecture
  - Custom hooks for data fetching
  - Modern error handling with Error Boundaries
  - Suspense for loading states
  - Tailwind CSS for styling
  - Environment configuration
  - Vite for fast development

## Project Structure

```
fastapi-react-starter/
├── backend/
│   ├── app/
│   │   ├── __init__.py
│   │   ├── main.py              # FastAPI application entry
│   │   ├── config/              # Configuration management
│   │   │   ├── __init__.py
│   │   │   └── config.py        # Environment settings
│   │   ├── db/                  # Database
│   │   │   ├── __init__.py
│   │   │   ├── database.py      # Database connection
│   │   │   └── models.py        # SQLAlchemy models
│   │   ├── routes/              # API routes
│   │   │   ├── __init__.py
│   │   │   ├── auth.py         # Authentication endpoints
│   │   │   └── health.py       # Health check endpoint
│   │   ├── schemas/            # Pydantic models
│   │   │   ├── __init__.py
│   │   │   └── auth.py        # Authentication schemas
│   │   ├── services/          # Business logic
│   │   │   ├── __init__.py
│   │   │   └── auth.py       # Authentication services
│   │   └── utils/            # Utilities
│   │       ├── __init__.py
│   │       └── logger.py     # Logging configuration
│   ├── .env                  # Environment variables
│   └── requirements.txt      # Python dependencies
├── frontend/
│   ├── src/
│   │   ├── components/       # Reusable UI components
│   │   │   └── ui/          # shadcn/ui components
│   │   │       ├── button.tsx
│   │   │       ├── card.tsx
│   │   │       └── status-dot.tsx
│   │   ├── features/         # Feature modules
│   │   │   ├── auth/        # Authentication feature
│   │   │   │   ├── LoginForm.tsx
│   │   │   │   └── RegisterForm.tsx
│   │   │   └── health/      # Health check feature
│   │   │       └── HealthStatus.tsx
│   │   ├── hooks/           # Custom React hooks
│   │   │   ├── useAuth.ts
│   │   │   └── useHealthStatus.ts
│   │   ├── layouts/         # Page layouts
│   │   │   └── MainLayout.tsx
│   │   ├── lib/             # Utility functions and configurations
│   │   │   └── utils.ts
│   │   ├── routes/          # Route components and configurations
│   │   │   └── root.tsx
│   │   ├── types/           # TypeScript type definitions
│   │   │   └── index.d.ts
│   │   └── App.tsx          # Main React component
│   ├── .env                 # Frontend environment variables
│   └── package.json         # Node.js dependencies
└── README.md               # Project documentation
```

## Quick Start

### Using Docker (Recommended)

1. Clone the repository:

   ```bash
   git clone https://github.com/raythurman2386/fastapi-react-starter.git
   cd fastapi-react-starter
   ```

2. Create environment files:

   Create `.env` file in the root directory:

   ```env
   # Database Configuration
   DB_USER=postgres
   DB_PASSWORD=postgres
   DB_NAME=fastapi_db
   ```

3. Start the application with Docker:

   ```bash
   docker compose up --build
   ```

   This will:

   - Start PostgreSQL database
   - Apply migrations to a fresh database (e.g., after Docker volume removal)
   - Start the FastAPI backend at http://localhost:8000
   - Start the React frontend at http://localhost:5173

   The Swagger docs will be available at http://localhost:8000/docs

### Automated Setup Scripts

For your convenience, this project includes automated setup scripts for both Windows and Linux/Mac:

#### Windows Setup

1. Open PowerShell as Administrator
2. Navigate to the project directory
3. Run the setup script:
   ```powershell
   .\setup.ps1
   ```

This script will:

- Check for required dependencies (Docker, Docker Compose V2)
- Install the correct version of docker recommended for the system.
- Set up environment variables

#### Linux/Mac Setup

1. Open a terminal
2. Navigate to the project directory
3. Make the script executable and run it:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

This script performs the same setup steps as the Windows version but is adapted for Unix-based systems.

### Manual Setup (Alternative)

1. Backend Setup:

   a. Install PostgreSQL and create a database:

   ```bash
   # macOS with Homebrew
   brew install postgresql
   brew services start postgresql

   # Create database
   createdb fastapi_db
   ```

   b. Create a `.env` file in the backend directory:

   ```env
   # Database Configuration
   DB_NAME=fastapi_db
   DB_USER=postgres  # your database user
   DB_PASSWORD=postgres  # your database password
   DB_HOST=localhost
   DB_PORT=5432
   CORS_ORIGINS=["http://localhost:5173"]
   ENVIRONMENT=development
   ```

   c. Install Python dependencies and run migrations:

   ```bash
   cd backend
   pip install -r requirements.txt
   python manage.py migrate
   uvicorn app.main:app --reload
   ```

2. Frontend Setup:
   ```bash
   cd frontend
   npm install
   npm run dev
   ```

### Database Management

The project includes several database management commands:

```bash
# Generate new migrations
python manage.py makemigrations "description of changes"

# Apply pending migrations
python manage.py migrate

# Apply all migrations to a (presumably) fresh database (runs 'alembic upgrade head')
python manage.py reset_db

# Check migration status
python manage.py db-status

# Rollback last migration
python manage.py downgrade
```

If you encounter database errors and need a full reset:

1. Stop all running services: `docker compose down`
2. Remove the PostgreSQL Docker volume (e.g., `docker volume rm fastapi-react-starter_postgres_data` - verify volume name with `docker volume ls`)
3. Restart services: `docker compose up -d --build`

### Troubleshooting

1. Backend Status shows "error":

   - Ensure PostgreSQL is running
   - Check database credentials in `.env`
   - For a full reset, see the 'If you encounter database errors' section above (involves Docker volume removal).
   - Check backend logs for specific error messages

2. User Registration fails:
   - Ensure the database is properly initialized
   - Check if backend is running and accessible
   - Verify CORS settings in backend `.env`
   - Check browser console for specific error messages

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
