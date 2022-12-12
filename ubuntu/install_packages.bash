#!/usr/bin/env bash

# Check if super user and use sudo if not
SUDO=''
if (( $EUID != 0 )); then
  SUDO='sudo'
fi

##############################
# Apt-get Installations
##############################

# Prep for Terminator
# PPA taken from the install instructions on the terminator repo for Ubuntu 20.04
$SUDO add-apt-repository ppa:mattrose/terminator

# Update and upgrade!
$SUDO sudo apt update
$SUDO apt upgrade -y

# Install all our packages
$SUDO apt install -y \
  arduino \
  atop \
  can-utils \
  clang-format \
  cloc \
  cmake \
  curl \
  git \
  gnome-tweak-tool \
  graphviz \
  htop \
  imagemagick \
  iotop \
  isc-dhcp-server \
  kcachegrind \
  nfs-common \
  nmap \
  octave \
  openssh-server \
  sshfs \
  sysstat \
  terminator \
  thefuck \
  tmux \
  tree \
  valgrind \
  vlc \
  wireshark

# Install python packages
pip install \
  cantools \
  numpy \
  thefuck

# Lines below are for optional Atom editor installation
# wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | $SUDO apt-key add -
# echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" | $SUDO tee /etc/apt/sources.list.d/atom.list
# $SUDO sudo apt update
# $SUDO apt install -y atom
