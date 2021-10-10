#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

CERT_DIR="./certs"

# cd ..

# git clone https://github.com/confluentinc/confluent-kubernetes-examples.git

# cd vault

# bash ../../kubernetes/confluent-kubernetes-examples/scripts/create-keystore.sh tls.chain.crt confluent-tls.key mystorepassword
# mv jks/keystore.jks jks/confluent-keystore.jks
# mv jks/pkcs.p12 jks/confluent-pkcs.p12

bash ../../kubernetes/confluent-kubernetes-examples/scripts/create-keystore.sh ${CERT_DIR}/zookeeper-tls.chain.crt ${CERT_DIR}/zookeeper-tls.key mystorepassword
mv jks/keystore.jks jks/zookeeper-keystore.jks
mv jks/pkcs.p12 jks/zookeeper-pkcs.p12

bash ../../kubernetes/confluent-kubernetes-examples/scripts/create-keystore.sh ${CERT_DIR}/kafka-tls.chain.crt ${CERT_DIR}/kafka-tls.key mystorepassword
mv jks/keystore.jks jks/kafka-keystore.jks
mv jks/pkcs.p12 jks/kafka-pkcs.p12

bash ../../kubernetes/confluent-kubernetes-examples/scripts/create-keystore.sh ${CERT_DIR}/schema-registry-tls.chain.crt ${CERT_DIR}/schema-registry-tls.key mystorepassword
mv jks/keystore.jks jks/schema-registry-keystore.jks
mv jks/pkcs.p12 jks/schema-registry-pkcs.p12

bash ../../kubernetes/confluent-kubernetes-examples/scripts/create-keystore.sh ${CERT_DIR}/kafka-connect-tls.chain.crt ${CERT_DIR}/kafka-connect-tls.key mystorepassword
mv jks/keystore.jks jks/kafka-connect-keystore.jks
mv jks/pkcs.p12 jks/kafka-connect-pkcs.p12

bash ../../kubernetes/confluent-kubernetes-examples/scripts/create-keystore.sh ${CERT_DIR}/replicator-tls.chain.crt ${CERT_DIR}/replicator-tls.key mystorepassword
mv jks/keystore.jks jks/replicator-keystore.jks
mv jks/pkcs.p12 jks/replicator-pkcs.p12

bash ../../kubernetes/confluent-kubernetes-examples/scripts/create-keystore.sh ${CERT_DIR}/ksqldb-tls.chain.crt ${CERT_DIR}/ksqldb-tls.key mystorepassword
mv jks/keystore.jks jks/ksqldb-keystore.jks
mv jks/pkcs.p12 jks/ksqldb-pkcs.p12

bash ../../kubernetes/confluent-kubernetes-examples/scripts/create-keystore.sh ${CERT_DIR}/control-center-tls.chain.crt ${CERT_DIR}/control-center-tls.key mystorepassword
mv jks/keystore.jks jks/control-center-keystore.jks
mv jks/pkcs.p12 jks/control-center-pkcs.p12

bash ../../kubernetes/confluent-kubernetes-examples/scripts/create-truststore.sh ${CERT_DIR}/ca.crt mystorepassword
