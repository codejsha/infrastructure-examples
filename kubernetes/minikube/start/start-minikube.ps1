$env:MINIKUBE_HOME = "E:\.minikube"

minikube start `
    --driver=docker `
    --cpus=2 `
    --memory=12800
