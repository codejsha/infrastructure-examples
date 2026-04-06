######################################################################

### global install

pnpm install -g @typespec/compiler
pnpm install -g @redocly/cli

pnpm list -g --depth=0

######################################################################

### local install
pnpm add @redocly/cli

######################################################################

### add to package.json
pnpm add -D @redocly/cli

######################################################################

pnpm dlx @redocly/cli lint spec.yaml
pnpm dlx @stoplight/spectral lint spec.yaml

######################################################################

### delete
pnpm remove -g @openapitools/openapi-generator-cli
