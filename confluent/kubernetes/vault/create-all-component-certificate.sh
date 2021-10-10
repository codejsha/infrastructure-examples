#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export VAULT_ADDR="http://vault.example.com"
export VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"

CERT_DIR="./certs"
mkdir -p ${CERT_DIR}

vault write -format="json" pki_int/issue/confluent-operator \
    common_name="kafka.example.com" \
    alt_names="*.zookeeper.confluent.svc.cluster.local,*.kafka.confluent.svc.cluster.local,*.schemaregistry.confluent.svc.cluster.local,*.connect.confluent.svc.cluster.local,*.replicator.confluent.svc.cluster.local,*.ksql.confluent.svc.cluster.local,*.controlcenter.confluent.svc.cluster.local" \
    ttl="4380h" \
    > ${CERT_DIR}/tls.json

jq -r '.data.private_key' < ${CERT_DIR}/tls.json > ${CERT_DIR}/tls.key
jq -r '.data.certificate' < ${CERT_DIR}/tls.json > ${CERT_DIR}/tls.crt
jq -r '.data.issuing_ca' < ${CERT_DIR}/tls.json > ${CERT_DIR}/intermediate.crt
vault read pki/cert/ca -format="json" | jq -r '.data.certificate' > ${CERT_DIR}/ca.crt

cat ${CERT_DIR}/tls.crt > ${CERT_DIR}/tls.chain.crt
cat ${CERT_DIR}/intermediate.crt >> ${CERT_DIR}/tls.chain.crt
cat ${CERT_DIR}/ca.crt >> ${CERT_DIR}/tls.chain.crt
