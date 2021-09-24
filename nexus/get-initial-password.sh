#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NEXUS_PODNAME="$(kubectl get pods -l app.kubernetes.io/name=nexus-repository-manager -o custom-columns=:metadata.name)"
kubectl exec -it ${NEXUS_PODNAME} -- cat /nexus-data/admin.password && echo ""

# NEXUS_PODNAME="$(kubectl get pods -l app=sonatype-nexus -o custom-columns=:metadata.name)"
# kubectl exec -it ${NEXUS_PODNAME} --container nexus -- cat /nexus-data/admin.password && echo ""
