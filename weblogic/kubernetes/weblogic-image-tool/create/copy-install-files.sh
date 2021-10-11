#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

### 14c
SHARE_DIR="/mnt/share"
/bin/cp -f ${SHARE_DIR}/oracle-java/11/jdk-11.0.12_linux-x64_bin.tar.gz  .
/bin/cp -f ${SHARE_DIR}/oracle-weblogic-server/wls14.1.1/fmw_14.1.1.0.0_wls_lite_Disk1_1of1.zip .
/bin/cp -f ${SHARE_DIR}/oracle-weblogic-server/opatch/p28186730_139426_Generic.zip .
/bin/cp -f ${SHARE_DIR}/oracle-weblogic-server/wls14.1.1/p33069656_141100_Generic.zip .

### 12c
# SHARE_DIR="/mnt/share"
# /bin/cp -f ${SHARE_DIR}/oracle-java/8/jdk-8u301-linux-x64.tar.gz .
# /bin/cp -f ${SHARE_DIR}/oracle-weblogic-server/wls12.2.1.4/fmw_12.2.1.4.0_wls_lite_Disk1_1of1.zip .
# /bin/cp -f ${SHARE_DIR}/oracle-weblogic-server/opatch/p28186730_139426_Generic.zip .
# /bin/cp -f ${SHARE_DIR}/oracle-weblogic-server/wls12.2.1.4/p33059296_122140_Generic.zip .
