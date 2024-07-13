# Tomcat

## Install

### Binary/Archive

```bash
### pre-install
bash ./helper.sh

### install
bash ./install-tomcat.sh
```

### Chocolatey

```ps1
choco install -y tomcat

# choco uninstall -y tomcat
```

## Create instances

- [Tomcat instances README](/tomcat/instance/README.md)

## Logging

- Logging in Tomcat: <https://tomcat.apache.org/tomcat-10.0-doc/logging.html>

### Log4j

- Using Log4j 2 in Web Applications: <https://logging.apache.org/log4j/2.x/manual/webapp.html>
- Appenders: <https://logging.apache.org/log4j/2.x/manual/appenders.html>

## Datasource

### DBCP

- JNDI Datasource How-To: <https://tomcat.apache.org/tomcat-10.0-doc/jndi-datasource-examples-howto.html>
- BasicDataSource Configuration Parameters: <https://commons.apache.org/proper/commons-dbcp/configuration.html>

### HikariCP

- HikariCP wiki: <https://github.com/brettwooldridge/HikariCP/wiki/JNDI-DataSource-Factory-(Tomcat,-etc>.)

## References

- Apache Tomcat Website: <https://tomcat.apache.org/>
