#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# JAVA_HOME="/usr/java/java-11"
JAVA_HOME="/usr/java/java-1.8.0"

ORACLE_HOME="/usr/local/weblogic"
INVENTORY_FILE="oraInst.loc"

# PATCH_FILE_DIR="/mnt/share/oracle-weblogic-server/wls14.1.1"
# PATCH_FILE_DIR="/mnt/share/oracle-weblogic-server/wls12.2.1.4"
PATCH_FILE_DIR="/mnt/share/oracle-weblogic-server/wls12.2.1.3"
# PATCH_FILE_DIR="/mnt/share/oracle-weblogic-server/wls12.1.3"

######################################################################

function check_java_home() {
    if [ ! -d "${JAVA_HOME}" ]; then
        echo "[ERROR] The JAVA_HOME (${JAVA_HOME}) does not exist!"
        exit
    fi
}

function check_oracle_home() {
    if [ ! -d "${ORACLE_HOME}" ]; then
        echo "[ERROR] The ORACLE_HOME (${ORACLE_HOME}) does not exist!"
        exit
    fi

    mkdir -p ${ORACLE_HOME}/OPatch/patch_files
}

function check_inventory_file() {
    if [ ! -f "${ORACLE_HOME}/${INVENTORY_FILE}" ]; then
        echo "[ERROR] The inventory file (${ORACLE_HOME}/${INVENTORY_FILE}) does not exist!"
        exit
    fi
}

function check_inventory_group() {
    local ORACLE_HOME_GROUP="$(stat -c '%G' ${ORACLE_HOME})"
    local INST_GROUP="$(grep inst_group ${ORACLE_HOME}/${INVENTORY_FILE} | cut -d'=' -f 2)"

    if [[ "${ORACLE_HOME_GROUP}" != "${INST_GROUP}" ]]; then
        echo "[ERROR] The group of ORACLE_HOME directory (${ORACLE_HOME_GROUP}) and the inst_group value (${INST_GROUP}) are not the same!"
        exit
    fi
}

function check_inventory_location() {
    local INVENTORY_LOC="$(grep inventory_loc ${ORACLE_HOME}/${INVENTORY_FILE} | cut -d'=' -f 2)"

    if [ ! -d "${INVENTORY_LOC}" ]; then
        echo "[ERROR] The Oracle Inventory directory (${INVENTORY_LOC}) does not exist!"
        exit
    fi
}

function check_patch_file() {
    local PATCH_FILE_PATH="${1}"

    if [ ! -f "${PATCH_FILE_PATH}" ]; then
        echo "[ERROR] The PATCH_FILE (${PATCH_FILE_PATH}) does not exist!"
        exit
    fi
}

function opatch_update() {
    local PATCH_FILE="${1}"
    local PATCH_ID="${2}"

    check_patch_file ${PATCH_FILE_DIR}/${PATCH_FILE}
    unzip -q -o ${PATCH_FILE_DIR}/${PATCH_FILE} -d ${ORACLE_HOME}/OPatch/patch_files

    ${JAVA_HOME}/bin/java \
        -jar ${ORACLE_HOME}/OPatch/patch_files/${PATCH_ID}/opatch_generic.jar \
        -silent oracle_home=${ORACLE_HOME} \
        -invPtrLoc ${ORACLE_HOME}/${INVENTORY_FILE}
    # ${JAVA_HOME}/bin/java \
    #     -jar ${ORACLE_HOME}/OPatch/patch_files/${PATCH_ID}/opatch_generic.jar \
    #     -silent oracle_home=${ORACLE_HOME} \
    #     -invPtrLoc ${ORACLE_HOME}/${INVENTORY_FILE} \
    #     -ignoreSysPrereqs
    # ${JAVA_HOME}/bin/java \
    #     -Djava.security.egd=file:///dev/urandom \
    #     -Djava.io.tmpdir=/tmp \
    #     -jar ${ORACLE_HOME}/OPatch/patch_files/${PATCH_ID}/opatch_generic.jar \
    #     -silent oracle_home=${ORACLE_HOME} \
    #     -invPtrLoc ${ORACLE_HOME}/${INVENTORY_FILE}
}

function opatch_rollback() {
    local PATCH_ID="${1}"

    ${ORACLE_HOME}/OPatch/opatch rollback -silent -id ${PATCH_ID}
}

function opatch_apply() {
    local PATCH_FILE="${1}"
    local PATCH_ID="${2}"
    if [ -z "${PATCH_ID}" ]; then
        PATCH_ID_TEMP="${1/_*/}"
        PATCH_ID="${PATCH_ID_TEMP/p/}"
    fi

    check_patch_file ${PATCH_FILE_DIR}/${PATCH_FILE}
    unzip -q -o ${PATCH_FILE_DIR}/${PATCH_FILE} -d ${ORACLE_HOME}/OPatch/patch_files

    # ${ORACLE_HOME}/OPatch/opatch apply \
    #     -silent \
    #     ${ORACLE_HOME}/OPatch/patch_files/${PATCH_ID}
    ${ORACLE_HOME}/OPatch/opatch apply \
        -silent \
        -oh ${ORACLE_HOME} \
        -invPtrLoc ${ORACLE_HOME}/${INVENTORY_FILE} \
        -jre ${JAVA_HOME}/jre \
        ${ORACLE_HOME}/OPatch/patch_files/${PATCH_ID}
}

function opatch_lsinventory() {
    # ${ORACLE_HOME}/OPatch/opatch lsinventory
    # ${ORACLE_HOME}/OPatch/opatch lsinventory -all
    ${ORACLE_HOME}/OPatch/opatch lsinventory \
        -all \
        -oh ${ORACLE_HOME} \
        -invPtrLoc ${ORACLE_HOME}/${INVENTORY_FILE} \
        -jre ${JAVA_HOME}/jre
}

######################################################################

# export ORACLE_HOME="${ORACLE_HOME}"
# export PATH="${ORACLE_HOME}/OPatch:${PATH}"

check_java_home
check_oracle_home
check_inventory_file
check_inventory_group
check_inventory_location

opatch_update "p28186730_139424_Generic.zip" "6880880"

# opatch_rollback "30675853"
# opatch_apply "p31101362_1394002_Generic.zip"
opatch_apply "p31961038_122130_Generic.zip"

opatch_lsinventory
