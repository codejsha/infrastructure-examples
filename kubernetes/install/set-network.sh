#!/usr/bin/bash

nmcli connection add type ethernet con-name eth0 ifname eth0
nmcli connection modify eth0 ipv4.addresses 10.10.10.10/24
nmcli connection modify eth0 ipv4.method manual
nmcli connection modify eth0 ipv6.ip6-privacy 0

nmcli connection add type ethernet con-name eth1 ifname eth1
nmcli connection modify eth1 ipv4.addresses 192.168.140.10/24
nmcli connection modify eth1 ipv4.gateway 192.168.140.1
nmcli connection modify eth1 ipv4.method manual
nmcli connection modify eth1 ipv6.ip6-privacy 0
nmcli connection modify eth1 ipv4.dns "8.8.8.8,168.126.63.1"

nmcli connection modify eth0 ipv4.dns-priority 100
nmcli connection modify eth1 ipv4.dns-priority 110
nmcli connection modify eth0 ipv4.route-metric 100
nmcli connection modify eth1 ipv4.route-metric 110

systemctl restart NetworkManager
