######################################################################
### confluent kafka
######################################################################

### login mds cluster
confluent login --ca-cert-path /var/ssl/private/ca.crt --url https://kafka1:8090

### get cluster registry entry
confluent cluster list

