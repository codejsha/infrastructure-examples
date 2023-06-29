# Configuring Hosts

## Deployment

server config file location:

- `${CATALINA_BASE}/conf/server.xml`

## Examples

### Webapps

deploy only applications under the webapps directory

```xml
      <Host name="localhost"  appBase="webapps"
            unpackWARs="true" autoDeploy="false">
      </Host>
```

### Webapps + Contexts

deploy applications under the webapps directory and applications designated as context

```xml
      <Host name="localhost"  appBase="webapps"
            unpackWARs="true" autoDeploy="false">

        <Context path="/cache" docBase="/svc/app/cachetest" reloadable="false"/>
        <Context path="/failover" docBase="/svc/app/failovertest" reloadable="false"/>
        <Context path="/jdbc" docBase="/svc/app/jdbctest" reloadable="false"/>

      </Host>
```

### Contexts

deploy only applications designated as context

```xml
      <Host name="localhost"  appBase="webapps"
            unpackWARs="true" autoDeploy="false" deployOnStartup="false">

        <Context path="/cache" docBase="/svc/app/cachetest" reloadable="false"/>
        <Context path="/failover" docBase="/svc/app/failovertest" reloadable="false"/>
        <Context path="/jdbc" docBase="/svc/app/jdbctest" reloadable="false"/>

      </Host>
```
