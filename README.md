# CodeVerse

A modern LeetCode-style coding platform built with Java Spring Boot, Node.js, and React.

## 🚀 Features

- **Problem Solving**: Browse and solve coding challenges with multiple difficulty levels
- **Multi-Language Support**: Execute code in Python, JavaScript, Java, and C++
- **Dual Execution Engine**: 
  - Primary: Judge0 API (cloud-based, sandboxed execution)
  - Fallback: Local execution for reliability
- **Batched Test Execution**: Run all test cases efficiently in a single API call
- **Real-time Feedback**: Instant code execution results with detailed error messages
- **User Authentication**: Secure login with JWT and OAuth2 support
- **Submission Tracking**: Track solved problems and submission statistics

## 🏗️ Architecture

The project consists of three main components:

```
CodeVerse/
├── Backend/           # Java Spring Boot REST API
├── Frontend/          # React + Vite application
└── server/            # Node.js Executor Proxy
```

### Component Details

1. **Backend** (`Backend/codeverse-backend/`)
   - Java 21 + Spring Boot 3.x
   - PostgreSQL database
   - JWT authentication
   - RESTful API for problems, submissions, and user management
   - Port: `8081`

2. **Frontend** (`Frontend/Codeverse-main/codeverse/`)
   - React 18 with Vite
   - Monaco Editor for code editing
   - Axios for API calls
   - React Router for navigation
   - Port: `5173`

3. **Executor Proxy** (`server/`)
   - Node.js + Express
   - Handles code execution via Judge0 API or local runtime
   - Supports Python, JavaScript, Java, C++
   - Port: `3000`

## 📋 Prerequisites

### Option 1: Docker (Recommended - Easiest Setup)
- **Docker Desktop** - [Download here](https://www.docker.com/products/docker-desktop)

### Option 2: Manual Installation
- **Java 21** or higher
- **Maven 3.6+**
- **Node.js 18+** and npm
- **PostgreSQL 12+**
- **Python 3.x** (for Python code execution)
- **Judge0 API Key** (optional, for cloud execution)

## 🚀 Quick Start with Docker (3 Simple Steps!)

**For Windows:**
```bash
# 1. Clone the repository
git clone <repository-url>
cd CodeVerse-main

# 2. Run the startup script
start.bat

# 3. Access the application at http://localhost:5173
```

**For Linux/Mac:**
```bash
# 1. Clone the repository
git clone <repository-url>
cd CodeVerse-main

# 2. Make the script executable and run
chmod +x start.sh
./start.sh

# 3. Access the application at http://localhost:5173
```

**That's it!** 🎉 All services (Database, Backend, Executor, Frontend) will start automatically.

### Docker Commands

```bash
# View logs
docker-compose logs -f

# View logs for specific service
docker-compose logs -f backend

# Stop all services
docker-compose down

# Stop and remove all data
docker-compose down -v

# Rebuild after code changes
docker-compose up --build
```

### Why Docker?

| Aspect | Docker Setup | Manual Setup |
|--------|--------------|--------------|
| **Setup Time** | 2-3 minutes | 10-15 minutes |
| **Prerequisites** | Docker Desktop only | Java 21, Maven, Node.js, PostgreSQL, Python |
| **Commands** | 1 command (`start.bat`) | 10+ commands across 3 terminals |
| **Consistency** | Same environment everywhere | "Works on my machine" issues |
| **Cleanup** | `docker-compose down -v` | Manual uninstall of all tools |

**Bottom line:** With Docker, anyone can run the entire project by just installing Docker Desktop and running `start.bat` - no other tools needed! 🎉

---

## 🛠️ Manual Installation (Without Docker)

### 1. Database Setup

```sql
-- Create database
CREATE DATABASE codeverse;

-- Import schema (provided in Backend)
\i Backend/codeverse-backend/schema.sql
```

### 2. Backend Setup

```bash
cd Backend/codeverse-backend

# Configure database in application.properties
# Update: spring.datasource.url, username, password

# Build and run
.\run.bat         # Windows
# OR
./run.sh          # Linux/Mac
```

### 3. Executor Proxy Setup

```bash
cd server

# Install dependencies
npm install

# Configure .env file
# Optional: Add Judge0 API credentials
# USE_JUDGE0=true
# JUDGE0_API_KEY=your_api_key
# JUDGE0_API_HOST=judge0-ce.p.rapidapi.com

# Start server
npm start
```

### 4. Frontend Setup

```bash
cd Frontend/Codeverse-main/codeverse

# Install dependencies
npm install

# Start development server
npm run dev
```

## 🚦 Running the Application

1. **Start Backend**: `cd Backend/codeverse-backend && .\run.bat`
2. **Start Executor Proxy**: `cd server && npm start`
3. **Start Frontend**: `cd Frontend/Codeverse-main/codeverse && npm run dev`

Access the application at: **http://localhost:5173**

## 🔧 Configuration

### Environment Variables (server/.env)

```env
# Judge0 Configuration
JUDGE0_API_KEY=your_api_key_here
JUDGE0_API_HOST=judge0-ce.p.rapidapi.com
USE_JUDGE0=true  # Set to false to use only local execution
```

### Application Properties (Backend)

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/codeverse
spring.datasource.username=postgres
spring.datasource.password=your_password
```

## 🎯 How It Works

### Code Execution Flow

1. User submits code from the Frontend
2. Frontend sends request to Backend API
3. Backend wraps code with test case driver
4. Backend forwards to Executor Proxy
5. Executor Proxy:
   - Tries Judge0 API first (if enabled)
   - Falls back to local execution if Judge0 fails
6. Results returned to Frontend for display

### Batched Test Cases

When running all tests, the system:
- Gathers all test cases into a JSON array
- Wraps user code with a loop to process all test cases
- Executes once and parses the batched output
- Significantly faster than individual executions

## 🔒 Security Features

- JWT-based authentication
- OAuth2 social login support
- CORS configuration
- SQL injection prevention (JPA)
- Sandboxed code execution (Judge0)
- Temporary file cleanup

## 📁 Project Structure

```
CodeVerse-main/
├── Backend/
│   └── codeverse-backend/
│       ├── src/main/java/com/codeverse/
│       │   ├── controller/
│       │   ├── service/
│       │   ├── entity/
│       │   ├── repository/
│       │   ├── security/
│       │   └── config/
│       └── pom.xml
├── Frontend/
│   └── Codeverse-main/
│       └── codeverse/
│           ├── src/
│           │   ├── Pages/
│           │   ├── Components/
│           │   └── service/
│           └── package.json
└── server/
    ├── server.js
    ├── .env
    └── package.json
```

## 🐛 Troubleshooting

### Backend won't start
- Check Java version: `java -version`
- Verify PostgreSQL is running
- Check database credentials in `application.properties`

### Frontend errors
- Clear node_modules: `rm -rf node_modules && npm install`
- Check that Backend is running on port 8081

### Code execution fails
- For Python: Ensure `py` command is available
- For local execution: Check language runtimes are installed
- For Judge0: Verify API key and internet connection

## 📝 License

This project is available for educational purposes.

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

---

**Built with ❤️ using Spring Boot, React, and Node.js**
