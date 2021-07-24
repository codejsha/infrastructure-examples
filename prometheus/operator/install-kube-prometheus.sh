#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

git clone --single-branch --branch release-0.8 https://github.com/prometheus-operator/kube-prometheus.git

kubectl create -f kube-prometheus/manifests/setup
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
kubectl create -f kube-prometheus/manifests/
