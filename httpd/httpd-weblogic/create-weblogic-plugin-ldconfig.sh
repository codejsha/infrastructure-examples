#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

cat <<EOF | sudo tee /etc/ld.so.conf.d/weblogic-plugin.conf
# /etc/httpd/weblogic-plugin/lib
/usr/local/httpd/weblogic-plugin/lib
EOF

sudo ldconfig
