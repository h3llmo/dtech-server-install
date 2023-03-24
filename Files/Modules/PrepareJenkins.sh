echo '### Prepare stateful jenkins volumes'
sudo mkdir /media/storage/jenkins_home
sudo chown -R 200 /media/storage/jenkins_home
sudo chmod 7777 /media/storage/jenkins_home
echo '### copy files settings.xml and Dockerfile'
sudo MY_DOMAIN=$1, NEXUS_PASSWORD=$2 envsubst < /media/dtech/Files/MavenSettings/template.xml >> /home/vagrant/settings.xml
sudo docker network create jenkins && sudo docker build -t myjenkins-blueocean:2.387.1-1 -f /media/dtech/Files/JenkinsContainer/Dockerfile . #&& sudo docker run --restart=on-failure --detach --network jenkins -p $3:8080 -p 50000:50000 -v /media/storage/jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock myjenkins-blueocean:2.387.1-1