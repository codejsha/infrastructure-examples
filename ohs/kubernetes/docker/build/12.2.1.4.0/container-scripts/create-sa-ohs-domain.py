#!/usr/bin/python
# Copyright (c) 2016-2019 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
#
# Create OHS Domain and OHS System component
#
# OHS Domain 'ohsDomain' (or anything defined under DOMAIN_NAME) to be created inside the Docker image for OHS
# OHS System Component "ohs1" (Or anything defined under OHS_COMPONENT_NAME)to be created inside the Docker image for OHS
# ==============================================

import os, sys
ohs_http_port   = (os.environ.get("OHS_LISTEN_PORT", "7777"))
ohs_ssl_port   = (os.environ.get("OHS_SSL_PORT", "4443"))
ohs_comp_name   = os.environ.get("OHS_COMPONENT_NAME", "ohs1")
domain_name  = os.environ.get("DOMAIN_NAME", "ohsDomain")
domain_path  = '/u01/oracle/ohssa/user_projects/domains/' + domain_name

# Select OHS standalone template
# ==============================================
setTopologyProfile('Compact')
selectTemplate('Oracle HTTP Server (Standalone)')
loadTemplates()
showTemplates()

# Create OHS System Component by the name ohs1, Configure OHS Listen Port and SSL Port
# ======================================================================
cd('/')
cd('SystemComponent/' + ohs_comp_name)
set('ComponentType','OHS')
cd('/')
cd('OHS/' + ohs_comp_name)
set('ListenAddress','')
set('ListenPort', ohs_http_port)
set('SSLListenPort', ohs_ssl_port)

# Set NodeManager user name and password
# ======================================================================
cd('/')
create('sc', 'SecurityConfiguration')
cd('SecurityConfiguration/sc')
set('NodeManagerUsername', username)
set('NodeManagerPasswordEncrypted', password)
setOption('NodeManagerType','PerDomainNodeManager')
setOption('OverwriteDomain', 'true')

# Write Domain, close template and exit
# ======================================================================
writeDomain(domain_path)
closeTemplate()
exit()
