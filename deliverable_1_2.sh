sudo apt-get update
sudo apt-get install openssh-server openssh-client -y 

sudo iptables -A INPUT -p all -d 127.0.0.1 --dport 22  -j LOG #Destino localhost esta bien o es redundante?
sudo iptables -A INPUT -p all -d 127.0.0.1 --dport 22  -j DROP
sudo iptables -A INPUT -p all -s 192.168.x.x -d 127.0.0.1 --dport 22 -j ACCEPT