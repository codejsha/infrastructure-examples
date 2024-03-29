#!/usr/bin/env jython

admin_server_listen_address = os.environ['ADMIN_SERVER_LISTEN_ADDRESS']
admin_server_listen_port = os.environ['ADMIN_SERVER_LISTEN_PORT']
admin_username = os.environ['ADMIN_USERNAME']
admin_password = os.environ['ADMIN_PASSWORD']

ds_name = os.environ['DS_NAME']
ds_jndi = os.environ['DS_JNDI']
ds_url = os.environ['DS_URL']
ds_driver = os.environ['DS_DRIVER']
ds_username = os.environ['DS_USERNAME']
ds_password = os.environ['DS_PASSWORD']
ds_init = os.environ['DS_INIT']
ds_min = os.environ['DS_MIN']
ds_max = os.environ['DS_MAX']
ds_target_type = os.environ['DS_TARGET_TYPE']
ds_target = os.environ['DS_TARGET']


######################################################################


def set_generic_datasource_param_config(_domain_version, _ds_name, _ds_jndi, _ds_url,
                                        _ds_driver, _ds_username, _ds_password,
                                        _ds_init, _ds_min, _ds_max, _ds_target_type, _ds_target):
    _ds_jndi_list = [jndi.strip() for jndi in _ds_jndi.split(',')]
    _ds_target_list = [target.strip() for target in _ds_target.split(',')]

    cd('/JDBCSystemResources/' + _ds_name + '/JDBCResource/' + _ds_name +
       '/JDBCDriverParams/' + _ds_name)
    cmo.setUrl(_ds_url)
    cmo.setDriverName(_ds_driver)
    cmo.setPassword(_ds_password)

    ### oracle.jdbc.ReadTimeout
    # cd('/JDBCSystemResources/' + _ds_name + '/JDBCResource/' + _ds_name +
    #    '/JDBCDriverParams/' + _ds_name + '/Properties/' + _ds_name)
    # cmo.createProperty('oracle.jdbc.ReadTimeout')
    # cd('/JDBCSystemResources/' + _ds_name + '/JDBCResource/' + _ds_name +
    #    '/JDBCDriverParams/' + _ds_name + '/Properties/' + _ds_name + '/Properties/oracle.jdbc.ReadTimeout')
    # cmo.setValue('30000')

    cd('/JDBCSystemResources/' + _ds_name + '/JDBCResource/' + _ds_name +
       '/JDBCDriverParams/' + _ds_name + '/Properties/' + _ds_name + '/Properties/user')
    cmo.setValue(_ds_username)

    cd('/JDBCSystemResources/' + _ds_name + '/JDBCResource/' + _ds_name +
       '/JDBCDataSourceParams/' + _ds_name)
    cmo.setJNDINames(_ds_jndi_list)
    cmo.setGlobalTransactionsProtocol('OnePhaseCommit')
    # cmo.setRowPrefetch(False)
    # cmo.setStreamChunkSize(256)

    cd('/JDBCSystemResources/' + _ds_name + '/JDBCResource/' + _ds_name +
       '/JDBCConnectionPoolParams/' + _ds_name)
    cmo.setInitialCapacity(int(_ds_init))
    cmo.setMinCapacity(int(_ds_min))
    cmo.setMaxCapacity(int(_ds_max))
    # cmo.setStatementCacheType('LRU')
    # cmo.setStatementCacheSize(10)
    # cmo.setTestConnectionsOnReserve(False)
    cmo.setTestConnectionsOnReserve(True)
    cmo.setTestFrequencySeconds(120)
    if ('14.' in _domain_version) or ('12.2' in _domain_version) or ('12.1.3' in _domain_version):
        cmo.setTestTableName('SQL ISVALID\r\n')
    elif ('12.1' in _domain_version) or ('10.3' in _domain_version):
        cmo.setTestTableName('SQL SELECT 1 FROM DUAL\r\n')
    else:
        pass
    # cmo.setSecondsToTrustAnIdlePoolConnection(10)
    # cmo.setShrinkFrequencySeconds(900)
    # cmo.setConnectionCreationRetryFrequencySeconds(0)
    # cmo.setLoginDelaySeconds(0)
    # cmo.setInactiveConnectionTimeoutSeconds(0)
    cmo.setInactiveConnectionTimeoutSeconds(120)
    cmo.setHighestNumWaiters(2147483647)
    # cmo.setConnectionReserveTimeoutSeconds(10)
    # cmo.setStatementTimeout(-1)
    cmo.setStatementTimeout(120)
    # cmo.setIgnoreInUseConnectionsEnabled(True)
    # cmo.setPinnedToThread(False)
    # cmo.setRemoveInfectedConnections(True)
    # cmo.setWrapTypes(True)
    # cmo.setConnectionHarvestMaxCount(1)
    # cmo.setConnectionHarvestTriggerCount(-1)
    # cmo.setCountOfRefreshFailuresTillDisable(2)
    # cmo.setCountOfTestFailuresTillFlush(2)

    ### Diagnostics Profile
    # cmo.setProfileType(0)     # default
    cmo.setProfileType(4)     # Profile Connection Leak

    cd('/JDBCSystemResources/' + _ds_name)
    _objects = []
    for _target_name in _ds_target_list:
        if _ds_target_type == 'Cluster':
            _objects.append(ObjectName('com.bea:Name=' + _target_name + ',Type=Cluster'))
        elif _ds_target_type == 'Server':
            _objects.append(ObjectName('com.bea:Name=' + _target_name + ',Type=Server'))
        else:
            pass
    set('Targets', jarray.array(_objects, ObjectName))


######################################################################


admin_server_url = 't3://' + admin_server_listen_address + ':' + admin_server_listen_port
connect(admin_username, admin_password, admin_server_url)
edit()
startEdit()
domain_version = cmo.getDomainVersion()

set_generic_datasource_param_config(domain_version, ds_name, ds_jndi, ds_url,
                                    ds_driver, ds_username, ds_password,
                                    ds_init, ds_min, ds_max, ds_target_type, ds_target)

save()
activate()
exit()
