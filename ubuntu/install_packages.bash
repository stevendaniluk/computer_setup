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
$SUDO wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
$SUDO echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Prep for Atom editor
$SUDO add-apt-repository ppa:webupd8team/atom

# Prep for Terminator
$SUDO add-apt-repository ppa:gnome-terminator

# Update and upgrade!
$SUDO sudo apt-get update
$SUDO apt-get upgrade -y

# Install all our packages
# (thefuck requires python3-dev and python3-pip)
$SUDO apt-get install -y \
  arduino \
  atom \
  atop \
  can-utils \
  clang-format \
  cloc \
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
  vlc

# Have to install thefuck in a special way
$SUDO pip3 install thefuck

SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Add the terminator config file
cp -r $SRC_DIR/config/terminator ~/.config/
