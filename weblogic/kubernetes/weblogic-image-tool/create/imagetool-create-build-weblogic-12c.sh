#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

JAVA_HOME="/usr/java/java-1.8.0"
export JAVA_HOME

### delete cache
rm -rf ~/cache

### jdk
bash ../imagetool/bin/imagetool.sh cache addInstaller \
    --type=jdk \
    --version=8u301 \
    --path=jdk-8u301-linux-x64.tar.gz

### weblogic
bash ../imagetool/bin/imagetool.sh cache addInstaller \
    --type=wls \
    --version=12.2.1.4.0 \
    --path=fmw_12.2.1.4.0_wls_lite_Disk1_1of1.zip

### patch
bash ../imagetool/bin/imagetool.sh cache addPatch \
    --patchId=28186730_12.2.1.4.0 \
    --path=p28186730_139426_Generic.zip
bash ../imagetool/bin/imagetool.sh cache addPatch \
    --patchId=33059296_12.2.1.4.0 \
    --path=p33059296_122140_Generic.zip

### build (docker)
bash ../imagetool/bin/imagetool.sh create \
    --type=wls \
    --fromImage=oracle/jdk:11-oraclelinux8 \
    --tag=weblogic:12.2.1.4 \
    --version=12.2.1.4.0 \
    --jdkVersion=8u301 \
    --chown=oracle:root
    --opatchBugNumber=28186730 \
    --patches=33059296

### build (podman)
# bash ../imagetool/bin/imagetool.sh create \
#     --type=wls \
#     --builder=podman \
#     --fromImage=oracle/jdk:11-oraclelinux8 \
#     --tag=weblogic:12.2.1.4 \
#     --version=12.2.1.4.0 \
#     --jdkVersion=8u301 \
#     --chown=oracle:root
#     --opatchBugNumber=28186730 \
#     --patches=33059296
