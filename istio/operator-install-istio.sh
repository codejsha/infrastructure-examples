#!/usr/bin/bash
# https://istio.io/latest/docs/setup/install/istioctl/
# https://istio.io/latest/docs/setup/install/standalone-operator/
# https://istio.io/latest/docs/setup/additional-setup/config-profiles/

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

# istioctl install --set profile=default
# istioctl install --set profile=demo

istioctl install \
    --set profile=default \
    --set values.gateways.istio-ingressgateway.enabled=true \
    --set values.gateways.istio-egressgateway.enabled=true \
    --set components.pilot.enabled=true \
    --set components.citadel.enabled=true \
    --set components.policy.enabled=true \
    --set components.telemetry.enabled=true \
    --set components.cni.enabled=false \
    --set addonComponents.grafana.enabled=true \
    --set addonComponents.kiali.enabled=true \
    --set addonComponents.prometheus.enabled=true \
    --set addonComponents.tracing.enabled=true \
    --set addonComponents.istiocoredns.enabled=false

# kubectl get services -n istio-system
# kubectl get pods -n istio-system
