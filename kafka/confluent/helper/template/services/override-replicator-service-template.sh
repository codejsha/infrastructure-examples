#!/bin/bash

# USER="cp-kafka-connect"
# GROUP="confluent"
USER=""
GROUP=""

CONFLUENT_HOME=""
SERVER_NAME=""
PROPERTIES_FILE=""

# LOG_DIR="/var/log/kafka"
LOG_DIR=""

######################################################################

sudo /bin/cp -f confluent-replicator.service /usr/lib/systemd/system
sudo mkdir -p /usr/lib/systemd/system/confluent-replicator.service.d
sudo mkdir -p ${LOG_DIR}
sudo chown -R ${USER}:${GROUP} ${LOG_DIR}

######################################################################

### override

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-replicator.service.d/override.conf
[Service]
SuccessExitStatus=143

User=
Group=
User=${USER}
Group=${GROUP}

Environment=
EnvironmentFile=${CONFLUENT_HOME}/services/${SERVER_NAME}-service.env

ExecStart=
ExecStart=/usr/bin/connect-distributed ${PROPERTIES_FILE}
EOF

######################################################################

sudo systemctl daemon-reload
