provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "etcd" {
  metadata {
    name = "etcd"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "etcd" {
  name       = "my-etcd"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "etcd"
  version    = "6.1.3"
  values = [
    file("${path.module}/values.yaml")
  ]
  namespace = kubernetes_namespace.etcd.metadata.0.name
  depends_on = [kubernetes_namespace.etcd]
}
