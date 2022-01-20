#!/bin/bash
kubectl create deployment echoserver --image=gcr.io/google_containers/echoserver:1.8

kubectl wait deploy/echoserver --for condition=available --timeout=600s

kubectl expose deployment echoserver --type=NodePort --port=8080

clusterip=$(minikube ip)
echo cluster ip is ${clusterip}

serviceurl=$(minikube service echoserver --url)
curl ${serviceurl}
