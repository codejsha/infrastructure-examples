######################################################################

[ -f ~/.istioctl/istioctl.bash ] && source ~/.istioctl/istioctl.bash

export PATH="${PATH}:${HOME}/.istioctl/bin"

######################################################################

### install istioctl

### download and install istioctl
curl -L https://istio.io/downloadIstio | sh -
cd istio-*/
cd bin
chmod +x istioctl
sudo /bin/cp -pf istioctl /usr/local/bin

### homebrew
brew install istioctl

### chocolatey
choco install -y istioctl

######################################################################

### version

istioctl version
# client version: 1.29.1
# control plane version: 1.29.1
# data plane version: 1.29.1 (2 proxies)

######################################################################

### install istio with istioctl

istioctl install -y --set profile=default

istioctl install --set profile=ambient --skip-confirmation

######################################################################

### sidecar injection

### automatic sidecar injection
kubectl label namespace ${NAMESPACE} istio-injection=enabled
kubectl get namespace -L istio-injection
istioctl proxy-status

### manual sidecar injection
kubectl apply --filename <(istioctl kube-inject -f httpbin.yaml)

### disable sidecar injection
kubectl label namespace ${NAMESPACE} istio-injection-

######################################################################

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

### ambient mesh

kubectl label namespace ${NAMESPACE} istio.io/dataplane-mode=ambient
kubectl get namespace -L istio.io/dataplane-mode

######################################################################

istioctl ztunnel-config all
istioctl ztunnel-config workloads

######################################################################

### debugging envoy and istod

PRODUCTPAGE_POD_NAME="$(kubectl get pods -l app=productpage -n bookinfo -o jsonpath='{.items[*].metadata.name}')"

istioctl proxy-status
istioctl ps
istioctl proxy-status ${PRODUCTPAGE_POD_NAME}.productpage --vklog=8
istioctl proxy-status ${PRODUCTPAGE_POD_NAME}.productpage --vklog=9

istioctl proxy-config all ${PRODUCTPAGE_POD_NAME}.bookinfo
istioctl pc all ${PRODUCTPAGE_POD_NAME}.bookinfo

ISTO_INGRESS_POD_NAME="$(kubectl get pods -l app=istio-ingressgateway -n istio-system -o jsonpath='{.items[*].metadata.name}')"
istioctl proxy-config cluster --namespace istio-system ${ISTO_INGRESS_POD_NAME}
istioctl proxy-config cluster --namespace istio-system ${ISTO_INGRESS_POD_NAME} --port 9080
istioctl proxy-config cluster --namespace istio-system ${ISTO_INGRESS_POD_NAME} --port 9080 --subset v1
istioctl proxy-config cluster --namespace istio-system ${ISTO_INGRESS_POD_NAME} --fqdn productpage.bookinfo.svc.cluster.local
istioctl proxy-config cluster --namespace istio-system ${ISTO_INGRESS_POD_NAME} --fqdn productpage.bookinfo.svc.cluster.local --subset v1
istioctl proxy-config cluster --namespace istio-system ${ISTO_INGRESS_POD_NAME} --fqdn productpage.bookinfo.svc.cluster.local --subset v1 --output json | jq

istioctl proxy-config listener ${PRODUCTPAGE_POD_NAME}.bookinfo
istioctl proxy-config listener ${PRODUCTPAGE_POD_NAME}.bookinfo --port 9080
istioctl proxy-config listener ${PRODUCTPAGE_POD_NAME}.bookinfo --port 9080 --output json | jq
istioctl proxy-config listener ${PRODUCTPAGE_POD_NAME}.bookinfo --port 15001
istioctl proxy-config listener ${PRODUCTPAGE_POD_NAME}.bookinfo --port 15006

istioctl proxy-config route ${PRODUCTPAGE_POD_NAME}.bookinfo
istioctl proxy-config route ${PRODUCTPAGE_POD_NAME}.bookinfo --name 9080
istioctl proxy-config route ${PRODUCTPAGE_POD_NAME}.bookinfo --name 9080 --output json | jq

istioctl proxy-config endpoint ${PRODUCTPAGE_POD_NAME}.bookinfo
istioctl proxy-config endpoint ${PRODUCTPAGE_POD_NAME}.bookinfo --port 9080
istioctl proxy-config endpoint ${PRODUCTPAGE_POD_NAME}.bookinfo --address $(kubectl get pod ${PRODUCTPAGE_POD_NAME} --output jsonpath='{.status.podIP}')
istioctl proxy-config endpoint ${PRODUCTPAGE_POD_NAME}.bookinfo --address $(kubectl get pod ${PRODUCTPAGE_POD_NAME} --output jsonpath='{.status.podIP}') --output json | jq

######################################################################

### debug tls

### control plane log
kubectl logs -l istio=ingressgateway -c istio-proxy -n istio-system

### istio sidecar log
kubectl logs -f ${PRODUCTPAGE_POD_NAME} -c istio-proxy -n bookinfo
