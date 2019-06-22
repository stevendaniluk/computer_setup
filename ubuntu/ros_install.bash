#!/usr/bin/env bash

# Check if super user and use sudo if not
SUDO=''
if (( $EUID != 0 )); then
  SUDO='sudo'
fi

# Setup sources
$SUDO sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup keys
$SUDO apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# Installation
echo "Installing packages"
$SUDO apt-get update
$SUDO apt-get install ros-kinetic-desktop-full
$SUDO apt-get install ros-kinetic-rosserial-arduino

$SUDO rosdep init
rosdep update

# Workspace setup
echo "Setting up new workspace"
source /opt/ros/kinetic/setup.bash

mkdir -p ~/ros_ws/src
cd ~/ros_ws
catkin_make

echo "Finished"
