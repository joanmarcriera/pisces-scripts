#!/bin/bash
#ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10

#mem
ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%mem | head

#cpu
ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%cpu | head