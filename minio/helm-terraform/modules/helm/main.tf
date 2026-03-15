terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
    }
  }
}

resource "kubernetes_service_account_v1" "minio" {
  metadata {
    name      = "minio"
    namespace = var.namespace
  }
}

resource "kubernetes_secret_v1" "minio" {
  type = "kubernetes.io/service-account-token"
  metadata {
    name      = "minio-token"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account_v1.minio.metadata[0].name
    }
  }
}

resource "helm_release" "minio" {
  depends_on = [kubernetes_service_account_v1.minio, kubernetes_secret_v1.minio]
  namespace  = var.namespace
  name       = "minio"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "minio"
  version    = "17.0.21"
  values = [
    file("${path.module}/values.yaml")
  ]
  timeout = 120
}
