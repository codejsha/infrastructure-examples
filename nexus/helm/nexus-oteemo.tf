resource "helm_release" "nexus-oteemo" {
  name       = "my-nexus"
  repository = "https://oteemo.github.io/charts"
  chart      = "sonatype-nexus"
  version    = "5.2.0"
  values = [
    file("${path.module}/values-oteemo.yaml")
  ]
}
