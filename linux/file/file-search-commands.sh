######################################################################

function grep() { echo "+ grep ${@}">&2; command grep "${@}"; }
function rg() { echo "+ rg ${@}">&2; command rg "${@}"; }

######################################################################

### rg (ripgrep)

######################################################################

### grep (Print lines matching a pattern)
### cf. `grep -E` == `egrep`, `grep -F` == `fgrep`

### basic and extended regexp
grep -E "OutOfMemoryError|Critical" *.log
egrep "OutOfMemoryError|Critical" *.log
grep -e "OutOfMemoryError" -e "Critical" *.log

### invert match
grep -n "hello" *.log | grep -v "world"

### ignore case
grep -i "connector port" server.xml
# <Connector port="8080" protocol="HTTP/1.1"
# <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
# <Connector port="8443" protocol="org.apache.coyote.http11.Http11AprProtocol"
# <Connector port="8009" protocol="AJP/1.3" redirectPort="8443" />

### max count
grep -ni -m 1 "connector port" server.xml
# 69:    <Connector port="8080" protocol="HTTP/1.1"

### recursive
grep -rni -m 1 "connector port" conf
# conf/server.xml:69:    <Connector port="8080" protocol="HTTP/1.1"

### include and exclude file patterns
grep -rn -m 1 --include="*xml" "version" conf
# conf/context.xml:1:<?xml version="1.0" encoding="UTF-8"?>
# conf/jaspic-providers.xml:1:<?xml version="1.0" encoding="UTF-8"?>
# conf/server.xml:1:<?xml version="1.0" encoding="UTF-8"?>
# conf/tomcat-users.xml:1:<?xml version="1.0" encoding="UTF-8"?>
# conf/web.xml:1:<?xml version="1.0" encoding="UTF-8"?>

grep -rn -m 1 --exclude="*xml" "version" conf
# conf/catalina.policy:138:    permission java.util.PropertyPermission "os.version", "read";
# conf/jaspic-providers.xsd:1:<?xml version="1.0" encoding="UTF-8"?>
# conf/tomcat-users.xsd:1:<?xml version="1.0" encoding="UTF-8"?>

grep -rn -m 1 --include="*xml" --exclude="server*" "version" conf
# conf/context.xml:1:<?xml version="1.0" encoding="UTF-8"?>
# conf/jaspic-providers.xml:1:<?xml version="1.0" encoding="UTF-8"?>
# conf/tomcat-users.xml:1:<?xml version="1.0" encoding="UTF-8"?>
# conf/web.xml:1:<?xml version="1.0" encoding="UTF-8"?>

grep -rn -m 1 --exclude-dir="webapps" --exclude-dir="bin" --exclude-dir="conf" "version" *
# BUILDING.txt:30:In order to build a binary distribution version of Apache Tomcat from a
# CONTRIBUTING.md:46:currently supported Tomcat versions (7, 8.5, and 9).
# LICENSE:34:      and conversions to other media types.
# README.md:13:[Apache License version 2](https://www.apache.org/licenses/). The Apache Tomcat
# RUNNING.txt:23:Environment (JRE) version 8 or later.

### files with matches (only file names)
grep -l -E "OutOfMemoryError|Critical"

### files without match (only file names containing no match)
grep -L -E "OutOfMemoryError|Critical"

### count of matching lines
grep -rn -c --include="*xml" "version" conf
# conf/context.xml:1
# conf/jaspic-providers.xml:2
# conf/server.xml:1
# conf/tomcat-users.xml:2
# conf/web.xml:3

### before and after context
tac test.log | grep -n -m 10 -B 30 -A 50 -e "[ERROR]"
tac test.log | grep -n -m 10 -A 50 -e "[ERROR]"
