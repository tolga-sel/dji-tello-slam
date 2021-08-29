#!/bin/bash

if (( $EUID > 0 )); then
	echo " - Please run as root"
	exit
fi

#Do updates
apt update -y
apt upgrade -y

# C++ Build tools
apt install build-essential gdb -y

# check for UTF-8
locale
sudo apt update -y && sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

echo " - enable the Universe repository"
sudo apt install software-properties-common -y
sudo add-apt-repository universe
apt-cache policy | grep universe
 500 http://us.archive.ubuntu.com/ubuntu focal/universe amd64 Packages
     release v=20.04,o=Ubuntu,a=focal,n=focal,l=Ubuntu,c=universe,b=amd64

echo " - add the ROS 2 apt repository to your system"
sudo apt update -y && sudo apt install curl gnupg lsb-release -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null


echo " - install ROS2 packages"
sudo apt update -y
sudo apt install ros-galactic-desktop -y
sudo apt install ros-galactic-ros-base -y

source /opt/ros/galactic/setup.bash
echo 'source /opt/ros/galactic/setup.bash' >> ~/.bashrc 


