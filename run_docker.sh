#!/usr/bin/env bash

## steps to get the app running locally

# Step 1
# Build image and add a descriptive tag
docker build -t project4:port3030 .

# Step 2 
# Run flask app: docker run -p [container port]:[port exposed in app] [image to use] 
docker run -p 3030:3030 project4:port3030

# other ports that also work, both ports have to match for the host to forward the traffic to the container
# 8000, 3000
