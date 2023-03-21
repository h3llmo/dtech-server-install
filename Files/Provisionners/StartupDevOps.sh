docker run \
  --restart=on-failure \
  --detach \
  -p 1100:1100 \
  -p 8081:8081 \
  -v ~/nexus-data/:/nexus-data
  sonatype/nexus3 

docker run \
  --restart=on-failure \
  --detach \
  --network jenkins \
  --publish 8080:8080 \
  --publish 50000:50000 \
  -v /home/jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  myjenkins-blueocean:2.387.1-1 