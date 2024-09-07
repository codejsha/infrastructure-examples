######################################################################

### firewalld

systemctl status firewalld

systemctl enable firewalld
systemctl disable firewalld

systemctl start firewalld
systemctl stop firewalld

######################################################################

### add/remove zone

firewall-cmd --get-default-zone
# public
firewall-cmd --get-active-zone
# public
#   interfaces: eth0
firewall-cmd --get-zones
# block dmz drop external home internal public trusted work

firewall-cmd --list-all-zones
# ...
# public (active)
#   target: default
#   icmp-block-inversion: no
#   interfaces: eth0
#   sources:
#   services: cockpit dhcpv6-client ssh
#   ports:
#   protocols:
#   masquerade: no
#   forward-ports:
#   source-ports:
#   icmp-blocks:
#   rich rules:
# ...

firewall-cmd --info-zone=public
firewall-cmd --permanent --list-all --zone=public

firewall-cmd --permanent --new-zone=webserver
firewall-cmd --reload

firewall-cmd --permanent --delete-zone=webserver
firewall-cmd --reload

######################################################################

### add/remove ports

firewall-cmd --permanent --zone=public --add-port=7001/tcp
firewall-cmd --permanent --zone=public --add-port=7000-7999/tcp
firewall-cmd --reload

firewall-cmd --permanent --zone=public --remove-port=7001/tcp
firewall-cmd --permanent --zone=public --remove-port=7000-7999/tcp
firewall-cmd --reload

######################################################################

### add/remove service

firewall-cmd --permanent --zone=public --add-service=cockpit.socket
firewall-cmd --reload

firewall-cmd --permanent --zone=public --remove-service=cockpit.socket
firewall-cmd --reload

firewall-cmd --list-services
# cockpit dhcpv6-client ssh

firewall-cmd --info-service=cockpit
# cockpit
#   ports: 9090/tcp
#   protocols:
#   source-ports:
#   modules:
#   destination:

######################################################################

### interface

firewall-cmd --list-interfaces
# eth0
