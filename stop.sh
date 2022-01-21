#!/bin/bash
COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';

function print_green()
{
    echo -e "${COLOR_GREEN}$@${COLOR_REST}"
}

function failed()
{
    echo "$*" >&2
    exit 1
}

print_green "minikube stop"
minikube stop
