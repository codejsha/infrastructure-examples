# Argo CD

Declarative GitOps CD for Kubernetes

Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes that helps in automating the deployment of applications and services to Kubernetes clusters.
It uses a Git repository as a resource repository to store the desired state of applications running on Kubernetes. It continuously reconciles any differences between the desired state and the current state.

- <https://argo-cd.readthedocs.io/en/stable/>
- <https://github.com/argoproj/argo-cd>

## API Resources

- <https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/>
- AppProject: <https://raw.githubusercontent.com/argoproj/argo-cd/master/docs/operator-manual/project.yaml>
- Application: <https://raw.githubusercontent.com/argoproj/argo-cd/master/docs/operator-manual/application.yaml>

## Examples

- argocd resource example in tekton pipeline: [/infrastructure-examples/tekton/pipeline-java/argocd](/tekton/pipeline-java/argocd/)
- guestbook example: [/infrastructure-examples/argo-cd/guestbook](/argo-cd/guestbook/)
- ArgoCD Example Apps: <https://github.com/argoproj/argocd-example-apps>

## References

- Awesome-GitOps: <https://github.com/weaveworks/awesome-gitops>
