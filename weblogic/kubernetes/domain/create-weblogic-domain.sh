#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

USERNAME="weblogic"
PASSWORD="welcome1"

JAVA_HOME="/usr/lib/jvm/java-11"
# JAVA_HOME="/usr/lib/jvm/java-1.8.0"
export JAVA_HOME

### domain in image
bash ../weblogic-kubernetes-operator/kubernetes/samples/scripts/create-weblogic-domain/domain-home-in-image/create-domain.sh \
    -i domain-in-image-input.yaml -o output -u ${USERNAME} -p ${PASSWORD} -e
