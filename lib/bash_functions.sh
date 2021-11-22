#!/usr/bin/env bash
# Preceding bash functions.
set -x 
. ../lib/bash_logging.sh

# List of bash functions to load before running scripts.

function die () {
    last_exit_status=$?
    IFS=' '
    local message=$1
    [ -z "$message" ] && message="FATAL ERROR: $* (status $last_exit_status)" 
    logThis "$message (at ${BASH_SOURCE[1]}:${FUNCNAME[1]} line ${BASH_LINENO[0]}.)" >&2
    exit 1
}

function user_exists(){ 
    # silent, it just sets the exit code
    #id "$1" &>/dev/null 
    getent passwd $1 &>/dev/null && return true || return false
    
} 


