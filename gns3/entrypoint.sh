#!/bin/sh
/linux_amd64_goioulic | sed -n '2,3p' > /data/.iourc
/docker.sh &
exec gns3server -A --config /data/config.ini
