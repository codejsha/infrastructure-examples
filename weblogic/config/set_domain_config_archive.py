#!/usr/bin/env python

admin_server_listen_address = os.environ.get('ADMIN_SERVER_LISTEN_ADDRESS')
admin_server_listen_port = os.environ.get('ADMIN_SERVER_LISTEN_PORT')
admin_username = os.environ.get('ADMIN_USERNAME')
admin_password = os.environ.get('ADMIN_PASSWORD')


######################################################################


def set_domain_config_archive():
    cd('/')
    cmo.setConfigBackupEnabled(True)
    cmo.setArchiveConfigurationCount(7)


######################################################################


admin_server_url = 't3://' + admin_server_listen_address + ':' + admin_server_listen_port
connect(admin_username, admin_password, admin_server_url)
edit()
startEdit()

set_domain_config_archive()

save()
activate()
exit()
