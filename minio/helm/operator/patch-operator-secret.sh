#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export OPERATOR_PRIVATE_KEY="$(kubectl get secret --namespace minio-operator operator-cert --output jsonpath="{.data['tls\.key']}")"
export OPERATOR_PUBLIC_CERT="$(kubectl get secret --namespace minio-operator operator-cert --output jsonpath="{.data['tls\.crt']}")"
export OPERATOR_CA_CERT="$(kubectl get secret --namespace minio-operator operator-cert --output jsonpath="{.data['ca\.crt']}")"

envsubst < ./operator-secret.yaml > ./operator-secret-temp.yaml
envsubst < ./operator-ca-secret.yaml > ./operator-ca-secret-temp.yaml

kubectl patch secret --namespace minio-operator operator-tls --type merge --patch-file operator-secret-temp.yaml
kubectl apply --namespace minio-operator --filename operator-ca-secret-temp.yaml
