######################################################################

function cdkafka() { DIRECTORY="/usr/local/kafka"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
