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
