#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export VAULT_ADDR="http://vault.example.com"
export VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"

CERT_DIR="./certs"
mkdir -p ${CERT_DIR}

######################################################################

### confluent

# vault write -format="json" pki_int/issue/confluent-operator \
#     common_name="kafka.example.com" \
#     alt_names="localhost,kafka.example.com,*.confluent.svc.cluster.local" \
#     ttl="4380h" \
#     > ${CERT_DIR}/confluent-tls.json

# jq -r '.data.private_key' < ${CERT_DIR}/confluent-tls.json > ${CERT_DIR}/confluent-tls.key
# jq -r '.data.certificate' < ${CERT_DIR}/confluent-tls.json > ${CERT_DIR}/confluent-tls.crt
# # jq -r '.data.issuing_ca' < ${CERT_DIR}/confluent-tls.json > ${CERT_DIR}/intermediate.crt
# # vault read pki/cert/ca -format="json" | jq -r '.data.certificate' > ${CERT_DIR}/ca.crt

# cat ${CERT_DIR}/confluent-tls.crt > ${CERT_DIR}/tls.chain.crt
# # cat ${CERT_DIR}/intermediate.crt >> ${CERT_DIR}/tls.chain.crt
# # cat ${CERT_DIR}/ca.crt >> ${CERT_DIR}/tls.chain.crt

######################################################################

### zookeeper

vault write -format="json" pki_int/issue/confluent-zookeeper \
    common_name="zookeeper" \
    alt_names="localhost,zookeeper,zookeeper.example.com,zookeeper.confluent.svc.cluster.local,*.zookeeper.confluent.svc.cluster.local" \
    ttl="4380h" \
    > ${CERT_DIR}/zookeeper-tls.json

jq -r '.data.private_key' < ${CERT_DIR}/zookeeper-tls.json > ${CERT_DIR}/zookeeper-tls.key
jq -r '.data.certificate' < ${CERT_DIR}/zookeeper-tls.json > ${CERT_DIR}/zookeeper-tls.crt
jq -r '.data.issuing_ca' < ${CERT_DIR}/zookeeper-tls.json > ${CERT_DIR}/zookeeper-intermediate.crt
vault read pki/cert/ca -format="json" | jq -r '.data.certificate' > ${CERT_DIR}/ca.crt

cat ${CERT_DIR}/zookeeper-tls.crt > ${CERT_DIR}/zookeeper-tls.chain.crt
cat ${CERT_DIR}/zookeeper-intermediate.crt >> ${CERT_DIR}/zookeeper-tls.chain.crt
cat ${CERT_DIR}/ca.crt >> ${CERT_DIR}/zookeeper-tls.chain.crt

######################################################################

### kafka

vault write -format="json" pki_int/issue/confluent-kafka \
    common_name="kafka" \
    alt_names="localhost,kafka,kafka.example.com,kafka.confluent.svc.cluster.local,*.kafka.confluent.svc.cluster.local,mds.example.com" \
    ttl="4380h" \
    > ${CERT_DIR}/kafka-tls.json

jq -r '.data.private_key' < ${CERT_DIR}/kafka-tls.json > ${CERT_DIR}/kafka-tls.key
jq -r '.data.certificate' < ${CERT_DIR}/kafka-tls.json > ${CERT_DIR}/kafka-tls.crt
jq -r '.data.issuing_ca' < ${CERT_DIR}/kafka-tls.json > ${CERT_DIR}/kafka-intermediate.crt
vault read pki/cert/ca -format="json" | jq -r '.data.certificate' > ${CERT_DIR}/ca.crt

cat ${CERT_DIR}/kafka-tls.crt > ${CERT_DIR}/kafka-tls.chain.crt
cat ${CERT_DIR}/kafka-intermediate.crt >> ${CERT_DIR}/kafka-tls.chain.crt
cat ${CERT_DIR}/ca.crt >> ${CERT_DIR}/kafka-tls.chain.crt

######################################################################

### schema-registry

vault write -format="json" pki_int/issue/confluent-schema-registry \
    common_name="sr" \
    alt_names="localhost,sr,schemaregistry.example.com,schemaregistry.confluent.svc.cluster.local,*.schemaregistry.confluent.svc.cluster.local" \
    ttl="4380h" \
    > ${CERT_DIR}/schema-registry-tls.json

jq -r '.data.private_key' < ${CERT_DIR}/schema-registry-tls.json > ${CERT_DIR}/schema-registry-tls.key
jq -r '.data.certificate' < ${CERT_DIR}/schema-registry-tls.json > ${CERT_DIR}/schema-registry-tls.crt
jq -r '.data.issuing_ca' < ${CERT_DIR}/schema-registry-tls.json > ${CERT_DIR}/schema-registry-intermediate.crt
vault read pki/cert/ca -format="json" | jq -r '.data.certificate' > ${CERT_DIR}/ca.crt

cat ${CERT_DIR}/schema-registry-tls.crt > ${CERT_DIR}/schema-registry-tls.chain.crt
cat ${CERT_DIR}/schema-registry-intermediate.crt >> ${CERT_DIR}/schema-registry-tls.chain.crt
cat ${CERT_DIR}/ca.crt >> ${CERT_DIR}/schema-registry-tls.chain.crt

######################################################################

### kafka-connect

vault write -format="json" pki_int/issue/confluent-kafka-connect \
    common_name="connect" \
    alt_names="localhost,connect,connect.example.com,connect.confluent.svc.cluster.local,*.connect.confluent.svc.cluster.local" \
    ttl="4380h" \
    > ${CERT_DIR}/kafka-connect-tls.json

jq -r '.data.private_key' < ${CERT_DIR}/kafka-connect-tls.json > ${CERT_DIR}/kafka-connect-tls.key
jq -r '.data.certificate' < ${CERT_DIR}/kafka-connect-tls.json > ${CERT_DIR}/kafka-connect-tls.crt
jq -r '.data.issuing_ca' < ${CERT_DIR}/kafka-connect-tls.json > ${CERT_DIR}/kafka-connect-intermediate.crt
vault read pki/cert/ca -format="json" | jq -r '.data.certificate' > ${CERT_DIR}/ca.crt

cat ${CERT_DIR}/kafka-connect-tls.crt > ${CERT_DIR}/kafka-connect-tls.chain.crt
cat ${CERT_DIR}/kafka-connect-intermediate.crt >> ${CERT_DIR}/kafka-connect-tls.chain.crt
cat ${CERT_DIR}/ca.crt >> ${CERT_DIR}/kafka-connect-tls.chain.crt

######################################################################

### replicator

vault write -format="json" pki_int/issue/confluent-replicator \
    common_name="replicator" \
    alt_names="localhost,replicator,replicator.example.com,replicator.confluent.svc.cluster.local,*.replicator.confluent.svc.cluster.local" \
    ttl="4380h" \
    > ${CERT_DIR}/replicator-tls.json

jq -r '.data.private_key' < ${CERT_DIR}/replicator-tls.json > ${CERT_DIR}/replicator-tls.key
jq -r '.data.certificate' < ${CERT_DIR}/replicator-tls.json > ${CERT_DIR}/replicator-tls.crt
jq -r '.data.issuing_ca' < ${CERT_DIR}/replicator-tls.json > ${CERT_DIR}/replicator-intermediate.crt
vault read pki/cert/ca -format="json" | jq -r '.data.certificate' > ${CERT_DIR}/ca.crt

cat ${CERT_DIR}/replicator-tls.crt > ${CERT_DIR}/replicator-tls.chain.crt
cat ${CERT_DIR}/replicator-intermediate.crt >> ${CERT_DIR}/replicator-tls.chain.crt
cat ${CERT_DIR}/ca.crt >> ${CERT_DIR}/replicator-tls.chain.crt

######################################################################

### ksqldb

vault write -format="json" pki_int/issue/confluent-ksqldb \
    common_name="ksql" \
    alt_names="localhost,ksql,ksqldb.example.com,ksqldb.confluent.svc.cluster.local,*.ksqldb.confluent.svc.cluster.local" \
    ttl="4380h" \
    > ${CERT_DIR}/ksqldb-tls.json

jq -r '.data.private_key' < ${CERT_DIR}/ksqldb-tls.json > ${CERT_DIR}/ksqldb-tls.key
jq -r '.data.certificate' < ${CERT_DIR}/ksqldb-tls.json > ${CERT_DIR}/ksqldb-tls.crt
jq -r '.data.issuing_ca' < ${CERT_DIR}/ksqldb-tls.json > ${CERT_DIR}/ksqldb-intermediate.crt
vault read pki/cert/ca -format="json" | jq -r '.data.certificate' > ${CERT_DIR}/ca.crt

cat ${CERT_DIR}/ksqldb-tls.crt > ${CERT_DIR}/ksqldb-tls.chain.crt
cat ${CERT_DIR}/ksqldb-intermediate.crt >> ${CERT_DIR}/ksqldb-tls.chain.crt
cat ${CERT_DIR}/ca.crt >> ${CERT_DIR}/ksqldb-tls.chain.crt

######################################################################

### control-center

vault write -format="json" pki_int/issue/confluent-control-center \
    common_name="c3" \
    alt_names="localhost,c3,controlcenter.example.com,controlcenter.confluent.svc.cluster.local,*.controlcenter.confluent.svc.cluster.local" \
    ttl="4380h" \
    > ${CERT_DIR}/control-center-tls.json

jq -r '.data.private_key' < ${CERT_DIR}/control-center-tls.json > ${CERT_DIR}/control-center-tls.key
jq -r '.data.certificate' < ${CERT_DIR}/control-center-tls.json > ${CERT_DIR}/control-center-tls.crt
jq -r '.data.issuing_ca' < ${CERT_DIR}/control-center-tls.json > ${CERT_DIR}/control-center-intermediate.crt
vault read pki/cert/ca -format="json" | jq -r '.data.certificate' > ${CERT_DIR}/ca.crt

cat ${CERT_DIR}/control-center-tls.crt > ${CERT_DIR}/control-center-tls.chain.crt
cat ${CERT_DIR}/control-center-intermediate.crt >> ${CERT_DIR}/control-center-tls.chain.crt
cat ${CERT_DIR}/ca.crt >> ${CERT_DIR}/control-center-tls.chain.crt
