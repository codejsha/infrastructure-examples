######################################################################

### verify zip archive files
find . -type f -iname '*.zip' -exec unzip -tq {} \;
