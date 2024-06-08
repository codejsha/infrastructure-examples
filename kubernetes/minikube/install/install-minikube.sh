#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### debian
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
# sudo dpkg -i minikube_latest_amd64.deb
# rm -f minikube_latest_amd64.deb

### rpm
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
# sudo rpm -Uvh minikube-latest.x86_64.rpm
# rm -f minikube-latest.x86_64.rpm

### binary
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm -f minikube-linux-amd64
