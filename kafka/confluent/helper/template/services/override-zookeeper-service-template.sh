#!/bin/bash

# USER="cp-kafka"
# GROUP="confluent"
USER=""
GROUP=""

CONFLUENT_HOME=""
SERVER_NAME=""
MYID=""
PROPERTIES_FILE=""

# DATA_DIR="/var/lib/zookeeper"
# LOG_DIR="/var/log/kafka"
DATA_DIR=""
LOG_DIR=""

######################################################################

sudo /bin/cp -f confluent-zookeeper.service /usr/lib/systemd/system
sudo mkdir -p /usr/lib/systemd/system/confluent-zookeeper.service.d
sudo mkdir -p {${DATA_DIR},${LOG_DIR}}
echo ${MYID} | sudo tee ${DATA_DIR}/myid
sudo chown -R ${USER}:${GROUP} ${DATA_DIR} ${LOG_DIR}

######################################################################

### override

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-zookeeper.service.d/override.conf
[Service]
SuccessExitStatus=143

User=
Group=
User=${USER}
Group=${GROUP}

Environment=
EnvironmentFile=${CONFLUENT_HOME}/services/${SERVER_NAME}-service.env

ExecStart=
ExecStart=/usr/bin/zookeeper-server-start ${PROPERTIES_FILE}
EOF

######################################################################

sudo systemctl daemon-reload
