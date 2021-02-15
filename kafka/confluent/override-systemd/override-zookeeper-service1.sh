#!/bin/bash

sudo mkdir -p /usr/lib/systemd/system/confluent-zookeeper.service.d
# mkdir -p /mnt/zookeeper1/logs

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-zookeeper.service.d/override.conf
[Service]
# User=
# Group=
# User=cp-kafka
# Group=confluent

# Environment=
Environment="LOG_DIR=/var/log/kafka"
# Environment="LOG_DIR=/mnt/zookeeper1/logs"

ExecStart=
# ExecStart=/usr/bin/zookeeper-server-start /etc/kafka/zookeeper.properties
ExecStart=/usr/bin/zookeeper-server-start /etc/confluent/properties/zookeeper1.properties
EOF

sudo systemctl daemon-reload
