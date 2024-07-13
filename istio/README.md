# Istio

Istio is an open-source service mesh platform that provides a uniform way to connect, manage, and secure microservices.
Traffic routing rules let you easily control the flow of traffic and API calls between services.
It provides a number of key capabilities uniformly across a network of services: traffic management, service identity and security, and observability and telemetry

## Install istioctl

### Binary/Archive

```bash
curl -L https://istio.io/downloadIstio | sh -
cd istio-*/
cd bin
chmod +x istioctl
sudo /bin/cp -pf istioctl /usr/local/bin
```

### Homebrew

```sh
brew install -y istioctl

# brew uninstall -y istioctl
```

### Chocolatey

```ps1
choco install -y istioctl

# choco uninstall -y istioctl
```

## References

- Istio Documentation: <https://istio.io/latest/docs/>
- Kubernetes Security Cheat Sheet: <https://cheatsheetseries.owasp.org/cheatsheets/Kubernetes_Security_Cheat_Sheet.html>
- Microservices Security Cheat Sheet: <https://cheatsheetseries.owasp.org/cheatsheets/Microservices_Security_Cheat_Sheet.html>
- Edge Stack Documentation: <https://www.getambassador.io/docs/edge-stack>
