######################################################################
### confluent kafka
######################################################################

### tokens and authentication

### get bearer token
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/authenticate | jq

######################################################################

### metadata service operations

### get mds nodes
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/activenodes/https | jq
### example response:
# [
#   "https://kafka1.example.com:8090",
#   "https://kafka2.example.com:8090",
#   "https://kafka3.example.com:8090"
# ]

### get kafka cluster id
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/metadataClusterId

######################################################################

### cluster registry

### get cluster registry list
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/registry/clusters | jq
### get specific cluster registry
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/registry/clusters/clusterlocal | jq

######################################################################

## rbac - role definitions

### get role names
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/roleNames | jq
### get roles
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/roles | jq
### get specific role
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/roles/ClusterAdmin | jq

######################################################################

### audit log configuration

### get audit log config
curl --silent --user kafkaadmin:kafkaadmin --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/audit/config | jq
### get routes
curl --silent --user kafkaadmin:kafkaadmin --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/audit/routes | jq
### get route
curl --silent --user kafkaadmin:kafkaadmin --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/audit/lookup | jq

######################################################################

### private rbac ui - cluster visibility

### get control-center visibility
curl --silent --user control-center:control-center-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/control_center.crt --key /opt/confluent/ssl/control_center.key https://kafka1.example.com:8090/security/1.0/lookup/managed/clusters/principal/User:control-center | jq

######################################################################

### private rbac ui - my rolebindings

### get rolebinding for specific principal
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/lookup/rolebindings/principal/User:mds | jq
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/lookup/rolebindings/principal/User:kafkaadmin | jq
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_broker.crt --key /opt/confluent/ssl/kafka_broker.key https://kafka1.example.com:8090/security/1.0/lookup/rolebindings/principal/User:kafka | jq
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/schema_registry.crt --key /opt/confluent/ssl/schema_registry.key https://kafka1.example.com:8090/security/1.0/lookup/rolebindings/principal/User:schema-registry | jq
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_connect.crt --key /opt/confluent/ssl/kafka_connect.key https://kafka1.example.com:8090/security/1.0/lookup/rolebindings/principal/User:kafka-connect | jq
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/kafka_rest.crt --key /opt/confluent/ssl/kafka_rest.key https://kafka1.example.com:8090/security/1.0/lookup/rolebindings/principal/User:kafka-rest | jq
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/ksql.crt --key /opt/confluent/ssl/ksql.key https://kafka1.example.com:8090/security/1.0/lookup/rolebindings/principal/User:ksqldb | jq
curl --silent --user mds:mds-secret --request GET --header "Accept:application/json" --cacert /opt/confluent/ssl/ca.crt --cert /opt/confluent/ssl/control_center.crt --key /opt/confluent/ssl/control_center.key https://kafka1.example.com:8090/security/1.0/lookup/rolebindings/principal/User:control-center | jq
