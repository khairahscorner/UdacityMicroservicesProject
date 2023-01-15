#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=khairahscorner/project4

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login
docker image tag project4:port3030 $dockerpath:port3030

# Step 3:
# Push image to a docker repository
docker image push $dockerpath:port3030
