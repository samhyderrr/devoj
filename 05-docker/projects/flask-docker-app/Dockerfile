# =========================
# STAGE 1 — BUILD STAGE
# =========================

# Use Python 3.8 slim as the base image and name this stage "build"
FROM python:3.8-slim AS build

# Set /app as the working directory inside the build stage
WORKDIR /app

# Install the Linux packages needed to BUILD mysqlclient
RUN apt-get update && apt-get install -y \
    pkg-config \
    default-libmysqlclient-dev \
    build-essential

# Install Flask and mysqlclient into /install
# This lets us copy the Python packages into Stage 2
RUN pip install --prefix=/install \
    flask \
    mysqlclient

# Copy our project files into /app
COPY . .


# =========================
# STAGE 2 — RUNTIME STAGE
# =========================

# Start again with a fresh Python 3.8 slim image
FROM python:3.8-slim

# Set /app as the working directory
WORKDIR /app

# Install ONLY the library mysqlclient needs to run
# We do not install the compiler/build tools from Stage 1
RUN apt-get update && apt-get install -y \
    libmariadb3 \
    && rm -rf /var/lib/apt/lists/*

# Copy the Python packages built/installed in Stage 1
COPY --from=build /install /usr/local

# Copy our application files from Stage 1
COPY --from=build /app /app

# Document that Flask uses port 5002
EXPOSE 5002

# Start Flask
CMD ["python", "app.py"]