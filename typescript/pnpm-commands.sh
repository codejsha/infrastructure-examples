######################################################################

pnpm add -g @redocly/cli
pnpm list -g --depth=0

######################################################################

pnpm dlx @redocly/cli lint spec.yaml

######################################################################

### delete
pnpm remove -g @openapitools/openapi-generator-cli
