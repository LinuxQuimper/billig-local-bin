#!/bin/sh

# Ce script est execute lorsqu'une nouvelle ip est attribué par dhcp a une interface de cette machine
# Le but de ce script est de crée la regle SNAT kivabien pour partager la connexion internet eth0 ou wlan0 sur eth1 (réseau local)

exit

echo '--------------------------' >> /tmp/dhclient-exit-hooks.debug
set >> /tmp/dhclient-exit-hooks.debug
echo $new_ip_address >> dhclient-exit-hooks.debug
sleep 10
echo Lancement de /sbin/iptables -t nat -A POSTROUTING -s 10.9.0.0/22 -o $interface -j SNAT --to-source $new_ip_address >> /tmp/dhclient-exit-hooks.debug
/sbin/iptables -t nat -A POSTROUTING -s 10.9.0.0/22 -o $interface -j SNAT --to-source $new_ip_address >> /tmp/dhclient-exit-hooks.debug
echo [FAIT] >> /tmp/dhclient-exit-hooks.debug
echo '--------------------------' >> /tmp/dhclient-exit-hooks.debug

