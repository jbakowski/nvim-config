#!/bin/bash
# Docker wrapper script for STM32 H7 builds
# Copy this to your H7 project root and make it executable

# Docker image name (customize this)
DOCKER_IMAGE="stm32-h7-builder"

# Run the build command inside Docker
docker run --rm \
    -v "$(pwd)":/workspace \
    -w /workspace \
    "$DOCKER_IMAGE" \
    bash -c "$*"
