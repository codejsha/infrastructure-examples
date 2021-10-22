#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

NAMESPACE="sample-domain1-ns"
DOMAIN_NAME="sample-domain1"
USERNAME="weblogic"
PASSWORD="welcome1"

SECRET_NAME="${DOMAIN_NAME}-weblogic-credentials"

# RESULT="$(kubectl get secret ${SECRET_NAME} --namespace ${NAMESPACE} --ignore-not-found=true | grep ${SECRET_NAME} | wc | awk ' { print $1; }')"
# if [ "${RESULT:-"ERROR"}" != "0" ]; then
#     echo "[ERROR] The secret ${SECRET_NAME} already exists in namespace ${NAMESPACE}."
#     exit 1
# fi

# kubectl delete secret ${SECRET_NAME} --namespace ${NAMESPACE} --ignore-not-found=true

kubectl create secret generic ${SECRET_NAME} \
    --from-literal=username="${USERNAME}" \
    --from-literal=password="${PASSWORD}" \
    --namespace ${NAMESPACE}

kubectl label secret ${SECRET_NAME} \
    --namespace ${NAMESPACE} \
    weblogic.domainUID=${DOMAIN_NAME} weblogic.domainName=${DOMAIN_NAME}
