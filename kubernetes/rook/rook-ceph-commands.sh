######################################################################

### rook-ceph-password
kubectl get secret rook-ceph-dashboard-password --namespace rook-ceph --output jsonpath="{['data']['password']}" | base64 --decode && echo
