#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### 1411
# JAVA_HOME="/usr/java/java-11"
# JAVA_HOME="/usr/java/java-1.8.0"
# INSTALL_FILE_DIR="/mnt/share/oracle-weblogic-server/wls14.1.1/fmw_14.1.1.0.0_wls_Disk1_1of1"
# INSTALL_FILE="fmw_14.1.1.0.0_wls.jar"
# RESPONSE_FILE="response.rsp"
# INVENTORY_FILE="oraInst.loc"

### 12214
JAVA_HOME="/usr/java/java-1.8.0"
INSTALL_FILE_DIR="/mnt/share/oracle-weblogic-server/wls12.2.1.4/fmw_12.2.1.4.0_wls_Disk1_1of1"
INSTALL_FILE="fmw_12.2.1.4.0_wls.jar"
RESPONSE_FILE="response.rsp"
INVENTORY_FILE="oraInst.loc"

### 12213
# JAVA_HOME="/usr/java/java-1.8.0"
# INSTALL_FILE_DIR="/mnt/share/oracle-weblogic-server/wls12.2.1.3/fmw_12.2.1.3.0_wls_Disk1_1of1"
# INSTALL_FILE="fmw_12.2.1.3.0_wls.jar"
# RESPONSE_FILE="response.rsp"
# INVENTORY_FILE="oraInst.loc"

### 1213
# JAVA_HOME="/usr/java/java-1.8.0"
# INSTALL_FILE_DIR="/mnt/share/oracle-weblogic-server/wls12.1.3"
# INSTALL_FILE="fmw_12.1.3.0.0_wls.jar"
# RESPONSE_FILE="response.rsp"
# INVENTORY_FILE="oraInst.loc"

### 1036 (11119)
# JAVA_HOME="/usr/java/java-1.7.0"
# INSTALL_FILE_DIR="/mnt/share/oracle-weblogic-server/wls10.3.6"
# INSTALL_FILE="wls1036_generic.jar"
# SILENT_FILE="silent.xml"

INSTALL_SCRIPT_DIR="${HOME}/repos/infrastructure-examples/weblogic"

######################################################################

function install_required_package_14c_rhel8() {
    sudo yum install -y binutils gcc gcc-c++ glibc.x86_64 glibc-devel.x86_64 libaio.x86_64 libaio-devel.x86_64 libgcc.x86_64 libstdc++.x86_64 libstdc++-devel.x86_64 libnsl.x86_64 sysstat motif.x86_64 motif-devel.x86_64 redhat-lsb.x86_64 redhat-lsb-core.x86_64 openssl make
}

function install_required_package_14c_rhel7() {
    sudo yum install -y binutils compat-libcap1 compat-libstdc++.x86_64 compat-libstdc++.i686 gcc gcc-c++ glibc.x86_64 glibc.i686 glibc-devel.x86_64 libaio.x86_64 libaio-devel.x86_64 libgcc.x86_64 libgcc.i686 libstdc++.x86_64 libstdc++.i686 libstdc++-devel.x86_64 dejavu-serif-fonts ksh make sysstat numactl.x86_64 numactl-devel.x86_64 motif.x86_64 motif-devel.x86_64 redhat-lsb.x86_64 redhat-lsb-core.x86_64 openssl
}

function install_required_package_12c_rhel8() {
    sudo yum install -y binutils gcc gcc-c++ glibc.x86_64 glibc-devel.x86_64 libaio.x86_64 libaio-devel.x86_64 libgcc.x86_64 libstdc++.x86_64 libstdc++-devel.x86_64 libnsl.x86_64 sysstat motif.x86_64 motif-devel.x86_64 redhat-lsb.x86_64 redhat-lsb-core.x86_64 openssl make xorg-x11-utils
}

function install_required_package_12c_rhel7() {
    sudo yum install -y binutils compat-libcap1 compat-libstdc++-33.x86_64 compat-libstdc++-33.i686 gcc gcc-c++ glibc.x86_64 glibc.i686 glibc-devel.x86_64 libaio.x86_64 libaio-devel.x86_64 libgcc.x86_64 libgcc.i686 libstdc++.x86_64 libstdc++.i686 libstdc++-devel.x86_64 dejavu-serif-fonts ksh make sysstat numactl.x86_64 numactl-devel.x86_64 motif.x86_64 motif-devel.x86_64 redhat-lsb.x86_64 redhat-lsb-core.x86_64 openssl xorg-x11-utils
}

function install_required_package_11g() {
    sudo yum install -y binutils gcc gcc-c++ glibc.x86_64 glibc.i686 glibc-devel.x86_64 glibc-devel.i686 libaio.x86_64 libaio-devel.x86_64 libgcc.x86_64 libgcc.i686 libstdc++.x86_64 libstdc++.i686 libstdc++-devel.x86_64 ksh make sysstat numactl.x86_64 numactl-devel.x86_64 motif.x86_64 motif-devel.x86_64 redhat-lsb.x86_64 redhat-lsb-core.x86_64
    sudo yum install -y compat-libcap1 compat-libstdc++-33.x86_64 compat-libstdc++-33.i686

    # sudo yum install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/compat-libcap1-1.10-7.el7.x86_64.rpm
    # sudo yum install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/compat-libstdc++-33-3.2.3-72.el7.i686.rpm
    # sudo yum install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm
}

######################################################################

function install_weblogic_14c() {
    ${JAVA_HOME}/bin/java \
        -Djava.security.egd=file:///dev/urandom \
        -jar ${INSTALL_FILE_DIR}/${INSTALL_FILE} \
        -silent \
        -responseFile ${INSTALL_SCRIPT_DIR}/${RESPONSE_FILE} \
        -invPtrLoc ${INSTALL_SCRIPT_DIR}/${INVENTORY_FILE}

    # ${JAVA_HOME}/bin/java \
    #     -Djava.security.egd=file:///dev/urandom \
    #     -Djava.io.tmpdir=/tmp \
    #     -jar ${INSTALL_FILE_DIR}/${INSTALL_FILE} \
    #     -silent \
    #     -responseFile ${INSTALL_SCRIPT_DIR}/${RESPONSE_FILE} \
    #     -invPtrLoc ${INSTALL_SCRIPT_DIR}/${INVENTORY_FILE} \
    #     -jreLoc ${JAVA_HOME} \
    #     -ignoreSysPrereqs \
    #     -force \
    #     -novalidation
}

function install_weblogic_12c() {
    ${JAVA_HOME}/bin/java \
        -Djava.security.egd=file:///dev/urandom \
        -jar ${INSTALL_FILE_DIR}/${INSTALL_FILE} \
        -silent \
        -responseFile ${INSTALL_SCRIPT_DIR}/${RESPONSE_FILE} \
        -invPtrLoc ${INSTALL_SCRIPT_DIR}/${INVENTORY_FILE}

    # ${JAVA_HOME}/bin/java \
    #     -Djava.security.egd=file:///dev/urandom \
    #     -Djava.io.tmpdir=/tmp \
    #     -jar ${INSTALL_FILE_DIR}/${INSTALL_FILE} \
    #     -silent \
    #     -responseFile ${INSTALL_SCRIPT_DIR}/${RESPONSE_FILE} \
    #     -invPtrLoc ${INSTALL_SCRIPT_DIR}/${INVENTORY_FILE} \
    #     -jreLoc ${JAVA_HOME} \
    #     -ignoreSysPrereqs \
    #     -force \
    #     -novalidation
}

function install_weblogic_11g() {
    ${JAVA_HOME}/bin/java \
        -jar ${INSTALL_FILE_DIR}/${INSTALL_FILE} \
        -mode=silent \
        -silent_xml=${INSTALL_SCRIPT_DIR}/${SILENT_FILE}
}

function install_weblogic() {
    local OS_VERSION="$(grep "^VERSION=" /etc/os-release | grep -o -E "[0-9]{1,2}\.{0,1}[0-9]{0,2}")"
    echo "[INFO] OS version: ${OS_VERSION}"
    echo "[INFO] Install file: ${INSTALL_FILE}"

    ### 14c
    if [[ "${INSTALL_FILE}" =~ ^fmw_14. ]]; then
        echo "[INFO] Installing WebLogic 14c"
        if [[ ${OS_VERSION} =~ ^8|^8. ]]; then
            install_required_package_14c_rhel8
        elif [[ ${OS_VERSION} =~ ^7|^7. ]]; then
            install_required_package_14c_rhel7
        fi
        install_weblogic_14c
    ### 12cr2
    elif [[ "${INSTALL_FILE}" =~ ^fmw_12.2 ]]; then
        echo "[INFO] Installing WebLogic 12cR2"
        if [[ ${OS_VERSION} =~ ^8|^8. ]]; then
            install_required_package_12c_rhel8
        elif [[ ${OS_VERSION} =~ ^7|^7. ]]; then
            install_required_package_12c_rhel7
        fi
        install_weblogic_12c
    ### 12cr1
    elif [[ "${INSTALL_FILE}" =~ ^fmw_12.1|^wls_121 ]]; then
        echo "[INFO] Installing WebLogic 12cR1"
        if [[ ${OS_VERSION} =~ ^8|^8. ]]; then
            install_required_package_12c_rhel8
        elif [[ ${OS_VERSION} =~ ^7|^7. ]]; then
            install_required_package_12c_rhel7
        fi
        install_weblogic_12c
    ### 11g
    elif [[ "${INSTALL_FILE}" =~ ^wls103 ]]; then
        echo "[INFO] Installing WebLogic 11g"
        install_required_package_11g
        install_weblogic_11g
    fi
}

######################################################################

install_weblogic
