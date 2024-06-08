# Deployment

## Deployment descriptor

web.xml:

- https://cloud.google.com/appengine/docs/standard/java/config/webxml
- https://docs.spring.io/spring/docs/current/spring-framework-reference/core.html
- https://docs.oracle.com/middleware/12213/wls/WBAPP/web_xml.htm
- https://docs.oracle.com/middleware/12213/wls/WBAPP/app_events.htm

weblogic.xml:

- https://docs.oracle.com/middleware/12213/wls/WBAPP/weblogic_xml.htm

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
