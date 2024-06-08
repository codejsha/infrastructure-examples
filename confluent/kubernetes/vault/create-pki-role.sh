#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export VAULT_ADDR="https://vault.example.com"
export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
export VAULT_CACERT="${HOME}/.vault/ca.crt"

vault write pki_int/roles/confluent-operator \
    allowed_domains="localhost,kafka.example.com,*.confluent.svc.cluster.local" \
    allow_subdomains="true" \
    allow_bare_domains="true" \
    allow_glob_domains="true" \
    max_ttl="8760h"

vault write pki_int/roles/confluent-zookeeper \
    allowed_domains="localhost,zookeeper,zookeeper.example.com,zookeeper.confluent.svc.cluster.local,*.zookeeper.confluent.svc.cluster.local" \
    allow_subdomains="true" \
    allow_bare_domains="true" \
    allow_glob_domains="true" \
    max_ttl="8760h"

vault write pki_int/roles/confluent-kafka \
    allowed_domains="localhost,kafka,kafka.example.com,kafka.confluent.svc.cluster.local,*.kafka.confluent.svc.cluster.local,mds.example.com" \
    allow_subdomains="true" \
    allow_bare_domains="true" \
    allow_glob_domains="true" \
    max_ttl="8760h"

vault write pki_int/roles/confluent-schema-registry \
    allowed_domains="localhost,sr,schemaregistry.example.com,schemaregistry.confluent.svc.cluster.local,*.schemaregistry.confluent.svc.cluster.local" \
    allow_subdomains="true" \
    allow_bare_domains="true" \
    allow_glob_domains="true" \
    max_ttl="8760h"

vault write pki_int/roles/confluent-kafka-connect \
    allowed_domains="localhost,connect,connect.example.com,connect.confluent.svc.cluster.local,*.connect.confluent.svc.cluster.local" \
    allow_subdomains="true" \
    allow_bare_domains="true" \
    allow_glob_domains="true" \
    max_ttl="8760h"

vault write pki_int/roles/confluent-replicator \
    allowed_domains="localhost,replicator,replicator.example.com,replicator.confluent.svc.cluster.local,*.replicator.confluent.svc.cluster.local" \
    allow_subdomains="true" \
    allow_bare_domains="true" \
    allow_glob_domains="true" \
    max_ttl="8760h"

vault write pki_int/roles/confluent-ksqldb \
    allowed_domains="localhost,ksql,ksqldb.example.com,ksqldb.confluent.svc.cluster.local,*.ksqldb.confluent.svc.cluster.local" \
    allow_subdomains="true" \
    allow_bare_domains="true" \
    allow_glob_domains="true" \
    max_ttl="8760h"

vault write pki_int/roles/confluent-control-center \
    allowed_domains="localhost,c3,controlcenter.example.com,controlcenter.confluent.svc.cluster.local,*.controlcenter.confluent.svc.cluster.local" \
    allow_subdomains="true" \
    allow_bare_domains="true" \
    allow_glob_domains="true" \
    max_ttl="8760h"
