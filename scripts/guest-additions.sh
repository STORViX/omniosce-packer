#!/usr/bin/env bash -eux

if [ "$PACKER_BUILDER_TYPE" != "virtualbox-iso" ]; then
  exit 0
fi

DEV="/dev/lofi/1"
pfexec mkdir -p /media/cdrom

pfexec /usr/sbin/lofiadm -a VBoxGuestAdditions.iso $DEV
pfexec /usr/sbin/mount -F hsfs $DEV /media/cdrom/
yes | pfexec /usr/sbin/pkgadd -d /media/cdrom/VBoxSolarisAdditions.pkg all
pfexec /usr/sbin/umount /media/cdrom
pfexec /usr/sbin/lofiadm -d $DEV
pfexec rm -f ~/VBoxGuestAdditions.iso

echo "postinstall.sh done"
