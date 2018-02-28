#!/bin/bash

MYIP=192.168.56.101
IPFROMADMIN=163.168.56.1

# Update headers to install openssh
sudo apt-get update
# Install openssh in order to allow ssh connections into the server
sudo apt-get install openssh-server openssh-client -y 

# Change firewall default policy to drop all incoming packets
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP

#Enable input packets in loopback interface (apache - mysql use it)
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

#Accept only ssh connections from the admin's ip
sudo iptables -A INPUT -p tcp -d $MYIP --dport ssh -s $IPFROMADMIN  -m state --state NEW -j ACCEPT # lo mismo ip destino sobra
# sudo iptables -A OUTPUT -p tcp -d $IPFROMADMIN -s $MYIP --sport ssh -m state --state RELATED,ESTABLISHED  -j ACCEPT 

# Accept al incoming connections to apache-tomcat
sudo iptables -A INPUT -p tcp -d $MYIP --dport http -m state --state NEW -j ACCEPT 

#sudo iptables -A OUTPUT -p tcp -d $MYIP --dport http -j ACCEPT
 

#TODO
sudo iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport http -m state --state NEW -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport domain -m state --state NEW -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport domain -m state --state NEW -j ACCEPT

sudo iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT 

