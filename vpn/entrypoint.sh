#!/bin/bash

iptables -t nat -A PREROUTING -d $GNS3_VPN -j DNAT --to-destination $GNS3_CONTAINER
/opt/src/run.sh