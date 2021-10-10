#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

SECRET_NAME="mysql-datasource-secret"
NAMESPACE="sample-domain1-ns"
DOMAIN_NAME="sample-domain1"

URL="my-mysql.mysql.svc.cluster.local:3306/mysqldb"
USERNAME="admin"
PASSWORD="admin"

kubectl create secret generic ${SECRET_NAME} \
    --from-literal=url="${URL}" \
    --from-literal=username="${USERNAME}" \
    --from-literal=password="${PASSWORD}" \
    --namespace ${NAMESPACE}

kubectl label secret ${SECRET_NAME} --namespace ${NAMESPACE} weblogic.domainUID=${DOMAIN_NAME}
