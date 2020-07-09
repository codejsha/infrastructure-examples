#!/usr/bin/bash
# https://rook.github.io/docs/rook/v1.3/ceph-quickstart.html

git clone --single-branch --branch release-1.3 https://github.com/rook/rook.git

kubectl create -f rook/cluster/examples/kubernetes/ceph/common.yaml
kubectl create -f rook/cluster/examples/kubernetes/ceph/operator.yaml

# verify the rook-ceph-operator is in the `Running` state before proceeding
kubectl -n rook-ceph get pod
