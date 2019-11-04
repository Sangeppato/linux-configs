#!/bin/bash

#Fix for bluetooth not working after suspension
#Only necessary for the Qualcomm Atheros QCA9377

set -e

case $1 in
	
	"pre")
		rmmod btusb
		;;
	
	"post")
		modprobe btusb
		;;
	
esac
