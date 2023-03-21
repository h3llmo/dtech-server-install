# HOST-MACHINE GUIDE
## Description
This document explains what has to be done on the host-machine in order to allow VMs to properly handle their environment.


## VAGRANT INSTALL
```shell
sudo apt install ruby-libvirt qemu libvirt-daemon-system libvirt-clients ebtables dnsmasq-base libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev libguestfs-tools

sudo apt install vagrant
sudo vagrant plugin install vagrant-libvirt
sudo vagrant plugin install vagrant-disksize
sudo vagrant plugin install vagrant-vbguest
```
