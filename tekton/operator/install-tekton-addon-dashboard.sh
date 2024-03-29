#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="tekton-pipelines"
kubectl create namespace ${NAMESPACE}
kubectl config set-context --current --namespace "${NAMESPACE}"

kubectl create clusterrolebinding tekton-operator-cluster-admin --clusterrole cluster-admin --serviceaccount tekton-operator:tekton-operator

cat <<EOF > ./tekton-addon-dashboard.yaml
apiVersion: operator.tekton.dev/v1alpha1
kind: TektonAddon
metadata:
  name: dashboard
spec:
  version: v0.8.2
EOF

kubectl apply --filename tekton-addon-dashboard.yaml

### check
# kubectl get tektonaddon dashboard --output jsonpath='{.status.conditions[0]}'
