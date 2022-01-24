#!/bin/bash

LOGFILE="/var/log/public.ip.log"

echo -n "$(date +%F%T) " >> $LOGFILE
curl -s ifconfig.me >> $LOGFILE
echo >> $LOGFILE

