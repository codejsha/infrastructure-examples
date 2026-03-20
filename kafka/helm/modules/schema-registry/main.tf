terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
    }
  }
}

resource "kubernetes_service_account_v1" "schema_registry" {
  metadata {
    name      = "schema-registry"
    namespace = var.namespace
  }
}

resource "kubernetes_secret_v1" "schema_registry" {
  type = "kubernetes.io/service-account-token"
  metadata {
    name      = "schema-registry-token"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account_v1.schema_registry.metadata[0].name
    }
  }
}

resource "helm_release" "kafka" {
  depends_on = [kubernetes_service_account_v1.schema_registry, kubernetes_secret_v1.schema_registry]
  namespace  = var.namespace
  name       = "schema-registry"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "schema-registry"
  version    = "25.1.8"
  values = [
    file("${path.module}/values.yaml")
  ]
  timeout = 120
  set_sensitive = [
    { name = "externalKafka.sasl.user", value = data.vault_generic_secret.external_admin_credentials.data["username"] },
    { name = "externalKafka.sasl.password", value = data.vault_generic_secret.external_admin_credentials.data["password"] }
  ]
}
