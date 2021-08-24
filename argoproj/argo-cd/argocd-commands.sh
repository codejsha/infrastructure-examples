######################################################################

### login/logout

argocd login argocd.example.com
argocd login --insecure argocd.example.com
argocd login --username admin --password ${PASSWORD} --grpc-web --insecure --plaintext argocd.example.com:80

argocd logout argocd.example.com
argocd logout --insecure argocd.example.com

######################################################################

### account

argocd account update-password --account admin --current-password ${PASSWORD} --new-password ${NEW_PASSWORD} --grpc-web --insecure --plaintext --server argocd.example.com:80

######################################################################

### cluster

argocd cluster list

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
APP="my-project"
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

argocd app delete guestbook
