#!/usr/bin/env bash

display_usage() {
  echo -e "Sets up HomeBrew, and installs all the packages we want"
  echo -e "   "
  echo -e "Usage:  $0 [OPTION...] "
  echo -e "   "
  echo -e "   --skip-homebrew-install: true skips installing homebrew, but installs packages"
  echo -e ""
}

# Parse input arguments
# See this Stack Exchange post for details
# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
SKIP_INSTALL=0
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
  *)
      # unknown option
  ;;
esac
done

# Handle HomeBrew installation
if [ "$SKIP_INSTALL" == "0" ]; then
    echo "Installing homebrew..."
    #/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Homebrew installation complete"
else
    echo "Skipping homebrew install"
fi

# Install casks
echo "Installing all casks..."
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
casks=(
  arduino
  atom
  caffeine
  cure
  dropbox
  firefox
  flux
  google-backup-and-sync
  insomniax
  nordvpn
  osxfuse
  slack
  skype
  spectacle
  sublime-text
  teamviewer
  utorrent
  vlc
)
brew cask install ${casks[@]}
echo "All casks installed"

# Install apps
echo ?"Installing all apps..."
apps=(
  cmake
  dark-mode
  git
  git bash-completion
  htop
  imagemagick
  mas
  speedtest-cli
  ssh-copy-id
  sshfs
  thefuck
  tree
  wget
)
brew install ${apps[@]}
echo "All apps installed"

echo "Done!"
