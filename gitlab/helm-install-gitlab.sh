#!/usr/bin/bash
# https://docs.gitlab.com/charts
# https://gitlab.com/gitlab-org/charts/gitlab

helm repo add gitlab https://charts.gitlab.io
helm repo update

NAMESPACE="git-system"
kubectl create namespace ${NAMESPACE}

helm install my-gitlab \
    --namespace ${NAMESPACE} \
    --set global.edition="ce" \
    --set global.hosts.domain="git.example.com" \
    --set certmanager.install="false" \
    --set global.ingress.configureCertmanager="false" \
    gitlab/gitlab --dry-run
