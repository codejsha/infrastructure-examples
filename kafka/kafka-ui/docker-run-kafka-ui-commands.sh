######################################################################

HOSTNAME="$(hostname --fqdn)"
HOSTIP="$(ip -4 addr show scope global dev eth0 | grep inet | awk '{print $2}' | cut -d / -f 1 | sed -n 1p)"

docker container run \
	--rm \
    --detach \
	--name kafka-ui \
	--publish 9080:8080 \
	--env KAFKA_CLUSTERS_0_NAME="clusterlocal" \
	--env KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS="${HOSTNAME}:9092" \
	--env KAFKA_CLUSTERS_0_SCHEMAREGISTRY="http://${HOSTNAME}:8081" \
	--env KAFKA_CLUSTERS_0_KAFKACONNECT_0_NAME="connect-cluster" \
	--env KAFKA_CLUSTERS_0_KAFKACONNECT_0_ADDRESS="http://${HOSTNAME}:8083" \
	--add-host="${HOSTNAME}:${HOSTIP}" \
	provectuslabs/kafka-ui:latest
