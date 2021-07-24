#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

kubectl apply --filename rook/cluster/examples/kubernetes/ceph/cluster-test.yaml
kubectl apply --filename rook/cluster/examples/kubernetes/ceph/pool-test.yaml
# kubectl apply --filename rook/cluster/examples/kubernetes/ceph/filesystem-test.yaml
kubectl apply --filename rook/cluster/examples/kubernetes/ceph/object-test.yaml
kubectl apply --filename rook/cluster/examples/kubernetes/ceph/storageclass-bucket-delete.yaml
# kubectl apply --filename rook/cluster/examples/kubernetes/ceph/storageclass-bucket-retain.yaml
kubectl apply --filename rook/cluster/examples/kubernetes/ceph/toolbox.yaml
kubectl apply --filename rook/cluster/examples/kubernetes/ceph/csi/rbd/storageclass-test.yaml

# kubectl apply --filename rook/cluster/examples/kubernetes/ceph/dashboard-ingress-https.yaml
# kubectl apply --filename rook/cluster/examples/kubernetes/ceph/dashboard-loadbalancer.yaml
kubectl apply ../dashboard-ingress.yaml
