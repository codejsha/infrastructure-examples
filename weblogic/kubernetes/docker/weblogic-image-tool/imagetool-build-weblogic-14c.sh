#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

JAVA_HOME="/usr/java/java-11"
export JAVA_HOME

### download weblogic image tool
curl -LJO https://github.com/oracle/weblogic-image-tool/releases/latest/download/imagetool.zip
unzip imagetool.zip

### copy install files
SHARE_DIR="/mnt/share"
/bin/cp -f ${SHARE_DIR}/oracle-java/11/jdk-11.0.12-linux-x64.tar.gz .
/bin/cp -f ${SHARE_DIR}/oracle-weblogic-server/wls14.1.1/fmw_14.1.1.0.0_wls_lite_Disk1_1of1.zip .
/bin/cp -f ${SHARE_DIR}/oracle-weblogic-server/opatch/p28186730_139426_Generic.zip .
/bin/cp -f ${SHARE_DIR}/oracle-weblogic-server/wls14.1.1/p33069656_141100_Generic.zip .

### delete cache
rm -rf ~/cache

### jdk
bash ./imagetool/bin/imagetool.sh cache addInstaller \
    --type=jdk \
    --version=11.0.12 \
    --path=jdk-11.0.12-linux-x64.tar.gz

### weblogic
bash ./imagetool/bin/imagetool.sh cache addInstaller \
    --type=wls \
    --version=14.1.1.0.0 \
    --path=fmw_14.1.1.0.0_wls_lite_Disk1_1of1.zip

### patch
bash ./imagetool/bin/imagetool.sh cache addPatch \
    --patchId=28186730_14.1.1.0.0 \
    --path=p28186730_139426_Generic.zip
bash ./imagetool/bin/imagetool.sh cache addPatch \
    --patchId=33069656_14.1.1.0.0 \
    --path=p33069656_141100_Generic.zip

### build
bash ./imagetool/bin/imagetool.sh create \
    --type=wls \
    --fromImage=oracle/jdk:11-oraclelinux8 \
    --tag=weblogic:14.1.1 \
    --version=14.1.1.0.0 \
    --jdkVersion=11.0.12 \
    --chown=oracle:root \
    --opatchBugNumber=28186730 \
    --patches=33069656

# --dryRun \
# --installerResponseFile= \
# --inventoryPointerFile= \
