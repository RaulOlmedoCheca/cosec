sudo apt-get update
sudo apt-get install openssh-server && openssh-client -y

sudo iptables -A INPUT -p all --dport 22 -d 127.0.0.1 -j LOG
sudo iptables -A INPUT -p all --dport 22 -d 127.0.0.1 -j DROP
sudo iptables -A INPUT -p all --dport 22 -s 192.168.x.x -d 127.0.0.1 -j ACCEPT
