# Apache HTTP Server

Apache HTTP Server is a free and open-source cross-platform web server software, maintained by the Apache Software Foundation.

## Install

### DNF/YUM

```bash
sudo dnf install -y httpd

# sudo systemctl enable httpd.service
# sudo systemctl start httpd.service

sudo dnf install mod_ssl -y
```

### Build

```bash
bash ./install-httpd.sh
```

### Homebrew

```sh
brew install -y httpd

# brew uninstall -y httpd
```

### Chocolatey

```ps1
choco install -y apache-httpd

# choco uninstall -y apache-httpd
```

## Apache Tomcat Connector

Apache Tomcat Connector (mod_jk) is an Apache module that enables Apache HTTP Server to communicate with Apache Tomcat.
It uses *Apache JServ Protocol (AJP)* to connect to the backend. Backends known to support AJP are Apache Tomcat, Jetty and JBoss.

### Configuration

include mod_jk.conf file in httpd.conf:

```conf
# Apache Tomcat Connector (mod_jk)
Include conf/jk/mod_jk.conf
```

run to copy config files to httpd home:

```bash
bash ./httpd-tomcat.sh
```

## References

- Apache HTTP Server Documentation: <http://httpd.apache.org/docs/current/>
- Apache Tomcat Connector: <https://tomcat.apache.org/connectors-doc/>
- Sisdig apache exporter: <https://github.com/sysdiglabs/promcat-resources/tree/master/resources/apache>
- Lusitaniae apache exporter: <https://github.com/Lusitaniae/apache_exporter>
