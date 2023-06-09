echo '### Prepare stateful jenkins volumes'
sudo mkdir  -p /media/storage/jenkins_home
sudo chown -R 200 /media/storage/jenkins_home
sudo chmod 7777 /media/storage/jenkins_home
echo '### copy files settings.xml and Dockerfile'
sudo MY_DOMAIN=$1, NEXUS_PASSWORD=$2 envsubst < /media/dtech/Files/MavenSettings/template.xml >> /home/vagrant/settings.xml

cp /media/dtech/Files/Jenkins/services/jenkins.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable jenkins.service
# sudo systemctl start jenkins.service

sudo cp /media/dtech/Files/Jenkins/docker/Dockerfile ~
sudo docker build -t myjenkins-blueocean:2.387.1-1 -f ~/Dockerfile . 
sudo docker network create jenkins
