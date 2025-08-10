FROM node:20-alpine

ARG N8N_VERSION=latest

# Install dependencies
RUN apk add --update graphicsmagick tzdata python3 make g++ \
    && npm install -g n8n@${N8N_VERSION} \
    && apk del make g++

# Set working directory
WORKDIR /data

# Set environment variables (Railway will override)
ENV N8N_PORT=5678
ENV N8N_USER_FOLDER=/data

# Expose port
EXPOSE $N8N_PORT

# Start n8n
CMD ["n8n"]
