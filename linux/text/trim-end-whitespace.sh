#!/bin/bash

find . -type f -not \( -path "./.git/*" -o -path "./docs/*" \) | xargs sed -i "s/\s*$//g"
