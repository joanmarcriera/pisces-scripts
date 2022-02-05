#!/bin/bash

function some_seconds(){
	sleep 10
}

docker stop miner
some_seconds

rm -rf /home/pi/hnt/miner/blockchain.db 
some_seconds
rm -rf /home/pi/hnt/miner/ledger.db
some_seconds
mkdir /home/pi/hnt/miner/blockchain.db
mkdir /home/pi/hnt/miner/ledger.db
some_seconds
docker start miner

echo "Wait and check"
df -HPT
