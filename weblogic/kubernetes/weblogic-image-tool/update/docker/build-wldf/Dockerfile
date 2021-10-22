FROM weblogic:14.1.1-update

USER root

RUN yum install -y python2 && \
    yum clean all && \
    alternatives --set python /usr/bin/python2

### create script directory
RUN mkdir -p /u01/oracle/user_projects/domains/sample-domain1/bin/scripts

### scaling action
COPY scalingAction.sh /u01/oracle/user_projects/domains/sample-domain1/bin/scripts/
# COPY scaleUpAction.sh /u01/oracle/user_projects/domains/sample-domain1/bin/scripts/
# COPY scaleDownAction.sh /u01/oracle/user_projects/domains/sample-domain1/bin/scripts/

### kill java processes
COPY killjava.sh /u01/oracle/user_projects/domains/sample-domain1/bin/scripts/

### change ownership and permission
RUN chmod 755 /u01/oracle/user_projects/domains/sample-domain1/bin/scripts/*.sh && \
    chown -R oracle:root /u01/oracle/user_projects/domains/sample-domain1/bin/scripts

USER oracle
