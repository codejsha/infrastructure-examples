#!/bin/bash

cat <&0 > all.yaml
kustomize build . && rm all.yaml

# cat > all.yaml
# kustomize build .
# rm all.yaml

# cat > all.yaml
# kubectl kustomize
# rm all.yaml
