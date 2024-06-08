######################################################################

### example:

virsh console cp1-zookeeper11
bash setup.sh "10.0.1.44/23" zookeeper11
virsh console cp1-zookeeper12
bash setup.sh "10.0.1.46/23" zookeeper12
virsh console cp1-zookeeper13
bash setup.sh "10.0.1.47/23" zookeeper13
virsh console cp1-kafka11
bash setup.sh "10.0.1.31/23" kafka11
virsh console cp1-kafka12
bash setup.sh "10.0.1.32/23" kafka12
virsh console cp1-kafka13
bash setup.sh "10.0.1.33/23" kafka13
virsh console cp1-schema-registry11
bash setup.sh "10.0.1.38/23" schema-registry11
virsh console cp1-schema-registry12
bash setup.sh "10.0.1.39/23" schema-registry12
virsh console cp1-kafka-connect11
bash setup.sh "10.0.1.35/23" kafka-connect11
virsh console cp1-kafka-connect12
bash setup.sh "10.0.1.29/23" kafka-connect12
virsh console cp1-ksqldb11
bash setup.sh "10.0.1.37/23" ksqldb11
virsh console cp1-ksqldb12
bash setup.sh "10.0.1.77/23" ksqldb12
virsh console cp1-replicator11
bash setup.sh "10.0.1.40/23" replicator11
virsh console cp1-replicator12
bash setup.sh "10.0.1.41/23" replicator12
virsh console cp1-control-center11
bash setup.sh "10.0.1.34/23" control-center11

virsh console cp1-monitoring
bash setup.sh "10.0.1.80/23" monitoring
virsh console cp1-database
bash setup.sh "10.0.1.81/23" database
