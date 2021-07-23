#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

SCHEMA_REGISTRY_URL="http://localhost:8081"
# SCHEMA_REGISTRY_URL="http://schema-registry1:8081"
# SCHEMA_REGISTRY_URL="http://schema-registry1:8081,http://schema-registry2:8081"
# SCHEMA_REGISTRY_URL="http://schemaregistry-0-internal:8081,http://schemaregistry-1-internal:8081"

######################################################################

### escape forward slash
SCHEMA_REGISTRY_URL="${SCHEMA_REGISTRY_URL//\//\\/}"

######################################################################

perl -pi -e "s/http:\/\/localhost:8081/${SCHEMA_REGISTRY_URL}/" */*.json
