######################################################################

### event listener

kubectl patch configmap -n tekton-pipelines config-logging-triggers --type='json' -p '[{"op":"replace","path":"/data","value":{"loglevel.eventlistener":"debug"}}]'
kubectl patch configmap -n tekton-pipelines config-logging-triggers --type='json' -p '[{"op":"replace","path":"/data","value":{"loglevel.eventlistener":"info"}}]'
