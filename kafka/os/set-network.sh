#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

sudo sysctl -w net.core.rmem_default=131072
sudo sysctl -w net.core.wmem_default=131072
sudo sysctl -w net.core.rmem_max=2097152
sudo sysctl -w net.core.wmem_max=2097152
echo "net.core.rmem_default=131072" | sudo tee -a /etc/sysctl.conf
echo "net.core.wmem_default=131072" | sudo tee -a /etc/sysctl.conf
echo "net.core.rmem_max=2097152" | sudo tee -a /etc/sysctl.conf
echo "net.core.wmem_max=2097152" | sudo tee -a /etc/sysctl.conf

sudo sysctl -w net.ipv4.tcp_rmem="4096 65536 2048000"
sudo sysctl -w net.ipv4.tcp_wmem="4096 65536 2048000"
echo "net.ipv4.tcp_rmem=4096 65536 2048000" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_wmem=4096 65536 2048000" | sudo tee -a /etc/sysctl.conf

sudo sysctl -w net.ipv4.tcp_window_scaling=1
sudo sysctl -w net.ipv4.tcp_max_syn_backlog=1024
sudo sysctl -w net.core.netdev_max_backlog=1000
echo "net.ipv4.tcp_window_scaling=1" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_max_syn_backlog=1024" | sudo tee -a /etc/sysctl.conf
echo "net.core.netdev_max_backlog=1000" | sudo tee -a /etc/sysctl.conf

######################################################################

# sudo sysctl -w net.core.rmem_default=212992
# sudo sysctl -w net.core.wmem_default=212992
# sudo sysctl -w net.core.rmem_max=2097152
# sudo sysctl -w net.core.wmem_max=2097152
# sudo sysctl -w net.ipv4.tcp_rmem="8192 87380 33554432"
# sudo sysctl -w net.ipv4.tcp_wmem="8192 87380 33554432"

# echo "net.core.rmem_default=212992" | sudo tee -a /etc/sysctl.conf
# echo "net.core.wmem_default=212992" | sudo tee -a /etc/sysctl.conf
# echo "net.core.rmem_max=2097152" | sudo tee -a /etc/sysctl.conf
# echo "net.core.wmem_max=2097152" | sudo tee -a /etc/sysctl.conf
# echo "net.ipv4.tcp_rmem=8192 87380 33554432" | sudo tee -a /etc/sysctl.conf
# echo "net.ipv4.tcp_wmem=8192 87380 33554432" | sudo tee -a /etc/sysctl.conf

# sudo sysctl -w net.ipv4.tcp_window_scaling=1
# sudo sysctl -w net.ipv4.tcp_max_syn_backlog=256
# sudo sysctl -w net.core.netdev_max_backlog=1000
# echo "net.ipv4.tcp_window_scaling=1" | sudo tee -a /etc/sysctl.conf
# echo "net.ipv4.tcp_max_syn_backlog=256" | sudo tee -a /etc/sysctl.conf
# echo "net.core.netdev_max_backlog=1000" | sudo tee -a /etc/sysctl.conf
