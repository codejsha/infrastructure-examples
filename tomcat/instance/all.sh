#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################

### create instances
bash ./create-instance.sh --instance=inst1 --http-port=8080 --https-port=8443 --shutdown-port=8005
bash ./create-instance.sh --instance=inst2 --http-port=8081 --https-port=8444 --shutdown-port=8006

######################################################################

### create instances - cluster

bash ./create-instance-cluster.sh --instance=inst1 --http-port=8080 --https-port=8443 --shutdown-port=8005 --ajp-port=8009 --jmx-port=8050
bash ./create-instance-cluster.sh --instance=inst2 --http-port=8081 --https-port=8444 --shutdown-port=8006 --ajp-port=8010 --jmx-port=8051

# bash ./create-instance-cluster-full.sh --instance=inst1 --http-port=8080 --https-port=8443 --shutdown-port=8005 --ajp-port=8009 --jmx-port=8050
# bash ./create-instance-cluster-full.sh --instance=inst2 --http-port=8081 --https-port=8444 --shutdown-port=8006 --ajp-port=8010 --jmx-port=8051

# bash ./create-instance-cluster-static.sh --instance=inst1 --http-port=8080 --https-port=8443 --shutdown-port=8005 --ajp-port=8009 --jmx-port=8050 \
#     --cluster-address1=test1.example.com --cluster-port1=4000 --cluster-address2=test2.example.com --cluster-port2=4000 --receiver-port=4000
# bash ./create-instance-cluster-static.sh --instance=inst2 --http-port=8081 --https-port=8444 --shutdown-port=8006 --ajp-port=8010 --jmx-port=8051 \
#     --cluster-address1=test1.example.com --cluster-port1=4000 --cluster-address2=test2.example.com --cluster-port2=4000 --receiver-port=4000

# bash ./create-instance-cluster-static.sh --instance=inst1 --http-port=8080 --https-port=8443 --shutdown-port=8005 --ajp-port=8009 --jmx-port=8050 \
#     --cluster-address1=test.example.com --cluster-port1=4001 --cluster-address2=test.example.com --cluster-port2=4002 --receiver-port=4001
# bash ./create-instance-cluster-static.sh --instance=inst2 --http-port=8081 --https-port=8444 --shutdown-port=8006 --ajp-port=8010 --jmx-port=8051 \
#     --cluster-address1=test.example.com --cluster-port1=4001 --cluster-address2=test.example.com --cluster-port2=4002 --receiver-port=4002

######################################################################

### create instances - cluster with redis

# cd redis
# bash ./create-instance-cluster-redis.sh --instance=inst1 --http-port=8080 --https-port=8443 --shutdown-port=8005 --ajp-port=8009 --jmx-port=8050
# bash ./create-instance-cluster-redis.sh --instance=inst2 --http-port=8081 --https-port=8444 --shutdown-port=8006 --ajp-port=8010 --jmx-port=8051
# cd ..

######################################################################

### create scripts

bash ./create-scripts.sh --instance=inst1 --http-port=8080 --https-port=8443 --shutdown-port=8005 --ajp-port=8009 --jmx-port=8050
bash ./create-scripts.sh --instance=inst2 --http-port=8081 --https-port=8444 --shutdown-port=8006 --ajp-port=8010 --jmx-port=8051
