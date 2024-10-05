######################################################################

function kubectl() { echo "+ kubectl ${@}">&2; command kubectl "${@}"; }

[ -f ~/.aliases/kubectl_aliases ] && source ~/.aliases/kubectl_aliases

source <(kubectl completion bash)

######################################################################

kubectl api-versions

######################################################################

### kubectx and kubens

kubectx
kubectx -
kubectx -h
kubectx -c
kubectx --current
kubectx docker-desktop

kubens
kubens -
kubens -h
kubens -c
kubens --current
kubens kube-system

######################################################################

### apply and delete

cat <<EOF | kubectl apply -f -
EOF
cat <<EOF | kubectl create -f -
EOF
cat <<EOF | kubectl delete --recursive -f
EOF

kubectl delete jobs --grace-period=0 --force
kubectl delete jobs --all
kubectl delete jobs --all --grace-period=0 --force
kubectl delete pods --grace-period=0 --force
kubectl delete pods --all --grace-period=0 --force

######################################################################

### storageclass

kubectl get storageclass

### standard
kubectl annotate --overwrite storageclass standard storageclass.kubernetes.io/is-default-class=true
kubectl annotate --overwrite storageclass standard storageclass.kubernetes.io/is-default-class=false
### local-path
kubectl annotate --overwrite storageclass local-path storageclass.kubernetes.io/is-default-class=true
kubectl annotate --overwrite storageclass local-path storageclass.kubernetes.io/is-default-class=false
### rook-ceph-block
kubectl annotate --overwrite storageclass rook-ceph-block storageclass.kubernetes.io/is-default-class=true
kubectl annotate --overwrite storageclass rook-ceph-block storageclass.kubernetes.io/is-default-class=false

######################################################################

### dashboard

### dashboard password
kubectl describe secrets kubernetes-dashboard-token --namespace kube-system | grep token: | awk '{print $2}'
