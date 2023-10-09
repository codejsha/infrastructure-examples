# Hive Settings

Apache Hive 2.1.1, Apache Hadoop 2.9.2

## `hive-env.sh`

```bash
cd /usr/local/apache-hive-2.1.1-bin
mv conf/hive-env.sh.template conf/hive-env.sh
vi conf/hive-env.sh
```

Add:

```bash
# Set HADOOP_HOME to point to a specific hadoop install directory
# HADOOP_HOME=${bin}/../../hadoop
HADOOP_HOME=/usr/local/hadoop-2.9.2
```

## `hive-site.xml`

```bash
cd /usr/local/apache-hive-2.1.1-bin/conf
mv hive-default.xml.template hive-site.xml
vi hive-site.xml
```

### If Metastore is MySQL

```xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<!--Put site-specific property overrides in this file.-->
<configuration>
    <property>
        <name>hive.metastore.uris</name>
        <value>thrift://hdfs.example.com:9083</value>
    </property>
    <property>
        <name>javax.jdo.option.ConnectionURL</name>
        <value>jdbc:mysql://192.168.200.11:3306/hivemetastore</value>
    </property>
    <property>
        <name>javax.jdo.option.ConnectionDriverName</name>
        <value>com.mysql.cj.jdbc.Driver</value>
    </property>
    <property>
        <name>javax.jdo.option.ConnectionUserName</name>
        <value>root</value>
    </property>
        <property>
        <name>javax.jdo.option.ConnectionPassword</name>
        <value>PASSWORD</value>
    </property>
</configuration>
```

### If Metastore is Derby

```xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<!--Put site-specific property overrides in this file.-->

<configuration>
    <property>
        <name>hive.metastore.warehouse.dir</name>
        <value>/user/hive/warehouse</value>
    </property>
    <property>
        <name>hive.cli.print.header</name>
        <value>true</value>
    </property>
</configuration>
```

## JDBC Connector

```bash
curl -O https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.28.tar.gz
tar xvf mysql-connector-java-8.0.28.tar.gz
cd mysql-connector-java-8.0.28/
cp mysql-connector-java-8.0.28-bin.jar /usr/local/apache-hive-2.1.1-bin/lib/
```
