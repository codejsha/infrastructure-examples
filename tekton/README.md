# Tekton

Tekton is a cloud-native open-source framework for creating continuous integration and continuous delivery (CI/CD) systems.

## Install Tekton CLI

### Binary/Archive

```bash
bash ./install-tekton-cli.sh
```

### Homebrew

```sh
brew install -y tektoncd-cli

# brew uninstall -y tektoncd-cli
```

### Chocolatey

```ps1
choco install -y tektoncd-cli

# choco uninstall -y tektoncd-cli
```

## Install Tekton

```bash
bash ./install-tekton-dashboard.sh
bash ./install-tekton-pipeline.sh
bash ./install-tekton-trigger.sh
kubectl apply --filename tekton-dashboard-ingress.yaml
```

for operator:

```bash
cd operator
bash ./install-tekton-operator.sh
bash ./install-tekton-addon-dashboard.sh
bash ./install-tekton-addon-trigger.sh
cd ..
kubectl apply --filename tekton-dashboard-ingress.yaml
```

## Examples

- java pipeline example: [/infrastructure-examples/tekton/pipeline-java/argocd](/tekton/pipeline-java/)
- tekton pipeline example: <https://github.com/tektoncd/pipeline/tree/main/examples>
- tekton triggers example: <https://github.com/tektoncd/triggers/tree/main/examples>

## References

- Tekton Docs: <https://tekton.dev/docs/>
- Tekton Pipelines: <https://github.com/tektoncd/pipeline>
- Tekton Dashboard: <https://github.com/tektoncd/dashboard>
- Tekton Triggers: <https://github.com/tektoncd/triggers>
- Tektoncd Operator: <https://github.com/tektoncd/operator>
- Tekton Catalog: <https://github.com/tektoncd/catalog>
