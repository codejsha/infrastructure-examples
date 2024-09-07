######################################################################

journalctl

# timestamp
journalctl --utc

# current boot
journalctl -b

journalctl --since "2015-01-10 17:15:00"
journalctl --since "2015-01-10" --until "2015-01-11 03:00"
journalctl --since yesterday
journalctl --since 09:00 --until "1 hour ago"
journalctl -u nginx.service --since today

journalctl --no-pager
journalctl --no-full

journalctl -f
journalctl -f -u confluent-server.service
