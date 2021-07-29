#!/bin/bash

# USER="cp-ksql"
# GROUP="confluent"
USER=""
GROUP=""

CONFLUENT_HOME=""
SERVER_NAME=""
PROPERTIES_FILE=""

# DATA_DIR="/var/lib/kafka-streams"
# LOG_DIR="/var/log/confluent/ksql"
DATA_DIR=""
LOG_DIR=""

######################################################################

sudo /bin/cp -f confluent-ksqldb.service /usr/lib/systemd/system
sudo mkdir -p /usr/lib/systemd/system/confluent-ksqldb.service.d
sudo mkdir -p {${DATA_DIR},${LOG_DIR}}
sudo chown -R ${USER}:${GROUP} ${DATA_DIR} ${LOG_DIR}

######################################################################

### override

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-ksqldb.service.d/override.conf
[Service]
SuccessExitStatus=143

User=
Group=
User=${USER}
Group=${GROUP}

Environment=
EnvironmentFile=${CONFLUENT_HOME}/services/${SERVER_NAME}-service.env

ExecStart=
ExecStart=/usr/bin/ksql-server-start ${PROPERTIES_FILE}
EOF

######################################################################

sudo systemctl daemon-reload
