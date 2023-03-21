## 01.DOCKER
### Install Docker & add user to group
echo 'Install docker.io'
apt install docker.io htop -y

echo 'Add user to docker group'
usermod -a -G docker vagrant

echo '### Prepare insecure registry'
mkdir /etc/docker
cp /media/dtech/Files/DockerDaemon/daemon.json /etc/docker

## 02.NEXUS (:9093)

echo '### Prepare Nexus volume'
mkdir ~/nexus-data/
chown -R 200 ~/nexus-data/
chmod 7777 ~/nexus-data/

echo '### Pull Nexus image'
docker pull sonatype/nexus3

## 03.JENKINS (:9092)

echo '### Prepare jenkins volumes'
mkdir /home/jenkins_home
chown -R 200 /home/jenkins_home
chmod 7777 /home/jenkins_home

echo '### copy files settings.xml and Dockerfile'
cp /media/dtech/Files/MavenSettings/settings.xml /home/jenkins_home/
cp /media/dtech/Files/JenkinsContainer/Dockerfile /home/jenkins_home/
#### Add docker network

echo '### Create network'
docker network create jenkins

echo '### Build Jenkins image'
docker build -t myjenkins-blueocean:2.387.1-1 -f /home/jenkins_home/Dockerfile /home/jenkins_home/
