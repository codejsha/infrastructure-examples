resource "helm_release" "metallb" {
  namespace  = var.namespace
  name       = "metallb"
  repository = "https://metallb.github.io/metallb"
  chart      = "metallb"
  version    = "0.15.0"
}
