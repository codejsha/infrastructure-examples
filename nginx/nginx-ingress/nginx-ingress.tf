provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "ingress-nginx" {
  metadata {
    name = "ingress-nginx"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "ingress-nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.0.16"
  namespace  = kubernetes_namespace.ingress-nginx.metadata.0.name
  depends_on = [kubernetes_namespace.ingress-nginx]
}
