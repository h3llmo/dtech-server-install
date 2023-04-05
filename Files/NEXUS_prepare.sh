echo '### Prepare Nexus volume'
mkdir -p /media/storage/nexus-data
chown -R 200 /media/storage/nexus-data
chmod 7777 /media/storage/nexus-data

cp /media/dtech/Files/NEXUS_nexus.service /etc/systemd/system/nexus.service

sudo systemctl daemon-reload
sudo systemctl enable nexus.service
sudo systemctl start nexus.service