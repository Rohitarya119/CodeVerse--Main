# Docker Setup for CodeVerse

This document provides additional details about the Docker configuration.

## Contents

### Docker Files Created

1. **docker-compose.yml** - Orchestrates all services
2. **Backend/codeverse-backend/Dockerfile** - Java Spring Boot container
3. **server/Dockerfile** - Node.js Executor Proxy container
4. **Frontend/Codeverse-main/codeverse/Dockerfile** - React frontend container
5. **Frontend/Codeverse-main/codeverse/nginx.conf** - Nginx configuration for production
6. **.dockerignore** - Excludes unnecessary files from Docker builds
7. **.env.example** - Template for environment variables
8. **start.bat** / **start.sh** - Startup scripts for easy deployment

## Services

### 1. PostgreSQL Database
- **Image**: postgres:15-alpine
- **Port**: 5432
- **Volume**: `postgres_data` for data persistence
- **Health check**: Ensures database is ready before starting dependent services

### 2. Backend (Spring Boot)
- **Base image**: eclipse-temurin:21-jre-alpine
- **Build**: Multi-stage build for optimal image size
- **Port**: 8081
- **Dependencies**: Waits for PostgreSQL health check

### 3. Executor Proxy (Node.js)
- **Base image**: node:18-alpine
- **Additional**: Python 3 for local code execution
- **Port**: 3000
- **Volume**: `executor_temp` for temporary code execution files

### 4. Frontend (React)
- **Build image**: node:18-alpine (for Vite build)
- **Runtime image**: nginx:alpine (production server)
- **Port**: 5173 (mapped to nginx port 80)
- **Features**: Gzip compression, caching, SPA routing

## Environment Configuration

Edit `.env` file to configure:

```env
# Judge0 API (Optional)
JUDGE0_API_KEY=your_api_key_here
JUDGE0_API_HOST=judge0-ce.p.rapidapi.com

# Database (defaults work with docker-compose)
POSTGRES_DB=codeverse
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
```

## Production Considerations

### Security
- [ ] Change default PostgreSQL password
- [ ] Use secrets management for Judge0 API key
- [ ] Configure HTTPS/SSL for production
- [ ] Set up proper CORS origins

### Scaling
```yaml
# In docker-compose.yml, add replicas for executor:
executor:
  deploy:
    replicas: 3
```

### Monitoring
```bash
# View resource usage
docker stats

# Health checks
docker-compose ps
```

### Backup Database
```bash
# Backup
docker exec codeverse-db pg_dump -U postgres codeverse > backup.sql

# Restore
cat backup.sql | docker exec -i codeverse-db psql -U postgres codeverse
```

## Troubleshooting

### Port Already in Use
```bash
# Find process using port 5173
netstat -ano | findstr :5173

# Kill the process or change port in docker-compose.yml
```

### Container Won't Start
```bash
# View logs
docker-compose logs backend

# Rebuild fresh
docker-compose down -v
docker-compose up --build
```

### Database Connection Issues
```bash
# Check if database is healthy
docker-compose ps

# Restart database
docker-compose restart postgres
```

## Development vs Production

### Development (Current Setup)
- Hot reload disabled (requires volume mounts)
- Logs to stdout
- No HTTPS

### Production Recommendations
1. Use environment-specific `.env` files
2. Enable HTTPS with reverse proxy (nginx/traefik)
3. Set up database backups
4. Configure log aggregation
5. Use container orchestration (Kubernetes/Docker Swarm)

## Advanced Usage

### Run Specific Service
```bash
docker-compose up backend executor
```

### Rebuild Single Service
```bash
docker-compose build frontend
docker-compose up -d frontend
```

### Access Container Shell
```bash
docker exec -it codeverse-backend sh
docker exec -it codeverse-db psql -U postgres codeverse
```

### Clean Everything
```bash
# Remove containers, networks, volumes, images
docker-compose down -v --rmi all
```
