# Elasticsearch

- https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-deploy-eck.html
- https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-deploy-elasticsearch.html
- https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-volume-claim-templates.html

## vm.max_map_count

- https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html

The vm.max_map_count kernel setting must be set to at least 262144.

```bash
wsl -d docker-desktop
sysctl -w vm.max_map_count=262144
```
