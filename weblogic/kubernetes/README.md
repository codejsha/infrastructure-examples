# Oracle WebLogic Server on Kubernetes

- https://oracle.github.io/weblogic-kubernetes-operator/
- https://github.com/oracle/weblogic-kubernetes-operator
- https://github.com/oracle/docker-images

## Install the WebLogic Operator

- https://oracle.github.io/weblogic-kubernetes-operator/userguide/managing-operators/installation/
- https://oracle.github.io/weblogic-kubernetes-operator/userguide/managing-operators/using-helm/
- https://oracle.github.io/weblogic-kubernetes-operator/security/openshift/

configurations:

- `enableClusterRoleBinding: true`: the operator will have privilege in all Kubernetes namespaces (cluster level)
- `domainNamespaceSelectionStrategy: LabelSelector` and `domainNamespaceLabelSelector: weblogic-operator=enabled`: manage domains with the label "`weblogic-operator=enabled`"
- `kubernetesPlatform: OpenShift`: Sets the domain home file permissions in each WebLogic Server pod to work correctly in OpenShift for Model in Image, and Domain home in Image domains.

## Create a WebLogic Domain

- https://oracle.github.io/weblogic-kubernetes-operator/userguide/managing-domains/choosing-a-model/

Domain home source type:

- **Domain in Image**
- **Domain in PV**
- **Model in Image**

### Domain in Image

- https://oracle.github.io/weblogic-kubernetes-operator/samples/domains/domain-home-in-image/

#### Build image

1. build oracle jdk image (docker/build-jdk)
2. build weblogic image by imagetool (weblogic-image-tool/create)
3. build weblogic image that contain applications and data sources (weblogic-image-tool/update)

### Domain in PV

- https://oracle.github.io/weblogic-kubernetes-operator/samples/domains/domain-home-on-pv/

### Model in Image

- https://oracle.github.io/weblogic-kubernetes-operator/samples/domains/model-in-image/

## Configuration Overrides (situational configuration)

- https://oracle.github.io/weblogic-kubernetes-operator/userguide/managing-domains/configoverrides/

be used in Domain in Image and Domain in PV domains (Model in Image domains, use runtime updates instead)

### Override template

override template names:

| Original Configuration | Required Override Name       |
| ---------------------- | ---------------------------- |
| `config.xml`           | `config.xml`                 |
| JMS module             | `jms-MODULENAME.xml`         |
| JDBC module            | `jdbc-MODULENAME.xml`        |
| Diagnostics module     | `diagnostics-MODULENAME.xml` |

template files:

```bash
override-domain-config/
├── jdbc-MySQLDatasource.xml            # jdbc module
├── jms-ClusterJmsSystemResource.xml    # jms module
└── version.txt                         # version file
```

the `version.txt` file must contain exactly the string `2.0`:

```bash
# cat version.txt
2.0
```

create configmap(override template) and secret(secret reference):

```bash
kubectl create configmap override-domain-config --namespace ${NAMESPACE} --from-file ./override-domain-config
kubectl label configmap override-domain-config --namespace ${NAMESPACE} weblogic.domainUID="${DOMAIN_NAME}"

kubectl create secret generic ${SECRET_NAME} \
    --from-literal=url="${URL}" \
    --from-literal=username="${USERNAME}" \
    --from-literal=password="${PASSWORD}" \
    --namespace ${NAMESPACE}
kubectl label secret ${SECRET_NAME} --namespace ${NAMESPACE} weblogic.domainUID="${DOMAIN_NAME}"
```

configure domain yaml file:

```yaml
---
apiVersion: "weblogic.oracle/v8"
kind: Domain
metadata:
  name: sample-domain1
  namespace: sample-domain1-ns
  labels:
    weblogic.domainUID: sample-domain1
spec:
  # ...
  restartVersion: "1"
  introspectVersion: "1"

  webLogicCredentialsSecret:
    name: sample-domain1-weblogic-credentials

  # ...
  configuration:
    overridesConfigMap: override-domain-config
    secrets:
      - mysql-datasource-secret
```

## Istio

- https://oracle.github.io/weblogic-kubernetes-operator/userguide/istio/istio/
