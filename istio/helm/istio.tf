provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "istio-system" {
  metadata {
    name = "istio-system"
  }
}

resource "helm_release" "istio-base" {
  name       = "istio-base"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "base"
  version    = "1.24.2"
  set {
    name  = "defaultRevision"
    value = "default"
  }
  namespace = kubernetes_namespace.istio-system.metadata.0.name
  depends_on = [kubernetes_namespace.istio-system]
}

resource "helm_release" "istio-istiod" {
  name       = "istio-istiod"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "istiod"
  version    = "1.24.2"
  namespace  = kubernetes_namespace.istio-system.metadata.0.name
  depends_on = [helm_release.istio-base]
}

resource "kubernetes_namespace" "istio-ingress" {
  metadata {
    name = "istio-ingress"
  }
}

resource "helm_release" "istio-ingressgateway" {
  name       = "istio-ingressgateway"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "gateway"
  version    = "1.24.2"
  namespace  = kubernetes_namespace.istio-ingress.metadata.0.name
  depends_on = [kubernetes_namespace.istio-ingress, helm_release.istio-istiod]
}
