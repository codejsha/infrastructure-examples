#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### EXAMPLE FILTER

# bash ./add-filter.sh --port-offset=0
# bash ./add-filter.sh --port-offset=1

######################################################################

### SAMESITE FILTER

# bash ./add-samesite-filter.sh --port-offset=0
# bash ./add-samesite-filter.sh --port-offset=1

######################################################################

### HSTS (HTTP Strict-Transport-Security) FILTER

# bash ./add-hsts-filter.sh --port-offset=0
# bash ./add-hsts-filter.sh --port-offset=1

######################################################################

### STUCK THREAD DETECTOR FILTER

bash ./add-stuck-thread-detector.sh --port-offset=0
bash ./add-stuck-thread-detector.sh --port-offset=1

######################################################################

### HIDE SERVER HEADER INFO (Server, X-Powered-By)

bash ./hide-server-header-info.sh --port-offset=0
bash ./hide-server-header-info.sh --port-offset=1
