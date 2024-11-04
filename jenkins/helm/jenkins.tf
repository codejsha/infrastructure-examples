provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "jenkins" {
  metadata {
    name = "jenkins"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "5.7.12"
  values = [
    file("${path.module}/values.yaml")
  ]
  set {
    name  = "controller.admin.password"
    value = "admin"
  }
  namespace = kubernetes_namespace.jenkins.metadata.0.name
  depends_on = [kubernetes_namespace.jenkins]
}
