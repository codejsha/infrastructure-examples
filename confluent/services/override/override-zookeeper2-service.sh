#!/bin/bash

USER="confluent"
GROUP="confluent"

CONFLUENT_HOME="/usr/local/confluent"
SERVER_NAME="zookeeper2"
PROPERTIES_FILE="${CONFLUENT_HOME}/properties/zookeeper2.properties"
MYID="2"

DATA_DIR="/mnt/zookeeper/data"
LOG_DIR="/mnt/zookeeper/logs"

######################################################################

sudo mkdir -p /usr/lib/systemd/system/confluent-zookeeper.service.d
sudo mkdir -p {${DATA_DIR},${LOG_DIR}}
echo ${MYID} | sudo tee ${DATA_DIR}/myid
sudo chown -R confluent:confluent ${DATA_DIR} ${LOG_DIR}

######################################################################

### default

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-zookeeper.service
[Unit]
Description=Confluent ZooKeeper
Documentation=http://docs.confluent.io/
After=network.target

[Service]
Type=simple
User=cp-kafka
Group=confluent
ExecStart=/usr/bin/zookeeper-server-start /etc/kafka/zookeeper.properties
LimitNOFILE=100000
TimeoutStopSec=180
Restart=no

[Install]
WantedBy=multi-user.target
EOF

######################################################################

### override

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-zookeeper.service.d/override.conf
[Service]
User=
Group=
User=confluent
Group=confluent

Restart=no
RestartSec=100ms
SuccessExitStatus=0 143

Environment=
EnvironmentFile=-${CONFLUENT_HOME}/services/zookeeper-service.env

ExecStart=
ExecStart=/usr/bin/zookeeper-server-start ${PROPERTIES_FILE}

# ExecStop=
EOF

######################################################################

sudo systemctl daemon-reload
