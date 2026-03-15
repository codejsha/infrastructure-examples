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
    vault = {
      source  = "hashicorp/vault"
      version = ">= 5.0.0"
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

provider "vault" {
  address      = var.vault_url
  token        = var.vault_token
  ca_cert_file = var.kube_ca_crt_path
}

resource "kubernetes_namespace_v1" "minio" {
  metadata {
    name = var.namespace
    labels = {
      "istio.io/dataplane-mode" = "ambient"
    }
  }
}

module "secret" {
  source         = "./modules/secret"
  namespace      = kubernetes_namespace_v1.minio.metadata[0].name
  admin_username = var.minio_username
  admin_password = var.minio_password
  providers = {
    vault = vault
  }
}

module "helm" {
  source    = "./modules/helm"
  namespace = kubernetes_namespace_v1.minio.metadata[0].name
  providers = {
    helm = helm
  }
}
