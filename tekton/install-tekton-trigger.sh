#!/usr/bin/bash

kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
# TEKTON_TRIGGER_VERSION="0.6.1"
# kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/v${TEKTON_TRIGGER_VERSION}/release.yaml
