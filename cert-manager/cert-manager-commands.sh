######################################################################

### install

kubectl apply --f https://github.com/jetstack/cert-manager/releases/latest/download/cert-manager.yaml

# for specific version:
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.yaml

######################################################################

### krew

kubectl cert-manager check api

kubectl cert-manager status certificate minio1-cert
kubectl cert-manager inspect secret minio1-cert

######################################################################

### debug

kubectl get endpoints -n cert-manager my-cert-manager-webhook
