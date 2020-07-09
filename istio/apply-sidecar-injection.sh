#!/usr/bin/bash
# https://istio.io/latest/docs/setup/additional-setup/sidecar-injection/

NAMESPACE="NAMESPACE"

kubectl label namespace ${NAMESPACE} istio-injection=enabled
kubectl get namespace -L istio-injection

istioctl proxy-status
