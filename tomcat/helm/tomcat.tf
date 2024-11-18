provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "tomcat" {
  metadata {
    name = "tomcat"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "tomcat" {
  name       = "my-tomcat"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "tomcat"
  version    = "8.0.0"
  values = [
    file("${path.module}/values.yaml")
  ]
  namespace = kubernetes_namespace.tomcat.metadata.0.name
  depends_on = [kubernetes_namespace.tomcat]
}
