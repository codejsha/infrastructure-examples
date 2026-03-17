variable "namespace" {
  description = "Namespace name"
  type        = string
}

variable "minio_username" {
  description = "MinIO username"
  type        = string
  sensitive   = true
}

variable "minio_password" {
  description = "MinIO password"
  type        = string
  sensitive   = true
}

variable "vault_url" {
  description = "Vault URL"
  type        = string
}

variable "vault_token" {
  description = "Vault authentication token"
  type        = string
  sensitive   = true
}

variable "kube_ca_crt_path" {
  description = "Kubernetes CA certificate file path"
  type        = string
}
