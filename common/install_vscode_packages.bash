#!/usr/bin/env bash

# Install some additional packages for the VSCode editor
echo "Installing VSCode editor packages"
code --install-extension \
  akamud.vscode-theme-onedark \
  ms-vscode-remote.remote-ssh \
  peterj.proto
