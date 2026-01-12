@echo off
echo 🚀 Starting CodeVerse with Docker...
echo.

REM Check if Docker is running
docker info >nul 2>&1
if errorlevel 1 (
    echo ❌ Docker is not running. Please start Docker Desktop.
    pause
    exit /b 1
)

REM Create .env if it doesn't exist
if not exist .env (
    echo 📝 Creating .env file from template...
    copy .env.example .env
    echo ✅ Created .env file. You can edit it to add Judge0 API credentials.
    echo.
)

REM Build and start containers
echo 🔨 Building and starting containers...
docker-compose up --build -d

echo.
echo ⏳ Waiting for services to be ready...
timeout /t 10 /nobreak >nul

REM Check service health
echo.
echo 🔍 Checking service status...
docker-compose ps

echo.
echo ✅ CodeVerse is starting up!
echo.
echo 📱 Access the application:
echo    Frontend:  http://localhost:5173
echo    Backend:   http://localhost:8081
echo    Executor:  http://localhost:3000
echo.
echo 📊 View logs:
echo    docker-compose logs -f
echo.
echo 🛑 Stop the application:
echo    docker-compose down
echo.
pause
