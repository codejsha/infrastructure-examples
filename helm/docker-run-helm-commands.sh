######################################################################

docker container run --rm -it -v $(pwd):/apps -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm alpine/helm version
docker container run --rm -it -v $(pwd):/apps -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm alpine/helm --help

######################################################################

function helm() { echo "+ helm ${*}">&2; command helm "${*}"; }
alias helm="docker container run --rm -it -v $(pwd):/apps -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm -v ~/.config/helm:/root/.config/helm -v ~/.cache/helm:/root/.cache/helm alpine/helm"
alias helm="docker container run --rm -it --env HELM_EXPERIMENTAL_OCI=1 -v $(pwd):/apps -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm -v ~/.config/helm:/root/.config/helm -v ~/.cache/helm:/root/.cache/helm alpine/helm"
