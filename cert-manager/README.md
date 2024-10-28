# cert-manager

The cert-manager is a certificate controller for Kubernetes. It will ensure certificates are valid and up to date, and attempt to renew certificates at a configured time before expiry.

## Install

```bash
kubectl apply --f https://github.com/jetstack/cert-manager/releases/latest/download/cert-manager.yaml

# for specific version:
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.yaml
```

## References

- cert-manager Website: <https://cert-manager.io/>
- cert-manager GitHub: <https://github.com/cert-manager/cert-manager>
