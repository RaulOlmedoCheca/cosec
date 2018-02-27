#!/bin/bash

MYIP = 163.117.244.97
IPFROMADMIN = 163.117.221.151

sudo apt-get update
sudo apt-get install openssh-server openssh-client -y 

sudo iptables -P INPUT DROP
sudo iptables -A INPUT -p tcp --dport ssh -s $IPFROMADMIN -d $MYIP -j ACCEPT # no funciona en loopback
 
# acepta todas las conexiones entrantes que ya hayan sido establecidas o relacionadas con una peticon DNS
sudo iptables -A INPUT -p udp --sport domain -m state --state RELATED,ESTABLISHED -d $MYIP -j ACCEPT 
# acepta todas las conexiones entrantes que ya hayan sido establecidas o relacionadas con una peticion saliente del puerto HTTP del origen (por ejemplo cuando se ejecuta apt-get update)
sudo iptables -A INPUT -p tcp --sport http -m state --state RELATED,ESTABLISHED -d $MYIP -j ACCEPT 

nano /var/log/kern.log
