data "vault_generic_secret" "inter_broker_credentials" {
  path = "kv/kafka/broker/inter-broker/credentials"
}

data "vault_generic_secret" "controller_credentials" {
  path = "kv/kafka/broker/controller/credentials"
}

data "vault_generic_secret" "external_admin_credentials" {
  path = "kv/kafka/broker/external/admin/credentials"
}
