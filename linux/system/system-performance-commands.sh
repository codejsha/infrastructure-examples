######################################################################

sar -u ${SECONDS} ${COUNT}
sar -u 1 5

vmstat ${SECONDS} ${COUNT}
vmstat 1 5

iostat -x ${SECONDS} ${COUNT}
iostat -x 1 5

pidstat -u ${SECONDS} ${COUNT}
pidstat -u 1 5

top

######################################################################

### cpu utilization
sar -u
sar -P ALL

### queue length and load average
sar -q

### memory utilization
sar -r
sar -R

### swap space utilization
sar -S

### block device
sar -d

### io and transfer rate
sar -b

### network
sar -n DEV
sar -n EDEV

######################################################################

### vmstat

### event counter
vmstat -s
vmstat --stats
### slabinfo
vmstat -m
vmstat --slabs

### disk
vmstat -d
vmstat --disk
vmstat -D
vmstat --disk-sum
### partition
vmstat -p sda
vmstat --partition sda

######################################################################

pidstat -u 1
pidstat -r 1
pidstat -d 1

######################################################################

ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head

######################################################################

ss -s
ss -lntp

######################################################################

### get free memory

free -t
free --total

### human-readable
free -th
free --total --human

### low high statistics
free -thl
free --total --human --lohi

### repeatly
free -th -s ${SECONDS} -c ${COUNT}
free --total --human --seconds ${SECONDS} --count ${COUNT}
