#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace
set -o xtrace

JAVA_HOME="/usr/java/current"
WL_HOME="/usr/local/weblogic/wlserver_10.3"
DOMAIN_HOME="/usr/local/weblogic/user_projects/domains/base_domain"

INSTALL_SCRIPT_DIR="/svc/infrastructure/weblogic"

######################################################################

function upgrade_domain_11g() {
    ${JAVA_HOME}/bin/java \
        -classpath ${WL_HOME}/server/lib/weblogic.jar \
        weblogic.Upgrade \
        -mode silent \
        -type domain \
        -responses ${INSTALL_SCRIPT_DIR}/upgrade/upgrade-domain.xml \
        -out ${DOMAIN_HOME}/upgrade-domain.log
}

######################################################################

cd ${DOMAIN_HOME}
upgrade_domain_11g
