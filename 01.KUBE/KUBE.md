# How to SET-UP a Microk8s Worker/Master

### Add user to group

```sh
sudo usermod -a -G microk8s $USER
# Relog to update the user groups
exit
```

### Enable services
```sh
microk8s enable metrics-server
microk8s enable dashboard
```

### Add insercure registry

1. Create **toml** file and start edition
```sh
sudo nano /etc/hosts # ADD 127.0.0.1 damosoft.internal.com	
sudo mkdir /var/snap/microk8s/current/args/certs.d/damosoft.internal.com:1100/
sudo nano /var/snap/microk8s/current/args/certs.d/damosoft.internal.com:1100/hosts.toml
```

2. Copy/Paste this in editor:
```
# /var/snap/microk8s/current/args/certs.d/damosoft.internal.com:1100/hosts.toml
server = "http://damosoft.internal.com:1100"

[host."http://damosoft.internal.com:1100"]
capabilities = ["pull", "resolve"]
```

3. Restart microk8s
```sh
microk8s stop
microk8s start
```




# Cheat-sheet
```sh
# Gives a status on all the services (use after restart before any actions)
microk8s kubectl get pods -n kube-system

# Start the dashboard on port 10443 (don't forget port-forward on host machine)
microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443 --address='0.0.0.0' &

# Retrive a token to connect on dashboard
microk8s kubectl describe secret -n kube-system microk8s-dashboard-token

```
