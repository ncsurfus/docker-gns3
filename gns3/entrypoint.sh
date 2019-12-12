#!/bin/sh
/linux_amd64_goioulic | sed -n '2,3p' > /data/.iourc
/docker.sh &

# workaround until I fix this
rm -rf /data/config.ini
cp /config.ini /data/config.ini

exec gns3server -A --config /data/config.ini
