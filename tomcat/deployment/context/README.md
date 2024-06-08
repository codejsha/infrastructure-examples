# Configuring Web Application Contexts

## Deployment

requirement:

- deployOnStartup="true" (default: true)

```xml
    <!-- server.xml -->

      <Host name="localhost"  appBase="webapps"
            unpackWARs="true" autoDeploy="false">

      <Host name="localhost"  appBase="webapps"
            unpackWARs="true" autoDeploy="false" deployOnStartup="true">
```

context file location:

- `${CATALINA_BASE}/conf/[enginename]/[hostname]/<context>.xml`

## Examples

```xml
<!-- ROOT.xml -->
<Context docBase="/svc/app/basic" reloadable="false">

<!-- cache.xml -->
<Context docBase="/svc/app/cachetest" reloadable="false">

<!-- failover.xml -->
<Context docBase="/svc/app/failovertest" reloadable="false">

<!-- jdbc.xml -->
<Context docBase="/svc/app/jdbctest" reloadable="false">
```
