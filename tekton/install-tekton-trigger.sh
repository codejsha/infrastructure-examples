#!/usr/bin/bash

kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
# TEKTON_TRIGGER_VERSION="0.7.0"
# kubectl apply --filename https://github.com/tektoncd/triggers/releases/download/v${TEKTON_TRIGGER_VERSION}/release.yaml
