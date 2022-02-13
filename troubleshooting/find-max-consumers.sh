#!/bin/bash
#ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10

#mem
ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%mem | head -n5

#cpu
ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%cpu | head -n5


#find max ioconsumers
#iotop -aoP
#-a    Will show accumulated output
#-o    Will only output 
#-P    Will only show processes instead of threads