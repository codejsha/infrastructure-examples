######################################################################

virsh list
virsh list --all

virsh start testmachine
virsh shutdown testmachine
virsh destroy testmachine
virsh undefine testmachine

######################################################################

virsh nodeinfo
virsh dominfo testmachine
virsh net-info default
