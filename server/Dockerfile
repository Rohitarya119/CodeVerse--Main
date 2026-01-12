FROM node:18-alpine

WORKDIR /app

# Install Python, C++, and Java for local code execution
RUN apk add --no-cache python3 py3-pip g++ openjdk17

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy application code
COPY . .

# Create temp directory for code execution
RUN mkdir -p /app/temp

# Expose port
EXPOSE 3000

# Run the application
CMD ["node", "server.js"]
