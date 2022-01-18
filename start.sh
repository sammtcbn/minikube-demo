#!/bin/bash
function failed()
{
    echo "$*" >&2
    exit 1
}

minikube start --driver=docker

minikube dashboard --url
