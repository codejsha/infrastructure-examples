provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "mssql" {
  metadata {
    name = "mssql"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "mssql" {
  name       = "my-mssql"
  repository = "https://charts.helm.sh/stable"
  chart      = "mssql-linux"
  version    = "0.11.2"
  set { name = "acceptEula.value" value = "Y" }
  set { name = "edition.value" value = "Developer" }
  set { name = "collation" value = "SQL_Latin1_General_100_CI_AS_SC" }
  set { name = "sapassword" value = var.mssql_password }
  set { name = "persistence.enabled" value = "true" }
  set { name = "persistence.storageClass" value = "standard" }
  set { name = "service.type" value = "LoadBalancer" }
  set { name = "service.loadBalancerIP" value = "10.10.10.91" }
  namespace  = kubernetes_namespace.mssql.metadata.0.name
  depends_on = [kubernetes_namespace.mssql]
}

variable "mssql_password" {
  type      = string
  sensitive = true
}
