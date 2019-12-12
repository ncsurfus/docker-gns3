#!/bin/bash

for (( ; ; ))
do
   echo "Starting Docker"
   dockerd --storage-driver=vfs
   sleep 5
   echo "Restarting Docker"
done
