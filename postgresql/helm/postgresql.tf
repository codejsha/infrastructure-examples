provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "postgres" {
  metadata {
    name = "postgres"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "postgres" {
  name       = "my-postgres"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  version    = "10.7.0"
  values = [
    file("${path.module}/values.yaml")
  ]
  set {
    name  = "postgresqlPassword"
    value = var.postgresql_password
  }
  namespace = kubernetes_namespace.postgres.metadata.0.name
  depends_on = [kubernetes_namespace.postgres]
}

# resource "helm_release" "postgres-gitlab" {
#   name       = "my-gitlab-postgres"
#   repository = "https://charts.bitnami.com/bitnami"
#   chart      = "postgresql"
#   version    = "10.7.0"
#   values = [
#     file("${path.module}/values.yaml"),
#     file("${path.module}/values-gitlab.yaml")
#   ]
#   set {
#     name  = "postgresqlPassword"
#     value = var.postgresql_password
#   }
#   namespace = kubernetes_namespace.postgres.metadata.0.name
#   depends_on = [kubernetes_namespace.postgres]
# }

variable "postgresql_password" {
  type      = string
  sensitive = true
}
