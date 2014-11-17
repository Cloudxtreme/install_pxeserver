!#/bin/bash

# run this as root, but READ IT FIRST.
# BEFORE you run this, edit the ./interface-changes.txt file. 
# if you don't see that file, don't run this script, it won't work without that file present. But it WILL break things.
SCRIPT_PATH = $PWD
BASE_PATH = "/srv"
TFTP_PATH = $BASE_PATH"/tftp"
NFS_PATH = $BASE_PATH"/nfs"
SERVICE_IFACE = eth1

ARCH_ARRAY[0] = "i386"
ARCH_ARRAY[1] = "amd64"

apt-get install isc-dhcp-server tftpd-hpa nfs-kernel-server

#test functions

for ARCH in $(@$ARCH_ARRAY); do

./tftp+.sh;
./nfs+.sh;
function inettest {
	if [[ $(ping -c 10 google.com) ]] ;
	then INET_UP="yes" ;
	else INET_UP="no" ;
	fi
	}
function inetiface {
	}	
	

cp /etc/network/interfaces /etc/network/interfaces.old

#cat /home/andyman/interface-changes > /etc/network/interfaces

#echo -e "INTERFACES=\"eth1\"" >> /etc/default/isc-dhcp-server




mkdir /srv
mkdir /srv/tftp
mkdir /srv/nfs
mkdir /srv/images







#configuration complete, (re)start servers

ifup eth1