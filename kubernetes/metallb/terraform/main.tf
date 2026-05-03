terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 3.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 3.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace_v1" "metallb" {
  metadata {
    name = var.namespace
  }
}

# module "legacy" {
#   source         = "./modules/legacy"
#   namespace      = kubernetes_namespace_v1.metallb.metadata[0].name
#   pool_addresses = var.pool_addresses
#   providers = {
#     helm       = helm
#   }
# }

module "helm" {
  source    = "modules/helm"
  namespace = kubernetes_namespace_v1.metallb.metadata[0].name
  providers = {
    helm = helm
  }
}

module "pool" {
  source         = "modules/pool"
  namespace      = kubernetes_namespace_v1.metallb.metadata[0].name
  pool_addresses = var.pool_addresses
}
