# Inside frontend/Dockerfile
FROM node:18-alpine AS build
WORKDIR /app
# Note the path: if you set the context to '.', you use 'frontend/package.json'
# If you set context to 'frontend', you use 'package.json'
COPY frontend/package*.json ./ 
RUN npm install
COPY frontend/ .
RUN npm run build
...
