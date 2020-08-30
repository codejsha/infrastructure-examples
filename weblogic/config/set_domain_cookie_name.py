#!/usr/bin/env python

oracle_home = os.environ.get('ORACLE_HOME')
domain_name = os.environ.get('DOMAIN_NAME')
admin_server_listen_address = os.environ.get('ADMIN_SERVER_LISTEN_ADDRESS')
admin_server_listen_port = os.environ.get('ADMIN_SERVER_LISTEN_PORT')
admin_username = os.environ.get('ADMIN_USERNAME')
admin_password = os.environ.get('ADMIN_PASSWORD')


######################################################################


def set_domain_cookie_name(_oracle_home, _domain_name):
    cd('/AdminConsole/' + _domain_name)
    _oracle_home_upper = _oracle_home.replace('/', '_').upper()
    _domain_upper = _domain_name.replace('_', '').upper()
    cmo.setCookieName(_oracle_home_upper + '_' + _domain_upper + 'SESSION')


######################################################################


admin_server_url = 't3://' + admin_server_listen_address + ':' + admin_server_listen_port
connect(admin_username, admin_password, admin_server_url)
edit()
startEdit()

set_domain_cookie_name(_oracle_home, domain_name)

save()
activate()
exit()
