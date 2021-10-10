# Oracle WebLogic Server on Kubernetes

- https://oracle.github.io/weblogic-kubernetes-operator/
- https://github.com/oracle/weblogic-kubernetes-operator
- https://github.com/oracle/docker-images

## Install the WebLogic Operator

- https://oracle.github.io/weblogic-kubernetes-operator/userguide/managing-operators/installation/

## Create a WebLogic Domain

- https://oracle.github.io/weblogic-kubernetes-operator/userguide/managing-domains/choosing-a-model/

Domain home source type:

- Domain in Image
- Domain in PV
- Model in Image

### Domain in Image

- https://oracle.github.io/weblogic-kubernetes-operator/samples/domains/domain-home-in-image/

#### Build image

1. build oracle jdk image (docker/build-jdk)
2. build weblogic image by imagetool (weblogic-image-tool/create)
3. build weblogic image that contain jdbc drivers configure data sources (weblogic-image-tool/update-jdbc)
4. build weblogic image that contain applications and configure deployments (weblogic-image-tool/update-deploy)

### Domain in PV

- https://oracle.github.io/weblogic-kubernetes-operator/samples/domains/domain-home-on-pv/

### Model in Image

- https://oracle.github.io/weblogic-kubernetes-operator/samples/domains/model-in-image/
