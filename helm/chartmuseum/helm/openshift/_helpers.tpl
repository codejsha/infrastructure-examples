{{/*
Workaround for Helm 3 related issue
*/}}
{{- define "chartmuseum.helmRouteFix" -}}
status:
  ingress:
    - host: ""
{{- end -}}
