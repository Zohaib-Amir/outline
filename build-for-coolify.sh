#!/bin/bash

echo "Building Outline for Coolify using the official Docker Hub build process..."

echo "Step 1: Building base image (Dockerfile.base)..."
docker-compose -f docker-compose.coolify.yml build outline-base

if [ $? -eq 0 ]; then
    echo "✅ Base image built successfully"
    echo "Step 2: Building final image (Dockerfile)..."
    docker-compose -f docker-compose.coolify.yml build outline
    
    if [ $? -eq 0 ]; then
        echo "✅ Final image built successfully"
        echo "🚀 Ready to deploy! Use: docker-compose -f docker-compose.coolify.yml up"
    else
        echo "❌ Failed to build final image"
        exit 1
    fi
else
    echo "❌ Failed to build base image"
    exit 1
fi 