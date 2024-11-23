######################################################################

export PATH="${PATH}:${KREW_ROOT:-"${HOME}/.krew"}/bin"

######################################################################

### krew

kubectl krew

kubectl krew index list
kubectl krew update

kubectl krew list
kubectl krew info
kubectl krew upgrade

kubectl krew install
kubectl krew uninstall

kubectl krew search
kubectl krew version

######################################################################

### commands

### ca-cert
kubectl ca-cert

### view secret
kubectl view-secret ${SECRET_NAME}

### tail
kubectl tail

### tree
kubectl tree
kubectl tree deployments
kubectl tree replicationcontrollers
kubectl tree replicasets
kubectl tree statefulsets
