######################################################################

### scope

### check cluster scope access
kubectl confluent operator --namespaced=false pre-check

### check namespace scope access
kubectl confluent operator pre-check

######################################################################

### view external and internal endpoints
kubectl confluent http-endpoints

######################################################################

### migration operator 1.x to 2.x
kubectl confluent migration
