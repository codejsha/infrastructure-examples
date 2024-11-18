provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "nexus" {
  metadata {
    name = "nexus"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "nexus" {
  name       = "my-nexus"
  repository = "https://sonatype.github.io/helm3-charts"
  chart      = "nexus-repository-manager"
  version    = "33.0.0"
  values = [
    file("${path.module}/values.yaml")
  ]
  namespace = kubernetes_namespace.nexus.metadata.0.name
  depends_on = [kubernetes_namespace.nexus]
}
