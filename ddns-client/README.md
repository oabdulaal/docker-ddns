# DDNS Client using Rest API

This script updates the docker DynamicDNS with its DNS record. Request is sent to the DynamicDNS on IP change, check is made every 120 seconds.

The prefix for the host machine is its hostname, for example:

felouka0.FQDN.com

## DDNS Client Script Service

1. Copy `ddns-client.sh` to `/opt/ddns-client.sh`
2. Copy `ddns-client.service` to `/etc/systemd/system/ddns-client.service`
3. sudo chmod 644 /etc/systemd/system/ddns-client.service
4. sudo systemctl daemon-reload
5. sudo service ddns-service start
