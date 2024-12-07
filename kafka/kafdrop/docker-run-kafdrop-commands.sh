######################################################################

HOSTNAME="$(hostname --fqdn)"
HOSTIP="$(ip -4 addr show scope global dev eth0 | grep inet | awk '{print $2}' | cut -d / -f 1 | sed -n 1p)"

docker container run \
    --rm \
    --detach \
    --name kafdrop \
    --publish 9003:9000 \
    --env KAFKA_BROKERCONNECT="${HOSTNAME}:9092" \
    --env SCHEMAREGISTRY_CONNECT="http://${HOSTNAME}:8081" \
    --env CMD_ARGS="--message.format=AVRO" \
    --add-host="${HOSTNAME}:${HOSTIP}" \
    obsidiandynamics/kafdrop:latest
