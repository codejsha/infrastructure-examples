######################################################################

### install hostctl
brew install guumaster/tap/hostctl

hostctl --help

######################################################################

hostctl list
### +---------+--------+-----------------+---------------------+
### | PROFILE | STATUS |       IP        |       DOMAIN        |
### +---------+--------+-----------------+---------------------+
### | default | on     | 127.0.0.1       | localhost           |
### | default | on     | 255.255.255.255 | broadcasthost       |
### | default | on     | ::1             | localhost           |
### +---------+--------+-----------------+---------------------+

hostctl status

######################################################################

sudo hostctl add k8s < k8s.hosts
sudo hostctl replace k8s < k8s.hosts
sudo hostctl remove k8s

sudo hostctl enable work
sudo hostctl disable work
