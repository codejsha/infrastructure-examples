######################################################################
### apache kafka
######################################################################

### broker list (kubernetes)
kubectl exec -it my-cluster-zookeeper-0 -- bin/zookeeper-shell.sh localhost:2181 ls /brokers/ids
