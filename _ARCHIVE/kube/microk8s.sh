microk8s kubectl describe secret -n kube-system microk8s-dashboard-token
microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443 --address='0.0.0.0' &




#	ALLOW PULL FROM PRIVATE REG
	
sudo nano /etc/hosts # ADD 127.0.0.1 damosoft.internal.com	
sudo mkdir /var/snap/microk8s/current/args/certs.d/damosoft.internal.com:1100/
sudo nano /var/snap/microk8s/current/args/certs.d/damosoft.internal.com:1100/hosts.toml

# /var/snap/microk8s/current/args/certs.d/damosoft.internal.com:1100/hosts.toml
server = "http://damosoft.internal.com:1100"

[host."http://damosoft.internal.com:1100"]
capabilities = ["pull", "resolve"]
microk8s stop
microk8s start


#VBoxManage modifyvm "Applications" --natpf1 "market,tcp,,8085,10.152.183.207,80"
VBoxManage controlvm "Applications" natpf1 "market,tcp,,8085,10.152.183.207,80"

# -------------------- OTHER COMMANDS TESTED

microk8s kubectl get nodes -o wide

h3llmo@applications:~$ sudo mkdir /etc/containerd/
h3llmo@applications:~$ sudo nano /etc/containerd/config.toml

[plugins."io.containerd.grpc.v1.cri".registry]
  [plugins."io.containerd.grpc.v1.cri".registry.mirrors]
    [plugins."io.containerd.grpc.v1.cri".registry.mirrors."damosoft.internal.com:1100"]
      endpoint = ["http://damosoft.internal.com:1100"]


h3llmo@applications:~$ sudo systemctl restart containerd

# ---




microk8s kubectl create secret docker-registry my-secret \
    --docker-server=damosoft.internal.com:1100 \
    --docker-username=admin \
    --docker-password=Adminpas200! \
    --docker-email=h3llmo@gmail.com
	
	