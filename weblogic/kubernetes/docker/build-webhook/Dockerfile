FROM oracle/serverjre:8-oraclelinux8

RUN yum install -y python2 && \
    yum clean all && \
    alternatives --set python /usr/bin/python2

COPY apps/webhook /bin/webhook
COPY webhooks/hooks.json /etc/webhook/
COPY scripts/scaleUpAction.sh /var/scripts/
COPY scripts/scaleDownAction.sh /var/scripts/
COPY scripts/scalingAction.sh /var/scripts/

CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-hotreload"]

ENTRYPOINT ["/bin/webhook"]
