# FastAPI React Starter - Codespace Setup

## 🚀 Quick Start

Die Anwendung ist bereits eingerichtet und läuft! 

### Services

- **Frontend (React)**: https://obscure-barnacle-7vgwr7px5jvcrj4p-5173.app.github.dev
- **Backend (FastAPI)**: https://obscure-barnacle-7vgwr7px5jvcrj4p-8000.app.github.dev  
- **API Documentation**: https://obscure-barnacle-7vgwr7px5jvcrj4p-8000.app.github.dev/docs
- **Project Documentation**: https://obscure-barnacle-7vgwr7px5jvcrj4p-8001.app.github.dev
- **PostgreSQL Database**: 0.0.0.0:5433

> **Hinweis**: Das Frontend verwendet einen Proxy für API-Aufrufe, um CORS-Probleme zu vermeiden.

### 🔄 Services neustarten

```bash
cd /workspaces/fastapi-react-Vorlage/fastapi-react-starter
./codespace-setup.sh
```

### 📊 Service Status prüfen

```bash
docker compose ps
```

### 🔍 Logs anzeigen

```bash
# Alle Services
docker compose logs -f

# Einzelne Services
docker compose logs -f backend
docker compose logs -f frontend
docker compose logs -f postgres
```

### 🧪 API Testen

#### Benutzer registrieren
```bash
curl -X POST http://0.0.0.0:8000/api/auth/register \
     -H "Content-Type: application/json" \
     -d '{"username": "testuser", "email": "test@example.com", "password": "testpassword"}'
```

#### Benutzer anmelden
```bash
curl -X POST http://0.0.0.0:8000/api/auth/login \
     -H "Content-Type: application/json" \
     -d '{"email": "test@example.com", "password": "testpassword"}'
```

#### Health Check
```bash
curl http://0.0.0.0:8000/api/health
```

### 🗄️ Datenbank

- **Typ**: PostgreSQL 17
- **Host**: postgres (intern) / 0.0.0.0 (extern)
- **Port**: 5433 (extern) / 5432 (intern)
- **Database**: fastapi_db
- **Username**: postgres  
- **Password**: postgres123

#### Datenbank direkt verbinden
```bash
docker compose exec postgres psql -U postgres -d fastapi_db
```

### 🔧 Entwicklung

#### Backend entwickeln
```bash
# In Backend-Container einsteigen
docker compose exec backend bash

# Tests ausführen
docker compose exec backend python -m pytest

# Neue Migration erstellen
docker compose exec backend python manage.py makemigrations

# Migration anwenden
docker compose exec backend python manage.py migrate
```

#### Frontend entwickeln
```bash
# In Frontend-Container einsteigen  
docker compose exec frontend bash

# Dependencies installieren
docker compose exec frontend npm install

# Tests ausführen
docker compose exec frontend npm test
```

### 🌐 Codespace Besonderheiten

- **Ports**: Alle Services sind auf `0.0.0.0` gebunden für externe Zugänglichkeit
- **CORS**: Konfiguriert für `*.githubpreview.dev` und `*.github.dev` Domains
- **Hot Reload**: Funktioniert für Frontend und Backend
- **Datenpersistenz**: PostgreSQL Daten bleiben zwischen Neustarts erhalten

### 🚨 Troubleshooting

#### Services neustarten
```bash
docker compose down
docker compose up -d
```

#### Kompletter Reset (Daten löschen!)
```bash
docker compose down --volumes
docker compose up -d
```

#### Port-Konflikte
Falls Port 5432 bereits belegt ist, wird automatisch 5433 verwendet.

### 📁 Projektstruktur

```
fastapi-react-starter/
├── backend/          # FastAPI Backend
├── frontend/         # React Frontend  
├── docs/            # MkDocs Documentation
├── deployments/     # Deployment Configs
├── docker-compose.yml
├── .env             # Environment Variables
└── codespace-setup.sh
```
