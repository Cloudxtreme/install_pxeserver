#!/bin/bash
#configure dhcpd

sed -i s/INTERFACES=""/INTERFACES=\"$SERVICE_IFACE\"/ /etc/default/isc-dhcp-server
cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.old
patch /etc/dhcp/dhcpd.conf ./dhcpd.patch