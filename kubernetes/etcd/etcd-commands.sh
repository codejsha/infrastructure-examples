######################################################################

### health check

etcdctl endpoint health

export ETCDCTL_API=3
sudo /usr/local/bin/etcdctl \
    --endpoints=https://controlplane1:2379,https://controlplane2:2379,https://controlplane3:2379 \
    --cacert=/etc/ssl/etcd/ssl/ca.pem \
    --cert=/etc/ssl/etcd/ssl/member-controlplane1.pem \
    --key=/etc/ssl/etcd/ssl/member-controlplane1-key.pem \
    endpoint health

######################################################################

### key

etcdctl get / --prefix --keys-only

export ETCDCTL_API=3
sudo /usr/local/bin/etcdctl \
    --endpoints=https://controlplane1:2379,https://controlplane2:2379,https://controlplane3:2379 \
    --cacert=/etc/ssl/etcd/ssl/ca.pem \
    --cert=/etc/ssl/etcd/ssl/member-controlplane1.pem \
    --key=/etc/ssl/etcd/ssl/member-controlplane1-key.pem \
    get / --prefix --keys-only \
    | grep ${KEYWORD}

export ETCDCTL_API=3
sudo /usr/local/bin/etcdctl \
    --endpoints=https://controlplane1:2379,https://controlplane2:2379,https://controlplane3:2379 \
    --cacert=/etc/ssl/etcd/ssl/ca.pem \
    --cert=/etc/ssl/etcd/ssl/member-controlplane1.pem \
    --key=/etc/ssl/etcd/ssl/member-controlplane1-key.pem \
    del ${KEY}

######################################################################

### snapshot

etcdctl snapshot status ${FILENAME}

DATETIME="$(date +'%Y%m%d-%H%M%S')"
FILENAME="etcd-snapshot-${DATETIME}"
export ETCDCTL_API=3
sudo /usr/local/bin/etcdctl \
    --endpoints=https://controlplane1:2379 \
    --cacert=/etc/ssl/etcd/ssl/ca.pem \
    --cert=/etc/ssl/etcd/ssl/member-controlplane1.pem \
    --key=/etc/ssl/etcd/ssl/member-controlplane1-key.pem \
    snapshot save ${FILENAME}

export ETCDCTL_API=3
sudo /usr/local/bin/etcdctl \
    --endpoints=https://controlplane1:2379,https://controlplane2:2379,https://controlplane3:2379 \
    --cacert=/etc/ssl/etcd/ssl/ca.pem \
    --cert=/etc/ssl/etcd/ssl/member-controlplane1.pem \
    --key=/etc/ssl/etcd/ssl/member-controlplane1-key.pem \
    snapshot status ${FILENAME}

export ETCDCTL_API=3
sudo /usr/local/bin/etcdctl \
    --endpoints=https://controlplane1:2379,https://controlplane2:2379,https://controlplane3:2379 \
    --cacert=/etc/ssl/etcd/ssl/ca.pem \
    --cert=/etc/ssl/etcd/ssl/member-controlplane1.pem \
    --key=/etc/ssl/etcd/ssl/member-controlplane1-key.pem \
    snapshot restore ${FILENAME}
