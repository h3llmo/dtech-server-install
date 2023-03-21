# How to set-up DevOps machine

## 01.DOCKER
### Install Docker & add user to group
```sh
sudo apt install docker.io
sudo usermod -a -G docker $USER

# Relog to update the user groups
exit
```

### Prepare insecure registry

This is necessary to allow pull/push on a private registry, which is the case
in this context of DevOps machine setup since the container registry 
will be a Nexus-3 private docker registry hub.

```sh
sudo mkdir /etc/docker
cp /media/dtech/02.DEVOPS/FILES/daemon.json /etc/docker
sudo systemctl restart docker
```

## 02.NEXUS (:9093)

### Prepare volume
```sh
sudo mkdir ~/nexus-data/
sudo chown -R 200 ~/nexus-data/
sudo chmod 7777 ~/nexus-data/
```

### Run nexus
```sh
docker run -p 8081:8081 -p 1100:1100 -p 1101:1101 -v ~/nexus-data/:/nexus-data sonatype/nexus3 &
```

## 03.JENKINS (:9092)

### Prepare volume
```sh
cd /media/dtech/docker/jenkins_
sudo mkdir /home/jenkins_home
sudo chown -R 200 /home/jenkins_home
sudo chmod 7777 /home/jenkins_home
cp /media/dtech/02.DEVOPS/FILES/settings.xml /home/jenkins_home/
```
#### Add docker network
```sh
docker network create jenkins
```

### Build image
```sh
cd /media/dtech/02.DEVOPS/FILES/Jenkins
docker build -t myjenkins-blueocean:2.387.1-1 .
```

### Run

```sh
docker run \
  --restart=on-failure \
  --detach \
  --network jenkins \
  --publish 8080:8080 \
  --publish 50000:50000 \
  -v /home/jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  myjenkins-blueocean:2.387.1-1 

```