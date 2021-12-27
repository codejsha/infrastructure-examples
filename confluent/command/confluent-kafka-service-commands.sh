######################################################################

### zookeeper
sudo systemctl start confluent-zookeeper
sudo systemctl restart confluent-zookeeper
sudo systemctl status confluent-zookeeper
sudo systemctl stop confluent-zookeeper
journalctl -f -u confluent-zookeeper

### kafka
sudo systemctl start confluent-server
sudo systemctl restart confluent-server
sudo systemctl status confluent-server
sudo systemctl stop confluent-server
journalctl -f -u confluent-server

### schema-registry
sudo systemctl start confluent-schema-registry
sudo systemctl restart confluent-schema-registry
sudo systemctl status confluent-schema-registry
sudo systemctl stop confluent-schema-registry
journalctl -f -u confluent-schema-registry

### kafka-connect
sudo systemctl start confluent-kafka-connect
sudo systemctl restart confluent-kafka-connect
sudo systemctl status confluent-kafka-connect
sudo systemctl stop confluent-kafka-connect
journalctl -f -u confluent-kafka-connect

### kafka-rest
sudo systemctl start confluent-kafka-rest
sudo systemctl restart confluent-kafka-rest
sudo systemctl status confluent-kafka-rest
sudo systemctl stop confluent-kafka-rest
journalctl -f -u confluent-kafka-rest

### ksqldb
sudo systemctl start confluent-ksqldb
sudo systemctl restart confluent-ksqldb
sudo systemctl status confluent-ksqldb
sudo systemctl stop confluent-ksqldb
journalctl -f -u confluent-ksqldb

### control-center
sudo systemctl start confluent-control-center
sudo systemctl restart confluent-control-center
sudo systemctl status confluent-control-center
sudo systemctl stop confluent-control-center
journalctl -f -u confluent-control-center

######################################################################

### enable service

sudo systemctl enable confluent-zookeeper
sudo systemctl enable confluent-server
sudo systemctl enable confluent-schema-registry
sudo systemctl enable confluent-kafka-connect
sudo systemctl enable confluent-kafka-rest
sudo systemctl enable confluent-ksqldb
sudo systemctl enable confluent-control-center

sudo systemctl list-unit-files confluent-*

sudo systemctl list-units --type=service --all confluent-*

sudo systemctl status confluent-*

######################################################################

### failed state

sudo systemctl list-units --type=service --state=failed
sudo systemctl reset-failed confluent-control-center
