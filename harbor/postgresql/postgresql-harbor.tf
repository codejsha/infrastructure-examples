provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "harbor" {
  metadata {
    name = "harbor"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "postgres-harbor" {
  name       = "my-harbor-postgres"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  version    = "10.7.0"
  values = [
    file("${path.module}/values.yaml"),
    file("${path.module}/values-harbor.yaml")
  ]
  set {
    name  = "postgresqlPassword"
    value = var.postgresql_password
  }
  namespace = kubernetes_namespace.harbor.metadata.0.name
  depends_on = [kubernetes_namespace.harbor]
}

variable "postgresql_password" {
  type      = string
  sensitive = true
}
