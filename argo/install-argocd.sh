#!/usr/bin/bash

kubectl create namespace argocd
### Non HA
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v1.7.4/manifests/install.yaml
### HA
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v1.7.4/manifests/ha/install.yaml

