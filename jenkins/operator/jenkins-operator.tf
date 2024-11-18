provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "jenkins_operator" {
  metadata {
    name = "jenkins-operator"
  }
}

resource "helm_release" "jenkins_operator" {
  name       = "jenkins-operator"
  repository = "https://raw.githubusercontent.com/jenkinsci/kubernetes-operator/master/chart"
  chart      = "jenkins-operator"
  version    = "0.8.0"
  values = [
    file("${path.module}/values.yaml")
  ]
  namespace = kubernetes_namespace.jenkins_operator.metadata.0.name
  depends_on = [kubernetes_namespace.jenkins_operator]
}
