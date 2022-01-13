#!/bin/bash

/bin/cp -f confluent-zookeeper.service /usr/lib/systemd/system/confluent-zookeeper.service
/bin/cp -f confluent-server.service /usr/lib/systemd/system/confluent-server.service
/bin/cp -f confluent-schema-registry.service /usr/lib/systemd/system/confluent-schema-registry.service
/bin/cp -f confluent-kafka-connect.service /usr/lib/systemd/system/confluent-kafka-connect.service
/bin/cp -f confluent-ksqldb.service /usr/lib/systemd/system/confluent-ksqldb.service
/bin/cp -f confluent-control-center.service /usr/lib/systemd/system/confluent-control-center.service
