#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# JAVA_HOME="/usr/java/java-11"
JAVA_HOME="/usr/java/java-1.8.0"

ORACLE_HOME="/usr/local/weblogic"
INVENTORY_FILE="oraInst.loc"

######################################################################

function opatch_lsinventory() {
    # ${ORACLE_HOME}/OPatch/opatch lsinventory
    ${ORACLE_HOME}/OPatch/opatch lsinventory \
        -all \
        -oh ${ORACLE_HOME} \
        -invPtrLoc ${ORACLE_HOME}/${INVENTORY_FILE} \
        -jre ${JAVA_HOME}/jre
}

######################################################################

opatch_lsinventory
