# Deploy to AWS EKS 

dockerimage=khairahscorner/project4:port3030

# create a namespace if necessary
# kubectl create namespace python-apps

# if cluster is new, configure kubectl to communicate with the cluster
aws eks update-kubeconfig --name ml-api

#create a deployment with the docker image for the app (always rebuild and upload to docker for an updated version)
kubectl create deployment udacity-api --image=$dockerimage --replicas=1

#create a service of type load balancer to automatically create an elb that directs traffic to the app container in the pod 
#(access the app using its external IP)
kubectl expose deployment udacity-api --type=LoadBalancer --port=80 --target-port=3030

kubectl get svc


# kubectl apply -f deployConfig.yml
# kubectl apply -f serviceConfig.yml 

