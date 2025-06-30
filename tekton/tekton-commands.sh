######################################################################

function tkn() { echo "+ tkn ${*}">&2; command tkn "${*}"; }

source <(tkn completion bash)

######################################################################

### install tekton cli

### homebrew
brew install tektoncd-cli

### chocolatey
choco install -y tektoncd-cli

######################################################################

kubectl describe clusterinterceptors
kubectl describe clustertriggerbindings
kubectl describe eventlisteners
kubectl describe extensions
kubectl describe pipelineruns
kubectl describe triggerbindings
kubectl describe taskruns
kubectl describe triggers
kubectl describe triggertemplates

kubectl get clusterinterceptors
kubectl get clustertriggerbindings
kubectl get eventlisteners
kubectl get extensions
kubectl get pipelineruns
kubectl get triggerbindings
kubectl get taskruns
kubectl get triggers
kubectl get triggertemplates

tkn conditions list
tkn clustertasks list
tkn clustertriggerbinding list
tkn eventlisteners list
tkn pipelines delete
tkn pipelines delete --all
tkn pipelines delete --all --force
tkn pipelines list
tkn pipelineruns delete
tkn pipelineruns delete --all
tkn pipelineruns delete --all --force
tkn pipelineruns desc
tkn pipelineruns desc --last
tkn pipelineruns list --reverse
tkn pipelineruns logs --follow
tkn pipelineruns logs --follow --last
tkn resresources list
tkn tasks list
tkn tasks delete
tkn tasks delete --all
tkn tasks delete --all --force
tkn triggerbinding list
tkn taskruns delete
tkn taskruns delete --all
tkn taskruns delete --all --force
tkn taskruns desc
tkn taskruns desc --last
tkn taskruns list --reverse
tkn taskruns logs --follow
tkn taskruns logs --follow --last
tkn triggertemplate list
tkn version
