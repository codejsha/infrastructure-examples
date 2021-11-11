#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

JAVA_HOME="/usr/java/java-11"
# JAVA_HOME="/usr/java/java-1.8.0"
export JAVA_HOME

### delete cache
rm -rf ~/cache

bash ../imagetool/bin/imagetool.sh cache deleteEntry --key wdt_latest
bash ../imagetool/bin/imagetool.sh cache addInstaller \
    --type wdt \
    --version latest \
    --path ../weblogic-deploy.zip

### update build (docker)
bash ../imagetool/bin/imagetool.sh update \
    --builder=docker \
    --docker=/usr/bin/docker \
    --fromImage "weblogic:14.1.1" \
    --tag "weblogic:14.1.1-update" \
    --wdtModel "wdt_model.yaml" \
    --wdtVariables "domain.properties" \
    --wdtArchive "archive.zip" \
    --wdtOperation CREATE \
    --wdtVersion LATEST \
    --wdtDomainHome "/u01/oracle/user_projects/domains/sample-domain1" \
    --chown=oracle:root

### update build (podman)
# bash ../imagetool/bin/imagetool.sh update \
#     --builder=podman \
#     --fromImage "weblogic:14.1.1" \
#     --tag "weblogic:14.1.1-update" \
#     --wdtModel "wdt_model.yaml" \
#     --wdtVariables "domain.properties" \
#     --wdtArchive "archive.zip" \
#     --wdtOperation CREATE \
#     --wdtVersion LATEST \
#     --wdtDomainHome "/u01/oracle/user_projects/domains/sample-domain1" \
#     --chown=oracle:root
