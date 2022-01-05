#!/bin/bash

echo "======"
docker exec miner miner info summary
echo "Checks start"
echo "======"
echo "Hostname = > $(hostname)"
echo "Uptime   = > $(uptime)"
echo "Docker ps => $(docker ps)"
echo "Public IP => $(curl ifconfig.me)"



echo "====="
echo "Checks end"

