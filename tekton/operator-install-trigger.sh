#!/usr/bin/bash

cat <<EOF > ./operator-tekton-triggers.yaml
apiVersion: operator.tekton.dev/v1alpha1
kind: TektonAddon
metadata:
  name: trigger
spec:
  version: v0.7.0
EOF

kubectl apply -f operator-tekton-triggers.yaml

# tkn version
