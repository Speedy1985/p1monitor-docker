#!/bin/bash

IMAGE=p1monitor.img

if test -f "$IMAGE"; then

	echo "Installing dependencies..."
	sudo apt-get install -y kpartx

	echo "Mounting image... "
	sudo losetup loop0 $IMAGE

	echo "Mounting  disk to /dev/loop0..."
	sudo kpartx -av /dev/loop0

	echo "Creating  folder /mnt/p1monitor"
	sudo mkdir -p /mnt/p1monitor

	echo "Mounting partition2..."
	sudo mount -r /dev/mapper/loop0p2 /mnt/p1monitor

	echo "Extracting /p1mon from image......"
	sudo cp -a /mnt/p1monitor/p1mon p1mon/

	echo "Unmounting..."
	sudo umount /mnt/p1monitor

	echo "Remove disk from /dev/loop0..."
	sudo kpartx -dv /dev/loop0
	sudo losetup -d loop0

	echo "Done!"
else
	echo "File $IMAGE not found!"
fi


