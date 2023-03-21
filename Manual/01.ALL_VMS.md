# How to SET-UP a new VM

## Install VBoxAdditions

### Install build essentials

```sh
sudo apt update
sudo apt install build-essential dkms linux-headers-$(uname -r)
```


### Mount and install VBoxAdditions
```sh
# <<< insert iso >>
# Create mounting point then mount
sudo mkdir /media/cdrom
sudo mount /dev/cdrom /media/cdrom

# Execute installer
cd /media/cdrom
sudo .VBoxLinux... -->

# Add current user to vboxsf group to allow full access on shared folder
sudo usermod -a -G vboxsf $USER

# Restart
sudo shutdown -r now
```

### Edit hosts
```sh
# Add host machine IP as global reference for each VM.
echo '10.0.2.3 damosoft.internal.com' | sudo tee -a /etc/hosts
```

# Cheat-sheet

```
# Add nat port-forward rule
VBoxManage controlvm "Applications" natpf1 "market,tcp,,8085,10.152.183.207,80"
``` 