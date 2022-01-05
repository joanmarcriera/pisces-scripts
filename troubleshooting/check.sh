#!/bin/bash

echo "======MINER INFO SUMMARY===="
docker exec miner miner info summary
echo "========PEER BOOKS======"
docker exec miner miner peer book -s

echo "======CHECKS START======"
echo "Hostname = > $(hostname)"
echo "Uptime   = > $(uptime)"
echo "Docker ps => $(docker ps)"
echo "Public IP => $(curl -s ifconfig.me)"


echo "blockchain height"
curl -s https://api.helium.io/v1/blocks/height | jq .
echo "Miner height"
docker exec miner miner info height

echo "===== CHECKS END ======"

