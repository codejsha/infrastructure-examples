# Deployment

## Deployment descriptor

web.xml:

- <https://cloud.google.com/appengine/docs/standard/java/config/webxml>
- <https://docs.spring.io/spring-framework/reference/web/webmvc/mvc-servlet.html>
- <https://docs.oracle.com/middleware/12213/wls/WBAPP/web_xml.htm>
- <https://docs.oracle.com/middleware/12213/wls/WBAPP/app_events.htm>

weblogic.xml:

- <https://docs.oracle.com/middleware/12213/wls/WBAPP/weblogic_xml.htm>

## Deploy an Application by WebLogic Deployer Utility

- [weblogic.Deployer Command-Line Reference](https://docs.oracle.com/middleware/11119/wls/DEPGD/wldeployer.htm)
- [Deploying Applications and Modules with weblogic.Deployer](https://docs.oracle.com/middleware/11119/wls/DEPGD/deploy.htm)

## Deployment command

```bash
java weblogic.Deployer
     -adminurl ${PROTOCOL}://${LISTEN_ADDRESS}:${PORT}
     -username ${USERNAME} -password ${PASSWORD}
     -verbose
     -deploy -name ${DEPLOYMENT_NAME} -source ${FILE} -targets ${TARGET_LIST} -nostage
```

### Example

```bash
. ${MW_HOME}/wlserver_10.3/server/bin/setWLSEnv.sh
java weblogic.Deployer -adminurl t3://192.168.137.130:7001 -username weblogic -password welcome1 -verbose -deploy -name sampleapp -source /app/sampleapp -targets Cluster-1 -nostage

# weblogic.Deployer invoked with options:  -adminurl t3://192.168.137.130:7001 -username weblogic -verbose -deploy -name sampleapp -source /app/sampleapp -targets Cluster-1 -nostage
# <Apr 7, 2019 9:53:37 AM KST> <Info> <J2EE Deployment SPI> <BEA-260121> <Initiating deploy operation for application, sampleapp [archive: /app/sampleapp], to Cluster-1 .>
# Task 5 initiated: [Deployer:149026]deploy application sampleapp on Cluster-1.
# Task 5 deferred: [Deployer:149026]deploy application sampleapp on Cluster-1.
# Target state: deploy deferred on Cluster Cluster-1
# java.rmi.RemoteException: [Deployer:149145]Unable to contact 'Server-12'. Deployment is deferred until 'Server-12' becomes available.
#
# java.rmi.RemoteException: [Deployer:149145]Unable to contact 'Server-11'. Deployment is deferred until 'Server-11' becomes available.
#
#
# Target Assignments:
# + sampleapp  Cluster-1
```

## Sample application

### 14c and 12c

set `INSTALL_TYPE=Complete with Examples` in the weblogic response file.

```rsp
[ENGINE]

Response File Version=1.0.0.0.0

[GENERIC]

ORACLE_HOME=/usr/local/weblogic
INSTALL_TYPE=Complete with Examples
DECLINE_AUTO_UPDATES=true
DECLINE_SECURITY_UPDATES=true
```

### 11g

Add `WebLogic Server/Server Examples` component to COMPONENT_PATHS in `silent.xml`.

```xml
        <data-value name="COMPONENT_PATHS" value="WebLogic Server/Core Application Server|WebLogic Server/Administration Console|WebLogic Server/Configuration Wizard and Upgrade Framework|WebLogic Server/Web 2.0 HTTP Pub-Sub Server|WebLogic Server/WebLogic JDBC Drivers|WebLogic Server/Third Party JDBC Drivers|WebLogic Server/WebLogic Server Clients|WebLogic Server/WebLogic Web Server Plugins|WebLogic Server/UDDI and Xquery Support|WebLogic Server/Server Examples" />
```

And then, install weblogic.

```bash
bash ./install-weblogic.sh
```

For convenience, add symbolic links.

```bash
# ln -snf ${DOMAIN_HOME} ${MW_HOME}/${DOMAIN_NAME}

MW_HOME="/usr/local/weblogic"
ln -snf ${MW_HOME}/wlserver_10.3/samples/domains/wl_server ${MW_HOME}/wl_server
ln -snf ${MW_HOME}/wlserver_10.3/samples/domains/medrec ${MW_HOME}/medrec
ln -snf ${MW_HOME}/wlserver_10.3/samples/domains/medrec-spring ${MW_HOME}/medrec-spring
```
