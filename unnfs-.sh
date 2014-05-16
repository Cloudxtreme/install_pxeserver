#!/bin/bash

umount /srv/nfs/$ARCH-temp
rmdir /srv/nfs/$ARCH
if [ -e /etc/exports.orig ]
then
    cp /etc/exports.orig /etc/exports.old
fi

cp /etc/exports.old /etc/exports
