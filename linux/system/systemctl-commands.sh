######################################################################

### daemon reload
sudo systemctl daemon-reload

### enable/disable
sudo systemctl enable
sudo systemctl disable
sudo systemctl is-enabled httpd.service

### reset-failed
sudo systemctl reset-failed httpd.service

######################################################################

### start/restart/stop

sudo systemctl start httpd.service
sudo systemctl restart httpd.service
sudo systemctl stop httpd.service

######################################################################

### status

sudo systemctl status httpd.service
sudo systemctl status --no-pager --full httpd.service

sudo systemctl is-active httpd.service

sudo systemctl list-units --type=service --state=failed
sudo systemctl list-units --type=service --state=running

######################################################################

### edit
sudo systemctl edit httpd.service
