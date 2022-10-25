#! bin/bash
echo "Posible keys"
echo "all - show IP adresses and symbolic names of all host the current subnet
target - list of open system TCP Ports"

read x

case $x in

all) echo "IP adresses and symbolic names of all host the current subnet" | 
ip a show | grep inet | grep -v inet6 | grep -v 127.0.0.1 |
nmap -sn --system-dns `awk '{print $2}'` | grep report | awk '{print $5 " " $6}' | tr -d "(;)"
;;

target) echo "list of open system TCP Ports" | 
ip a show | grep inet | grep -v inet6 | grep -v 127.0.0.1 |
nmap --open `awk '{print $2}'` | grep open
;;

esac


