#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### docker
minikube start --driver=docker

### kvm
# minikube start --driver=kvm2

### podman
# minikube start \
#     --driver=podman \
#     --container-runtime=cri-o \
#     --cri-socket=/var/run/crio/crio.sock
