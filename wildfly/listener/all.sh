#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### THREAD POOL

# bash ./add-thread-pool.sh --port-offset=0 --worker-name=http-worker
# bash ./add-thread-pool.sh --port-offset=1 --worker-name=http-worker

# bash ./add-thread-pool.sh --port-offset=0 --worker-name=https-worker
# bash ./add-thread-pool.sh --port-offset=1 --worker-name=https-worker

bash ./add-thread-pool.sh --port-offset=0 --worker-name=ajp-worker
bash ./add-thread-pool.sh --port-offset=1 --worker-name=ajp-worker

bash ./set-http-listener-thread-pool.sh --port-offset=0
bash ./set-http-listener-thread-pool.sh --port-offset=1

bash ./set-https-listener-thread-pool.sh --port-offset=0
bash ./set-https-listener-thread-pool.sh --port-offset=1

bash ./set-ajp-listener-thread-pool.sh --port-offset=0
bash ./set-ajp-listener-thread-pool.sh --port-offset=1

bash ./set-http-listener-thread-pool-config.sh --port-offset=0
bash ./set-http-listener-thread-pool-config.sh --port-offset=1

# bash ./set-https-listener-thread-pool-config.sh --port-offset=0
# bash ./set-https-listener-thread-pool-config.sh --port-offset=1

bash ./set-ajp-listener-thread-pool-config.sh --port-offset=0
bash ./set-ajp-listener-thread-pool-config.sh --port-offset=1

######################################################################

### TIMEOUT

bash ./set-http-listener-timeout.sh --port-offset=0
bash ./set-http-listener-timeout.sh --port-offset=1

bash ./set-https-listener-timeout.sh --port-offset=0
bash ./set-https-listener-timeout.sh --port-offset=1

bash ./set-ajp-listener-timeout.sh --port-offset=0
bash ./set-ajp-listener-timeout.sh --port-offset=1

######################################################################

### MAX POST SIZE

bash ./set-http-listener-max-post-size.sh --port-offset=0
bash ./set-http-listener-max-post-size.sh --port-offset=1

bash ./set-https-listener-max-post-size.sh --port-offset=0
bash ./set-https-listener-max-post-size.sh --port-offset=1

bash ./set-ajp-listener-max-post-size.sh --port-offset=0
bash ./set-ajp-listener-max-post-size.sh --port-offset=1

######################################################################

### HTTP METHOD

bash ./disable-http-listener-http-method.sh --port-offset=0
bash ./disable-http-listener-http-method.sh --port-offset=1

bash ./disable-https-listener-http-method.sh --port-offset=0
bash ./disable-https-listener-http-method.sh --port-offset=1

bash ./disable-ajp-listener-http-method.sh --port-offset=0
bash ./disable-ajp-listener-http-method.sh --port-offset=1
