#!/usr/bin/env bash

# Check if super user and use sudo if not
SUDO=''
if (( $EUID != 0 )); then
  SUDO='sudo'
fi

##############################
# Apt-get Installations
##############################

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
  python3-pip \
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
pip3 install \
  cantools \
  numpy \
  thefuck
