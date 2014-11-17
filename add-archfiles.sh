#!/bin/bash

#set up files for architecture

# set up PXE files

## check if files exist in the right spots

## if not there, download them

cd $IMG_PATH/
if ! [ -e $IMG_PATH/net* ]
then wget -r -nH --reject index* --cut-dirs=7 http://archive.ubuntu.com/ubuntu/dists/trusty/main/installer-$1/current/images/netboot/

rm ./*.gif
fi

if ! [ -e $TFTP_PATH/$1/ ]
then
cp -av $IMG_PATH/netboot/* ../tftp/$1/
fi

## set up mybootmenu.cfg

label livei386
        menu label Xubuntu 14.04 Live 32bit
        kernel ubuntu-livecd-boot/i386/vmlinuz
        append boot=casper netboot=nfs nfsroot=192.168.0.1:/srv/nfs/live-files/i386 initrd=ubuntu-livecd-boot/i386/initrd.lz -- splash quiet
    label liveamd64
        menu label Xubuntu 14.04 Live 64bit
        kernel ubuntu-livecd-boot/amd64/vmlinuz
    append boot=casper netboot=nfs nfsroot=192.168.0.1:/srv/nfs/live-files/amd64 initrd=ubuntu-livecd-boot/amd64/initrd.lz -- splash quiet
    
## copy mybootmenu.cfg to the right place(s)



# set up NFS files

## image files
### detect, download, install

./nfs+.sh

### or use debootstrap?

## set up /etc/exports

cp /etc/exports $SCRIPT_PATH/exports.orig-config
grep $1 /etc/exports || echo "$NFS_PATH/$1   *(ro,async,no_root_squash,no_subtree_check)" >> /etc/exports




