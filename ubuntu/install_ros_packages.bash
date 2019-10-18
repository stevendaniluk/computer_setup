#!/usr/bin/env bash

# Check if super user and use sudo if not
SUDO=''
if (( $EUID != 0 )); then
  SUDO='sudo'
fi

$SUDO sudo apt-get update

$SUDO apt-get install -y \
  ros-melodic-imu-filter-madgwick \
  ros-melodic-rosserial-arduino \
  ros-melodic-rosserial-server \
  ros-melodic-rviz-imu-plugin
