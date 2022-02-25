######################################################################
### confluent kafka
######################################################################

### login mds cluster
confluent login --ca-cert-path /opt/confluent/ssl/ca.crt --url https://kafka1.example.com:8090

### context
confluent context list

curl --silent \
    --request GET \
    --user mds:mds-secret \
    --cacert /opt/confluent/ssl/ca.crt \
    --cert /opt/confluent/ssl/kafka_broker.crt \
    --key /opt/confluent/ssl/kafka_broker.key \
    https://kafka1.example.com:8090/security/1.0/authenticate \
    | jq
curl --silent \
    --request GET \
    --user control-center:control-center-secret \
    --cacert /opt/confluent/ssl/ca.crt \
    --cert /opt/confluent/ssl/control_center.crt \
    --key /opt/confluent/ssl/control_center.key
    https://kafka1.example.com:8090/security/1.0/authenticate \
    | jq

######################################################################

### cluster

### list
confluent cluster list
KAFKA_CLUSTER_ID="${KAFKA_CLUSTER_ID}"

######################################################################

### role binding list

confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:mds
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:kafkaadmin
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
