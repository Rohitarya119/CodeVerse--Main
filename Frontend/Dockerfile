# Build stage
FROM node:22-alpine

WORKDIR /app

# Install git (required for some dependencies/build steps)
RUN apk add --no-cache git

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Expose Vite port
EXPOSE 5173

# Run in development mode
CMD ["npm", "run", "dev", "--", "--host"]
