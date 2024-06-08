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
/subsystem=jgroups/channel=ee:read-resource(include-runtime=true)

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
/subsystem=jgroups/channel=ee:read-resource(include-runtime=true)

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

### credential store
# <datasource jndi-name="java:jboss/datasources/baseds1" pool-name="baseds1" enabled="true" use-ccm="true" statistics-enabled="true">
#     <connection-url>jdbc:oracle:thin:@test.example.com:1521:XE</connection-url>
#     <driver>oracle</driver>
#     <pool>
#         <min-pool-size>30</min-pool-size>
#         <initial-pool-size>30</initial-pool-size>
#         <max-pool-size>30</max-pool-size>
#         <prefill>true</prefill>
#         <use-strict-min>true</use-strict-min>
#     </pool>
#     <security>
#         <user-name>system</user-name>
#         <credential-reference store="my_store" alias="baseds1-password"/>
#     </security>
#     <validation>
#         <check-valid-connection-sql>SELECT 1 FROM DUAL</check-valid-connection-sql>
#         <background-validation>true</background-validation>
#         <background-validation-millis>120000</background-validation-millis>
#     </validation>
#     <timeout>
#         <blocking-timeout-millis>2000</blocking-timeout-millis>
#         <query-timeout>3600</query-timeout>
#     </timeout>
#     <statement>
#         <track-statements>true</track-statements>
#         <prepared-statement-cache-size>10</prepared-statement-cache-size>
#         <share-prepared-statements>true</share-prepared-statements>
#     </statement>
# </datasource>

### password vault
# <datasource jndi-name="java:jboss/datasources/baseds1" pool-name="baseds1" enabled="true" use-ccm="true" statistics-enabled="true">
#     <connection-url>jdbc:oracle:thin:@test.example.com:1521:XE</connection-url>
#     <driver>oracle</driver>
#     <pool>
#         <min-pool-size>30</min-pool-size>
#         <initial-pool-size>30</initial-pool-size>
#         <max-pool-size>30</max-pool-size>
#         <prefill>true</prefill>
#         <use-strict-min>true</use-strict-min>
#     </pool>
#     <security>
#         <user-name>system</user-name>
#         <password>${VAULT::datasource::password::1}</password>
#     </security>
#     <validation>
#         <check-valid-connection-sql>SELECT 1 FROM DUAL</check-valid-connection-sql>
#         <background-validation>true</background-validation>
#         <background-validation-millis>120000</background-validation-millis>
#     </validation>
#     <timeout>
#         <blocking-timeout-millis>2000</blocking-timeout-millis>
#         <query-timeout>3600</query-timeout>
#     </timeout>
#     <statement>
#         <track-statements>true</track-statements>
#         <prepared-statement-cache-size>10</prepared-statement-cache-size>
#         <share-prepared-statements>true</share-prepared-statements>
#     </statement>
# </datasource>

######################################################################

### deploy
deploy /svc/app/failovertest --name=failovertest.war --runtime-name=failovertest.war --unmanaged

######################################################################

### directory listing
/subsystem=undertow/servlet-container=default:write-attribute(name=directory-listing,value=false)

######################################################################

### hide server header info (server, x-powered-by)
# /subsystem=undertow/server=default-server/host=default-host/filter-ref=server-header:remove()
# /subsystem=undertow/server=default-server/host=default-host/filter-ref=x-powered-by-header:remove()
/subsystem=undertow/configuration=filter/response-header=server-header:write-attribute(name=header-value,value=server)
/subsystem=undertow/configuration=filter/response-header=x-powered-by-header:write-attribute(name=header-value,value=server)
/subsystem=undertow/servlet-container=default/setting=jsp:write-attribute(name=x-powered-by,value=false)

### hsts (http strict-transport-security)
/subsystem=undertow/configuration=filter/response-header=hsts-header:add(header-name="Strict-Transport-Security",header-value="max-age=31536000;")
/subsystem=undertow/server=default-server/host=default-host/filter-ref=hsts-header:add()

### stuck thread detector
/subsystem=undertow/configuration=filter/expression-filter=stuck:add(expression="blocking; stuck-thread-detector(600)")
/subsystem=undertow/server=default-server/host=default-host/filter-ref=stuck:add()

### samesite cookie
/subsystem=undertow/configuration=filter/expression-filter=samesite-cookie:add(expression="samesite-cookie(mode=none)")
/subsystem=undertow/server=default-server/host=default-host/filter-ref=samesite-cookie:add()

### redirect http to https
/subsystem=undertow/configuration=filter/rewrite=http-to-https:add(redirect="true",target="https://test.example.com:8443%U")
/subsystem=undertow/server=default-server/host=default-host/filter-ref=http-to-https:add(predicate="equals(%p,8080)")

# <host name="default-host" alias="localhost">
#     <location name="/" handler="welcome-content"/>
#     <access-log pattern="%h %l %u %t &amp;quot;%r&amp;quot; %s %b &amp;quot;%{i,Referer}&amp;quot; &amp;quot;%{i,User-Agent}&amp;quot; Cookie: &amp;quot;%{i,COOKIE}&amp;quot; Set-Cookie: &amp;quot;%{o,SET-COOKIE}&amp;quot; SessionID: %S Thread: &amp;quot;%I&amp;quot; TimeTaken: %T" directory="." relative-to="jboss.server.log.dir" prefix="access."/>
#     <filter-ref name="stuck"/>
#     <filter-ref name="hsts-header"/>
#     <filter-ref name="samesite-cookie"/>
#     <filter-ref name="http-to-https" predicate="equals(%p,8080)"/>
#     <http-invoker security-realm="ApplicationRealm"/>
# </host>

# <filters>
#     <response-header name="x-powered-by-header" header-name="X-Powered-By" header-value="server"/>
#     <response-header name="server-header" header-name="Server" header-value="server"/>
#     <response-header name="hsts-header" header-name="Strict-Transport-Security" header-value="max-age=31536000;"/>
#     <expression-filter name="samesite-cookie" expression="samesite-cookie(mode=none)"/>
#     <expression-filter name="stuck" expression="blocking; stuck-thread-detector(600)"/>
#     <rewrite name="http-to-https" target="https://test.example.com:8443%U" redirect="true"/>
# </filters>

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

# <subsystem xmlns="urn:jboss:domain:io:3.0">
#     <worker name="default" task-core-threads="150" task-max-threads="150"/>
#     <worker name="ajp-worker" task-core-threads="150" task-max-threads="150"/>
#     <buffer-pool name="default"/>
# </subsystem>

# <server name="default-server">
#     <ajp-listener name="ajp" socket-binding="ajp" worker="ajp-worker" record-request-start-time="true" no-request-timeout="60000" disallowed-methods="PUT DELETE TRACE OPTIONS"/>
#     <http-listener name="default" socket-binding="http" worker="default" record-request-start-time="true" no-request-timeout="60000" disallowed-methods="PUT DELETE TRACE OPTIONS" redirect-socket="https" enable-http2="true"/>
#     <https-listener name="https" socket-binding="https" worker="default" record-request-start-time="true" no-request-timeout="60000" disallowed-methods="PUT DELETE TRACE OPTIONS" security-realm="CertificateRealm" enable-http2="true"/>

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

######################################################################

### http only
/subsystem=undertow/servlet-container=default/setting=session-cookie:add
/subsystem=undertow/servlet-container=default/setting=session-cookie:write-attribute(name=http-only,value=true)

/subsystem=undertow/server=default-server/host=default-host/setting=single-sign-on:add
/subsystem=undertow/server=default-server/host=default-host/setting=single-sign-on:write-attribute(name=http-only,value=true)
