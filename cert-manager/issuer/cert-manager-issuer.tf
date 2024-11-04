provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_manifest" "selfsigned_cluster_issuer" {
  manifest = yamldecode(file("${path.module}/selfsigned-cluster-issuer.yaml"))
}

# resource "kubernetes_manifest" "selfsigned_issuer" {
#   manifest = yamldecode(file("${path.module}/selfsigned-issuer.yaml"))
# }
