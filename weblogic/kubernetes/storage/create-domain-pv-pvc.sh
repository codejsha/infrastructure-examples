#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

JAVA_HOME="/usr/lib/jvm/java-11"
# JAVA_HOME="/usr/lib/jvm/java-1.8.0"
export JAVA_HOME

### domain in image
bash ../weblogic-kubernetes-operator/kubernetes/samples/scripts/create-weblogic-domain-pv-pvc/create-pv-pvc.sh \
    -i pv-pvc-input.yaml -o output -e
