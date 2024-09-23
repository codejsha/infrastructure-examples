######################################################################

type -a ls
# ls is an alias for lsd
# ls is /bin/ls

type -a curl
# curl is a shell function from /Users/username/.zshrc
# curl is /usr/bin/curl

######################################################################

### directory

### ls (List directory contents)
ls

### ln (Make links between files)
ln -s ${SERVER_HOME}/${INST_HOME} ${INST_HOME}

### unlink (Removal via unlink(2))
unlink ${INST_HOME}

######################################################################

### unzip

unzip -q -o /etc/cmak.zip -d /etc
unzip -d . ${SAMPLE_DB_FILE_DIR}/dvdrental.zip
unzip -p ${JDBC_DRIVER_FILE} META-INF/MANIFEST.MF

######################################################################

### jq

jq . ${FILE}

http :8083/connector-plugins | jq '.[].class'
http :8083/connectors | jq '.[]'

http :8083/connectors/datagen-pageviews/config | jq -S
http :8083/connectors/datagen-pageviews/config | jq --sort-keys

######################################################################

### encoding

convmv -r --nfc --nosmart -f UTF-8 -t UTF-8 --notest ${DIRECTORY}

iconv -c --from-code=euc-kr --to-code=utf-8 ${INPUT_FILE} --output=${OUTPUT_FILE}

######################################################################

### uuid
uuidgen

######################################################################

### tripwire
tripwire --version
tripwire --check ${FILE}

######################################################################

### tidy

function tidy_indent() {
    local XML_FILE="${1}"

    tidy -modify \
        --indent true --indent-spaces 4 --indent-attributes true \
        --input-xml true --output-xml true \
        --hide-comments true --quote-nbsp false \
        --quiet true --wrap 80 \
        ${XML_FILE}
}

function tidy_nowrap() {
    local XML_FILE="${1}"

    tidy -modify \
        --indent true --indent-spaces 4 --indent-attributes false \
        --input-xml true --output-xml true \
        --hide-comments true --quote-nbsp false \
        --quiet true --wrap 0 \
        ${XML_FILE}
}
