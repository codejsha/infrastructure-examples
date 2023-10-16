#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

minikube addons enable ambassador
minikube addons enable auto-pause
minikube addons enable cloud-spanner
minikube addons enable csi-hostpath-driver
minikube addons enable dashboard
minikube addons enable default-storageclass
minikube addons enable efk
minikube addons enable freshpod
minikube addons enable gcp-auth
minikube addons enable gvisor
minikube addons enable headlamp
minikube addons enable helm-tiller
minikube addons enable inaccel
minikube addons enable ingress
minikube addons enable ingress-dns
minikube addons enable istio
minikube addons enable istio-provisioner
minikube addons enable kong
minikube addons enable kubevirt
minikube addons enable logviewer
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable nvidia-driver-installer
minikube addons enable nvidia-gpu-device-plugin
minikube addons enable olm
minikube addons enable pod-security-policy
minikube addons enable portainer
minikube addons enable registry
minikube addons enable registry-aliases
minikube addons enable registry-creds
minikube addons enable storage-provisioner
minikube addons enable storage-provisioner-gluste
minikube addons enable volumesnapshots
