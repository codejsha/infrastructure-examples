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
