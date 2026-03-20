data "vault_generic_secret" "external_admin_credentials" {
  path = "kv/kafka/broker/external/admin/credentials"
}
