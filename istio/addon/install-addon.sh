#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

kubectl apply -f https://raw.githubusercontent.com/istio/istio/refs/heads/master/samples/addons/grafana.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/refs/heads/master/samples/addons/jaeger.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/refs/heads/master/samples/addons/kiali.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/refs/heads/master/samples/addons/loki.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/refs/heads/master/samples/addons/prometheus.yaml

######################################################################

### install
# cd ../istio-*/
# kubectl apply -f samples/addons

### delete
# cd ../istio-*/
# kubectl delete -f samples/addons
