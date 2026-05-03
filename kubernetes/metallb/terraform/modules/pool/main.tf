resource "kubernetes_manifest" "address_pool" {
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind       = "IPAddressPool"
    metadata = {
      name      = "clusterlocal-pool"
      namespace = var.namespace
    }
    spec = {
      addresses = var.pool_addresses
    }
  }
}

resource "kubernetes_manifest" "layer2_advertisement" {
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind       = "L2Advertisement"
    metadata = {
      name      = "clusterlocal-advertisement"
      namespace = var.namespace
    }
    spec = {
      ipAddressPools = [
        kubernetes_manifest.address_pool.manifest.metadata.name,
      ]
    }
  }
}
