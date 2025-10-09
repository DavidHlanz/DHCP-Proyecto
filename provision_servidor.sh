#!/bin/bash
set -xeu
apt-get update
apt-get install -y isc-dhcp-server

systemctl restart isc-dhcp-server

cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.bak
mv /vagrant/vendor/dhcpd.conf /etc/dhcp/dhcpd.conf