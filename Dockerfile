FROM node:22.14.0-alpine

# Install required system dependencies
RUN apk add --no-cache python3 make g++

RUN npm install -g npm@11.1.0

# Install n8n globally
RUN npm install -g n8n

# Create config directory with proper permissions
RUN mkdir -p /home/node/.n8n \
    && chown -R node:node /home/node/.n8n

# Create non-root user and set permissions
USER node

# Set working directory and expose port
WORKDIR /home/node
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]