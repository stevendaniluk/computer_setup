#!/usr/bin/env bash

# Check if super user and use sudo if not
SUDO=''
if (( $EUID != 0 )); then
  SUDO='sudo'
fi

# OpenCFD version
curl https://dl.openfoam.com/add-debian-repo.sh | $SUDO bash

# OpenFOAM Foundation version
$SUDO sh -c "wget -O - https://dl.openfoam.org/gpg.key | apt-key add -"
$SUDO add-apt-repository http://dl.openfoam.org/ubuntu

$SUDO apt update

# Additional packages
$SUDO apt install -y \
  openfoam2112-default \
  openfoam9 \
  paraview

pip3 install \
  numpy-stl \
  pyFoam
