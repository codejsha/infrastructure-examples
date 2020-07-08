#!/usr/bin/bash

curl -sL https://istio.io/downloadIstioctl | sh -
export PATH=$PATH:$HOME/.istioctl/bin
istioctl version

istioctl operator init
kubectl create namespace istio-system

istioctl profile list
### Istio configuration profiles:
###     minimal
###     preview
###     remote
###     default
###     demo
###     empty

istioctl install \
    --set addonComponents.grafana.enabled=true \
    --set addonComponents.kiali.enabled=true \
    --set addonComponents.prometheus.enabled=true \
    --set addonComponents.tracing.enabled=true \
    --set profile=default

# istioctl install --set profile=demo

# kubectl get services -n istio-system
# kubectl get pods -n istio-system
