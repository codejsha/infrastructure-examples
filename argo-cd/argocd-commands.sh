######################################################################

### bash completion
source <(argocd completion bash)

######################################################################

### initial

### get init password
kubectl exec -it $(kubectl get pods --selector app.kubernetes.io/name=argocd-server --output jsonpath='{.items[0].metadata.name}') -c argocd-server -- argocd admin initial-password

kubectl port-forward svc/argocd-server -n argocd 8080:443
argocd login --username admin --password ${PASSWORD} --insecure localhost:8080
argocd account update-password --account admin --current-password ${PASSWORD} --new-password ${NEW_PASSWORD}
argocd cluster add docker-desktop --insecure --server argocd.example.com

######################################################################

### login/logout

### secure
argocd login argocd.example.com
argocd logout argocd.example.com
argocd login --username admin --password ${PASSWORD} --insecure argocd.example.com
argocd login --username developer --password developer --insecure argocd.example.com

### insecure
argocd login --insecure argocd.example.com
argocd logout --insecure argocd.example.com

### plaintext
argocd login --username admin --password ${PASSWORD} --grpc-web --insecure --plaintext argocd.example.com:80
argocd login --username developer --password developer --grpc-web --insecure --plaintext argocd.example.com:80
argocd logout --grpc-web --insecure --plaintext argocd.example.com:80

######################################################################

### update account password

### secure
argocd account update-password --account admin --current-password ${PASSWORD} --new-password ${NEW_PASSWORD}
argocd account update-password --account developer --current-password ${PASSWORD} --new-password developer

### plaintext
argocd account update-password --account admin --current-password ${PASSWORD} --new-password ${NEW_PASSWORD} --grpc-web --insecure --plaintext --server argocd.example.com:80
argocd account update-password --account developer --current-password ${PASSWORD} --new-password developer --grpc-web --insecure --plaintext --server argocd.example.com:80

######################################################################

### account token

argocd account generate-token --account developer

######################################################################

### cluster

argocd cluster list

argocd cluster add docker-desktop --insecure --server argocd.example.com
argocd cluster add docker-desktop --insecure --plaintext --server argocd.example.com:80

######################################################################

### project

PROJECT="my-project"
SERVER="*"
NAMESPACE="*"
URL="*"
GROUP="*"
KIND="*"

argocd proj create ${PROJECT}
argocd proj add-destination ${PROJECT} ${SERVER} ${NAMESPACE}
argocd proj add-source ${PROJECT} ${URL}
argocd proj allow-cluster-resource ${PROJECT} ${GROUP} ${KIND}

######################################################################

### role

PROJECT="my-project"
APP="my-app"
ROLE_NAME="my-role"

argocd proj role create ${PROJECT} ${ROLE_NAME}
argocd proj role list ${PROJECT}
argocd proj role get ${PROJECT} ${ROLE_NAME}

# argocd proj role create-token ${PROJECT} ${ROLE_NAME}
# argocd proj role create-token ${PROJECT} ${ROLE_NAME} --expires-in 3h
JWT_TOKEN=$(argocd proj role create-token ${PROJECT} ${ROLE_NAME})
echo ${JWT_TOKEN}

argocd proj role add-policy ${PROJECT} ${ROLE_NAME} --action get --permission allow --object ${APP}
argocd proj role add-policy ${PROJECT} ${ROLE_NAME} --action sync --permission allow --object ${APP}
argocd app get ${PROJECT} ${ROLE_NAME} --auth-token ${JWT_TOKEN}

######################################################################

### repository

argocd repo add https://git.example.com/developer/my-app-cd.git --type git --username developer --password developer --insecure --server argocd.example.com
argocd repo add https://git.example.com/developer/my-app-cd.git --type git --username developer --password developer --insecure-skip-server-verification --insecure --server argocd.example.com

######################################################################

### app

argocd app create guestbook \
    --repo https://github.com/argoproj/argocd-example-apps.git \
    --path guestbook \
    --dest-server https://10.10.10.11:6443 \
    --dest-namespace default

argocd app list

argocd app get guestbook

argocd app sync guestbook
argocd app set guestbook --sync-policy none
argocd app set guestbook --sync-policy automated
argocd app set guestbook --auto-prune
argocd app set guestbook --self-heal

argocd app history guestbook
argocd app diff guestbook

argocd app manifests guestbook
argocd app resources guestbook

argocd app delete guestbook
