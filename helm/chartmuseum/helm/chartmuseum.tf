provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "chartmuseum" {
  metadata {
    name = "chartmuseum"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "chartmuseum" {
  name       = "my-chartmuseum"
  repository = "https://chartmuseum.github.io/charts"
  chart      = "chartmuseum"
  version    = "2.14.2"
  values = [
    file("${path.module}/values.yaml")
  ]
  set {
    name  = "env.secret.AWS_ACCESS_KEY_ID"
    value = var.aws_access_key
  }
  set {
    name  = "env.secret.AWS_SECRET_ACCESS_KEY"
    value = var.aws_secret_key
  }
  namespace = kubernetes_namespace.chartmuseum.metadata.0.name
  depends_on = [kubernetes_namespace.chartmuseum]
}

variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type      = string
  sensitive = true
}
