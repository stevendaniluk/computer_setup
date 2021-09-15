#!/usr/bin/env bash

# Check if super user and use sudo if not
SUDO=''
if (( $EUID != 0 )); then
  SUDO='sudo'
fi

##############################
# Apt-get Installations
##############################

# Prep for Sublime editor
$SUDO wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | $SUDO apt-key add -
$SUDO echo "deb https://download.sublimetext.com/ apt/stable/" | $SUDO tee /etc/apt/sources.list.d/sublime-text.list

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
  firefox \
  git \
  graphviz \
  htop \
  imagemagick \
  iotop \
  isc-dhcp-server \
  kcachegrind \
  nano \
  nfs-common \
  nmap \
  octave \
  openssh-server \
  python3-dev \
  python3-pip \
  sshfs \
  sublime-text \
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

SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Add the terminator config file
cp -r $SRC_DIR/config/terminator ~/.config/

# Lines below are for optional Atom editor installation
# wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | $SUDO apt-key add -
# echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" | $SUDO tee /etc/apt/sources.list.d/atom.list
# $SUDO apt install -y atom
