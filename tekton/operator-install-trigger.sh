#!/usr/bin/bash

cat > operator-tekton-triggers.yaml <<EOF
apiVersion: operator.tekton.dev/v1alpha1
kind: TektonAddon
metadata:
  name: trigger
spec:
  version: v0.7.0
EOF

kubectl apply -f operator-tekton-triggers.yaml

# tkn version
