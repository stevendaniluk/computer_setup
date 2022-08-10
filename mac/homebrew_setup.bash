#!/usr/bin/env bash

display_usage() {
  echo -e "Sets up HomeBrew, and installs all the packages we want"
  echo -e "   "
  echo -e "Usage:  $0 [OPTION...] "
  echo -e "   "
  echo -e "   --skip-homebrew-install: true skips installing homebrew, but installs packages"
  echo -e "   --skip-casks: true skips installing all casks
  echo -e "   --skip-apps: true skips installing all apps
  echo -e ""
}

# Parse input arguments
# See this Stack Exchange post for details
# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
SKIP_INSTALL=0
SKIP_CASKS=0
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
  --skip-casks)
  SKIP_CASKS=1
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

# Install casks
if [ "$SKIP_CASKS" == "0" ]; then
  echo "Installing all casks..."
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
  casks=(
    1password
    arduino
    atom
    caffeine
    discord
    ultimaker-cura
    dropbox
    firefox
    flash-npapi
    flux
    insomniax
    macfuse
    slack
    spectacle
    sublime-text
    vlc
  )
  brew cask install ${casks[@]}
  echo "All casks installed"
else
  echo "Skipping installation of casks"
fi

# Install apps
if [ "$SKIP_INSTALL" == "0" ]; then
  echo ?"Installing all apps..."
  apps=(
    clang-format
    cloc
    cmake
    git
    git bash-completion
    htop
    imagemagick
    mas
    nmap
    octave
    speedtest-cli
    ssh-copy-id
    thefuck
    tree
    wget
  )
brew install ${apps[@]}
  echo "All apps installed"
else
  echo "Skipping installation of apps"
fi

echo "Done!"
