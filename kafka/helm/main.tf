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

resource "kubernetes_namespace_v1" "opensearch" {
  metadata {
    name = var.namespace
    labels = {
      "istio.io/dataplane-mode" = "ambient"
    }
  }
}

module "secret" {
  source                  = "./modules/secret"
  namespace               = kubernetes_namespace_v1.opensearch.metadata[0].name
  inter_broker_username   = var.inter_broker_username
  inter_broker_password   = var.inter_broker_password
  controller_username     = var.controller_username
  controller_password     = var.controller_password
  external_admin_username = var.external_admin_username
  external_admin_password = var.external_admin_password
}

module "kafka_broker" {
  source    = "./modules/kafka-broker"
  namespace = kubernetes_namespace_v1.opensearch.metadata[0].name
  providers = {
    helm = helm
  }
}

module "schema_registry" {
  source    = "./modules/schema-registry"
  namespace = kubernetes_namespace_v1.opensearch.metadata[0].name
  providers = {
    helm = helm
  }
}
