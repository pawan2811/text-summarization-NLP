# Use a newer base image with active repositories
FROM python:3.8-slim-bullseye

# Install system dependencies
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends awscli && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all project files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Upgrade accelerate and ensure latest transformers & accelerate
RUN pip install --no-cache-dir --upgrade accelerate transformers

# Set default command
CMD ["python3", "app.py"]
