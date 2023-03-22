echo '### Prepare stateful jenkins volumes'
mkdir /media/storage/jenkins_home
chown -R 200 /media/storage/jenkins_home
chmod 7777 /media/storage/jenkins_home

echo '### copy files settings.xml and Dockerfile'
MY_DOMAIN=$1, NEXUS_PASSWORD=$2 envsubst < /media/dtech/Files/MavenSettings/template.xml >> /home/vagrant/settings.xml
