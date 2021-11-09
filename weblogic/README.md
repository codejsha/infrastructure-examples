# WebLogic

## Install

```bash
### pre-install
### 14c, 12c:
bash ./helper.sh
### 11g:
bash ./helper-11g.sh

### install
bash ./install-weblogic.sh
```

## Create a domain

```bash
cd domain
bash ./create-domain.sh
cd ..
```

## Configuration

```bash
bash ./all.sh
```

## Logging

### logrotate

- https://www.redhat.com/sysadmin/setting-logrotate
- https://access.redhat.com/solutions/1294

`/etc/logrotate.d/weblogic_base_domain.conf`:

```conf
daily
rotate 4
create
dateext
notifempty
missingok

/usr/local/weblogic/user_projects/domains/base_domain/logs/*.out {
}

/usr/local/weblogic/user_projects/domains/base_domain/logs/*.log {
}
```

### Rotating log file in Windows service

- https://docs.oracle.com/middleware/12213/wls/START/winservice.htm
- https://docs.oracle.com/en/middleware/standalone/weblogic-server/14.1.1.0/start/winservice.html

#### Edit argument

At the end of the wlsvc command, append the following command option:

```cmd
-log:%LOG_PATH%
```

#### Edit stdout log file

by time:

```log
# ROTATION_TYPE = TIME
# TIME_START_DATE = MONTH DAY YEAR HOUR:MINUTES:SECONDS
# TIME_INTERVAL_MINS = NUMBER_OF_MINUTES
```

by size:

```log
# ROTATION_TYPE = SIZE
# SIZE_KB = FILE_SIZE_IN_KILOBYTES
# SIZE_TRIGGER_INTERVAL_MINS = NUMBER_OF_MINUTES
```

## WLST (WebLogic Scripting Tool)

### Set urandom

```bash
export CONFIG_JVM_ARGS="${CONFIG_JVM_ARGS} -Djava.security.egd=file:///dev/urandom"
```

### Connect WLST

```py
admin_server_listen_address = 'test.example.com'
admin_server_listen_port = '7001'
admin_username = 'weblogic'
admin_password = 'welcome1'

admin_server_url = 't3://' + admin_server_listen_address + ':' + admin_server_listen_port
connect(admin_username, admin_password, admin_server_url)
```
