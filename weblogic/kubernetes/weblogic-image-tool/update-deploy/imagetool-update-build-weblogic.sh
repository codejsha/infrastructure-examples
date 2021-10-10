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

### update
bash ../imagetool/bin/imagetool.sh update \
    --fromImage "domain-home-in-image:14.1.1-jdbc" \
    --tag "domain-home-in-image:14.1.1-deploy" \
    --wdtModel "wdt_model_deploy.yaml" \
    --wdtVariables "domain.properties" \
--wdtArchive "archive.zip" \
    --wdtOperation CREATE \
    --wdtVersion LATEST \
    --wdtDomainHome "/u01/oracle/user_projects/domains/sample-domain1" \
    --chown=oracle:root
