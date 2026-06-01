######################################################################

### install
kubectl apply --f https://github.com/jetstack/cert-manager/releases/latest/download/cert-manager.yaml
### for specific version:
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.20.2/cert-manager.yaml

### uninstall
kubectl get Issuers,ClusterIssuers,Certificates,CertificateRequests,Orders,Challenges --all-namespaces

######################################################################

### krew

kubectl cert-manager check api

kubectl cert-manager status certificate minio1-cert
kubectl cert-manager inspect secret minio1-cert

######################################################################

### cmctl

### homebrew
brew install cmctl

### manual
OS=$(go env GOOS); ARCH=$(go env GOARCH); curl -fsSL -o cmctl https://github.com/cert-manager/cmctl/releases/latest/download/cmctl_${OS}_${ARCH}
chmod +x cmctl
sudo mv cmctl /usr/local/bin

### go
go install github.com/cert-manager/cmctl/v2@latest

######################################################################

cmctl check api
cmctl check api --wait=2m

######################################################################

### debug

kubectl get pods --namespace cert-manager
kubectl get endpoints -n cert-manager cert-manager-webhook
