#!/usr/bin/env jython

domain_name = 'sample-domain1'
domain_home = '/u01/oracle/user_projects/domains/' + domain_name

admin_server_url = 'sample-domain1-admin-server:7001'
admin_username = 'weblogic'
admin_password = 'welcome1'

node_manager_listen_address = 'localhost'
node_manager_listen_port = '5556'
node_manager_username = admin_username
node_manager_password = admin_password

managed_server_name = os.getenv('SERVER_NAME')

nmConnect(username=node_manager_username, password=node_manager_password, host=node_manager_listen_address, port=node_manager_listen_port, domainName=domain_name, domainDir=domain_home, nmType='plain', verbose='true')

nmServerStatus(serverName=managed_server_name, serverType='WebLogic')
nmKill(serverName=managed_server_name, serverType='WebLogic')
nmServerStatus(serverName=managed_server_name, serverType='WebLogic')

nmDisconnect()
exit()