## Basic setup

Read : https://www.ssh.com/academy/ssh/tunneling/example

### On server
```bash
/etc/ssh/sshd_config
GatewayPorts yes
```

### On client 
```bash
~ $ ssh -f -T -N -R 0.0.0.0:8888:localhost:80 user@server.fi
```


## Sshuttle 

### Basic

```bash
sshuttle -D -r user@server.fi -x 192.168.1.0/24 0.0.0.0/0
```

### Better

```bash
[Unit]
Description=sshuttle service a permanent tunnel
After=network.target

[Service]
ExecStart=/usr/bin/sshuttle -r h4s@localhost:39111 0.0.0.0/0 --dns -D --pidfile=/var/run/sshuttle.pid -e 'ssh -i /home/h4s/.ssh/whtunnel2'
Restart=always
Type=forking
PIDFile=/var/run/sshuttle.pid

[Install]
WantedBy=multi-user.target
```