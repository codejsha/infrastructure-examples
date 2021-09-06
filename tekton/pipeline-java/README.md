# Java Pipeline

## Workflow

```txt
Push event ---> Event trigger ---> CI/CD
```

## Event trigger

```txt
my-app-eventlistener ---> git-triggerbinding ---> java-triggertemplate
 (EventListener)           (TriggerBinding)        (TriggerTemplate)
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
set-app ---> sync-app
```

## Kustomize

Tomcat directory structure:

```txt
kustomize
├── base
│   ├── deployment.yaml
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
    ├── [kustomization.yaml]  Kustomization
    └── [service.yaml]  Service tomcat-starter
```

## Application details

```txt
Name:               my-app
Project:            my-project
Server:             https://kubernetes.docker.internal:6443
Namespace:          my-project
URL:                https://argocd-server.argocd.svc/applications/my-app
Repo:               https://git.example.com/developer/my-app-cd.git
Target:             84645a283ee3a7bfa7b2b0012d1b974a203e591a
Path:               base
SyncWindow:         Sync Allowed
Sync Policy:        Automated
Sync Status:        Synced to 84645a283ee3a7bfa7b2b0012d1b974a203e591a
Health Status:      Healthy


GROUP  KIND        NAMESPACE   NAME            STATUS  HEALTH   HOOK  MESSAGE
       ConfigMap   my-project  server-config   Synced                 configmap/server-config unchanged
       Service     my-project  tomcat-starter  Synced  Healthy        service/tomcat-starter unchanged
apps   Deployment  my-project  tomcat-starter  Synced  Healthy        deployment.apps/tomcat-starter configured
```
