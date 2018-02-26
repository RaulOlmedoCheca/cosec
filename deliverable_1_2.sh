sudo apt-get update
sudo apt-get install openssh-server openssh-client -y 

sudo iptables -A INPUT -p tcp -d 127.0.0.1 --dport 22  -j LOG 
sudo iptables -A INPUT -p tcp -d 127.0.0.1 --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp -d 127.0.0.1 --dport 22  -j DROP
# como los pings se loguean tambien:
sudo iptables -A INPUT -p icmp -d 127.0.0.1 -j LOG
sudo iptables -A INPUT -p icmp -d 127.0.0.1 -j DROP

nano /var/log/kern.log