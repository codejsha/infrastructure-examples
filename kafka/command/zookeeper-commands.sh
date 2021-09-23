######################################################################
### apache kafka
######################################################################

### broker list (kubernetes)
kubectl exec -it my-cluster-zookeeper-0 -- bin/zookeeper-shell.sh localhost:2181 ls /brokers/ids




######################################################################
### confluent kafka
######################################################################

### cluster controller
./zookeeper-shell localhost:2181 ls /controller

### broker id
./zookeeper-shell localhost:2181 ls /brokers/ids
./zookeeper-shell localhost:2181 ls /clusterlocal/brokers/ids
./zookeeper-shell zookeeper1:2181,zookeeper2:2181,zookeeper3:2181 ls /brokers/ids
./zookeeper-shell zookeeper1:2181,zookeeper2:2181,zookeeper3:2181 ls /clusterlocal/brokers/ids

### topic
./zookeeper-shell localhost:2181 ls /brokers/topics

### config
./zookeeper-shell localhost:2181 ls /config

### consumers (__consumer_offsets)
# ./zookeeper-shell localhost:2181 ls /consumers

######################################################################

### kubernetes

### kafka-confluent-operator znode
kubectl exec zookeeper-0 --container zookeeper -- zookeeper-shell localhost:2181 ls /kafka-confluent-operator/brokers/ids
