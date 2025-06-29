######################################################################

### install kustomize
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
sudo mv kustomize /usr/local/bin
sudo chown root:root /usr/local/bin/kustomize

### homebrew
brew install kustomize

### chocolatey
choco install -y kustomize

### docker
docker pull registry.k8s.io/kustomize/kustomize:v5.0.0

######################################################################

kubectl kustomize | kubectl apply --recursive -f -
kubectl kustomize | kubectl delete -f -

kustomize build
kustomize build . | kubectl apply -f -
kustomize build . | kubectl delete -f -

######################################################################

### docker

alias kustomize="docker container run k8s.gcr.io/kustomize/kustomize:v3.8.7"

docker container run k8s.gcr.io/kustomize/kustomize:v3.8.7 version
