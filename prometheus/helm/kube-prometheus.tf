provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "prometheus" {
  name       = "my-prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "19.6.0"
  values = [
    file("${path.module}/values.yaml")
  ]
  namespace  = kubernetes_namespace.monitoring.metadata.0.name
  depends_on = [kubernetes_namespace.monitoring]
}
