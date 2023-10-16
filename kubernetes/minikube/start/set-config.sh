#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### resource
# minikube config set memory 10240
minikube config set memory 16384
# minikube config set memory 32768
minikube config set cpus 4

### driver
# minikube config set driver none
# minikube config set driver kvm2
minikube config set driver docker
# minikube config set driver podman

### podman
# minikube config set driver podman
# minikube config set container-runtime cri-o
