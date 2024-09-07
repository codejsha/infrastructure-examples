######################################################################

### nmcli (Network Manager Command Line Interface)

systemctl status NetworkManager
systemctl restart NetworkManager

######################################################################

nmcli con
# NAME                UUID                                  TYPE      DEVICE
# docker0             fd652000-f72b-4dd2-81eb-12f0c5c620a5  bridge    docker0
# eth0                b12318e9-a094-4054-8260-c6c507f457a0  ethernet  eth0
# Wired connection 1  586b6fb2-771b-3da2-af24-2d70d8962846  ethernet  --

nmcli dev status
# DEVICE   TYPE      STATE         CONNECTION
# eth0     ethernet  connected     eth0
# docker0  bridge    connected     docker0
# eth1     ethernet  disconnected  --
# lo       loopback  unmanaged     --

nmcli con delete "Wired connection 1"
nmcli con add type ethernet con-name eth1 ifname eth1

nmcli con mod eth1 ipv4.addresses 192.168.140.150/24
nmcli con mod eth1 ipv4.gateway 192.168.140.1
nmcli con mod eth1 ipv4.dns "192.168.140.10,8.8.8.8,168.126.63.1"
nmcli con mod eth1 ipv4.method manual
nmcli con mod eth1 ipv6.ip6-privacy 0

nmcli
