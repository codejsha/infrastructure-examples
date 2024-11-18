provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "kubed" {
  name       = "my-kubed"
  repository = "https://charts.appscode.com/stable"
  chart      = "kubed"
  version    = "latest"
  namespace  = "kube-system"
}
