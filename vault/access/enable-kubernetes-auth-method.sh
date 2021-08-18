#!/bin/bash

KUBERNETES_HOST_URL="https://kubernetes.docker.internal:6443"

vault auth enable kubernetes

vault write auth/kubernetes/config \
    token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
    kubernetes_host="${KUBERNETES_HOST_URL}" \
    kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
