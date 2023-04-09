sudo mkdir  -p /media/storage/jenkins_home
sudo chown -R 200 /media/storage/jenkins_home
sudo chmod 7777 /media/storage/jenkins_home
sudo MY_DOMAIN=$1, NEXUS_PASSWORD=$2, NEXUS_PORT=$3 envsubst < /media/dtech/Files/COMMON_settings.xml >> /home/vagrant/settings.xml

cp /media/dtech/Files/JENKINS_jenkins.service /etc/systemd/system/jenkins.service
sudo systemctl daemon-reload
sudo systemctl enable jenkins.service
# sudo systemctl start jenkins.service

sudo cp /media/dtech/Files/JENKINS_Dockerfile ~/Dockerfile
sudo docker build -t myjenkins-blueocean:2.387.1-1 -f ~/Dockerfile . 
sudo docker network create jenkins
