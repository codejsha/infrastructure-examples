provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "mongodb" {
  metadata {
    name = "mongodb"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "mongodb" {
  name       = "my-mongodb"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mongodb"
  version    = "8.2.3"
  set { name = "auth.rootPassword" value = var.root_password }
  set { name = "auth.username" value = var.username }
  set { name = "auth.password" value = var.password }
  values = [
    file("${path.module}/values.yaml")
  ]
  namespace = kubernetes_namespace.mongodb.metadata.0.name
  depends_on = [kubernetes_namespace.mongodb]
}

variable "root_password" {
  type      = string
  sensitive = true
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}
