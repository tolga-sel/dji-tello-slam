#!/bin/bash

if (( $EUID > 0 )); then
	echo " - Please run as root"
	exit
fi

#Do updates
sudo apt update -y
sudo apt upgrade -y

#Install terminator
sudo apt-get install terminator -y


#Install ROS 2
echo " - Installing ROS 2 Foxy"

echo " - Install Build Tools"

