#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=khairahscorner/project4

# Step 2
# Run the Docker Hub container with kubernetes
kubectl get nodes
kubectl create deployment project4 --image=$dockerpath:ml_api
kubectl expose deployment web --type=NodePort --port=8000

# Step 3:
# List kubernetes pods
kubectl get pods
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/$POD_NAME --address 0.0.0.0 8000:80
