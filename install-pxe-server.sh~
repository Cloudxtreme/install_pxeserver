!#/bin/bash

# run this as root, but READ IT FIRST.
# BEFORE you run this, edit the ./interface-changes.txt file. 
# if you don't see that file, don't run this script, it won't work without that file present. But it WILL break things.
SCRIPT_PATH = `pwd`
BASE_PATH = "/srv"
TFTP_PATH = $BASE_PATH"/tftp"
NFS_PATH = $BASE_PATH"/nfs"

apt-get install isc-dhcp-server tftpd-hpa nfs-kernel-server

cp /etc/network/interfaces /etc/network/interfaces.old

cat /home/andyman/interface-changes > /etc/network/interfaces

#echo -e "INTERFACES=\"eth1\"" >> /etc/default/isc-dhcp-server



mkdir /srv
mkdir /srv/tftp
mkdir /srv/nfs
mkdir /srv/images







#configuration complete, (re)start servers

ifup eth1