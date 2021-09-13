######################################################################

### interface
/interface=management:write-attribute(name=inet-address,value=${jboss.bind.address.management:127.0.0.1})
/interface=private:write-attribute(name=inet-address,value=${jboss.bind.address:127.0.0.1})
/interface=public:write-attribute(name=inet-address,value=${jboss.bind.address:127.0.0.1})

######################################################################

### jdr report
${JBOSS_HOME}/bin/jdr.sh --host ${BIND_ADDRESS_MGMT} --port ${JBOSS_MGMT_HTTP_PORT} --config ${SERVER_CONFIG_FILE}
${JBOSS_HOME}/bin/jdr.sh --host test.example.com --port 9990 --config standalone-ha.xml

######################################################################

### instance id
/subsystem=undertow:write-attribute(name=instance-id,value=inst1)

# <subsystem xmlns="urn:jboss:domain:undertow:11.0" default-server="default-server" default-virtual-host="default-host" default-servlet-container="default" instance-id="inst1" default-security-domain="other" statistics-enabled="${wildfly.undertow.statistics-enabled:${wildfly.statistics-enabled:false}}">

######################################################################

### udp stack

/subsystem=jgroups/stack=udp:remove()
/subsystem=jgroups/stack=udp:add()
/subsystem=jgroups/stack=udp/transport=UDP:add(socket-binding=jgroups-udp)
/subsystem=jgroups/stack=udp/protocol=PING:add()
/subsystem=jgroups/stack=udp/protocol=MERGE3:add()
/subsystem=jgroups/stack=udp/protocol=FD_SOCK:add(socket-binding=jgroups-tcp-fd)
/subsystem=jgroups/stack=udp/protocol=FD_ALL:add()
/subsystem=jgroups/stack=udp/protocol=VERIFY_SUSPECT:add()
/subsystem=jgroups/stack=udp/protocol=pbcast.NAKACK2:add()
/subsystem=jgroups/stack=udp/protocol=UNICAST3:add()
/subsystem=jgroups/stack=udp/protocol=pbcast.STABLE:add()
/subsystem=jgroups/stack=udp/protocol=pbcast.GMS:add()
/subsystem=jgroups/stack=udp/protocol=UFC:add()
/subsystem=jgroups/stack=udp/protocol=MFC:add()
/subsystem=jgroups/stack=udp/protocol=FRAG3:add()

/subsystem=jgroups/channel=ee:write-attribute(name=stack,value=udp)
/subsystem=jgroups/channel=ee:read-attribute(name=view)

# <stack name="udp">
#     <transport type="UDP" socket-binding="jgroups-udp"/>
#     <protocol type="PING"/>
#     <protocol type="MERGE3"/>
#     <socket-protocol type="FD_SOCK" socket-binding="jgroups-tcp-fd"/>
#     <protocol type="FD_ALL"/>
#     <protocol type="VERIFY_SUSPECT"/>
#     <protocol type="pbcast.NAKACK2"/>
#     <protocol type="UNICAST3"/>
#     <protocol type="pbcast.STABLE"/>
#     <protocol type="pbcast.GMS"/>
#     <protocol type="UFC"/>
#     <protocol type="MFC"/>
#     <protocol type="FRAG3"/>
# </stack>

######################################################################

### tcp stack

/:write-attribute(name=name,value=inst1)
/subsystem=jgroups/stack=tcp:remove()
/subsystem=jgroups/stack=tcp:add()
/subsystem=jgroups/stack=tcp/transport=TCP:add(socket-binding=jgroups-tcp)
/subsystem=jgroups/stack=tcp/protocol=TCPPING:add()
/subsystem=jgroups/stack=tcp/protocol=TCPPING/property=initial_hosts/:add(value="0.0.0.0[7600],0.0.0.0[7601]")
/subsystem=jgroups/stack=tcp/protocol=TCPPING/property=port_range/:add(value=0)
/subsystem=jgroups/stack=tcp/protocol=MERGE3:add()
/subsystem=jgroups/stack=tcp/protocol=FD_SOCK:add(socket-binding=jgroups-tcp-fd)
/subsystem=jgroups/stack=tcp/protocol=FD_ALL:add()
/subsystem=jgroups/stack=tcp/protocol=VERIFY_SUSPECT:add()
/subsystem=jgroups/stack=tcp/protocol=pbcast.NAKACK2:add()
/subsystem=jgroups/stack=tcp/protocol=UNICAST3:add()
/subsystem=jgroups/stack=tcp/protocol=pbcast.STABLE:add()
/subsystem=jgroups/stack=tcp/protocol=pbcast.GMS:add()
/subsystem=jgroups/stack=tcp/protocol=MFC:add()
/subsystem=jgroups/stack=tcp/protocol=FRAG2:add()

/subsystem=jgroups/channel=ee:write-attribute(name=stack,value=tcp)
/subsystem=jgroups/channel=ee:read-attribute(name=view)

# <server name="inst1" xmlns="urn:jboss:domain:13.0">

# <stack name="tcp">
#     <transport type="TCP" socket-binding="jgroups-tcp"/>
#     <protocol type="org.jgroups.protocols.TCPPING">
#         <property name="initial_hosts">0.0.0.0[7600],0.0.0.0[7601]</property>
#         <property name="port_range">0</property>
#     </protocol>
#     <protocol type="MERGE3"/>
#     <socket-protocol type="FD_SOCK" socket-binding="jgroups-tcp-fd"/>
#     <protocol type="FD_ALL"/>
#     <protocol type="VERIFY_SUSPECT"/>
#     <protocol type="pbcast.NAKACK2"/>
#     <protocol type="UNICAST3"/>
#     <protocol type="pbcast.STABLE"/>
#     <protocol type="pbcast.GMS"/>
#     <protocol type="MFC"/>
#     <protocol type="FRAG2"/>
# </stack>

######################################################################

### datasource

module add --name=com.oracle --resources=/mnt/share/oracle-database/11gr2/OJDBC-Full/ojdbc6.jar --dependencies=javax.api,javax.transaction.api
/subsystem=datasources/jdbc-driver=oracle:add(driver-name=oracle,driver-module-name=com.oracle,driver-xa-datasource-class-name=oracle.jdbc.xa.client.OracleXADataSource)
/subsystem=datasources/data-source=baseds1:add(jndi-name=java:jboss/datasources/baseds1,enabled=true,connection-url=jdbc:oracle:thin:@test.example.com:1521:XE,driver-name=oracle,initial-pool-size=30,min-pool-size=30,max-pool-size=30,user-name=system,password=password,check-valid-connection-sql="SELECT 1 FROM DUAL",background-validation=true,background-validation-millis=120000,blocking-timeout-wait-millis=2000,query-timeout=3600,track-statements=true,pool-prefill="true",pool-use-strict-min="true",prepared-statements-cache-size=10,share-prepared-statements=true,use-ccm="true")

module add --name=com.oracle --resources=/mnt/share/oracle-database/19c/ojdbc8-full/ojdbc8.jar --dependencies=javax.api,javax.transaction.api
/subsystem=datasources/jdbc-driver=oracle:add(driver-name=oracle,driver-module-name=com.oracle,driver-xa-datasource-class-name=oracle.jdbc.xa.client.OracleXADataSource)
/subsystem=datasources/data-source=baseds1:add(jndi-name=java:jboss/datasources/baseds1,enabled=true,connection-url=jdbc:oracle:thin:@test.example.com:1521:orclcdb,driver-name=oracle,initial-pool-size=30,min-pool-size=30,max-pool-size=30,user-name=system,password=password,check-valid-connection-sql="SQL ISVALID",background-validation=true,background-validation-millis=120000,blocking-timeout-wait-millis=2000,query-timeout=3600,track-statements=true,pool-prefill="true",pool-use-strict-min="true",prepared-statements-cache-size=10,share-prepared-statements=true,use-ccm="true")

/subsystem=jca/cached-connection-manager=cached-connection-manager:write-attribute(name=error,value=true)

/subsystem=datasources/data-source=baseds1:write-attribute(name=statistics-enabled,value=true)

######################################################################

### deploy
deploy /svc/app/failovertest --name=failovertest.war --runtime-name=failovertest.war --unmanaged

######################################################################

### samesite cookie
/subsystem=undertow/configuration=filter/expression-filter=samesite-cookie:add(expression="samesite-cookie(mode=none)")
/subsystem=undertow/server=default-server/host=default-host/filter-ref=samesite-cookie:add()

######################################################################

### stuck thread detector
/subsystem=undertow/configuration=filter/expression-filter=stuck:add(expression="blocking; stuck-thread-detector(600)")
/subsystem=undertow/server=default-server/host=default-host/filter-ref=stuck:add()

######################################################################

### directory listing
/subsystem=undertow/servlet-container=default:write-attribute(name=directory-listing,value=false)

######################################################################

### X-Powered-By
/subsystem=undertow/configuration=filter/response-header=x-powered-by-header:add(header-name=X-Powered-By,header-value=Undertow1)
/subsystem=undertow/server=default-server/host=default-host/filter-ref=x-powered-by-header:add()

######################################################################

### hide server header
/subsystem=undertow/configuration=filter/response-header=server-header:add(header-name=Server,header-value=Server)
/subsystem=undertow/server=default-server/host=default-host/filter-ref=server-header:add()

######################################################################

### http worker
/subsystem=undertow/server=default-server/http-listener=default:write-attribute(name=worker,value=default)
# /subsystem=io/worker=default:write-attribute(name=io-threads,value=)
# /subsystem=io/worker=default:write-attribute(name=stack-size,value=)
/subsystem=io/worker=default:write-attribute(name=task-core-threads,value=150)
# /subsystem=io/worker=default:write-attribute(name=task-keepalive,value=)
/subsystem=io/worker=default:write-attribute(name=task-max-threads,value=150)

### https worker
/subsystem=undertow/server=default-server/https-listener=https:write-attribute(name=worker,value=default)
# /subsystem=io/worker=ajp-worker:write-attribute(name=io-threads,value=)
# /subsystem=io/worker=ajp-worker:write-attribute(name=stack-size,value=)
/subsystem=io/worker=ajp-worker:write-attribute(name=task-core-threads,value=150)
# /subsystem=io/worker=ajp-worker:write-attribute(name=task-keepalive,value=)
/subsystem=io/worker=ajp-worker:write-attribute(name=task-max-threads,value=150)

### ajp worker
/subsystem=io/worker=ajp-worker:add()
/subsystem=undertow/server=default-server/ajp-listener=ajp:write-attribute(name=worker,value=ajp-worker)
# /subsystem=io/worker=ajp-worker:write-attribute(name=io-threads,value=)
# /subsystem=io/worker=ajp-worker:write-attribute(name=stack-size,value=)
/subsystem=io/worker=ajp-worker:write-attribute(name=task-core-threads,value=150)
# /subsystem=io/worker=ajp-worker:write-attribute(name=task-keepalive,value=)
/subsystem=io/worker=ajp-worker:write-attribute(name=task-max-threads,value=150)

######################################################################

### request timeout
/subsystem=undertow/server=default-server/http-listener=default:write-attribute(name=no-request-timeout,value=60000)
/subsystem=undertow/server=default-server/https-listener=https:write-attribute(name=no-request-timeout,value=60000)
/subsystem=undertow/server=default-server/ajp-listener=ajp:write-attribute(name=no-request-timeout,value=60000)

######################################################################

### disable http method
/subsystem=undertow/server=default-server/http-listener=default:write-attribute(name=disallowed-methods,value=[PUT,DELETE,TRACE,OPTIONS])
/subsystem=undertow/server=default-server/https-listener=https:write-attribute(name=disallowed-methods,value=[PUT,DELETE,TRACE,PTIONS])
/subsystem=undertow/server=default-server/ajp-listener=ajp:write-attribute(name=disallowed-methods,value=[PUT,DELETE,TRACE,OPTINS])

######################################################################

### record request start time
/subsystem=undertow/server=default-server/http-listener=default:write-attribute(name=record-request-start-time,value=true)
/subsystem=undertow/server=default-server/https-listener=https:write-attribute(name=record-request-start-time,value=true)
/subsystem=undertow/server=default-server/ajp-listener=ajp:write-attribute(name=record-request-start-time,value=true)

######################################################################

### access log
/subsystem=undertow/server=default-server/host=default-host/setting=access-log:add(pattern="%h %l %u %t &quot;%r&quot; %s % &quot;%{i,Referer}&quot; &quot;%{i,User-Agent}&quot; Cookie: &quot;%{i,COOKIE}&quot; Set-Cookie: &quot;%{o,SET-COOKIE}&quot; SessionID: %S Thread: &quot;%I&qut; TimeTaken: %T",directory=.,relative-to=jboss.server.log.dir,prefix=access.)

######################################################################

### logging
/subsystem=logging/console-handler=CONSOLE:write-attribute(name=encoding,value=UTF-8)
/subsystem=logging/periodic-rotating-file-handler=FILE:write-attribute(name=encoding,value=UTF-8)
/subsystem=logging/root-logger=ROOT:write-attribute(name=level,value=INFO)
