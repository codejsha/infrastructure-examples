#!/usr/bin/bash
# https://github.com/tektoncd/operator
# rerequisites: kubernetes cluster, kubectl, tkn

kubectl apply -f https://storage.googleapis.com/tekton-releases/operator/latest/release.notags.yaml

# tkn version
# kubectl get tektonpipelines cluster -o jsonpath='{.status.conditions[0]}'
