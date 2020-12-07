#!/bin/bash

git clone --single-branch --branch v1.5.3 https://github.com/rook/rook.git

kubectl create -f rook/cluster/examples/kubernetes/ceph/crds.yaml
kubectl create -f rook/cluster/examples/kubernetes/ceph/common.yaml
kubectl create -f rook/cluster/examples/kubernetes/ceph/operator.yaml

### verify the rook-ceph-operator is in the `Running` state before proceeding
kubectl -n rook-ceph get pod --watch
### NAME                                  READY   STATUS    RESTARTS   AGE
### rook-ceph-operator-667756ddb6-spzpt   1/1     Running   0          2m9s
### rook-discover-54vcm                   1/1     Running   0          83s
### rook-discover-tfsl4                   1/1     Running   0          83s
### rook-discover-v26jr                   1/1     Running   0          83s
