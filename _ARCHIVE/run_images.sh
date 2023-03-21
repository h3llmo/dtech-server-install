docker run -p 8081:8081 -p 1100:1100 -p 1101:1101 -v /home/h3llmo/nexus-data/:/nexus-data sonatype/nexus3 &

docker network create jenkins
  
  
  
cd /media/dtech/docker/jenkins_
docker build -t myjenkins-blueocean:2.387.1-1 .
sudo mkdir /home/jenkins_home
sudo chown -R 200 /home/jenkins_home
sudo chmod 7777 /home/jenkins_home
cp /media/dtech/maven-settings/settings.xml /home/jenkins_home/

docker run \
  --restart=on-failure \
  --detach \
  --network jenkins \
  --publish 8080:8080 \
  --publish 50000:50000 \
  -v /home/jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  myjenkins-blueocean:2.387.1-1 
