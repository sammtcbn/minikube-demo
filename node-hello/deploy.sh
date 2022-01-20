#!/bin/bash
COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';

function print_green()
{
    echo -e "${COLOR_GREEN}$@${COLOR_REST}"
}

print_green "kubectl create deployment node-hello --image=gcr.io/google_samples/node-hello:1.0"
kubectl create deployment node-hello --image=gcr.io/google_samples/node-hello:1.0

print_green "kubectl wait deploy/node-hello --for condition=available --timeout=600s"
kubectl wait deploy/node-hello --for condition=available --timeout=600s

print_green "kubectl expose deployment node-hello --type=NodePort --port=8080"
kubectl expose deployment node-hello --type=NodePort --port=8080

print_green "minikube ip"
clusterip=$(minikube ip)
echo cluster ip is ${clusterip}

print_green "minikube service node-hello --url"
serviceurl=$(minikube service node-hello --url)

print_green "curl ${serviceurl}"
curl ${serviceurl}
