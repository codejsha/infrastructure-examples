#!/bin/bash

echo "scale down action" >> scaleDownAction.log

export INTERNAL_OPERATOR_CERT="<INTERNAL_OPERATOR_CERT>"

bash /u01/oracle/user_projects/domains/sample-domain1/bin/scripts/scalingAction.sh \
    --action=scaleDown \
    --domain_uid=sample-domain1 \
    --cluster_name=cluster-1 \
    --wls_domain_namespace=sample-domain1-ns \
    --operator_service_name=internal-weblogic-operator-svc \
    --operator_service_account=sample-weblogic-operator-sa \
    --operator_namespace=sample-weblogic-operator-ns \
    --scaling_size=1
