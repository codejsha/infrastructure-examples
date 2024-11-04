######################################################################

### krew

kubectl cert-manager check api

kubectl cert-manager status certificate minio1-cert
kubectl cert-manager inspect secret minio1-cert

######################################################################

### debug

kubectl get endpoints -n cert-manager my-cert-manager-webhook
