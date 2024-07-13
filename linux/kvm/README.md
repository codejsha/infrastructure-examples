# KVM

## Install KVM

```bash
sudo dnf module install -y virt
sudo dnf install -y virt-install virt-viewer libguestfs-tools

virt-host-validate

sudo systemctl start libvirtd.service
sudo systemctl enable libvirtd.service
```
