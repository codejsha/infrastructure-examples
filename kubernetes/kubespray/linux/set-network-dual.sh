#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

declare -A PRI_NODES=(
    [kubeaccess]="10.10.10.10"
    [controlplane1]="10.10.10.11"
    [controlplane2]="10.10.10.12"
    [controlplane3]="10.10.10.13"
    [node1]="10.10.10.21"
    [node2]="10.10.10.22"
    [node3]="10.10.10.23"
)

for NODE_NAME in "${!PRI_NODES[@]}"
do
    if [ "$(hostname)" == "${NODE_NAME}" ]; then
        nmcli connection delete eth0
        nmcli connection add type ethernet con-name eth0 ifname eth0
        nmcli connection modify eth0 ipv4.addresses ${NODES[NODE_NAME]}/24
        nmcli connection modify eth0 ipv4.method manual
        nmcli connection modify eth0 ipv6.ip6-privacy 0
        break
    fi
done

declare -A INT_NODES=(
    [kubeaccess]="192.168.137.10"
    [controlplane1]="192.168.137.11"
    [controlplane2]="192.168.137.12"
    [controlplane3]="192.168.137.13"
    [node1]="192.168.137.21"
    [node2]="192.168.137.22"
    [node3]="192.168.137.23"
)

for NODE_NAME in "${!INT_NODES[@]}"
do
    if [ "$(hostname)" == "${NODE_NAME}" ]; then
        nmcli connection delete eth1
        nmcli connection add type ethernet con-name eth1 ifname eth1
        nmcli connection modify eth1 ipv4.addresses ${NODES[NODE_NAME]}/24
        nmcli connection modify eth1 ipv4.gateway 192.168.137.1
        nmcli connection modify eth1 ipv4.method manual
        nmcli connection modify eth1 ipv6.ip6-privacy 0
        nmcli connection modify eth1 ipv4.dns "${NODES["kubeaccess"]},8.8.8.8,168.126.63.1"
        break
    fi
done

nmcli connection modify eth0 ipv4.dns-priority 100
nmcli connection modify eth1 ipv4.dns-priority 110
nmcli connection modify eth0 ipv4.route-metric 100
nmcli connection modify eth1 ipv4.route-metric 110

systemctl restart NetworkManager
