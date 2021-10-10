#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

JAVA_HOME="/usr/java/java-11"
# JAVA_HOME="/usr/java/java-1.8.0"
export JAVA_HOME

USERNAME="weblogic"
PASSWORD="welcome1"

SCRIPT_DIR="$( cd "$( dirname $0 )" && pwd )"

### domain in image
cd ../weblogic-kubernetes-operator/kubernetes/samples/scripts/create-weblogic-domain/domain-home-in-image
bash ./create-domain.sh \
    -i ${SCRIPT_DIR}/domain-in-image-input.yaml -o output -u ${USERNAME} -p ${PASSWORD} -e
