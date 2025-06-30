#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################

# bash ./install-tekton-cli.sh

# kubectl apply --filename tekton-namespace.yaml
bash ./install-tekton-pipeline.sh
bash ./install-tekton-trigger.sh
bash ./install-tekton-dashboard.sh

cd istio
kubectl apply --filename tekton-traffic-management.yaml
cd ..

######################################################################

### operator

# cd operator
# bash ./install-tekton-operator.sh
# bash ./install-tekton-addon-dashboard.sh
# bash ./install-tekton-addon-trigger.sh
# cd ..
# kubectl apply --filename tekton-dashboard-ingress.yaml
