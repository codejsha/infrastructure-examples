#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

bash ./install-addon.sh

######################################################################

### CERTIFICATES
cd vault

### cert-manager
kubectl apply --filename grafana-certificate.yaml
kubectl apply --filename kiali-certificate.yaml
kubectl apply --filename prometheus-certificate.yaml
kubectl apply --filename tracing-certificate.yaml

### openssl
# bash ./create-ingress-domain-certificate-with-openssl.sh

cd ..

######################################################################

### TRAFFIC MANAGEMENT
cd istio

kubectl apply --filename grafana-traffic-management.yaml
kubectl apply --filename kiali-traffic-management.yaml
kubectl apply --filename prometheus-traffic-management.yaml
kubectl apply --filename tracing-traffic-management.yaml

cd ..
