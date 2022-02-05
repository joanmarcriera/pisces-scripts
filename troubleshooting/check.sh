#!/bin/bash

echo "==== Is the disk full?==="
df -HPT
echo "===Has the IP changed==="
cat /var/log/public.ip.log

echo "======CHECKS START======"
echo "Hostname = > $(hostname)"
echo "Uptime   = > $(uptime)"
echo "Docker ps => $(docker ps)"
echo "Public IP => $(curl -s ifconfig.me)"


echo "======MINER INFO SUMMARY===="
docker exec miner miner info summary
echo "========PEER BOOKS======"
docker exec miner miner peer book -s

echo "blockchain height"
curl -s https://api.helium.io/v1/blocks/height | jq .
echo "Miner height"
docker exec miner miner info height

echo "===== CHECKS END ======"

