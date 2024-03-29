#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### sasl
cat sasl/zookeeper-digest-jaas.conf | base64 | vault kv put kv/confluent/zookeeper/digest-jaas.conf digest=-
cat sasl/kafka-digest-jaas.conf | base64 | vault kv put kv/confluent/kafka-server/digest-jaas.conf digestjaas=-
cat sasl/kafka-server-plain-jaas.conf | base64 | vault kv put kv/confluent/kafka-server/plain-jaas.conf plainjaas=-
cat sasl/kafka-server-apikeys.json | base64 | vault kv put kv/confluent/kafka-server/apikeys.json apikeys=-
cat sasl/kafka-client-plain-jaas.conf | base64 | vault kv put kv/confluent/kafka-client/plain-jaas.conf plainjaas=-

### certs
kubectl create secret generic kafka-tls \
    --namespace confluent \
    --from-file=keystore.jks=jks/kafka-keystore.jks \
    --from-file=truststore.jks=jks/truststore.jks \
    --from-file=jksPassword.txt=jks/jksPassword.txt \
    --save-config --dry-run=client -o yaml | \
    kubectl apply -f -

vault kv put kv/confluent/jksPassword.txt password=jksPassword=mystorepassword
cat jks/truststore.jks | base64 | vault kv put kv/confluent/truststore.jks truststore=-
cat jks/zookeeper-keystore.jks | base64 | vault kv put kv/confluent/zookeeper/keystore.jks keystore=-
cat jks/kafka-keystore.jks | base64 | vault kv put kv/confluent/kafka/keystore.jks keystore=-
cat jks/schema-registry-keystore.jks | base64 | vault kv put kv/confluent/schema-registry/keystore.jks keystore=-
cat jks/kafka-connect-keystore.jks | base64 | vault kv put kv/confluent/kafka-connect/keystore.jks keystore=-
cat jks/replicator-keystore.jks | base64 | vault kv put kv/confluent/replicator/keystore.jks keystore=-
cat jks/ksqldb-keystore.jks | base64 | vault kv put kv/confluent/ksqldb/keystore.jks keystore=-
cat jks/control-center-keystore.jks | base64 | vault kv put kv/confluent/control-center/keystore.jks keystore=-

### rbac
cat mds/mds-public.key | base64 | vault kv put kv/confluent/mdsPublicKey.pem mdspublickey=-
cat mds/mds-private.key | base64 | vault kv put kv/confluent/mdsTokenKeyPair.pem mdstokenkeypair=-
kubectl create secret generic mds-token \
    --namespace confluent \
    --from-file=mdsPublicKey.pem=mds/mds-public.key  \
    --from-file=mdsTokenKeyPair.pem=mds/mds-private.key \
    --save-config --dry-run=client -o yaml | \
    kubectl apply -f -

### mds
kubectl create secret generic mds-kafka-client \
    --namespace confluent \
    --from-file=bearer.txt=mds/mds-kafka-client.txt \
    --save-config --dry-run=client -o yaml | \
    kubectl apply -f -
kubectl create secret generic mds-schema-registry-client \
    --namespace confluent \
    --from-file=bearer.txt=mds/mds-schema-registry-client.txt \
    --save-config --dry-run=client -o yaml | \
    kubectl apply -f -
kubectl create secret generic mds-kafka-connect-client \
    --namespace confluent \
    --from-file=bearer.txt=mds/mds-kafka-connect-client.txt \
    --save-config --dry-run=client -o yaml | \
    kubectl apply -f -
kubectl create secret generic mds-replicator-client \
    --namespace confluent \
    --from-file=bearer.txt=mds/mds-replicator-client.txt \
    --save-config --dry-run=client -o yaml | \
    kubectl apply -f -
kubectl create secret generic mds-ksqldb-client \
    --namespace confluent \
    --from-file=bearer.txt=mds/mds-ksqldb-client.txt \
    --save-config --dry-run=client -o yaml | \
    kubectl apply -f -
kubectl create secret generic mds-control-center-client \
    --namespace confluent \
    --from-file=bearer.txt=mds/mds-control-center-client.txt \
    --save-config --dry-run=client -o yaml | \
    kubectl apply -f -
kubectl create secret generic mds-kafka-rest \
    --from-file=bearer.txt=mds/mds-kafka-client.txt \
    --namespace confluent \
    --from-file=basic.txt=mds/mds-kafka-client.txt \
    --save-config --dry-run=client -o yaml | \
    kubectl apply -f -

cat mds/mds-kafka-client.txt | base64 | vault kv put kv/confluent/kafka/bearer.txt bearer=-
cat mds/mds-schema-registry-client.txt | base64 | vault kv put kv/confluent/schema-registry/bearer.txt bearer=-
cat mds/mds-kafka-connect-client.txt | base64 | vault kv put kv/confluent/kafka-connect/bearer.txt bearer=-
cat mds/mds-replicator-client.txt | base64 | vault kv put kv/confluent/replicator/bearer.txt bearer=-
cat mds/mds-ksqldb-client.txt | base64 | vault kv put kv/confluent/ksqldb/bearer.txt bearer=-
cat mds/mds-control-center-client.txt | base64 | vault kv put kv/confluent/control-center/bearer.txt bearer=-

### ldap
cat credentials/ldap.txt | base64 | vault kv put kv/confluent/ldap.txt ldapsimple=-

### license
cat credentials/license.txt | base64 | vault kv put kv/confluent/license.txt license=-

### list
vault kv list kv/confluent
