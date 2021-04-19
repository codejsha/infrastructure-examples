#!/bin/bash
set -o errtrace
set -o errexit
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR

source ../env-base.sh
source ./env-component.sh

ORACLE_HOME="${ORACLE_HOME}"
DOMAIN_NAME="${DOMAIN_NAME}"
DOMAIN_HOME="${DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

######################################################################

### replace pattern with string
TEMP="\${ORACLE_HOME}"
VAR_DOMAIN_HOME="${DOMAIN_HOME/${ORACLE_HOME}/${TEMP}}"
TEMP="\${DOMAIN_NAME}"
VAR_DOMAIN_HOME="${VAR_DOMAIN_HOME/${DOMAIN_NAME}/${TEMP}}"

######################################################################

cat <<EOF > ${DOMAIN_HOME}/check-config.sh
#!/bin/bash
set -o xtrace
set -o errtrace
set -o errexit
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"

ORACLE_HOME="${ORACLE_HOME}"
DOMAIN_NAME="${DOMAIN_NAME}"
DOMAIN_HOME="${VAR_DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

PRODUCT_HOME="\${ORACLE_HOME}/ohs"
LD_LIBRARY_PATH="\${ORACLE_HOME}/lib:\${ORACLE_HOME}/ohs/lib:\${ORACLE_HOME}/oracle_common/lib"
ORACLE_INSTANCE="\${DOMAIN_HOME}"
COMPONENT_TYPE="OHS"
COMPONENT_CONFIG_PATH="\${ORACLE_INSTANCE}/config/OHS/ohs1"
COMPONENT_LOG_PATH="\${ORACLE_INSTANCE}/diagnostics/logs/OHS/ohs1"
CONFIG=\${DOMAIN_HOME}/config/fmwconfig/components/\${COMPONENT_TYPE}/instances/\${COMPONENT_NAME}/httpd.conf
export ORACLE_HOME PRODUCT_HOME LD_LIBRARY_PATH ORACLE_INSTANCE COMPONENT_TYPE COMPONENT_CONFIG_PATH COMPONENT_LOG_PATH COMPONENT_NAME CONFIG

\${ORACLE_HOME}/ohs/bin/httpd.worker -f \${CONFIG} -t
EOF

######################################################################

cat <<EOF > ${DOMAIN_HOME}/get-version.sh
#!/bin/bash
set -o xtrace
set -o errtrace
set -o errexit
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"

ORACLE_HOME="${ORACLE_HOME}"
DOMAIN_NAME="${DOMAIN_NAME}"
DOMAIN_HOME="${VAR_DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

PRODUCT_HOME="\${ORACLE_HOME}/ohs"
LD_LIBRARY_PATH="\${ORACLE_HOME}/lib:\${ORACLE_HOME}/ohs/lib:\${ORACLE_HOME}/oracle_common/lib"
ORACLE_INSTANCE="\${DOMAIN_HOME}"
COMPONENT_TYPE="OHS"
COMPONENT_CONFIG_PATH="\${ORACLE_INSTANCE}/config/OHS/ohs1"
COMPONENT_LOG_PATH="\${ORACLE_INSTANCE}/diagnostics/logs/OHS/ohs1"
CONFIG=\${DOMAIN_HOME}/config/fmwconfig/components/\${COMPONENT_TYPE}/instances/\${COMPONENT_NAME}/httpd.conf
export ORACLE_HOME PRODUCT_HOME LD_LIBRARY_PATH ORACLE_INSTANCE COMPONENT_TYPE COMPONENT_CONFIG_PATH COMPONENT_LOG_PATH COMPONENT_NAME CONFIG

\${ORACLE_HOME}/ohs/bin/httpd.worker -f \${CONFIG} -v
EOF

######################################################################

cat <<EOF > ${DOMAIN_HOME}/get-compile-settings.sh
#!/bin/bash
set -o xtrace
set -o errtrace
set -o errexit
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"

ORACLE_HOME="${ORACLE_HOME}"
DOMAIN_NAME="${DOMAIN_NAME}"
DOMAIN_HOME="${VAR_DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

PRODUCT_HOME="\${ORACLE_HOME}/ohs"
LD_LIBRARY_PATH="\${ORACLE_HOME}/lib:\${ORACLE_HOME}/ohs/lib:\${ORACLE_HOME}/oracle_common/lib"
ORACLE_INSTANCE="\${DOMAIN_HOME}"
COMPONENT_TYPE="OHS"
COMPONENT_CONFIG_PATH="\${ORACLE_INSTANCE}/config/OHS/ohs1"
COMPONENT_LOG_PATH="\${ORACLE_INSTANCE}/diagnostics/logs/OHS/ohs1"
CONFIG=\${DOMAIN_HOME}/config/fmwconfig/components/\${COMPONENT_TYPE}/instances/\${COMPONENT_NAME}/httpd.conf
export ORACLE_HOME PRODUCT_HOME LD_LIBRARY_PATH ORACLE_INSTANCE COMPONENT_TYPE COMPONENT_CONFIG_PATH COMPONENT_LOG_PATH COMPONENT_NAME CONFIG

\${ORACLE_HOME}/ohs/bin/httpd.worker -f \${CONFIG} -V
EOF

######################################################################

cat <<EOF > ${DOMAIN_HOME}/get-vhosts-settings.sh
#!/bin/bash
set -o xtrace
set -o errtrace
set -o errexit
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"

ORACLE_HOME="${ORACLE_HOME}"
DOMAIN_NAME="${DOMAIN_NAME}"
DOMAIN_HOME="${VAR_DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

PRODUCT_HOME="\${ORACLE_HOME}/ohs"
LD_LIBRARY_PATH="\${ORACLE_HOME}/lib:\${ORACLE_HOME}/ohs/lib:\${ORACLE_HOME}/oracle_common/lib"
ORACLE_INSTANCE="\${DOMAIN_HOME}"
COMPONENT_TYPE="OHS"
COMPONENT_CONFIG_PATH="\${ORACLE_INSTANCE}/config/OHS/ohs1"
COMPONENT_LOG_PATH="\${ORACLE_INSTANCE}/diagnostics/logs/OHS/ohs1"
CONFIG=\${DOMAIN_HOME}/config/fmwconfig/components/\${COMPONENT_TYPE}/instances/\${COMPONENT_NAME}/httpd.conf
export ORACLE_HOME PRODUCT_HOME LD_LIBRARY_PATH ORACLE_INSTANCE COMPONENT_TYPE COMPONENT_CONFIG_PATH COMPONENT_LOG_PATH COMPONENT_NAME CONFIG

\${ORACLE_HOME}/ohs/bin/httpd.worker -f \${CONFIG} -t -D DUMP_VHOSTS
EOF

######################################################################

cat <<EOF > ${DOMAIN_HOME}/get-run-settings.sh
#!/bin/bash
set -o xtrace
set -o errtrace
set -o errexit
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"

ORACLE_HOME="${ORACLE_HOME}"
DOMAIN_NAME="${DOMAIN_NAME}"
DOMAIN_HOME="${VAR_DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

PRODUCT_HOME="\${ORACLE_HOME}/ohs"
LD_LIBRARY_PATH="\${ORACLE_HOME}/lib:\${ORACLE_HOME}/ohs/lib:\${ORACLE_HOME}/oracle_common/lib"
ORACLE_INSTANCE="\${DOMAIN_HOME}"
COMPONENT_TYPE="OHS"
COMPONENT_CONFIG_PATH="\${ORACLE_INSTANCE}/config/OHS/ohs1"
COMPONENT_LOG_PATH="\${ORACLE_INSTANCE}/diagnostics/logs/OHS/ohs1"
CONFIG=\${DOMAIN_HOME}/config/fmwconfig/components/\${COMPONENT_TYPE}/instances/\${COMPONENT_NAME}/httpd.conf
export ORACLE_HOME PRODUCT_HOME LD_LIBRARY_PATH ORACLE_INSTANCE COMPONENT_TYPE COMPONENT_CONFIG_PATH COMPONENT_LOG_PATH COMPONENT_NAME CONFIG

\${ORACLE_HOME}/ohs/bin/httpd.worker -f \${CONFIG} -D DUMP_RUN_CFG
EOF

######################################################################

cat <<EOF > ${DOMAIN_HOME}/get-settings.sh
#!/bin/bash
set -o xtrace
set -o errtrace
set -o errexit
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"

ORACLE_HOME="${ORACLE_HOME}"
DOMAIN_NAME="${DOMAIN_NAME}"
DOMAIN_HOME="${VAR_DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

PRODUCT_HOME="\${ORACLE_HOME}/ohs"
LD_LIBRARY_PATH="\${ORACLE_HOME}/lib:\${ORACLE_HOME}/ohs/lib:\${ORACLE_HOME}/oracle_common/lib"
ORACLE_INSTANCE="\${DOMAIN_HOME}"
COMPONENT_TYPE="OHS"
COMPONENT_CONFIG_PATH="\${ORACLE_INSTANCE}/config/OHS/ohs1"
COMPONENT_LOG_PATH="\${ORACLE_INSTANCE}/diagnostics/logs/OHS/ohs1"
CONFIG=\${DOMAIN_HOME}/config/fmwconfig/components/\${COMPONENT_TYPE}/instances/\${COMPONENT_NAME}/httpd.conf
export ORACLE_HOME PRODUCT_HOME LD_LIBRARY_PATH ORACLE_INSTANCE COMPONENT_TYPE COMPONENT_CONFIG_PATH COMPONENT_LOG_PATH COMPONENT_NAME CONFIG

# \${ORACLE_HOME}/ohs/bin/httpd.worker -f \${CONFIG} -S
\${ORACLE_HOME}/ohs/bin/httpd.worker -f \${CONFIG} -t -D DUMP_VHOSTS -D DUMP_RUN_CFG
EOF

######################################################################

cat <<EOF > ${DOMAIN_HOME}/get-load-modules.sh
#!/bin/bash
set -o xtrace
set -o errtrace
set -o errexit
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"

ORACLE_HOME="${ORACLE_HOME}"
DOMAIN_NAME="${DOMAIN_NAME}"
DOMAIN_HOME="${VAR_DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

PRODUCT_HOME="\${ORACLE_HOME}/ohs"
LD_LIBRARY_PATH="\${ORACLE_HOME}/lib:\${ORACLE_HOME}/ohs/lib:\${ORACLE_HOME}/oracle_common/lib"
ORACLE_INSTANCE="\${DOMAIN_HOME}"
COMPONENT_TYPE="OHS"
COMPONENT_CONFIG_PATH="\${ORACLE_INSTANCE}/config/OHS/ohs1"
COMPONENT_LOG_PATH="\${ORACLE_INSTANCE}/diagnostics/logs/OHS/ohs1"
CONFIG=\${DOMAIN_HOME}/config/fmwconfig/components/\${COMPONENT_TYPE}/instances/\${COMPONENT_NAME}/httpd.conf
export ORACLE_HOME PRODUCT_HOME LD_LIBRARY_PATH ORACLE_INSTANCE COMPONENT_TYPE COMPONENT_CONFIG_PATH COMPONENT_LOG_PATH COMPONENT_NAME CONFIG

# \${ORACLE_HOME}/ohs/bin/httpd.worker -f \${CONFIG} -M
\${ORACLE_HOME}/ohs/bin/httpd.worker -f \${CONFIG} -t -D DUMP_MODULES
EOF

######################################################################

cat <<EOF > ${DOMAIN_HOME}/get-include-files.sh
#!/bin/bash
set -o xtrace
set -o errtrace
set -o errexit
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"

ORACLE_HOME="${ORACLE_HOME}"
DOMAIN_NAME="${DOMAIN_NAME}"
DOMAIN_HOME="${VAR_DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

PRODUCT_HOME="\${ORACLE_HOME}/ohs"
LD_LIBRARY_PATH="\${ORACLE_HOME}/lib:\${ORACLE_HOME}/ohs/lib:\${ORACLE_HOME}/oracle_common/lib"
ORACLE_INSTANCE="\${DOMAIN_HOME}"
COMPONENT_TYPE="OHS"
COMPONENT_CONFIG_PATH="\${ORACLE_INSTANCE}/config/OHS/ohs1"
COMPONENT_LOG_PATH="\${ORACLE_INSTANCE}/diagnostics/logs/OHS/ohs1"
CONFIG=\${DOMAIN_HOME}/config/fmwconfig/components/\${COMPONENT_TYPE}/instances/\${COMPONENT_NAME}/httpd.conf
export ORACLE_HOME PRODUCT_HOME LD_LIBRARY_PATH ORACLE_INSTANCE COMPONENT_TYPE COMPONENT_CONFIG_PATH COMPONENT_LOG_PATH COMPONENT_NAME CONFIG

\${ORACLE_HOME}/ohs/bin/httpd.worker -f \${CONFIG} -t -D DUMP_INCLUDES
EOF

######################################################################

chmod 750 ${DOMAIN_HOME}/check-config.sh
chmod 750 ${DOMAIN_HOME}/get-version.sh
chmod 750 ${DOMAIN_HOME}/get-compile-settings.sh
chmod 750 ${DOMAIN_HOME}/get-vhosts-settings.sh
chmod 750 ${DOMAIN_HOME}/get-run-settings.sh
chmod 750 ${DOMAIN_HOME}/get-settings.sh
chmod 750 ${DOMAIN_HOME}/get-load-modules.sh
chmod 750 ${DOMAIN_HOME}/get-include-files.sh
