#!/usr/bin/env python

oracle_home = '/usr/local/ohs'
domain_name = 'base_domain'
domain_home = oracle_home + '/user_projects/domains/' + domain_name
nodemanager_name = 'localmachine'
nodemanager_listen_address = 'localhost'
nodemanager_listen_port = '5556'
nodemanager_username = 'ohs'
nodemanager_password = 'welcome1'

######################################################################

readTemplate(oracle_home + '/ohs/common/templates/wls/ohs_standalone_template_12.1.3.jar')

cd('/')
create(domain_name, 'SecurityConfiguration')
cd('/SecurityConfiguration/base_domain')
set('NodeManagerUsername', nodemanager_username)
set('NodeManagerPasswordEncrypted', nodemanager_password)
setOption('NodeManagerType', 'PerDomainNodeManager')

cd('/')
create(nodemanager_name, 'Machine')
cd('/Machines/' + nodemanager_name)
create(nodemanager_name, 'NodeManager')
cd('/Machines/' + nodemanager_name + '/NodeManager/' + nodemanager_name)
cmo.setListenAddress(nodemanager_listen_address)
cmo.setListenPort(int(nodemanager_listen_port))

cd('/')
writeDomain(domain_home)
closeTemplate()

exit()
