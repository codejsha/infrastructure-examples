terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}

resource "vault_policy" "minio" {
  name = "minio"
  policy = file("${path.module}/policy.hcl")
}

resource "vault_kubernetes_auth_backend_role" "minio" {
  role_name = "minio-role"
  bound_service_account_names = ["minio"]
  bound_service_account_namespaces = [var.namespace]
  token_policies = [vault_policy.minio.name]
  token_ttl = "3600" # 1 hour
}

resource "vault_kv_secret_v2" "minio" {
  name  = "minio/admin/credentials"
  mount = "kv"
  data_json = jsonencode({
    username = var.admin_username,
    password = var.admin_password
  })
}
