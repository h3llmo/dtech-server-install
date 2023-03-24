echo '### Prepare Nexus volume'
mkdir /media/storage/nexus-data
chown -R 200 /media/storage/nexus-data
chmod 7777 /media/storage/nexus-data
# docker run --restart=on-failure --detach -p $2:1100 -p $1:8081 -v /media/storage/nexus-data/:/nexus-data sonatype/nexus3 