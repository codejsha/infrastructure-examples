resource "null_resource" "enable_strict_arp" {
  provisioner "local-exec" {
    command = <<EOT
    kubectl get configmap kube-proxy -n kube-system -o yaml | \
    sed -e "s/mode:.*/ mode: \"ipvs\"/" | \
    sed -e "s/strictARP: false/strictARP: true/" | \
    kubectl apply -f - -n kube-system
    EOT
  }
}
