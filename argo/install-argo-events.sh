#!/usr/bin/bash

kubectl create namespace argo-events
kubectl apply -n argo-events -f https://raw.githubusercontent.com/argoproj/argo-events/v1.0.0/manifests/install.yaml
