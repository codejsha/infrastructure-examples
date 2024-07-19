######################################################################

function istioctl() { echo "+ istioctl ${*}">&2; command istioctl "${*}"; }

[ -f ~/.istioctl/istioctl.bash ] && source ~/.istioctl/istioctl.bash

export PATH="${PATH}:${HOME}/.istioctl/bin"

######################################################################

### injection

### automatic sidecar injection
kubectl label namespace ${NAMESPACE} istio-injection=enabled
kubectl get namespace -L istio-injection
istioctl proxy-status

### manual sidecar injection
# kubectl apply --filename <(istioctl kube-inject -f httpbin.yaml)

### disable sidecar injection
# kubectl label namespace ${NAMESPACE} istio-injection-

######################################################################

kubectl get namespace -L istio-injection

kubectl describe gateways
kubectl describe virtualservices
kubectl describe destinationrules
kubectl describe serviceentries
kubectl describe workloadentries

kubectl get gw,vs,dr,se
kubectl get gateways
kubectl get virtualservices
kubectl get destinationrules
kubectl get serviceentries
kubectl get workloadentries

kubectl delete gw,vs,dr,se --all

######################################################################

### debugging envoy and istod

istioctl proxy-status
istioctl proxy-status my-gitea-0.gitea --vklog=8
istioctl proxy-status my-gitea-0.gitea --vklog=9

istioctl proxy-config cluster --namespace istio-system $(kubectl get pods --namespace istio-system --selector app=istio-ingressgateway --output jsonpath='{.items[0].metadata.name}')
istioctl proxy-config cluster --namespace istio-system $(kubectl get pods --namespace istio-system --selector app=istio-ingressgateway --output jsonpath='{.items[0].metadata.name}') --port 3000
istioctl proxy-config cluster --namespace istio-system $(kubectl get pods --namespace istio-system --selector app=istio-ingressgateway --output jsonpath='{.items[0].metadata.name}') --fqdn my-gitea-http.gitea.svc.cluster.local
istioctl proxy-config cluster --namespace istio-system $(kubectl get pods --namespace istio-system --selector app=istio-ingressgateway --output jsonpath='{.items[0].metadata.name}') --fqdn my-gitea-http.gitea.svc.cluster.local --output json | jq

istioctl proxy-config listener my-gitea-0.gitea
istioctl proxy-config listener my-gitea-0.gitea --port 15006
istioctl proxy-config listener my-gitea-0.gitea --port 15006 --output json | jq
istioctl proxy-config listener my-gitea-0.gitea --port 15001
istioctl proxy-config listener my-gitea-0.gitea --port 15001 --output json | jq
istioctl proxy-config listener my-gitea-0.gitea --address 0.0.0.0

istioctl proxy-config route my-gitea-0.gitea
istioctl proxy-config route my-gitea-0.gitea --name 3000
istioctl proxy-config route my-gitea-0.gitea --name 3000 --output json | jq

istioctl proxy-config endpoint my-gitea-0.gitea
istioctl proxy-config endpoint my-gitea-0.gitea --port 3000
istioctl proxy-config endpoint my-gitea-0.gitea --address $(kubectl get pod my-gitea-0 --output jsonpath='{.status.podIP}')
istioctl proxy-config endpoint my-gitea-0.gitea --address $(kubectl get pod my-gitea-0 --output jsonpath='{.status.podIP}') --output json | jq

######################################################################

### debug tls

### control plane log
kubectl logs -l istio=ingressgateway -c istio-proxy -n istio-system

### istio sidecar log
kubectl logs -f my-gitea-0 -c istio-proxy

