provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "mysql" {
  metadata {
    name = "mysql"
    labels = {
      "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "mysql" {
  name       = "my-mysql"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mysql"
  version    = "9.4.6"
  set { name = "auth.rootPassword" value = var.mysql_root_password }
  set { name = "auth.username" value = var.mysql_user }
  set { name = "auth.password" value = var.mysql_password }
  values = [
    file("${path.module}/values.yaml")
  ]
  namespace = kubernetes_namespace.mysql.metadata.0.name
  depends_on = [kubernetes_namespace.mysql]
}

variable "mysql_root_password" {
  type      = string
  sensitive = true
}

variable "mysql_user" {
  type = string
}

variable "mysql_password" {
  type      = string
  sensitive = true
}
