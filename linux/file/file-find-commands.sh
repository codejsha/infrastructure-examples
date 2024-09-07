######################################################################

function find() { echo "+ find ${@}">&2; command find "${@}"; }
function fd() { echo "+ fd ${@}">&2; command fd "${@}"; }

######################################################################

### fd

######################################################################

### find

find .
find . -print

### find files and directories with names
### - `-type f`: files
### - `-type d`: directories

### in current directory
find . -name server.xml

### under directory
find /usr/local/tomcat -name server.xml
find /was -maxdepth 1 -type d -name "wls*"

### multiple directories
find ./bin ./conf -type f -name "*catalina*"

### ignore case
find /usr/local/tomcat -maxdepth 1 -iname "b*"

### extensions
find . -type f -name "*.sh"
find . -maxdepth 1 -type f -name "*.sh"

### filtering name
find . -type f -name "*.sh" -not -name "start*"
find . -type f -name "*.sh" -not -name "start*" -not -name "shutdown*"

find . -type f -name "*.sh" ! -name "start*"
find . -type f -name "*.sh" ! -name "start*" ! -name "shutdown*"

find . -type f -name "*bat" -o -name "*.sh"
find . -type f -name "*bat" -not -name "start*" -o -name "*.sh" -not -name "start*"

### empty directories
find /tmp -type d -empty

### exclude directories
find . -not -path "./docs"

### find files and directories and actions

find . -type f -name "*.sh" | xargs ls -l
find . -type f -name "*.sh" | xargs rm -rf
find . -name "*uddi*" | xargs rm -rf

find . -type f -name "*.sh" -exec cp {} {}_backup \;
find . -type f -name "*.sh" -exec rm -rf {} \;

### find files and directories based on permissions
### - `-perm`: permissions

### with permissions
find . -type f -perm 750
find . -type f -perm 0750 -name "*.sh"

### without permissions
find . -type d ! -perm 750
find . -type f ! -perm 750 -name "*.sh"

### change permissions
find . -type f ! -perm 750 -name "*.sh" | xargs chmod 750
find . -type f ! -perm 750 -name "*.sh" -exec chmod 750 {} \;

### read only files
find / -perm /u=r
### executable files
find / -perm /a=x

### suid files
find / -perm /u=s
### sgid files
find / -perm /g=s

### find files and directories based on owners and groups
### - `-user`
### - `-group`

find / -user root -name readme.md
find / -user prouser -name "*.out"

find /home/prouser -maxdepth 1 -group prouser -name ".*"

### find files and directories based on date and time
### - `-mtime`
### - `-cmin`

### last 30 days modified files
find . -maxdepth 1 -mtime -30 -type f -name "*.out"

### last 30-90 days modified files
### (modified more than 30 days back and less than 90 days)
find . -maxdepth 1 -mtime -90 -mtime +30 -type f -name "*.out"

### modified files in last 1 hour
find . -maxdepth 1 -mmin -60 -type f

### changed files in last 1 hour
find . -maxdepth 1 -cmin -60 -type f

### find files and directories based on size
### - `-size`

find / -size 50M
find / -size +50M -size -100M

find . -size +100M | xargs rm -rf
find . -size +100M -exec rm -rf {} \;

### examples:

find . -mtime -30 -type f \( -path "*/LOGS/*" -o -path "*/logs/*" \) -not -path "*/servers/*" \( -name "*log*" -o -name "*out" \) -not \(  -name "*access*" -o -name "*gc.*" \) | xargs grep -n -E "Critical"

### trim trailing whitespaces
find . -type f -not \( -path "./.git/*" -o -path "./docs/*" \) | xargs sed -i "s/\s*$//g"

### verify zip archive files
find . -type f -iname '*.zip' -exec unzip -tq {} \;
