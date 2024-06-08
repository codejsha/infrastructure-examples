#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

bash ./download-install-file.sh

bash ./helm-install-confluent-operator.sh
bash ./helm-install-confluent-zookeeper.sh
bash ./helm-install-confluent-kafka.sh
bash ./helm-install-confluent-schema-registry.sh
bash ./helm-install-confluent-kafka-connect.sh
bash ./helm-install-confluent-replicator.sh
bash ./helm-install-confluent-ksqldb.sh
bash ./helm-install-confluent-control-center.sh
kubectl apply --namespace confluent-operator --filename kafka-connect0-ingress.yaml
kubectl apply --namespace confluent-operator --filename control-center-ingress.yaml

### uninstall
# kubectl delete --namespace confluent-operator --filename control-center-ingress.yaml
# kubectl delete --namespace confluent-operator --filename kafka-connect0-ingress.yaml
# helm uninstall --namespace confluent-operator confluent-control-center
# helm uninstall --namespace confluent-operator confluent-ksqldb
# helm uninstall --namespace confluent-operator confluent-replicator
# helm uninstall --namespace confluent-operator confluent-kafka-connect
# helm uninstall --namespace confluent-operator confluent-schema-registry
# helm uninstall --namespace confluent-operator confluent-kafka
# helm uninstall --namespace confluent-operator confluent-zookeeper
# helm uninstall --namespace confluent-operator confluent-operator
