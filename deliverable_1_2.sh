sudo apt-get update
sudo apt-get install openssh-server openssh-client -y 

sudo iptables -P INPUT DROP
sudo iptables -A INPUT -p tcp --dport ssh -s ipFromAdmin -d myIp -j ACCEPT # no funciona en loopback
 
# acepta todas las conexiones entrantes que ya hayan sido establecidas o relacionadas con una peticon DNS
sudo iptables -A INPUT -p udp --sport domain -m state --state RELATED,ESTABLISHED -j ACCEPT 
# acepta todas las conexiones entrantes que ya hayan sido establecidas o relacionadas con una peticion saliente al puerto HTTP (por ejemplo cuando se ejecuta apt-get update)
sudo iptables -A INPUT -p tcp --sport http -m state --state RELATED,ESTABLISHED -j ACCEPT 



nano /var/log/kern.log
