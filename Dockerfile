# Start from rocker with R 4.3.2
FROM node:20-bullseye

# Install system packages
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    curl \
    python3 \
    python3-pip \
    nodejs \
    npm

# Install R packages
# RUN R -e "install.packages(c('mirt', 'jsonlite'), repos='https://cloud.r-project.org')"

# Install Python packages
RUN pip3 install pandas matplotlib PyMuPDF

# Set working directory
WORKDIR /app

WORKDIR /app

# 1. Copy dependencies first (better for caching)
COPY backend/package*.json ./
RUN npm install

# 2. Copy EVERYTHING from the backend folder into /app
COPY backend/ .

# 3. Expose and Start
ENV PORT=8080
EXPOSE 8080
CMD ["node", "server.js"]
