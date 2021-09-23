#!/bin/bash

export VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"
export VAULT_ADDR="http://vault.example.com"

NAMESPACE="vault-system"
KUBERNETES_HOST_URL="https://kubernetes.docker.internal:6443"

kubectl exec --namespace ${NAMESPACE} my-vault-0 -- vault login ${VAULT_TOKEN}

SERVICE_ACCOUNT_TOKEN="$(kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- cat /var/run/secrets/kubernetes.io/serviceaccount/token)"

vault auth enable kubernetes
kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault write auth/kubernetes/config \
    token_reviewer_jwt="${SERVICE_ACCOUNT_TOKEN}" \
    kubernetes_host="${KUBERNETES_HOST_URL}" \
    kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
