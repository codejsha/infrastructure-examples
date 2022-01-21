######################################################################
### confluent kafka
######################################################################

### login mds cluster
confluent login --ca-cert-path /var/ssl/private/ca.crt --url https://kafka1:8090

### context
confluent context list

######################################################################

### cluster

### list
confluent cluster list

######################################################################

### role binding list

confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:mds
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:kafka
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:schema-registry
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:kafka-connect
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:kafka-rest
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:ksqldb
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:control-center

confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id schema-cluster --principal User:schema-registry
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --connect-cluster-id connect-cluster --principal User:kafka-connect
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --ksql-cluster-id ksql-cluster --principal User:ksqldb

######################################################################

### create role binding

### topic
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:kafka --role ResourceOwner --resource Topic:my- --prefix
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:kafka
### subject
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id schema-cluster --principal User:schema-registry --role DeveloperRead --resource Subject:my- --prefix
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id schema-cluster --principal User:schema-registry --role DeveloperWrite --resource Subject:my- --prefix
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id schema-cluster --principal User:schema-registry --role DeveloperManage --resource Subject:my- --prefix
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:schema-registry --schema-registry-cluster-id schema-cluster
