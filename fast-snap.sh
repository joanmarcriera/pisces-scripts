echo "snap updating" > /home/pi/log/snap-update-begain.log ;
wait
sudo wget https://piscesminer.oss-cn-hangzhou.aliyuncs.com/snap/snap-latest -O /home/pi/hnt/miner/snap/snap-latest;
wait
echo "download success" > /home/pi/log/snap-update-wget.log ;
wait
sudo docker exec miner miner snapshot load /var/data/snap/snap-latest;
wait
echo "update success" > /home/pi/log/snap-update-end.log ;