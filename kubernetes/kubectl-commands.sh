######################################################################

source <(kubectl completion bash)

function kubectl() { echo "+ kubectl ${@}">&2; command kubectl ${@}; }

[ -f ~/.aliases/kubectl_aliases ] && source ~/.aliases/kubectl_aliases

######################################################################

kubectl api-versions

### dashboard password
kubectl describe secrets kubernetes-dashboard-token --namespace kube-system | grep token: | awk '{print $2}'


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
