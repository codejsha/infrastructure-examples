#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# cd instance
# bash ./all.sh
# cd ..

# cd user
# bash ./all.sh
# cd ..

######################################################################

cd undertow
bash ./all.sh
cd ..

cd cluster
bash ./all.sh
cd ..

cd security
bash ./all.sh
cd ..

cd datasource
bash ./all.sh
cd ..

cd deployment
bash ./all.sh
cd ..

cd filter
bash ./all.sh
cd ..

cd listener
bash ./all.sh
cd ..

cd logging
bash ./all.sh
cd ..
