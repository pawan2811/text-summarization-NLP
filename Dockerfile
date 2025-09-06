FROM python:3.8-slim-bullseye

# Install system dependencies
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        build-essential \
        gcc \
        git \
        libffi-dev \
        libssl-dev \
        python3-dev \
        curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Upgrade pip and install Python dependencies
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Upgrade accelerate and transformers explicitly
RUN pip install --no-cache-dir --upgrade accelerate transformers

# Set default command
CMD ["python3", "app.py"]
