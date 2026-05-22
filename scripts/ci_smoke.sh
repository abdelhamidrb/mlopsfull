#!/bin/bash
set -e

echo "==== CI Smoke Test Script ===="

# Set environment
export GITHUB_USERNAME=${GITHUB_USERNAME:-unknown-map}

# Create necessary directories
mkdir -p datasets results logs

# Quick smoke test with minimal data
python -m madewithml.train \
  --experiment-name ci-smoke \
  --dataset-loc datasets/dataset.csv \
  --train-loop-config '{"dropout_p":0.5,"lr":0.0001,"lr_factor":0.8,"lr_patience":3}' \
  --num-workers 1 \
  --cpu-per-worker 1 \
  --gpu-per-worker 0 \
  --num-samples 16 \
  --num-epochs 1 \
  --batch-size 8 \
  --results-fp results/ci_smoke_results.json

echo "✅ Smoke test passed"
