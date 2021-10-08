#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="sample-domain1-ns"
DOMAIN_NAME="sample-domain1"
USERNAME="weblogic"
PASSWORD="welcome1"

bash ../weblogic-kubernetes-operator/kubernetes/samples/scripts/create-weblogic-domain-credentials/create-weblogic-credentials.sh \
    -u ${USERNAME} -p ${PASSWORD} -n ${NAMESPACE} -d ${DOMAIN_NAME}
