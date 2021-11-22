#!/usr/bin/env bash
# Script to create the basic shell users.
set -x  # Un/Comment to enable/disable debug.

##############################
# source ../lib/bash_functions.sh # Makes no sense to load libraries in this script because it is going to be called using wget . 
## Necessary functions
function die () {
    last_exit_status=$?
    IFS=' '
    local message=$1
    [ -z "$message" ] && message="FATAL ERROR: $* (status $last_exit_status)" 
    logThis "$message (at ${BASH_SOURCE[1]}:${FUNCNAME[1]} line ${BASH_LINENO[0]}.)" >&2
    exit 1
}

declare -A levels=([DEBUG]=0 [INFO]=1 [WARN]=2 [ERROR]=3)
cript_logging_level="DEBUG" 

logThis() {
    local log_message=${1:-"Empty message"}
    local log_priority=${2:-"INFO"}

    #check if level exists
    [[ ${levels[$log_priority]} ]] || return 1

    #check if level is enough
    (( ${levels[$log_priority]} < ${levels[$script_logging_level]} )) && return 2

    #log here
    echo "${log_priority} : ${log_message}"
}



## End of necessary functions
##############################


USER=admin
GROUP=admin
PASSWORD=admin


if [ $(getent passwd ${USER})  ]  ; then 
    die  "User ${USER} already exists."
else
    echo "User ${USER} not found." >&2  # error messages should go to stderr
fi

die "I don't want to test yet."


adduser --disabled-password --gecos "User to login into the box" ${USER}
echo ${USER}:${PASSWORD} | chpasswd
usermod ${USER} -g sudo


