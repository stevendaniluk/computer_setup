#!/usr/bin/env bash

display_usage() {
  echo -e "Sets up HomeBrew, and installs all the packages we want"
  echo -e "   "
  echo -e "Usage:  $0 [OPTION...] "
  echo -e "   "
  echo -e "   --skip-homebrew-install: true skips installing homebrew, but installs packages"
  echo -e "   --skip-apps: true skips installing all apps"
  echo -e ""
}

# Parse input arguments
# See this Stack Exchange post for details
# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
SKIP_INSTALL=0
SKIP_APPS=0
for i in "$@"
do
case $i in
  -h)
  display_usage
  exit -1
  ;;
  --skip-homebrew-install)
  SKIP_INSTALL=1
  shift # past argument=value
  ;;
  --skip-apps)
  SKIP_APPS=1
  shift # past argument=value
  ;;
  *)
    # unknown option
  ;;
esac
done

# Handle HomeBrew installation
if [ "$SKIP_INSTALL" == "0" ]; then
  echo "Installing homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Homebrew installation complete"
else
  echo "Skipping homebrew install"
fi

# Install apps
if [ "$SKIP_INSTALL" == "0" ]; then
  echo ?"Installing all apps..."
  apps=(
    1password
    arduino
    atom
    caffeine
    clang-format
    cloc
    cmake
    discord
    dropbox
    flash
    flux
    forefox
    git
    git bash-completion
    htop
    imagemagick
    macfuse
    mas
    nmap
    octave
    protonmail-bridge
    protonvpn
    slack
    spectacle
    speedtest-cli
    ssh-copy-id
    sublime-text
    thefuck
    tree
    ultimaker-cura
    vlc
    wget
  )
brew install ${apps[@]}
  echo "All apps installed"
else
  echo "Skipping installation of apps"
fi

echo "Done!"
