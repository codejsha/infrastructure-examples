######################################################################

### zookeeper
sudo firewall-cmd --permanent --zone=public --add-port=2888/tcp
sudo firewall-cmd --permanent --zone=public --add-port=3888/tcp
sudo firewall-cmd --permanent --zone=public --add-port=2181/tcp
sudo firewall-cmd --permanent --zone=public --add-port=2182/tcp
sudo firewall-cmd --permanent --zone=public --add-port=1234/tcp
sudo firewall-cmd --permanent --zone=public --add-port=9100/tcp
sudo firewall-cmd --reload

### kafka
sudo firewall-cmd --permanent --zone=public --add-port=9091/tcp
sudo firewall-cmd --permanent --zone=public --add-port=9092/tcp
sudo firewall-cmd --permanent --zone=public --add-port=9093/tcp
sudo firewall-cmd --permanent --zone=public --add-port=9094/tcp
sudo firewall-cmd --permanent --zone=public --add-port=8090/tcp
sudo firewall-cmd --permanent --zone=public --add-port=1234/tcp
sudo firewall-cmd --permanent --zone=public --add-port=9100/tcp
sudo firewall-cmd --reload

### schema-registry
sudo firewall-cmd --permanent --zone=public --add-port=8081/tcp
sudo firewall-cmd --permanent --zone=public --add-port=1234/tcp
sudo firewall-cmd --permanent --zone=public --add-port=9100/tcp
sudo firewall-cmd --reload

### kafka-connect
sudo firewall-cmd --permanent --zone=public --add-port=8083/tcp
sudo firewall-cmd --permanent --zone=public --add-port=1234/tcp
sudo firewall-cmd --permanent --zone=public --add-port=9100/tcp
sudo firewall-cmd --reload

### ksqldb
sudo firewall-cmd --permanent --zone=public --add-port=8088/tcp
sudo firewall-cmd --permanent --zone=public --add-port=1234/tcp
sudo firewall-cmd --permanent --zone=public --add-port=9100/tcp
sudo firewall-cmd --reload

### control-center
sudo firewall-cmd --permanent --zone=public --add-port=9021/tcp
sudo firewall-cmd --permanent --zone=public --add-port=9100/tcp
sudo firewall-cmd --reload

### monitoring
sudo firewall-cmd --permanent --zone=public --add-port=9090/tcp
sudo firewall-cmd --permanent --zone=public --add-port=9093/tcp
sudo firewall-cmd --permanent --zone=public --add-port=3000/tcp
sudo firewall-cmd --permanent --zone=public --add-port=8000/tcp
sudo firewall-cmd --permanent --zone=public --add-port=9100/tcp
sudo firewall-cmd --permanent --zone=public --add-port=9000/tcp
sudo firewall-cmd --permanent --zone=public --add-port=53/tcp
sudo firewall-cmd --permanent --zone=public --add-port=53/udp
sudo firewall-cmd --permanent --zone=public --add-port=389/tcp
sudo firewall-cmd --permanent --zone=public --add-port=636/tcp
sudo firewall-cmd --permanent --zone=public --add-port=6080/tcp
sudo firewall-cmd --permanent --zone=public --add-port=6443/tcp
sudo firewall-cmd --reload
