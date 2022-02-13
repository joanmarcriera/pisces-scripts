#!/bin/bash

#delete old logs
find /var/log -type f -name "*.gz" -exec rm -rf {} \;

#claim apt cache back
apt-get clean
