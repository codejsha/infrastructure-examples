#!/bin/bash

GATEWAY="10.0.0.1"
ADDRESSES="${1}"
DNS="10.0.1.80,168.126.63.1,164.124.101.2"
HOSTNAME="${2}"

hostnamectl set-hostname ${HOSTNAME}

nmcli connection modify eth0 ipv4.method manual
nmcli connection modify eth0 ipv4.gateway ${GATEWAY}
nmcli connection modify eth0 ipv4.addresses ${ADDRESSES}
nmcli connection modify eth0 ipv4.dns ${DNS}
nmcli connection modify eth0 ipv6.ip6-privacy 0

systemctl restart NetworkManager
