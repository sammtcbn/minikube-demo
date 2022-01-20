#!/bin/bash
COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';

function print_green()
{
    echo -e "${COLOR_GREEN}$@${COLOR_REST}"
}

print_green "kubectl delete svc node-hello"
kubectl delete svc node-hello

print_green "kubectl delete deployment node-hello"
kubectl delete deployment node-hello
