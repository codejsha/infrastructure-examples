#!/usr/bin/bash
# https://istio.io/latest/docs/examples/bookinfo/

NAMESPACE="bookinfo"
kubectl create namespace ${NAMESPACE}
kubectl label namespace bookinfo istio-injection=enabled
kubectl config set-context "$(kubectl config current-context)" --namespace="${NAMESPACE}"

git clone https://github.com/istio/istio.git

### deploy bookinfo
kubectl apply -f istio/samples/bookinfo/platform/kube/bookinfo.yaml

### check bookinfo
# kubectl get services
# kubectl get pods
# kubectl exec -it $(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}') \
#     -c ratings -- curl productpage:9080/productpage | grep -o "<title>.*</title>"

### deploy bookinfo gateway
kubectl apply -f istio/samples/bookinfo/networking/bookinfo-gateway.yaml

### check bookinfo gateway
# kubectl get gateways
# istioctl analyze
# kubectl get services istio-ingressgateway -n istio-system

### delete
# kubectl delete -f istio/samples/bookinfo/platform/kube/bookinfo.yaml
# kubectl delete -f istio/samples/bookinfo/networking/bookinfo-gateway.yaml
