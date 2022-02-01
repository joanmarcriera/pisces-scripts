#!/bin/bash

LOGFILE="/var/log/public.ip.log"

echo -n "$(date +%F_%T) " >> $LOGFILE
curl -s ifconfig.me >> $LOGFILE
echo >> $LOGFILE

