# iPlanet

## Install

```bash
bash ./install-iplanet.sh
bash ./create-links.sh admin-server
```

## wadm

```bash
IPLANET_HOME="/usr/local/iplanet"
${IPLANET_HOME}/bin/wadm --user=admin --password-file="${IPLANET_HOME}/pswd-file" --host="test.example.com" --port="8989" --ssl="true" --rcfile="null"
```

## Log Rotation

- https://docs.oracle.com/cd/E19146-01/821-1828/gbrqz/index.html
