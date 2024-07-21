######################################################################

function helm() { echo "+ helm ${@}">&2; command helm "${@}"; }

######################################################################

### repo

### add
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add --username ${USERNAME} --password ${PASSWORD} local-harbor http://harbor.example.com/chartrepo/library
helm repo add --username ${USERNAME} --password ${PASSWORD} --insecure-skip-tls-verify local-harbor https://harbor.example.com/chartrepo/library
helm repo add --username ${USERNAME} --password ${PASSWORD} --ca-file /mnt/c/Users/user/.docker/certs.d/local-harbor-ca.crt --insecure-skip-tls-verify local-harbor https://harbor.example.com/chartrepo/library

### list
helm repo list

### update
helm repo update

### search
helm search repo ingress-nginx/ingress-nginx
helm search repo --versions ingress-nginx/ingress-nginx

### health check
curl --insecure --verbose http://chartmuseum.example.com/health

######################################################################

### plugin

### install plugin
helm plugin install https://github.com/chartmuseum/helm-push.git

### list
helm plugin list

######################################################################

### chart

### list
helm list
helm list --all

### show
helm show chart ingress-nginx/ingress-nginx
helm show readme ingress-nginx/ingress-nginx
helm show values ingress-nginx/ingress-nginx

### push (plugin)
helm cm-push tomcat-9.0.0.tgz local-harbor
helm cm-push tomcat-9.0.0.tgz http://harbor.example.com/chartrepo/library
helm cm-push --force tomcat-9.0.0.tgz local-harbor
helm cm-push --insecure tomcat-9.0.0.tgz local-harbor

### push
export HELM_EXPERIMENTAL_OCI=1
helm chart push harbor.example.com/chartrepo/library/tomcat:9.0.0

### pull
helm pull --untar --untardir charts ingress-nginx/ingress-nginx

### install / upgrade
helm install my-release
helm upgrade my-release
helm upgrade --install my-release

### uninstall
helm uninstall my-release

### rollback
helm rollback my-release

### dependency
helm dependency update

######################################################################

### registry

### login
helm registry login --insecure harbor.example.com

######################################################################

### status
helm status my-release
