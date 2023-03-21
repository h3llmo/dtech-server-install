sudo apt update

sudo apt install build-essential dkms linux-headers-$(uname -r)

sudo mkdir /media/cdrom

sudo mount /dev/cdrom /media/cdrom

sudo usermod -a -G vboxsf $USER