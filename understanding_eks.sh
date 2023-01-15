#!/usr/bin/env bash

# run with source ./runeks.sh

# create namespace
kubectl create namespace udacity

# configure kubectl to communicate with the cluster
aws eks update-kubeconfig --name project4

# create deployment, service if using ingress controller to connect external elb
kubectl create deployment project4 --image=khairahscorner/project4:v1.3 
kubectl expose deployment project4 --type=NodePort --name=project4-service --port=80


# # alternatively, use  yaml files
kubectl apply -f deployConfig.yml --namespace=udacity
kubectl apply -f serviceConfig.yml --namespace=udacity


# to use an external load balancer (service was configured to nodePort), ingress controller is needed

# install helm via repo
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update

# create namespace
kubectl create namespace ingress-controllers

#install the helm chart for nginx ingress (the ingress controller)
helm install my-nginx-helm-chart nginx-stable/nginx-ingress --namespace ingress-controllers
#--set rbac.create=true

# #when pods are up and running, create ingress







