snap install microk8s --classic
microk8s enable metrics-server
microk8s enable dashboard
usermod -a -G microk8s vagrant
cp /media/dtech/01.KUBE/FILES/hosts.toml /var/snap/microk8s/current/args/certs.d/damosoft.internal.com:1100/
microk8s stop
microk8s start