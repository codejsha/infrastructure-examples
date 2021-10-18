#!/bin/bash

echo "receive scaling action" >> scaleReceiver.log

RECEIVED_SCALE_ACTION="${1}"

if [ "${RECEIVED_SCALE_ACTION}" == "web_hook_scaleup" ]; then
    echo "[INFO] The '${RECEIVED_SCALE_ACTION}' hook has received." >> scaleReceiver.log
    bash /var/scripts/scaleUpAction.sh
elif [ "${RECEIVED_SCALE_ACTION}" == "web_hook_scaledown" ]; then
    echo "[INFO] The '${RECEIVED_SCALE_ACTION}' hook has received." >> scaleReceiver.log
    bash /var/scripts/scaleDownAction.sh
else
    echo "[ERROR] The action ('${RECEIVED_SCALE_ACTION}') not found!" >> scaleReceiver.log
fi
