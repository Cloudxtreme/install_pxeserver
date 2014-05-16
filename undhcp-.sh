#!/bin/bash
#de-configure dhcpd

sed -i s/INTERFACES=\"$SERVICE_IFACE\"/INTERFACES=""/ /etc/default/isc-dhcp-server
cp /etc/dhcp/dhcpd.conf.old /etc/dhcp/dhcpd.conf