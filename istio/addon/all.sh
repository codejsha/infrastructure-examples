#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

bash ./install-addon.sh

######################################################################

bash ./create-ingress-domain-certificate.sh
# bash ./create-ingress-domain-certificate-with-openssl.sh

######################################################################

kubectl apply --namespace istio-system --filename grafana-traffic-management.yaml
kubectl apply --namespace istio-system --filename kiali-traffic-management.yaml
kubectl apply --namespace istio-system --filename prometheus-traffic-management.yaml
kubectl apply --namespace istio-system --filename tracing-traffic-management.yaml
