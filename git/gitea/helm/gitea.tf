provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "gitea" {
  metadata {
    name = "gitea"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "gitea" {
  name       = "my-gitea"
  repository = "https://dl.gitea.com/charts"
  chart      = "gitea"
  version    = "4.1.0"
  values = [
    file("${path.module}/values.yaml")
  ]
  namespace = kubernetes_namespace.gitea.metadata.0.name
  depends_on = [kubernetes_namespace.gitea]
}
