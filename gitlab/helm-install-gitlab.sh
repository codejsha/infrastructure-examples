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
    --set global.hosts.domain="gitlab.example.com" \
    --set global.ingress.configureCertmanager="false" \
    --set global.ingress.annotations."kubernetes\.io/ingress\.class"="nginx" \
    --set certmanager.install="false" \
    --set nginx-ingress.install="false" \
    --version 4.2.1 \
    gitlab/gitlab
