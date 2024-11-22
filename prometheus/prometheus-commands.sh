######################################################################

### process
pgrep -xa prometheus | grep prometheus
sudo pkill -9 -ecx prometheus

######################################################################

### promtool

### update alert rules 1.x to 2.x (in 2.0 release)
./promtool update rules alert.rules
