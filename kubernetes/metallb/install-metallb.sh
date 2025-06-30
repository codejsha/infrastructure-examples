#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### Enable strict ARP mode
kubectl get configmap kube-proxy --namespace kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl diff --namespace kube-system --filename -

kubectl get configmap kube-proxy --namespace kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply --namespace kube-system --filename -

### Install MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.9/config/manifests/metallb-native.yaml

### Apply address pool configuration
kubectl apply --filename configmap.yaml
