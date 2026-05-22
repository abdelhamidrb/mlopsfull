FROM jenkins/jenkins:latest

USER root

RUN apt-get update && apt-get install -y \
    git curl wget build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Miniforge
RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O /tmp/miniforge.sh && \
    bash /tmp/miniforge.sh -b -p /opt/conda && \
    rm /tmp/miniforge.sh

ENV PATH="/opt/conda/bin:${PATH}"

# Create env and pre-install heavy packages (CPU-only torch)
RUN conda create -n mlopsfull python=3.10 -y && \
    /opt/conda/envs/mlopsfull/bin/pip install --no-cache-dir \
    setuptools==68.2.2 click==8.1.7 \
    torch==2.0.0+cpu -f https://download.pytorch.org/whl/torch_stable.html \
    numpy==1.24.3 scikit-learn==1.2.2 pandas==2.0.1 \
    mlflow==2.3.1 transformers==4.28.1 ray==2.7.0 \
    flake8==6.0.0 pytest==7.3.1 typer==0.9.0 \
    nltk==3.8.1 fastapi==0.95.2

USER jenkins