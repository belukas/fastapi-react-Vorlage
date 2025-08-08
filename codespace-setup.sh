#!/bin/bash

# FastAPI React Starter Setup für Codespace
echo "🚀 Starte FastAPI React Starter im Codespace..."

# Umgebungsvariablen prüfen
if [ ! -f .env ]; then
    echo "❌ .env Datei nicht gefunden!"
    exit 1
fi

# Services starten
echo "📦 Starte Docker Services..."
docker compose down --volumes 2>/dev/null || true
docker compose up -d

# Warten bis alle Services bereit sind
echo "⏳ Warte auf Services..."
sleep 15

# Services Status prüfen
echo "🔍 Service Status:"
docker compose ps

# Backend Health Check
echo "🏥 Backend Health Check:"
curl -s http://0.0.0.0:8000/api/health || echo "❌ Backend nicht erreichbar"

# Frontend Check
echo "🌐 Frontend Check:"
curl -s -o /dev/null -w "%{http_code}" http://0.0.0.0:5173 && echo " ✅ Frontend erreichbar" || echo "❌ Frontend nicht erreichbar"

echo ""
echo "🎉 Setup abgeschlossen!"
echo ""
echo "📍 Services verfügbar unter:"
echo "   Frontend: http://0.0.0.0:5173"
echo "   Backend API: http://0.0.0.0:8000"
echo "   API Docs: http://0.0.0.0:8000/docs"
echo "   Documentation: http://0.0.0.0:8001"
echo "   PostgreSQL: 0.0.0.0:5433"
echo ""
echo "🔑 Test-Benutzer erstellen:"
echo "   curl -X POST http://0.0.0.0:8000/api/auth/register \\"
echo "        -H 'Content-Type: application/json' \\"
echo "        -d '{\"username\": \"testuser\", \"email\": \"test@example.com\", \"password\": \"testpassword\"}'"
