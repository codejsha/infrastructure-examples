#!/bin/bash

JEUS_HOME="/usr/local/jeus"

${JEUS_HOME}/bin/jeusadmin -host localhost -port 9736 -u administrator -p jeusadmin -script add_session_cluster.py
