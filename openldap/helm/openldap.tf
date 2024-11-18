provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "ldap" {
  metadata {
    name = "ldap"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "phpldapadmin" {
  name       = "my-ldapadmin"
  repository = "https://cetic.github.io/helm-charts"
  chart      = "phpldapadmin"
  version    = "latest"
  values = [
    file("${path.module}/values.yaml")
  ]
  namespace = kubernetes_namespace.ldap.metadata.0.name
  depends_on = [kubernetes_namespace.ldap]
}
