######################################################################

### process
pgrep -xa node_exporter | grep node_exporter
pkill -9 -ecx node_exporter
