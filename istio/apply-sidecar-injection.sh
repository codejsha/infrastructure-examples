#!/usr/bin/bash

NAMESPACE="NAMESPACE"

kubectl label namespace ${NAMESPACE} istio-injection=enabled
kubectl get namespace -L istio-injection

istioctl proxy-status
