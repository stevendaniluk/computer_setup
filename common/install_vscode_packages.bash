#!/usr/bin/env bash

# Install some additional packages for the VSCode editor
echo "Installing VSCode editor packages"
code \
  --install-extension akamud.vscode-theme-onedark \
  --install-extension bazelbuild.vscode-bazel \
  --install-extension mathworks.language-matlab \
  --install-extension ms-vscode-remote.remote-ssh \
  --install-extension peterj.proto \
  --install-extension streetsidesoftware.code-spell-checker \
