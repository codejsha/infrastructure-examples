######################################################################

### start
sudo /usr/local/bin/coredns \
    -conf ${COREDNS_HOME}/corefile-server.conf \
    -pidfile ${COREDNS_HOME}/coredns.pid

### start with nohup
sudo nohup /usr/local/bin/coredns \
    -conf ${COREDNS_HOME}/corefile-server.conf \
    -pidfile ${COREDNS_HOME}/coredns.pid \
    > ${COREDNS_HOME}/nohup.coredns.out 2>&1 &
sleep 1
sudo chown $(id -un):$(id -gn) ${COREDNS_HOME}/coredns.pid

######################################################################

### kill
sudo pkill --echo --count --pidfile ${COREDNS_HOME}/coredns.pid
sudo kill -9 $(cat ${COREDNS_HOME}/coredns.pid)
