# Java Pipeline

## Workflow

```txt
Push event ---> Event trigger ---> CI/CD
```

## Event trigger

```txt
gitlab-ci-listener ---> gitlab-push-binding ---> gitlab-java-template
 (EventListener)         (TriggerBinding)         (TriggerTemplate)
```

## CI/CD

```txt
pipelinerun-java-xxxxx ---> java-pipeline
    (PipelineRun)            (Pipeline)
```

Tasks in java-pipeline:

```txt
clone-ci-repo ---> build-source ---> build-image
                                         |
      ------------------------------------
      |
      V
clone-cd-repo ---> kustomize-cd-repo ---> commit-cd-repo
                                                 |
    ----------------------------------------------
    |
    V
sync-app
```

## Kustomize

Tomcat directory structure:

```txt
kustomize
├── base
│   ├── deployment.yaml
│   ├── ingress.yaml
│   ├── kustomization.yaml
│   └── server.env
│   └── service.yaml
└── overlays
    ├── development
    │   └── kustomization.yaml
    └── production
        └── kustomization.yaml
```

Resource structure:

```txt
kustomize
└── base
    ├── [deployment.yaml]  Deployment tomcat-starter
    ├── [ingress.yaml]  Ingress tomcat-starter
    ├── [kustomization.yaml]  Kustomization
    └── [service.yaml]  Service tomcat-starter
```

## Application details

```txt
Name:               my-project
Project:            my-project
Server:             https://kubernetes.docker.internal:6443
Namespace:          my-project
URL:                https://argocd.example.com/applications/my-project
Repo:               http://gitlab.example.com:9480/root/my-project-cd.git
Target:             HEAD
Path:               base
SyncWindow:         Sync Allowed
Sync Policy:        Automated (Prune)
Sync Status:        Synced to HEAD (3ec1d74)
Health Status:      Healthy

GROUP              KIND        NAMESPACE   NAME            STATUS  HEALTH   HOOK  MESSAGE
                   Service     my-project  tomcat-starter  Synced  Healthy        service/tomcat-starter created
apps               Deployment  my-project  tomcat-starter  Synced  Healthy        deployment.apps/tomcat-starter created
networking.k8s.io  Ingress     my-project  tomcat-starter  Synced  Healthy        ingress.networking.k8s.io/tomcat-starter created
```
