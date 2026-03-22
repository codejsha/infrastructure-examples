######################################################################

### dumps the trust settings for the keychain
security dump-trust-settings -d /Library/Keychains/System.keychain

### delete a certificate from the keychain
security find-certificate -a -c <CERTIFICATE_NAME> -Z /Library/Keychains/System.keychain | grep "SHA-1"
sudo security delete-certificate -Z <SHA-1_HASH> /Library/Keychains/System.keychain
