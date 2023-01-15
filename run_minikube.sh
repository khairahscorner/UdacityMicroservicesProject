# Deploy containerised app to Kubernetes locally - minikube

#!/usr/bin/env bash

# Step 1:
minikube start
dockerimage=khairahscorner/project4:port3030

# Step 2 - create deployment (creates a single pod) and service with default name as the deployment name
kubectl create deployment v1 --image=$dockerimage
kubectl expose deployment v1 --type=NodePort --port=3030

# alternatively, create the deployment and service with files that have been configured
# kubectl apply -f deployConfig.yml
# kubectl apply -f serviceConfig.yml


# Step 3:
# get name of pod (only useful if you have one pod)
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME
kubectl wait --for=condition=Ready pod/$POD_NAME

#Step 4:
# Forward the (pod/container) port to localhost to access in browser: kubectl port-forward TYPE/NAME [options] LOCAL_PORT:REMOTE_PORT
kubectl port-forward pod/$POD_NAME --address 0.0.0.0 3030:3030






# minkube kubectl -- command is a workaround for windows if kubectl does not work


