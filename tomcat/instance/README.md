# Create instances

## Instance

```bash
bash ./create-instance.sh --instance=inst1 --http-port=8080 --https-port=8443 --shutdown-port=8005
bash ./create-instance.sh --instance=inst2 --http-port=8081 --https-port=8444 --shutdown-port=8006
```

## Cluster

### General (Multicast)

```bash
bash ./create-instance-cluster.sh --instance=inst1 --http-port=8080 --https-port=8443 --shutdown-port=8005 --ajp-port=8009 --jmx-port=8050
bash ./create-instance-cluster.sh --instance=inst2 --http-port=8081 --https-port=8444 --shutdown-port=8006 --ajp-port=8010 --jmx-port=8051

bash ./create-instance-cluster-full.sh --instance=inst1 --http-port=8080 --https-port=8443 --shutdown-port=8005 --ajp-port=8009 --jmx-port=8050
bash ./create-instance-cluster-full.sh --instance=inst2 --http-port=8081 --https-port=8444 --shutdown-port=8006 --ajp-port=8010 --jmx-port=8051
```

### Static

```bash
bash ./create-instance-cluster-static.sh --instance=inst1 --http-port=8080 --https-port=8443 --shutdown-port=8005 --ajp-port=8009 --jmx-port=8050 --cluster-address1=test1.example.com --cluster-port1=4000 --cluster-address2=test2.example.com --cluster-port2=4000 --receiver-port=4000
bash ./create-instance-cluster-static.sh --instance=inst2 --http-port=8081 --https-port=8444 --shutdown-port=8006 --ajp-port=8010 --jmx-port=8051 --cluster-address1=test1.example.com --cluster-port1=4000 --cluster-address2=test2.example.com --cluster-port2=4000 --receiver-port=4000
```

### With Redis

Set redisson mode in `env-redisson.sh`:

```bash
# REDISSON_MODE="CLUSTER_MODE"
REDISSON_MODE="MASTER_SLAVE_MODE"
# REDISSON_MODE="SINGLE_MODE"
```

Create instances:

```bash
bash ./create-instance-cluster-redis.sh --instance=inst1 --http-port=8080 --https-port=8443 --shutdown-port=8005 --ajp-port=8009 --jmx-port=8050
bash ./create-instance-cluster-redis.sh --instance=inst2 --http-port=8081 --https-port=8444 --shutdown-port=8006 --ajp-port=8010 --jmx-port=8051
```

Set addresses and password(If Redis has a password) in redisson.yaml.

Add libraries:

Add redisson-all-xxx.jar, redisson-tomcat-xxx.jar into `${CATALINA_BASE}/lib` directory.

https://github.com/redisson/redisson/tree/master/redisson-tomcat

## Create scripts

```bash
bash ./create-scripts.sh --instance=inst1 --http-port=8080 --https-port=8443 --shutdown-port=8005 --ajp-port=8009 --jmx-port=8050
bash ./create-scripts.sh --instance=inst2 --http-port=8081 --https-port=8444 --shutdown-port=8006 --ajp-port=8010 --jmx-port=8051
```
