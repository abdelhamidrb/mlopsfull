FROM jenkins/jenkins:latest

USER root

# Install dependencies
RUN apt-get update && apt-get install -y \
    git curl wget build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Miniforge (free, no TOS issues)
RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O /tmp/miniforge.sh && \
    bash /tmp/miniforge.sh -b -p /opt/conda && \
    rm /tmp/miniforge.sh

ENV PATH="/opt/conda/bin:${PATH}"

# Create Python 3.10 environment
RUN conda create -n mlopsfull python=3.10 -y

USER jenkins