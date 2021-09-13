FROM centos:8

RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
RUN mv kustomize /usr/local/bin

CMD ["kustomize"]
