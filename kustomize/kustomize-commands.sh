######################################################################

function kustomize() { echo "+ kustomize ${@}">&2; command kustomize ${@}; }

######################################################################

kubectl kustomize | kubectl apply --recursive -f -
kubectl kustomize | kubectl delete -f -

kustomize build
kustomize build . | kubectl apply -f -
kustomize build . | kubectl delete -f -
