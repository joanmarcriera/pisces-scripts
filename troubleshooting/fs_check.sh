#!/bin/bash

ACTUAL=`df -h /|grep -v File|awk '{print $5}'|rev|cut -c2-|rev`
TARGET=80

if [ $((ACTUAL)) -gt $((TARGET)) ]
then
	/root/pisces-scripts/troubleshooting/clear_resync.sh
  echo "Disk was full, now it should be empty"
fi

df -HPT

