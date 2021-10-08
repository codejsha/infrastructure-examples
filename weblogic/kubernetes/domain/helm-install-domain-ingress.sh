#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

helm install sample-domain1-ingress \
    --namespace sample-domain1-ns \
    --set wlsDomain.domainUID="sample-domain1" \
    --set traefik.hostname="sample-domain1.example.com" \
    ../weblogic-kubernetes-operator/kubernetes/samples/charts/ingress-per-domain
