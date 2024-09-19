######################################################################

function curl() { echo "+ curl ${@}">&2; command curl "${@}"; }
function ss() { echo "+ ss ${@}">&2; command ss "${@}"; }
function netstat() { echo "+ netstat ${@}">&2; command netstat "${@}"; }

######################################################################

## ss

sudo ss --all --numeric --tcp --udp --processes
sudo ss --all --listening --numeric --tcp --udp
sudo ss --all --listening --numeric --tcp --udp --processes
sudo ss --all --listening --numeric --tcp --udp --memory

######################################################################

### netstat

sudo netstat --listening --numeric --tcp --udp --programs

######################################################################

### dig

dig vault.example.com
dig argocd.example.com

######################################################################

### curl

curl -v https://vault.example.com/
curl -k -v https://vault.example.com/
curl -k -v https://argocd.example.com/

######################################################################

### httpie

http :8080
http GET :8080

######################################################################

### ifconfig

ifconfig

######################################################################

### iptables

iptables -L

### disable port 80
iptables -A FOWARD -p tcp --dport 80 -j DROP

### disable port 53 (dns)
iptables -A FOWARD -p udp -m udp --dport 53 -j DROP

### disable loopback traffic
iptables -A OUTPUT -o lo -j DROP

######################################################################

### tcpdump

### interface
sudo tcpdump -i eth0
sudo tcpdump --interface eth0

sudo tcpdump -i eth0 src 192.168.137.1 and dst port 8080
sudo tcpdump -i eth0
