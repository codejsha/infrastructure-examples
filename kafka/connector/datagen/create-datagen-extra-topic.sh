#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################
### apache kafka
######################################################################

kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic clickstream_user_click_events
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic clickstream_user_click_events_window
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic clickstream_page_click_event_window

curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/clickstream_user_click_events-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-clickstream_user_click_events-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/clickstream_user_click_events-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/clickstream_user_click_events_window-key/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"long\"}"}' http://localhost:8081/subjects/clickstream_user_click_events_window-value/versions | jq


######################################################################
### confluent kafka
######################################################################

# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic user_clickstream

# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/user_clickstream-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-user_clickstream-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/user_clickstream-value/versions | jq
