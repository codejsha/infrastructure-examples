######################################################################

### display wallet
${ORACLE_HOME}/oracle_common/bin/orapki wallet display -wallet ${WALLET_LOCATION}
${ORACLE_HOME}/oracle_common/bin/orapki wallet display -complete -wallet ${WALLET_LOCATION}

######################################################################

### import certificate
orapki wallet add -wallet ./remote_wallet -trusted_cert -cert RemoteProxyRoot.pem -pwd ${PASSWORD}
