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
LINE="fs_check.sh"
if [ -f $CRONTAB ];
then
  if grep $LINE "$CRONTAB"; then echo "Already in crontab" ; exit 0; fi
  echo "0 0 * * * /root/pisces-scripts/troubleshooting/fs_check.sh" >> /var/spool/cron/crontabs/root
  systemctl restart cron.service
else
  echo "0 0 * * * /root/pisces-scripts/troubleshooting/fs_check.sh" >> crontab_new
  crontab -u root crontab_new
  rm crontab_new
  systemctl restart cron.service
fi
