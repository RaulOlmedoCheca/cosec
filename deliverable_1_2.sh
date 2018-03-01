#!/bin/bash

MYIP=192.168.56.101
IPFROMADMIN=192.168.56.1

# Update headers to install openssh
sudo apt-get update
# Install openssh in order to allow ssh connections into the server
sudo apt-get install openssh-server openssh-client -y

# Activate automatic security updates
sudo apt-get install unattended-upgrades

# Change firewall default policy to drop all incoming packets
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP

# Enable input packets in loopback interface (apache - mysql use it)
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

# Accept only ssh connections from the admin's ip
sudo iptables -A INPUT -p tcp -d $MYIP --dport ssh -s $IPFROMADMIN  -m state --state NEW -j ACCEPT # lo mismo ip destino sobra
# sudo iptables -A OUTPUT -p tcp -d $IPFROMADMIN -s $MYIP --sport ssh -m state --state RELATED,ESTABLISHED  -j ACCEPT 

# Accept al incoming connections to apache-tomcat
sudo iptables -A INPUT -p tcp -d $MYIP --dport http -m state --state NEW -j ACCEPT 
# Checks if trhe connection is new in the last minute, and blocks it if 10 petitions has been sent.
sudo iptables -A INPUT -p tcp -d $MYIP --dport http -m state --state NEW -m recent --update --seconds 60 --hitcount 10 -j DROP
 

# Allow outgoing connections to dns and http ports in order to make apt-get update possible
sudo iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport http -m state --state NEW -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport domain -m state --state NEW -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport domain -m state --state NEW -j ACCEPT

# Allow all related input connections (because we control output traffic it is secure)
sudo iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT 

# Start snort alert system
sudo snort -c /etc/snort/snort.conf -l /var/log/snort -A console -D