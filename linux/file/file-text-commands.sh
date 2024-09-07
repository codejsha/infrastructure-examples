######################################################################

### gawk (A text scanning and processing language)

gawk '{print $1}' ${FILE}

######################################################################

### sed (Stream EDitor)

### replace string
### (replace all first occurrences of 'hello' to 'world' in the file input.txt)
sed 's/hello/world/' input.txt > output.txt
sed -e 's/hello/world/' input.txt > output.txt
sed --expression='s/hello/world/' input.txt > output.txt

### replace string all occurrences in line
sed 's/hello/world/g' input.txt > output.txt
sed -e 's/hello/world/g' input.txt > output.txt
sed --expression='s/hello/world/g' input.txt > output.txt

### edit files in place
### (Use -i to edit files in-place instead of printing to standard output)
sed -i 's/hello/world/g' file.txt

### print line
### (Use -n to suppress output, and the p command to print specific lines)
sed -n '45p' file.txt
### replace specific line
### replaces the word 'hello' with 'world' only on line 144
sed '144s/hello/world/g' input.txt > output.txt

### replace specific range
### replaces the word 'hello' with 'world' only in lines 4 to 17 (inclusive)
sed '4,17s/hello/world/' input.txt > output.txt

### replace specific line containing word
### replaces the word 'hello' with 'world' only in lines not containing the word 'apple'
### the ! character follows an address or an address range, then only lines which do not match the addresses will be selected
sed '/apple/!s/hello/world/' input.txt > output.txt

### replace exclude lines
### replaces the word 'hello' with 'world' only in lines 1 to 3 and 18 till the last line of the input file (i.e. excluding lines 4 to 17)
sed '4,17!s/hello/world/' input.txt > output.txt

### matches addr1 and the N lines following addr1.
seq 10 | sed -n '6,+2p'
# 6
# 7
# 8
### insert specific line
sed -i "1 i\you-want-to-insert" file.txt

### append after match
sed -i "/pattern/ a\you-want-to-append" file.txt

### append last line
sed -i "$ a\you-want-to-append" file.txt
### print lines containing the word 'hello'
sed -n '/hello/p' input.txt
grep 'hello' input.txt

### replaces the words 'gray' or 'grey' with 'blue'
sed  's/gr[ae]y/blue/'
### insert file content after match
sed "/pattern/r input.txt" file.txt
sed -i "/pattern/r input.txt" file.txt

### replace pattern with other file content
sed -e "/pattern/ {" -e "r input.txt" -e "d" -e "}" -i file.txt
### (NEED TO NEW LINE !!!)
sed -e "/pattern/ {r input.txt
                        d}" -i file.txt
### delete line containing word
sed -i "/pattern/d" input.txt

### delete specific line
sed -i "10d" input.txt

### other examples:

sed -n '/production/p' config.xml
# <production-mode-enabled>true</production-mode-enabled>

sed -n '/<server>/,/<\/server>/p' config.xml
# <server>
#   <name>AdminServer</name>
#   <listen-address>192.168.137.160</listen-address>
#   <staging-mode>nostage</staging-mode>
#   <weblogic-plugin-enabled>true</weblogic-plugin-enabled>
# </server>
# <server>
#   <name>ManagedServer1</name>
#   <listen-port>7003</listen-port>
#   <cluster>BaseCluster</cluster>
#   <listen-address>192.168.137.160</listen-address>
#   <jta-migratable-target>
#     <name>ManagedServer1</name>
#     <user-preferred-server>ManagedServer1</user-preferred-server>
#     <cluster>BaseCluster</cluster>
#     <migration-policy>manual</migration-policy>
#   </jta-migratable-target>
#   <staging-mode>nostage</staging-mode>
#   <weblogic-plugin-enabled>true</weblogic-plugin-enabled>
# </server>
# <server>
#   <name>ManagedServer2</name>
#   <listen-port>7004</listen-port>
#   <cluster>BaseCluster</cluster>
#   <listen-address>192.168.137.160</listen-address>
#   <jta-migratable-target>
#     <name>ManagedServer2</name>
#     <user-preferred-server>ManagedServer2</user-preferred-server>
#     <cluster>BaseCluster</cluster>
#     <migration-policy>manual</migration-policy>
#   </jta-migratable-target>
#   <staging-mode>nostage</staging-mode>
#   <weblogic-plugin-enabled>true</weblogic-plugin-enabled>
# </server>
