#!/bin/bash

if (( $EUID > 0 )); then
	echo " - Please run as root"
	exit
fi

#Install ROS 2
echo " - Installing ROS 2 Foxy"

echo " - Install Build Tools"

