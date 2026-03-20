terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}

resource "vault_policy" "kafka_broker" {
  name = "kafka-broker"
  policy = file("${path.module}/policy.hcl")
}

resource "vault_kubernetes_auth_backend_role" "kafka_broker" {
  role_name = "kafka-broker-role"
  bound_service_account_names = ["kafka"]
  bound_service_account_namespaces = [var.namespace]
  token_policies = [vault_policy.kafka_broker.name]
  token_ttl = "3600" # 1 hour
}

resource "vault_kv_secret_v2" "inter_broker" {
  name  = "kafka/broker/inter-broker/credentials"
  mount = "kv"
  data_json = jsonencode({
    username = var.inter_broker_username
    password = var.inter_broker_password
  })
}

resource "vault_kv_secret_v2" "controller" {
  name  = "kafka/broker/controller/credentials"
  mount = "kv"
  data_json = jsonencode({
    username = var.controller_username
    password = var.controller_password
  })
}

resource "vault_kv_secret_v2" "external_admin" {
  name  = "kafka/broker/external/admin/credentials"
  mount = "kv"
  data_json = jsonencode({
    username = var.external_admin_username
    password = var.external_admin_password
  })
}
