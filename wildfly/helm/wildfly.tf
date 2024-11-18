provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "wildfly" {
  metadata {
    name = "wildfly"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "wildfly" {
  name       = "my-wildfly"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wildfly"
  version    = "8.2.3"
  set {
    name  = "wildflyPassword"
    value = var.wildfly_password
  }
  values = [
    file("${path.module}/values.yaml")
  ]
  namespace = kubernetes_namespace.wildfly.metadata.0.name
  depends_on = [kubernetes_namespace.wildfly]
}

variable "wildfly_password" {
  type      = string
  sensitive = true
}
