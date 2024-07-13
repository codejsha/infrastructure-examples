# Oracle WebLogic Server on Kubernetes

version: weblogic-kubernetes-operator-3.3.2

Table of Contents:

- [Install the WebLogic Operator](#install-the-weblogic-operator)
- [Create a WebLogic Domain](#create-a-weblogic-domain)
  - [Domain home in Image](#domain-home-in-image)
  - [Domain home on PV](#domain-home-on-pv)
  - [Model in Image](#model-in-image)
- [Configuration Overrides (situational configuration)](#configuration-overrides-situational-configuration)
  - [Template name and syntax](#template-name-and-syntax)
  - [Apply configuration templates](#apply-configuration-templates)
- [Istio](#istio)
- [References](#references)

## Install the WebLogic Operator

- installation and upgrade: <https://oracle.github.io/weblogic-kubernetes-operator/managing-operators/installation/>
- configuration references: <https://oracle.github.io/weblogic-kubernetes-operator/managing-operators/using-helm/>
- security for openshift <https://oracle.github.io/weblogic-kubernetes-operator/security/openshift/>

configurations:

- `enableClusterRoleBinding: true`: the operator will have privilege in all Kubernetes namespaces (cluster scope)
- `domainNamespaceSelectionStrategy: LabelSelector` and `domainNamespaceLabelSelector: weblogic-operator=enabled`: manage domains with the label "`weblogic-operator=enabled`"
- `kubernetesPlatform: OpenShift`: set the domain home file permissions in each WebLogic Server pod to work correctly in OpenShift for Model in Image, and Domain home in Image domains.

## Create a WebLogic Domain

- choose a domain home source type: <https://oracle.github.io/weblogic-kubernetes-operator/managing-domains/choosing-a-model/>

Domain home source types:

- **Domain home in Image** (:warning: deprecated in WebLogic Kubernetes Operator version 4.0)
- **Domain home on PV**
- **Model in Image**

### Domain home in Image

1. build oracle jdk image (docker/build-jdk)
2. build weblogic image by imagetool (weblogic-image-tool/create)
3. build weblogic image that contain applications and data sources by imagetool (weblogic-image-tool/update)
4. build weblogic image to include wldf scripts (weblogic-image-tool/update/docker/build-wldf)

### Domain home on PV

- <https://oracle.github.io/weblogic-kubernetes-operator/samples/domains/domain-home-on-pv/>

### Model in Image

- <https://oracle.github.io/weblogic-kubernetes-operator/samples/domains/model-in-image/>

## Configuration Overrides (situational configuration)

- configuration overrides: <https://oracle.github.io/weblogic-kubernetes-operator/managing-domains/configoverrides/>

be used in Domain home in Image and Domain home on PV domains (Model in Image domains, use runtime updates instead)

### Template name and syntax

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
├── diagnostics-MyWldfModule.xml        # diagnostics module
└── version.txt                         # version file
```

the `version.txt` file must contain exactly the string `2.0`:

```bash
# cat version.txt
2.0
```

### Apply configuration templates

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

configure config map and secret in domain yaml file:

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

- istio support: <https://oracle.github.io/weblogic-kubernetes-operator/managing-domains/accessing-the-domain/istio/istio/>

```bash
kubectl label namespace weblogic-operator istio-injection=enabled
kubectl label namespace sample-domain1-ns istio-injection=enabled
```

```yaml
apiVersion: "weblogic.oracle/v8"
kind: Domain
metadata:
  name: sample-domain1
  namespace: sample-domain1-ns
  labels:
    weblogic.domainUID: sample-domain1
spec:
  # ...
  configuration:
    istio:
      enabled: true
      readinessPort: 8888
      replicationChannelPort: 4564
      localhostBindingsEnabled: false
```

## References

- WebLogic Kubernetes Operator Website: <https://oracle.github.io/weblogic-kubernetes-operator/>
- WebLogic Kubernetes Operator GitHub: <https://github.com/oracle/weblogic-kubernetes-operator>
- WebLogic Image Tool GitHub: <https://github.com/oracle/weblogic-image-tool>
- WebLogic Deploy Tooling (WDT) GitHub: <https://github.com/oracle/weblogic-deploy-tooling>
- WebLogic Monitoring Exporter GitHub: <https://github.com/oracle/weblogic-monitoring-exporter>
- Docker Images from Oracle GitHub: <https://github.com/oracle/docker-images>
