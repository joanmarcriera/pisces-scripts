#!/usr/bin/env bash
# Script to create the basic shell users.

source ../lib/bash_functions.sh

USER=admin
GROUP=admin
PASSWORD=admin
set -x 

if [ $(getent passwd ${USER})  ]  ; then 
    die  "User ${USER} already exists."
else
    echo "User ${USER} not found." >&2  # error messages should go to stderr
fi

die "I don't want to test yet."


adduser --disabled-password --gecos "User to login into the box" ${USER}
echo ${USER}:${PASSWORD} | chpasswd
usermod ${USER} -g sudo


