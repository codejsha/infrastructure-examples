#!/usr/bin/env jython

domain_name = os.environ['DOMAIN_NAME']
admin_server_listen_address = os.environ['ADMIN_SERVER_LISTEN_ADDRESS']
admin_server_listen_port = os.environ['ADMIN_SERVER_LISTEN_PORT']
admin_username = os.environ['ADMIN_USERNAME']
admin_password = os.environ['ADMIN_PASSWORD']

jmsmodule_name = os.environ['JMSMODULE_NAME']
jmsmodule_target_type = os.environ['JMSMODULE_TARGET_TYPE']
jmsmodule_target = os.environ['JMSMODULE_TARGET']


######################################################################


def create_jms_module(_jmsmodule_name):
    cd('/')
    if _jmsmodule_name not in [jmsmodule.getName() for jmsmodule in cmo.getJMSSystemResources()]:
        cmo.createJMSSystemResource(_jmsmodule_name)


def set_jms_module_general_config(_jmsmodule_name, _jmsmodule_target_type,
                                  _jmsmodule_target):
    cd('/SystemResources/' + _jmsmodule_name)
    _target_list = [target.strip() for target in _jmsmodule_target.split(',')]
    _objects = []
    for _target_name in _target_list:
        if _jmsmodule_target_type == 'Cluster':
            _objects.append(ObjectName('com.bea:Name=' + _target_name + ',Type=Cluster'))
        elif _jmsmodule_target_type == 'Server':
            _objects.append(ObjectName('com.bea:Name=' + _target_name + ',Type=Server'))
        else:
            pass
    set('Targets', jarray.array(_objects, ObjectName))


######################################################################


admin_server_url = 't3://' + admin_server_listen_address + ':' + admin_server_listen_port
connect(admin_username, admin_password, admin_server_url)
edit()
startEdit()

create_jms_module(jmsmodule_name)
set_jms_module_general_config(jmsmodule_name, jmsmodule_target_type,
                              jmsmodule_target)

save()
activate()
exit()
