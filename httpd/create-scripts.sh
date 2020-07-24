#!/usr/bin/bash

### links package: sudo yum install -y links

SERVER_ROOT="/usr/local/httpd"

cat > ${SERVER_ROOT}/start-httpd.sh <<EOF
#!/usr/bin/bash

SERVER_ROOT="${SERVER_ROOT}"

\${SERVER_ROOT}/bin/apachectl -k start
EOF

cat > ${SERVER_ROOT}/restart-httpd.sh <<EOF
#!/usr/bin/bash

SERVER_ROOT="${SERVER_ROOT}"

\${SERVER_ROOT}/bin/apachectl -k restart
EOF

cat > ${SERVER_ROOT}/stop-httpd.sh <<EOF
#!/usr/bin/bash

SERVER_ROOT="${SERVER_ROOT}"

\${SERVER_ROOT}/bin/apachectl -k stop
EOF

cat > ${SERVER_ROOT}/check-config.sh <<EOF
#!/usr/bin/bash

SERVER_ROOT="${SERVER_ROOT}"

\${SERVER_ROOT}/bin/apachectl -t
EOF

cat > ${SERVER_ROOT}/get-version.sh <<EOF
#!/usr/bin/bash

SERVER_ROOT="${SERVER_ROOT}"

\${SERVER_ROOT}/bin/apachectl -v
EOF

cat > ${SERVER_ROOT}/get-compile-settings.sh <<EOF
#!/usr/bin/bash

SERVER_ROOT="${SERVER_ROOT}"

\${SERVER_ROOT}/bin/apachectl -V
EOF

cat > ${SERVER_ROOT}/get-dump-vhosts.sh <<EOF
#!/usr/bin/bash

SERVER_ROOT="${SERVER_ROOT}"

\${SERVER_ROOT}/bin/apachectl -t -D DUMP_VHOSTS
EOF

cat > ${SERVER_ROOT}/get-dump-run-cfg.sh <<EOF
#!/usr/bin/bash

SERVER_ROOT="${SERVER_ROOT}"

\${SERVER_ROOT}/bin/apachectl -D DUMP_RUN_CFG
EOF

cat > ${SERVER_ROOT}/get-dump-settings.sh <<EOF
#!/usr/bin/bash

SERVER_ROOT="${SERVER_ROOT}"

\${SERVER_ROOT}/bin/apachectl -S
# \${SERVER_ROOT}/bin/apachectl -t -D DUMP_VHOSTS -D DUMP_RUN_CFG
EOF

cat > ${SERVER_ROOT}/get-dump-modules.sh <<EOF
#!/usr/bin/bash

SERVER_ROOT="${SERVER_ROOT}"

\${SERVER_ROOT}/bin/apachectl -M
# \${SERVER_ROOT}/bin/apachectl -t -D DUMP_MODULES
EOF

cat > ${SERVER_ROOT}/get-dump-includes.sh <<EOF
#!/usr/bin/bash

SERVER_ROOT="${SERVER_ROOT}"

\${SERVER_ROOT}/bin/apachectl -t -D DUMP_INCLUDES
EOF

cat > ${SERVER_ROOT}/get-links-dump.sh <<EOF
#!/usr/bin/bash

PORT="80"

links -dump http://127.0.0.1:\${PORT}/server-status
EOF

chmod 750 ${SERVER_ROOT}/start-httpd.sh
chmod 750 ${SERVER_ROOT}/restart-httpd.sh
chmod 750 ${SERVER_ROOT}/stop-httpd.sh
chmod 750 ${SERVER_ROOT}/check-config.sh
chmod 750 ${SERVER_ROOT}/get-version.sh
chmod 750 ${SERVER_ROOT}/get-compile-settings.sh
chmod 750 ${SERVER_ROOT}/get-dump-vhosts.sh
chmod 750 ${SERVER_ROOT}/get-dump-run-cfg.sh
chmod 750 ${SERVER_ROOT}/get-dump-settings.sh
chmod 750 ${SERVER_ROOT}/get-dump-modules.sh
chmod 750 ${SERVER_ROOT}/get-dump-includes.sh
chmod 750 ${SERVER_ROOT}/get-links-dump.sh
