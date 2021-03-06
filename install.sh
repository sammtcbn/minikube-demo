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

sudo apt -y update

sudo apt -y install curl

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube version

#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
#echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
#sudo apt -y update
#sudo apt -y install kubectl kubeadm
sudo snap install kubectl --classic

sudo apt -y install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
docker --version
newgrp docker
