#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

source ../env-base.sh

HTTPD_HOME="${HTTPD_HOME}"
PLUGIN_HOME="${HTTPD_HOME}/weblogic-plugin"

# PLUGIN_FILE_DIR="/mnt/share/oracle-http-server/ohs11.1.1.9/ofm_wlsplugins_generic_11.1.1.9.0_disk1_1of1"
PLUGIN_FILE_DIR="/mnt/share/oracle-http-server/ohs12.2.1.3/fmw_12.2.1.3.0_wlsplugins_Disk1_1of1"
# PLUGIN_FILE_DIR="/mnt/share/oracle-http-server/ohs12.2.1.4/fmw_12.2.1.4.0_wlsplugins_Disk1_1of1"

# PLUGIN_FILE="WLSPlugin11g-64bit-Apache2.2-linux64-x86_64.zip"
PLUGIN_FILE="WLSPlugin12.2.1.3.0-Apache2.2-Apache2.4-Linux_x86_64-12.2.1.3.0.zip"
# PLUGIN_FILE="WLSPlugin12.2.1.4.0-Apache2.2-Apache2.4-Linux_x86_64-12.2.1.4.0.zip"

######################################################################

unzip -d ${PLUGIN_HOME} ${PLUGIN_FILE_DIR}/${PLUGIN_FILE}

/bin/cp -pf httpd-vhosts.conf ${HTTPD_HOME}/conf/extra/httpd-vhosts-weblogic.conf
/bin/cp -pf httpd-ssl-vhosts.conf ${HTTPD_HOME}/conf/extra/httpd-ssl-vhosts-weblogic.conf
