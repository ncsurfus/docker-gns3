#!/bin/sh
/linux_amd64_goioulic | sed -n '2,3p' > /data/.iourc
./dockerd &
exec gns3server -A --config /config.ini
