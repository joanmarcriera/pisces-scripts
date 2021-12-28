## basics that I always add

echo 'export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILESIZE=10000000
export HISTSIZE=100000
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:ll:pwd:bg:fg:history"' >> ~/.bashrc


#TODO: Auth keys 


# Install dependencies
apt-get -y install  autoconf libtool libevent-dev ncurses-dev libmsgpackc2 libssh-4  libssh-dev libmsgpack-dev automake git-core build-essential pkg-config libtool libevent-dev libncurses-dev zlib1g-dev


# Install tmate 
mkdir src
cd src

git clone https://github.com/tmate-io/tmate.git
cd tmate
./autogen.sh
./configure
make
make install
  

# Config ssh (follow instructions to create ssh keys, use the poublic one created here https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key)
echo 'ssh-rsa REDACTED_LONG_PUBLIC_KEY my-name-for-reference-you-can-put-whatever' >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
# Config tmate (key comes from https://tmate.io/)
echo 'set tmate-api-key "tmk-KEY-from-web"
set tmate-authorized-keys "~/.ssh/authorized_keys"' > ~./tmate.conf

#Get your HS name
docker exec miner miner info summary

#Config your HS hostname (example is Corgi)
##Edit 2 files 
root@raspberrypi:/# cat /etc/hostname
raspberrypi-corgi
root@raspberrypi:/# cat /etc/hosts
127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters

127.0.1.1               raspberrypi raspberrypi-corgi
root@raspberrypi:/#


root@raspberrypi:/# hostname -b raspberrypi-corgi

root@raspberrypi:/# reboot 

#Config daemon
echo '[Install]
> WantedBy=multi-user.target
>
> [Unit]
> Description=Tmate-SSH
> Wants=network-online.target
> After=network-online.target
>
> [Service]
> Type=simple
> Restart=always
> User=root
> ExecStart=/usr/local/bin/tmate -F -n raspberrypi-corgi' > /etc/systemd/system/tmate.service

systemctl daemon-reload

# Enable and start daemon

systemctl status tmate.service
systemctl start tmate.service
systemctl enable tmate.service
systemctl status tmate.service

# From the last command you get the socket to use when connecting to the box.

root@raspberrypi:/# reboot 



