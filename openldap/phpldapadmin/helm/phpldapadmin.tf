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

resource "helm_release" "openldap" {
  name       = "my-openldap"
  repository = "https://charts.helm.sh/stable"
  chart      = "openldap"
  version    = "latest"
  values = [
    file("${path.module}/values.yaml")
  ]
  namespace = kubernetes_namespace.ldap.metadata.0.name
  depends_on = [kubernetes_namespace.ldap]
}
