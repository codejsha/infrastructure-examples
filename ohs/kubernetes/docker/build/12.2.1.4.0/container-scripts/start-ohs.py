# Copyright (c) 2016-2019 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.

import os, sys
java_home = os.environ.get("JAVA_HOME", "/usr/java/default")
ohs_comp_name   = os.environ.get("OHS_COMPONENT_NAME", "ohs1")
domain_name  = os.environ.get("DOMAIN_NAME", "ohsDomain")
domain_path  = '/u01/oracle/ohssa/user_projects/domains/' + domain_name
oracle_home = os.environ.get("ORACLE_HOME", "/u01/oracle/ohssa")

try:
    JAVA_HOME = java_home
    DOMAIN_HOME = domain_path
    ORACLE_HOME = oracle_home
    if DOMAIN_HOME is None:
        sys.exit("Error: Please set the environment variable DOMAIN_HOME")
    if JAVA_HOME is None:
        sys.exit("Error: Please set the environment variable JAVA_HOME")
    if ORACLE_HOME is None:
        sys.exit("Error: Please set the environment variable ORACLE_HOME")
except (KeyError), why:
    sys.exit("Error: Missing Environment Variables " + str(why))

nmConnect(username=username,password=password,domainName=domain_name)
nmServerStatus(serverName=ohs_comp_name,serverType='OHS')
nmStart(serverName=ohs_comp_name,serverType='OHS')
nmServerStatus(serverName=ohs_comp_name,serverType='OHS')

exit()
