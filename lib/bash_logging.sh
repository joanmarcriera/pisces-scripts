#!/usr/bin/env bash

declare -A levels=([DEBUG]=0 [INFO]=1 [WARN]=2 [ERROR]=3)
#script_logging_level="ERROR"
#script_logging_level="WARN"
script_logging_level="INFO"
#script_logging_level="DEBUG"  # The last uncommented will prevail. 

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

for i in DEBUG INFO WARN ERROR
do
    logThis "Log level will log $i" "$i"
done
