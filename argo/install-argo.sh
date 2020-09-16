#!/usr/bin/bash

ARGO_VERSION="v2.10.1"

kubectl create namespace argo
kubectl apply -n argo -f https://raw.githubusercontent.com/argoproj/argo/${ARGO_VERSION}/manifests/install.yaml
