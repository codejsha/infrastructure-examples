#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

helm repo add airflow-stable https://airflow-helm.github.io/charts
helm repo add apache-solr https://solr.apache.org/charts
helm repo add appscode https://charts.appscode.com/stable
helm repo add artifact-hub https://artifacthub.github.io/hub/chart
helm repo add atlassian-data-center https://atlassian-labs.github.io/data-center-helm-charts
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add cetic https://cetic.github.io/helm-charts
helm repo add chartmuseum https://chartmuseum.github.io/charts
helm repo add confluentinc https://confluentinc.github.io/cp-helm-charts
helm repo add datadog https://helm.datadoghq.com
helm repo add descheduler https://kubernetes-sigs.github.io/descheduler
helm repo add drone https://charts.drone.io
helm repo add elastic https://helm.elastic.co
helm repo add enix https://charts.enix.io
helm repo add gitea-charts https://dl.gitea.io/charts
helm repo add gitlab https://charts.gitlab.io
helm repo add harbor https://helm.goharbor.io
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo add incubator https://charts.helm.sh/incubator
helm repo add influxdata https://helm.influxdata.com
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add jenkins https://charts.jenkins.io
helm repo add jetstack https://charts.jetstack.io
helm repo add jfrog https://charts.jfrog.io
helm repo add klustair https://klustair.github.io/klustair-helm
helm repo add kube-state-metrics https://kubernetes.github.io/kube-state-metrics
helm repo add minio https://helm.min.io
helm repo add oteemocharts https://oteemo.github.io/charts
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add renovate https://docs.renovatebot.com/helm-charts
helm repo add stable https://charts.helm.sh/stable
helm repo add strimzi https://strimzi.io/charts
helm repo add vmware-tanzu https://vmware-tanzu.github.io/helm-charts

### local
# helm repo add --username ${USERNAME} --password ${PASSWORD} local-harbor http://harbor.example.com/chartrepo/library
