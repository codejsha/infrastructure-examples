######################################################################

### gitea actions

### run workflow
tea actions workflows dispatch tekton-pipeline.yml \
    --repo example-corp/catalog-source \
    --ref main \
    --input event=ci

tea actions workflows dispatch tekton-pipeline.yml \
    --repo example-corp/catalog-helm --ref main \
    --input event=cd
tea actions workflows dispatch tekton-pipeline.yml \
    --repo example-corp/catalog-helm --ref main \
    --input event=cd --input revision=${COMMIT_SHA}

### list workflow runs
tea actions runs list --repo example-corp/catalog-source

### show workflow run logs
tea actions runs logs --repo example-corp/catalog-source --run-id 42

######################################################################

