provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "kafka" {
  metadata {
    name = "kafka"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "kafka" {
  name       = "my-kafka"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "kafka"
  version    = "18.3.1"
  values = [
    file("${path.module}/values.yaml")
  ]
  namespace = kubernetes_namespace.kafka.metadata.0.name
  depends_on = [kubernetes_namespace.kafka]
}
