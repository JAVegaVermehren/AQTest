# Step 1: Build the React/Vite app
FROM node:18-alpine AS build
WORKDIR /app

# We are building from the ROOT of the repo, so we specify the 'frontend' folder
COPY frontend/package*.json ./
RUN npm install

# Copy the rest of the frontend files
COPY frontend/ .
RUN npm run build

# Step 2: Serve with Nginx
FROM nginx:stable-alpine
# Copy the 'dist' folder created by the build step
COPY --from=build /app/dist /usr/share/nginx/html

# Point Nginx to Port 8080 (Required for Cloud Run)
RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
