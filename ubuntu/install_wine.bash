#!/usr/bin/env bash

# Check if super user and use sudo if not
SUDO=''
if (( $EUID != 0 )); then
  SUDO='sudo'
fi

# Instructions taken from: https://wiki.winehq.org/Ubuntu
$SUDO dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
$SUDO apt-key add winehq.key
$SUDO add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
$SUDO apt install --install-recommends winehq-stable
