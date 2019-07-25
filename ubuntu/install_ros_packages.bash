#!/usr/bin/env bash

# Check if super user and use sudo if not
SUDO=''
if (( $EUID != 0 )); then
  SUDO='sudo'
fi

$SUDO sudo apt-get update

$SUDO apt-get install -y \
  ros-kinetic-imu-filter-madgwick \
  ros-kinetic-rosserial-arduino \
  ros-kinetic-rosserial-server \
  ros-kinetic-rviz-imu-plugin
