#!/usr/bin/bash

ORACLE_HOME="/usr/local/ohs"
DOMAIN_NAME="base_domain"
DOMAIN_HOME="${ORACLE_HOME}/user_projects/domains/${DOMAIN_NAME}"
LOG_HOME="\${DOMAIN_HOME}/logs"
COMPONENT_NAME="ohs1"

######################################################################

cat > "${DOMAIN_HOME}/start-nodemanager.sh" <<EOF
#!/usr/bin/bash

DOMAIN_HOME="${DOMAIN_HOME}"
LOG_HOME="${LOG_HOME}"
GET_DATE="$(date +'%Y%m%d_%H%M%S')"

PID="\$(pgrep -xa java | grep \${DOMAIN_HOME} | grep NodeManager | awk '{print \$1}')"
if [ -n "\${PID}" ]; then
  echo "NodeManager (pid $\{PID}) is already running!"
  exit
fi

if [ -f ${LOG_HOME}/nohup_NodeManager.out ]; then
  mv ${LOG_HOME}/nohup_NodeManager.out ${LOG_HOME}/NodeManager/nohup_NodeManager_\${GET_DATE}.out
fi

touch ${LOG_HOME}/nohup_NodeManager.out
nohup \${DOMAIN_HOME}/bin/startNodeManager.sh > ${LOG_HOME}/nohup_NodeManager.out 2>&1 &
tail -f ${LOG_HOME}/nohup_NodeManager.out
EOF

cat > "${DOMAIN_HOME}/stop-nodemanager.sh" <<EOF
#!/usr/bin/bash

DOMAIN_HOME="${DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

PID="\$(pgrep -xa java | grep \${DOMAIN_HOME} | grep NodeManager | awk '{print \$1}')"
kill -9 \${PID}
EOF

######################################################################

cat > "${DOMAIN_HOME}/start-${COMPONENT_NAME}.sh" <<EOF
#!/usr/bin/bash

DOMAIN_HOME="${DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

\${DOMAIN_HOME}/bin/startComponent.sh \${COMPONENT_NAME} storeUserConfig
EOF

cat > "${DOMAIN_HOME}/stop-${COMPONENT_NAME}.sh" <<EOF
#!/usr/bin/bash

DOMAIN_HOME="${DOMAIN_HOME}"
COMPONENT_NAME="${COMPONENT_NAME}"

\${DOMAIN_HOME}/bin/stopComponent.sh \${COMPONENT_NAME}
EOF

######################################################################

mkdir -p "$(eval echo ${LOG_HOME}/NodeManager)"
mkdir -p "$(eval echo ${LOG_HOME}/${COMPONENT_NAME})"

ln -snf ${DOMAIN_HOME} ${ORACLE_HOME}/${DOMAIN_NAME}
ln -snf ${DOMAIN_HOME}/config/fmwconfig/components/OHS/${COMPONENT_NAME} ${DOMAIN_HOME}/config/${COMPONENT_NAME}stg
ln -snf ${DOMAIN_HOME}/config/fmwconfig/components/OHS/instances/${COMPONENT_NAME} ${DOMAIN_HOME}/config/${COMPONENT_NAME}rt

chmod 750 ${DOMAIN_HOME}/start-nodemanager.sh
chmod 750 ${DOMAIN_HOME}/stop-nodemanager.sh
chmod 750 ${DOMAIN_HOME}/start-${COMPONENT_NAME}.sh
chmod 750 ${DOMAIN_HOME}/stop-${COMPONENT_NAME}.sh

######################################################################
