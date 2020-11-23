#!/usr/bin/bash

source ./env-base.sh
source ./env-component.sh

DOMAIN_HOME="${DOMAIN_HOME}"
LOG_DIR="${LOG_DIR}"
COMPONENT_NAME="${COMPONENT_NAME}"

######################################################################

### transform variable
TEMP="\${DOMAIN_HOME}"
VAR_LOG_DIR="${LOG_DIR/${DOMAIN_HOME}/${TEMP}}"

######################################################################

cat <<EOF > ${DOMAIN_HOME}/start-${COMPONENT_NAME}.sh
#!/usr/bin/bash
export PS4="\e[33;1m+ \e[0m"; set -x

DOMAIN_HOME="${DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

export CONFIG_JVM_ARGS="\${CONFIG_JVM_ARGS} -Djava.security.egd=file:///dev/urandom"
\${DOMAIN_HOME}/bin/startComponent.sh \${COMPONENT_NAME} storeUserConfig
EOF

cat <<EOF > ${DOMAIN_HOME}/stop-${COMPONENT_NAME}.sh
#!/usr/bin/bash
export PS4="\e[33;1m+ \e[0m"; set -x

DOMAIN_HOME="${DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

export CONFIG_JVM_ARGS="\${CONFIG_JVM_ARGS} -Djava.security.egd=file:///dev/urandom"
\${DOMAIN_HOME}/bin/stopComponent.sh \${COMPONENT_NAME}
EOF

######################################################################

mkdir -p ${LOG_DIR}/${COMPONENT_NAME}

ln -snf ${DOMAIN_HOME}/config/fmwconfig/components/OHS/${COMPONENT_NAME} ${DOMAIN_HOME}/config/${COMPONENT_NAME}stg
ln -snf ${DOMAIN_HOME}/config/fmwconfig/components/OHS/instances/${COMPONENT_NAME} ${DOMAIN_HOME}/config/${COMPONENT_NAME}rt

chmod 750 ${DOMAIN_HOME}/start-${COMPONENT_NAME}.sh
chmod 750 ${DOMAIN_HOME}/stop-${COMPONENT_NAME}.sh

######################################################################
