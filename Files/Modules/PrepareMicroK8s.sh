sudo snap install microk8s --classic
sudo microk8s enable metrics-server
sudo microk8s enable dashboard
sudo usermod -a -G microk8s vagrant
sudo mkdir /var/snap/microk8s/current/args/certs.d/$1:$2
MY_DOMAIN=$1 envsubst < /media/dtech/Files/ContainerdToml/hosts.toml >> /var/snap/microk8s/current/args/certs.d/$1:$2/hosts.toml
sudo microk8s stop
sudo microk8s start