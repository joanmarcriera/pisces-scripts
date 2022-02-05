#!/bin/bash

REPO=/root/pisces-scripts/troubleshooting/
if [ -d $REPO ];
then
  cd /root/pisces-scripts/troubleshooting/
  git pull
else
  cd /root
  git clone https://github.com/joanmarcriera/pisces-scripts.git
fi


CRONTAB=/var/spool/cron/crontabs/root
LINE='0 0 * * * /root/pisces-scripts/troubleshooting/fs_check.sh' 
if [ -f $CRONTAB ];
then
  if [ ! -z $(grep "$LINE" "$CRONTAB") ]; then echo "FOUND" ; exit 1; fi
  echo $LINE >> /var/spool/cron/crontabs/root
  systemctl restart cron.service
else
  echo $LINE >> crontab_new
  crontab -u root crontab_new
  rm crontab_new
  systemctl restart cron.service
fi
