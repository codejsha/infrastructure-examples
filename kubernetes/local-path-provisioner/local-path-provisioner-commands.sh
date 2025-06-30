######################################################################

### install
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.31/deploy/local-path-storage.yaml

### install (kustomize)
kustomize build "github.com/rancher/local-path-provisioner/deploy?ref=v0.0.31" | kubectl apply -f -
