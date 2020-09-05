#!/usr/bin/bash

kubectl create namespace argo
kubectl apply -n argo -f https://raw.githubusercontent.com/argoproj/argo/v2.10.1/manifests/install.yaml
