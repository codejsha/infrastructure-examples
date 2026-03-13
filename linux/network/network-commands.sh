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

traceroute

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

### enable port 80
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

### disable port 80
iptables -A FOWARD -p tcp --dport 80 -j DROP

### disable port 53 (dns)
iptables -A FOWARD -p udp -m udp --dport 53 -j DROP

### disable loopback traffic
iptables -A OUTPUT -o lo -j DROP

######################################################################

### tcpdump

### interface
tcpdump -i eth0
tcpdump --interface eth0

tcpdump -i eth0 src 192.168.137.1 and dst port 8080
tcpdump -i any src host 192.168.0.6 and \( port 80 or port 443 \)
tcpdump -i eth0

######################################################################

### ssh

ssh -i cert.pem prouser@testmachine

### local port forwarding
ssh -i cert.pem -L 8080:localhost:8080 prouser@testmachine
