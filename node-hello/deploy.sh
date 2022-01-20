#!/bin/bash
kubectl create deployment node-hello --image=gcr.io/google_samples/node-hello:1.0

kubectl wait deploy/node-hello --for condition=available --timeout=600s

kubectl expose deployment node-hello --type=NodePort --port=8081

clusterip=$(minikube ip)
echo cluster ip is ${clusterip}

serviceurl=$(minikube service node-hello --url)
curl ${serviceurl}
