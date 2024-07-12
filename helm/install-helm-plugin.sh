#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

helm plugin install https://github.com/chartmuseum/helm-push.git
# helm plugin install https://github.com/ContainerSolutions/helm-convert.git    # deprecated
# helm plugin install https://github.com/ContainerSolutions/helm-monitor.git    # deprecated
helm plugin install https://github.com/databus23/helm-diff.git
helm plugin install https://github.com/hayorov/helm-gcs.git
helm plugin install https://github.com/helm/helm-2to3.git
helm plugin install https://github.com/hypnoglow/helm-s3.git
helm plugin install https://github.com/jkroepke/helm-secrets.git
# helm plugin install https://github.com/karuppiah7890/helm-schema-gen.git  # deprecated
# helm plugin install https://github.com/technosophos/helm-gpg.git          # deprecated
