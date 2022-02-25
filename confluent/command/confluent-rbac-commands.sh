######################################################################
### confluent kafka
######################################################################

### login mds cluster
confluent login --ca-cert-path /opt/confluent/ssl/ca.crt --url https://kafka1.example.com:8090

### context
confluent context list

curl --silent \
    --user mds:mds-secret \
    --request GET \
    --cacert /opt/confluent/ssl/ca.crt \
    --cert /opt/confluent/ssl/kafka_broker.crt \
    --key /opt/confluent/ssl/kafka_broker.key \
    https://kafka1.example.com:8090/security/1.0/authenticate \
    | jq
curl --silent \
    --user control-center:control-center-secret \
    --request GET \
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

SCHEMA_REGISTRY_CLUSTER_ID="schema-cluster"
SCHEMA_REGISTRY_ADMIN_USER="schema-registry"
KAFKA_CONNECT_CLUSTER_ID="connect-cluster"
KAFKA_CONNECT_ADMIN_USER="kafka-connect"
KSQLDB_CLUSTER_ID="ksql-cluster"
KSQLDB_ADMIN_USER="ksqldb"

confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:mds
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:kafkaadmin
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:kafka
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:schema-registry
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:kafka-connect
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:kafka-rest
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:ksqldb
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:control-center

confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id ${SCHEMA_REGISTRY_CLUSTER_ID} --principal User:${SCHEMA_REGISTRY_ADMIN_USER}
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --connect-cluster-id ${KAFKA_CONNECT_CLUSTER_ID} --principal User:${KAFKA_CONNECT_ADMIN_USER}
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --ksql-cluster-id ${KSQLDB_CLUSTER_ID} --principal User:${KSQLDB_ADMIN_USER}

######################################################################

### create role binding (kafka)

### admin
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${SYSTEM_ADMIN_USER} --role SystemAdmin

### producer/consumer
CLIENT_USER="kafka-connect"
TOPIC_NAME="my-topic"
GROUP_NAME_PREFIX="my-consumer-"
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${CLIENT_USER} --role ResourceOwner --resource Topic:${TOPIC_NAME}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${CLIENT_USER} --role DeveloperRead --resource Group:${GROUP_NAME_PREFIX} --prefix

######################################################################

### create role binding (schema-registry)

SCHEMA_REGISTRY_CLUSTER_ID="schema-cluster"
SCHEMA_REGISTRY_ADMIN_USER="schema-registry"
CLIENT_USER="kafka-connect"
TOPIC_NAME="my-topic"
SUBJECT_NAME="${TOPIC_NAME}"

### admin
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id ${SCHEMA_REGISTRY_CLUSTER_ID} --principal User:${SCHEMA_REGISTRY_ADMIN_USER} --role SecurityAdmin
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${SCHEMA_REGISTRY_ADMIN_USER} --role ResourceOwner --resource Group:${SCHEMA_REGISTRY_CLUSTER_ID}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${SCHEMA_REGISTRY_ADMIN_USER} --role ResourceOwner --resource Topic:_schemas
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${SCHEMA_REGISTRY_ADMIN_USER} --role DeveloperRead --resource Topic:_confluent-license
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${SCHEMA_REGISTRY_ADMIN_USER} --role DeveloperWrite --resource Topic:_confluent-license

### client
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id ${SCHEMA_REGISTRY_CLUSTER_ID} --principal User:${CLIENT_USER} --role ResourceOwner --resource Subject:${SUBJECT_NAME}-key
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id ${SCHEMA_REGISTRY_CLUSTER_ID} --principal User:${CLIENT_USER} --role ResourceOwner --resource Subject:${SUBJECT_NAME}-value

######################################################################

### create role binding (kafka-connect)

SCHEMA_REGISTRY_CLUSTER_ID="schema-cluster"
KAFKA_CONNECT_CLUSTER_ID="connect-cluster"
KAFKA_CONNECT_ADMIN_USER="kafka-connect"
KAFKA_CONNECT_CONNECTOR_CREATOR_USER="kafka-connect"
KAFKA_CONNECT_CONNECTOR_USER="kafka-connect"
CONNECTOR_NAME="postgresql-source"
CONSUMER_GROUP_ID_PREFIX="my-"
TOPIC_NAME="my-topic"
SUBJECT_NAME="${TOPIC_NAME}"

### admin
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --connect-cluster-id ${KAFKA_CONNECT_CLUSTER_ID} --principal User:${KAFKA_CONNECT_ADMIN_USER} --role SecurityAdmin
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KAFKA_CONNECT_ADMIN_USER} --role ResourceOwner --resource Group:${SCHEMA_REGISTRY_CLUSTER_ID}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KAFKA_CONNECT_ADMIN_USER} --role ResourceOwner --resource Group:${KAFKA_CONNECT_CLUSTER_ID}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KAFKA_CONNECT_ADMIN_USER} --role ResourceOwner --resource Topic:connect-configs
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KAFKA_CONNECT_ADMIN_USER} --role ResourceOwner --resource Topic:connect-offsets
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KAFKA_CONNECT_ADMIN_USER} --role ResourceOwner --resource Topic:connect-status
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KAFKA_CONNECT_ADMIN_USER} --role ResourceOwner --resource Topic:_confluent-secrets

### connector creator
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --connect-cluster-id ${KAFKA_CONNECT_CLUSTER_ID} --principal User:${KAFKA_CONNECT_CONNECTOR_CREATOR_USER} --role ResourceOwner --resource Connector:${CONNECTOR_NAME}

### connector
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KAFKA_CONNECT_CONNECTOR_USER} --role ResourceOwner --resource Topic:${TOPIC_NAME}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id ${SCHEMA_REGISTRY_CLUSTER_ID} --principal User:${KAFKA_CONNECT_CONNECTOR_USER} --role ResourceOwner --resource Subject:${SUBJECT_NAME}-key
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id ${SCHEMA_REGISTRY_CLUSTER_ID} --principal User:${KAFKA_CONNECT_CONNECTOR_USER} --role ResourceOwner --resource Subject:${SUBJECT_NAME}-value

### sink connector
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID}  --principal User:${KAFKA_CONNECT_CONNECTOR_USER} --role DeveloperRead --resource Group:${CONSUMER_GROUP_ID_PREFIX} --prefix

######################################################################

### connector rbac configurations (kafka-connect)

### source connector
# "producer.override.sasl.jaas.config": "org.apache.kafka.common.security.oauthbearer.OAuthBearerLoginModule required username=\"kafka-connect\" password=\"kafka-connect-secret\" metadataServerUrls=\"http://kafka1.example.com:8090,http://kafka2.example.com:8090,http://kafka3.example.com:8090\";",
# "producer.override.sasl.jaas.config": "org.apache.kafka.common.security.oauthbearer.OAuthBearerLoginModule required username=\"kafka-connect\" password=\"kafka-connect-secret\" metadataServerUrls=\"https://kafka1.example.com:8090,https://kafka2.example.com:8090,https://kafka3.example.com:8090\";",

### sink connector
# "consumer.override.sasl.jaas.config": "org.apache.kafka.common.security.oauthbearer.OAuthBearerLoginModule required username=\"kafka-connect\" password=\"kafka-connect-secret\" metadataServerUrls=\"http://kafka1.example.com:8090,http://kafka2.example.com:8090,http://kafka3.example.com:8090\";",
# "consumer.override.sasl.jaas.config": "org.apache.kafka.common.security.oauthbearer.OAuthBearerLoginModule required username=\"kafka-connect\" password=\"kafka-connect-secret\" metadataServerUrls=\"https://kafka1.example.com:8090,https://kafka2.example.com:8090,https://kafka3.example.com:8090\";",

######################################################################

### create role binding (rest-proxy)

KAFKA_REST_ADMIN_USER="kafka-rest"
CLIENT_USER="ksqldb"
CONSUMER_GROUP_ID_PREFIX="my-"
TOPIC_NAME="my-topic"

### admin
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KAFKA_REST_ADMIN_USER} --role DeveloperRead --resource Topic:_confluent-license
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KAFKA_REST_ADMIN_USER} --role DeveloperWrite --resource Topic:_confluent-license

### producer/consumer
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${CLIENT_USER} --role ResourceOwner --resource Topic:${TOPIC_NAME}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${CLIENT_USER} --role DeveloperRead --resource Group:${CONSUMER_GROUP_ID_PREFIX} --prefix

######################################################################

### create role binding (ksqldb)

KSQLDB_CLUSTER_ID="ksql-cluster"
KSQLDB_ADMIN_USER="ksqldb"
CLIENT_USER="ksqldb"
TOPIC_NAME="my-topic"
CSAS_STREAM_NAME=""
CTAS_TABLE_NAME=""

### admin
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KSQLDB_ADMIN_USER} --role ResourceOwner --resource Topic:_confluent-ksql-${KSQLDB_CLUSTER_ID}_command_topic
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KSQLDB_ADMIN_USER} --role ResourceOwner --resource Topic:${KSQLDB_CLUSTER_ID}ksql_processing_log
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --ksql-cluster-id ${KSQLDB_CLUSTER_ID} --principal User:${KSQLDB_ADMIN_USER} --role SecurityAdmin
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --ksql-cluster-id ${KSQLDB_CLUSTER_ID} --principal User:${KSQLDB_ADMIN_USER} --role ResourceOwner --resource KsqlCluster:${KSQLDB_CLUSTER_ID}

### client (cli)
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --ksql-cluster-id ${KSQLDB_CLUSTER_ID} --principal User:${CLIENT_USER} --role DeveloperWrite --resource KsqlCluster:${KSQLDB_CLUSTER_ID}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KSQLDB_ADMIN_USER} --role ResourceOwner --resource TransactionalId:${KSQLDB_CLUSTER_ID}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KSQLDB_ADMIN_USER} --role ResourceOwner --resource Topic:_confluent-ksql-${KSQLDB_CLUSTER_ID} --prefix
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KSQLDB_ADMIN_USER} --role ResourceOwner --resource Topic:_confluent-ksql-${KSQLDB_CLUSTER_ID}transient --prefix
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KSQLDB_ADMIN_USER} --role ResourceOwner --resource Topic:${CSAS_STREAM_NAME}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KSQLDB_ADMIN_USER} --role ResourceOwner --resource Topic:${CTAS_TABLE_NAME}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KSQLDB_ADMIN_USER} --role DeveloperRead --resource Group:_confluent-ksql-${KSQLDB_CLUSTER_ID} --prefix
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KSQLDB_ADMIN_USER} --role DeveloperRead --resource Topic:${TOPIC_NAME}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${CLIENT_USER} --role ResourceOwner --resource Topic:_confluent-ksql-${KSQLDB_CLUSTER_ID}transient --prefix
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${CLIENT_USER} --role ResourceOwner --resource Topic:${CSAS_STREAM_NAME}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${CLIENT_USER} --role ResourceOwner --resource Topic:${CTAS_TABLE_NAME}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${CLIENT_USER} --role DeveloperRead --resource Group:_confluent-ksql-${KSQLDB_CLUSTER_ID} --prefix
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${CLIENT_USER} --role DeveloperRead --resource Topic:${KSQLDB_CLUSTER_ID}ksql_processing_log
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${CLIENT_USER} --role DeveloperRead --resource Topic:${TOPIC_NAME}

######################################################################

### control-center

SCHEMA_REGISTRY_CLUSTER_ID="schema-cluster"
KAFKA_CONNECT_CLUSTER_ID="connect-cluster"
CONTROL_CENTER_ADMIN_USER="control-center"
CLIENT_USER="control-center"
CONNECTOR_NAME="postgresql-source"
TOPIC_NAME="my-topic"
SUBJECT_NAME="${TOPIC_NAME}"

### admin
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${CONTROL_CENTER_ADMIN_USER} --role SystemAdmin

### client
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${CLIENT_USER} --role DeveloperRead --resource Topic:${TOPIC_NAME}
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id ${SCHEMA_REGISTRY_CLUSTER_ID} --principal User:${CLIENT_USER} --role DeveloperRead --resource Subject:${SUBJECT_NAME}-key
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id ${SCHEMA_REGISTRY_CLUSTER_ID} --principal User:${CLIENT_USER} --role DeveloperRead --resource Subject:${SUBJECT_NAME}-value
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --connect-cluster-id ${KAFKA_CONNECT_CLUSTER_ID} --principal User:${CLIENT_USER} --role DeveloperRead --resource Connector:${CONNECTOR_NAME}

######################################################################

### create role binding (topic, subject)

KAFKA_CLIENT_USER="kafka"
SCHEMA_REGISTRY_CLUSTER_ID="schema-cluster"
SCHEMA_REGISTRY_CLIENT_USER="schema-registry"
TOPIC_NAME_PREFIX="my-"

### topic
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KAFKA_CLIENT_USER} --role ResourceOwner --resource Topic:${TOPIC_NAME_PREFIX} --prefix

### subject
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id ${SCHEMA_REGISTRY_CLUSTER_ID} --principal User:${SCHEMA_REGISTRY_CLIENT_USER} --role DeveloperRead --resource Subject:${TOPIC_NAME_PREFIX} --prefix
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id ${SCHEMA_REGISTRY_CLUSTER_ID} --principal User:${SCHEMA_REGISTRY_CLIENT_USER} --role DeveloperWrite --resource Subject:${TOPIC_NAME_PREFIX} --prefix
confluent iam rbac role-binding create --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id ${SCHEMA_REGISTRY_CLUSTER_ID} --principal User:${SCHEMA_REGISTRY_CLIENT_USER} --role DeveloperManage --resource Subject:${TOPIC_NAME_PREFIX} --prefix

### list
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --principal User:${KAFKA_CLIENT_USER}
confluent iam rbac role-binding list --kafka-cluster-id ${KAFKA_CLUSTER_ID} --schema-registry-cluster-id ${SCHEMA_REGISTRY_CLUSTER_ID} --principal User:${SCHEMA_REGISTRY_CLIENT_USER}
