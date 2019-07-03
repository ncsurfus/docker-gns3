#! /bin/bash
/tmp/goioulic
echo Starting
dockerd &
(( timeout = 60 + SECONDS ))
until docker info >/dev/null 2>&1
do
    if (( SECONDS >= timeout )); then
        echo 'Timed out trying to connect to internal docker host.' >&2
        exit 1
    fi
    sleep 1
done
exec gns3server
