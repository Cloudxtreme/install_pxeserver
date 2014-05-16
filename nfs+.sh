#/bin/bash
#configure NFS
#rm /etc/exports
ISO_URL="http://cdimage.ubuntu.com/xubuntu/releases/14.04/release/"
ISO_NAME="xubuntu-14.04-desktop-$1.iso"

cd /srv/images/
if ! [ -e $ISO_NAME ]
    then 
    wget $ISO_URL$ISO_NAME
fi

if ! [ -e /srv/nfs/$1 ]
then
    mkdir /srv/nfs/$1/ 
    mkdir $1-temp
    mount -o loop $ISO_NAME $1-temp
    cp -av $1-temp/ /srv/nfs/$1/
fi

cd $SCRIPT_PATH
#cp /etc/exports /etc/exports.old
patch /etc/exports ./exports-patch