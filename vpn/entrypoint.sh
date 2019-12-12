#!/bin/bash

iptables -t nat -A PREROUTING -d $GNS3_CONTAINER -j DNAT --to-destination $GNS3_VPN
exec /opt/src/run.sh