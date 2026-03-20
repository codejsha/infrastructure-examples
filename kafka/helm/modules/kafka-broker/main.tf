terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
    }
    vault = {
      source = "hashicorp/vault"
    }
  }
}

locals {
  external_username_list = [
    data.vault_generic_secret.external_admin_credentials.data["username"]
  ]
  external_password_string = join(",", [
    data.vault_generic_secret.external_admin_credentials.data["password"]
  ])
}

resource "kubernetes_service_account_v1" "kafka" {
  metadata {
    name      = "kafka"
    namespace = var.namespace
  }
}

resource "kubernetes_secret_v1" "kafka" {
  type = "kubernetes.io/service-account-token"
  metadata {
    name      = "kafka-token"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account_v1.kafka.metadata[0].name
    }
  }
}

resource "helm_release" "kafka" {
  depends_on = [kubernetes_service_account_v1.kafka, kubernetes_secret_v1.kafka]
  namespace  = var.namespace
  name       = "kafka"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "kafka"
  version    = "32.2.15"
  values = [
    file("${path.module}/values.yaml")
  ]
  timeout = 120
  set_sensitive = [
    { name = "sasl.interbroker.user", value = data.vault_generic_secret.inter_broker_credentials.data["username"] },
    { name = "sasl.interbroker.password", value = data.vault_generic_secret.inter_broker_credentials.data["password"] },
    { name = "sasl.controller.user", value = data.vault_generic_secret.controller_credentials.data["username"] },
    { name = "sasl.controller.password", value = data.vault_generic_secret.controller_credentials.data["password"] },
    { name = "sasl.client.users", value = local.external_username_list },
    { name = "sasl.client.passwords", value = local.external_password_string }
  ]
}
