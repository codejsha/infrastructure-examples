#!/usr/bin/env python

domain_name = os.environ.get('DOMAIN_NAME')
admin_server_listen_address = os.environ.get('ADMIN_SERVER_LISTEN_ADDRESS')
admin_server_listen_port = os.environ.get('ADMIN_SERVER_LISTEN_PORT')
admin_username = os.environ.get('ADMIN_USERNAME')
admin_password = os.environ.get('ADMIN_PASSWORD')

conn_filters = os.environ.get('CONN_FILTERS')


######################################################################


def set_connection_filter(_domain_name, _conn_filters):
    if len(_conn_filters) != 0:
        cd('/SecurityConfiguration/' + _domain_name)
        cmo.setConnectionLoggerEnabled(True)
        cmo.setConnectionFilter('weblogic.security.net.ConnectionFilterImpl')
        cmo.setConnectionFilterRules(_conn_filters)


######################################################################


admin_server_url = 't3://' + admin_server_listen_address + ':' + admin_server_listen_port
connect(admin_username, admin_password, admin_server_url)
edit()
startEdit()

set_connection_filter(domain_name, conn_filters)

save()
activate()
exit()
