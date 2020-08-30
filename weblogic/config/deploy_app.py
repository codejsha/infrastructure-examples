#!/usr/bin/env python

domain_name = os.environ.get('DOMAIN_NAME')
admin_server_listen_address = os.environ.get('ADMIN_SERVER_LISTEN_ADDRESS')
admin_server_listen_port = os.environ.get('ADMIN_SERVER_LISTEN_PORT')
admin_username = os.environ.get('ADMIN_USERNAME')
admin_password = os.environ.get('ADMIN_PASSWORD')

app_name = os.environ.get('APP_NAME')
app_path = os.environ.get('APP_PATH')
app_target = os.environ.get('APP_TARGET')


######################################################################


def deploy_application(_app_name, _app_path, _app_target):
    cd('/')
    if _app_name in [appdeploy.getName() for appdeploy in cmo.getAppDeployments()]:
        redeploy(_app_name)
    else:
        deploy(_app_name, _app_path, _app_target, 'nostage')


######################################################################


admin_server_url = 't3://' + admin_server_listen_address + ':' + admin_server_listen_port
connect(admin_username, admin_password, admin_server_url)
edit()
startEdit()

deploy_application(app_name, app_path, app_target)

save()
activate()
exit()
