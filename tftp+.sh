#!/bin/bash
#set up tftp boot
mkdir $TFTP_PATH
mkdir $TFTP_PATH/$1
mkdir $TFTP_PATH/$1/pxelinux.cfg
cd $IMG_PATH/
if ! [ -e $IMG_PATH/net* ]
then wget -r -nH --reject index* --cut-dirs=7 http://archive.ubuntu.com/ubuntu/dists/trusty/main/installer-$1/current/images/netboot/

rm ./*.gif
fi

if ! [ -e $TFTP_PATH/$1/ ]
then
cp -av $IMG_PATH/netboot/* ../tftp/$1/
fi

cd $SCRIPT_PATH
cp default $TFTP_PATH/$1/pxelinux.cfg/
cp mybootmenu.cfg $TFTP_PATH/

