# Apache HTTP Server

Apache HTTP Server is a free and open-source cross-platform web server software, maintained by the Apache Software Foundation.

## Apache Tomcat Connector

Apache Tomcat Connector (mod_jk) is an Apache module that enables Apache HTTP Server to communicate with Apache Tomcat.
It uses *Apache JServ Protocol (AJP)* to connect to the backend. Backends known to support AJP are Apache Tomcat, Jetty and JBoss.

### Configuration

include mod_jk.conf file in httpd.conf:

```conf
# Apache Tomcat Connector (mod_jk)
Include conf/jk/mod_jk.conf
```

copy config files to `conf/jk` directory

## References

- Apache HTTP Server Documentation: <http://httpd.apache.org/docs/current/>
- Apache Tomcat Connector: <https://tomcat.apache.org/connectors-doc/>
- Sisdig apache exporter: <https://github.com/sysdiglabs/promcat-resources/tree/master/resources/apache>
- Lusitaniae apache exporter: <https://github.com/Lusitaniae/apache_exporter>
