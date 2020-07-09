#!/usr/bin/bash
# https://istio.io/latest/docs/setup/install/standalone-operator/

### depete the istio deployment
kubectl delete istiooperators.install.istio.io -n istio-system example-istiocontrolplane

### delete the istio operator
istioctl operator remove
# kubectl delete ns istio-operator --grace-period=0 --force

### clean up resources
# istioctl manifest generate | kubectl delete -f -
# kubectl delete ns istio-system --grace-period=0 --force
