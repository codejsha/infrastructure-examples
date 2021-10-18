#!/usr/bin/env python

domain_name = 'sample-domain1'
admin_server_url = 'sample-domain1-admin-server:7001'
admin_username = 'weblogic'
admin_password = 'welcome1'

server_name1 = 'managed-server1'
server_name2 = 'managed-server2'

connect(admin_username, admin_password, admin_server_url)

print('######################################################################')

### connection filters
print('### connection filters (original value)')
domainConfig()
get('/SecurityConfiguration/' + domain_name + '/ConnectionFilterRules')
print('### connection filters (overridden value)')
serverConfig()
get('/SecurityConfiguration/' + domain_name + '/ConnectionFilterRules')

print('######################################################################')

### overload protection
print('### overload protection (overridden value)')
serverConfig()
print('### managed-server1')
cd('/Servers/' + server_name1 + '/OverloadProtection/' + server_name1)
ls()
print('### managed-server2')
cd('/Servers/' + server_name2 + '/OverloadProtection/' + server_name2)
ls()

print('######################################################################')

exit()
