#!/bin/sh

### Requirements:
### - markdown-link-check: `npm install markdown-link-check`

fd -e md -x ./node_modules/markdown-link-check/markdown-link-check -q -c ./markdown-link-check.json {} \;
