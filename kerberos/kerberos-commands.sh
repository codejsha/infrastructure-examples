######################################################################

### add principal
kadmin.local -q "add_principal kdcadmin/admin"
kadmin.local -q "add_principal -randkey host/kerberos.example.com@EXAMPLE.COM"

### add key to keytab
kadmin.local -q "ktadd -norandkey -k kerberos.keytab host/kerberos.example.com@EXAMPLE.COM"

### delete principal
kadmin.local -q "delete_principal -force host/kerberos.example.com@EXAMPLE.COM"

######################################################################

sudo systemctl start krb5kdc.service
sudo systemctl start kadmin.service

######################################################################

klist -kte kafka.keytab

kinit -V -k -t kafka.keytab kafka/kafka1.example.com@EXAMPLE.COM
klist
