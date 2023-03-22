#snap install microk8s --classic
#microk8s enable metrics-server
#microk8s enable dashboard
#usermod -a -G microk8s vagrant
MY_DOMAIN=$1 envsubst < /media/dtech/Files/ContainerdToml/hosts.toml >> /var/snap/microk8s/current/args/certs.d/$1:1100/
#microk8s stop
#microk8s start