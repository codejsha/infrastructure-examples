#!/usr/bin/bash
# https://github.com/tektoncd/pipeline/

NAMESPACE="tekton-pipelines"
kubectl create namespace ${NAMESPACE}
kubectl config set-context --current --namespace="${NAMESPACE}"

kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
# TEKTON_PIPELINE_VERSION="0.15.2"
# kubectl apply --filename https://github.com/tektoncd/pipeline/releases/download/v${TEKTON_PIPELINE_VERSION}/release.yaml
