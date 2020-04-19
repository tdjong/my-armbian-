#!/bin/bash
# Based on https://docs.nextcloudpi.com/en/how-to-get-started-with-ncp-docker/
HDD_MOUNT=/media/hdd
NCDATA=${HDD_MOUNT}/ncdata
if [ ! -d $NCDATA ]; then
	mkdir $NCDATA
fi

# Initial Trusted Domain
IFACE=$( ip r | grep "default via" | awk '{ print $5 }' )
IP=$( ip a | grep "global $IFACE" | grep -oP '\d{1,3}(.\d{1,3}){3}' | head -1 )
echo "Using Trusted domain: $IP"

NAME=nextcloudpi

echo "Stopping and removing previous version"
docker stop $NAME
docker rm $NAME

echo "Starting new container"
docker run -d -p 443:443 -p 80:80 -p 4443:4443 \
  --restart always -v ${NCDATA}:/data \
  --name $NAME ownyourbits/nextcloudpi-armhf "$IP"
