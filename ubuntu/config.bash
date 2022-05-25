#!/usr/bin/env bash

SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Copy the bashrc
cp $SRC_DIR/bashrc_personal.bash ~/.bashrc_personal
echo "source ~/.bashrc_personal" >> ~/.bashrc

# Add the terminator config file
cp -r $SRC_DIR/config/terminator ~/.config/
