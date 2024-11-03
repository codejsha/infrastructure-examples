provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "jenkins" {
  name       = "jenkins"
  namespace  = "jenkins"
  create_namespace = true
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "5.7.12"
  values = [
    file("values.yaml")
  ]
  set {
    name = "controller.admin.password"
    value = "admin"
  }
}
