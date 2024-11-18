provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "zookeeper" {
  metadata {
    name = "zookeeper"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "zookeeper" {
  name       = "my-zookeeper"
  repository = "https://charts.helm.sh/incubator"
  chart      = "zookeeper"
  version    = "latest"
  namespace  = kubernetes_namespace.zookeeper.metadata.0.name
  depends_on = [kubernetes_namespace.zookeeper]
}
