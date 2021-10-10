#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

### download weblogic image tool
curl -LJO https://github.com/oracle/weblogic-image-tool/releases/latest/download/imagetool.zip
unzip imagetool.zip

### download weblogic deploy tool
curl -LJO https://github.com/oracle/weblogic-deploy-tooling/releases/latest/download/weblogic-deploy.zip
# unzip weblogic-deploy.zip
