#! /bin/bash -ex

HOSTNAME=$(hostname)
CURRIP_FILE=/tmp/currip
touch $CURRIP_FILE
OLDIP=$(cat $CURRIP_FILE)
CURRENTIP=$(hostname -I | awk '{print $1}')
DDNS=10.227.48.35:8080
DDNS_SECRET=felouka321!

while :
do
        if [ "$OLDIP" != "$CURRENTIP" ];
        then
                curl "http://${DDNS}/update?secret=${DDNS_SECRET}&domain=${HOSTNAME}&addr=${CURRENTIP}"
                echo "$CURRENTIP" > $CURRIP_FILE
        fi
        sleep 10
        CURRENTIP=$(hostname -I | awk '{print $1}')
        touch $CURRIP_FILE
        OLDIP=$(cat $CURRIP_FILE)
done
