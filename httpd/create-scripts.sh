#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

source ./env-base.sh

HTTPD_HOME="${HTTPD_HOME}"

######################################################################

cat <<EOF > ${HTTPD_HOME}/envvars.sh
#!/bin/bash

# LD_LIBRARY_PATH="\${LD_LIBRARY_PATH}:\${HTTPD_HOME}/weblogic-plugin/lib"
# export LD_LIBRARY_PATH
EOF

######################################################################

cat <<EOF > ${HTTPD_HOME}/start-httpd.sh
#!/bin/bash
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"
set -o errexit
set -o errtrace
set -o xtrace

HTTPD_HOME="${HTTPD_HOME}"
source \${HTTPD_HOME}/envvars.sh

\${HTTPD_HOME}/bin/apachectl -d \${HTTPD_HOME} -f \${HTTPD_HOME}/conf/httpd.conf -k start
EOF

######################################################################

cat <<EOF > ${HTTPD_HOME}/restart-httpd.sh
#!/bin/bash
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"
set -o errexit
set -o errtrace
set -o xtrace

HTTPD_HOME="${HTTPD_HOME}"
source \${HTTPD_HOME}/envvars.sh

\${HTTPD_HOME}/bin/apachectl -d \${HTTPD_HOME} -f \${HTTPD_HOME}/conf/httpd.conf -k restart
EOF

######################################################################

cat <<EOF > ${HTTPD_HOME}/stop-httpd.sh
#!/bin/bash
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"
set -o errexit
set -o errtrace
set -o xtrace

HTTPD_HOME="${HTTPD_HOME}"
source \${HTTPD_HOME}/envvars.sh

\${HTTPD_HOME}/bin/apachectl -d \${HTTPD_HOME} -f \${HTTPD_HOME}/conf/httpd.conf -k stop
EOF

######################################################################

cat <<EOF > ${HTTPD_HOME}/check-config.sh
#!/bin/bash
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"
set -o errexit
set -o errtrace
set -o xtrace

HTTPD_HOME="${HTTPD_HOME}"
source \${HTTPD_HOME}/envvars.sh

\${HTTPD_HOME}/bin/apachectl -d \${HTTPD_HOME} -f \${HTTPD_HOME}/conf/httpd.conf -t
EOF

######################################################################

cat <<EOF > ${HTTPD_HOME}/get-compile-settings.sh
#!/bin/bash
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"
set -o errexit
set -o errtrace
set -o xtrace

HTTPD_HOME="${HTTPD_HOME}"
source \${HTTPD_HOME}/envvars.sh

\${HTTPD_HOME}/bin/apachectl -d \${HTTPD_HOME} -f \${HTTPD_HOME}/conf/httpd.conf -V
EOF

######################################################################

cat <<EOF > ${HTTPD_HOME}/get-include-files.sh
#!/bin/bash
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"
set -o errexit
set -o errtrace
set -o xtrace

HTTPD_HOME="${HTTPD_HOME}"
source \${HTTPD_HOME}/envvars.sh

\${HTTPD_HOME}/bin/apachectl -d \${HTTPD_HOME} -f \${HTTPD_HOME}/conf/httpd.conf -t -D DUMP_INCLUDES
EOF

######################################################################

cat <<EOF > ${HTTPD_HOME}/get-load-modules.sh
#!/bin/bash
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"
set -o errexit
set -o errtrace
set -o xtrace

HTTPD_HOME="${HTTPD_HOME}"
source \${HTTPD_HOME}/envvars.sh

# \${HTTPD_HOME}/bin/apachectl -d \${HTTPD_HOME} -f \${HTTPD_HOME}/conf/httpd.conf -M
\${HTTPD_HOME}/bin/apachectl -d \${HTTPD_HOME} -f \${HTTPD_HOME}/conf/httpd.conf -t -D DUMP_MODULES
EOF

######################################################################

cat <<EOF > ${HTTPD_HOME}/get-run-settings.sh
#!/bin/bash
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"
set -o errexit
set -o errtrace
set -o xtrace

HTTPD_HOME="${HTTPD_HOME}"
source \${HTTPD_HOME}/envvars.sh

\${HTTPD_HOME}/bin/apachectl -d \${HTTPD_HOME} -f \${HTTPD_HOME}/conf/httpd.conf -D DUMP_RUN_CFG
EOF

######################################################################

cat <<EOF > ${HTTPD_HOME}/get-settings.sh
#!/bin/bash
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"
set -o errexit
set -o errtrace
set -o xtrace

HTTPD_HOME="${HTTPD_HOME}"
source \${HTTPD_HOME}/envvars.sh

# \${HTTPD_HOME}/bin/apachectl -d \${HTTPD_HOME} -f \${HTTPD_HOME}/conf/httpd.conf -S
\${HTTPD_HOME}/bin/apachectl -d \${HTTPD_HOME} -f \${HTTPD_HOME}/conf/httpd.conf -t -D DUMP_VHOSTS -D DUMP_RUN_CFG
EOF

######################################################################

cat <<EOF > ${HTTPD_HOME}/get-version.sh
#!/bin/bash
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"
set -o errexit
set -o errtrace
set -o xtrace

HTTPD_HOME="${HTTPD_HOME}"

\${HTTPD_HOME}/bin/apachectl -d \${HTTPD_HOME} -f \${HTTPD_HOME}/conf/httpd.conf -v
EOF

######################################################################

cat <<EOF > ${HTTPD_HOME}/get-vhosts-settings.sh
#!/bin/bash
trap 'echo "\${BASH_SOURCE[0]}: line \${LINENO}: status \${?}: user \${USER}: func \${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"
set -o errexit
set -o errtrace
set -o xtrace

HTTPD_HOME="${HTTPD_HOME}"
source \${HTTPD_HOME}/envvars.sh

\${HTTPD_HOME}/bin/apachectl -d \${HTTPD_HOME} -f \${HTTPD_HOME}/conf/httpd.conf -t -D DUMP_VHOSTS
EOF

######################################################################

chmod 750 ${HTTPD_HOME}/envvars.sh
chmod 750 ${HTTPD_HOME}/start-httpd.sh
chmod 750 ${HTTPD_HOME}/restart-httpd.sh
chmod 750 ${HTTPD_HOME}/stop-httpd.sh
chmod 750 ${HTTPD_HOME}/check-config.sh
chmod 750 ${HTTPD_HOME}/get-compile-settings.sh
chmod 750 ${HTTPD_HOME}/get-include-files.sh
chmod 750 ${HTTPD_HOME}/get-load-modules.sh
chmod 750 ${HTTPD_HOME}/get-run-settings.sh
chmod 750 ${HTTPD_HOME}/get-settings.sh
chmod 750 ${HTTPD_HOME}/get-version.sh
chmod 750 ${HTTPD_HOME}/get-vhosts-settings.sh
