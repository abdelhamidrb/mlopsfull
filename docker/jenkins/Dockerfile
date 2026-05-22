FROM jenkins/jenkins:latest

USER root

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install --no-cache-dir \
    mlflow==2.3.1 \
    ray==2.7.0 \
    torch==2.0.0 \
    transformers==4.28.1 \
    scikit-learn==1.2.2 \
    numpy==1.24.3 \
    pandas==2.0.1

USER jenkins
