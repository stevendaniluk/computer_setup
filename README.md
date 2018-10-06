# computer_setup
Scripts for setting up new computers

This is divided into the following sections:
1. `mac`: Setup related to OSX
1. `ubuntu`: Setup related to Ubuntu (16.04)
1. `common`: Data and scripts that are common to all operating systems

## Mac Setup
Follow these steps to setup a new mac:
1. Update System Preferences
   * Open *System Preferences* and change all settings to match those in `mac/system_preferences.txt`
1. Setup Terminal
   1. Open Terminal
   1. Open Preferences, under "Profiles" click the gear and import the file `mac/terminal_profile.terminal`
1. Setup Environment
   * `cp mac/bash_profile_personal.bash ~/.bash_profile_personal`
   * `echo "source ~/.bash_profile_personal" >> ~/.bash_profile`
1. Install HomeBrew and Apps
   * `bash mac/homebrew_setup.bash`
   * `bash common/install_atom_packages.bash`
1. Install remaining software
   1. Manually install all software listed in `additional_software.txt`

## Ubuntu Setup
Follow these steps to setup a new machine with Ubuntu 16.04
1. Customize Terminal and Environment Setup
   * Open a terminal, go the *Preferences*, and change the settings to match `ubuntu/Terminal/setup.txt`
   * Add the personal settings to `bash_profile`:
      * `cp ubutnu/bashrc_personal.bash ~/.bashrc_personal`
      * `echo "source ~/.bashrc_personal" >> ~/.bashrc`
1. Install all packages
   * `bash ubuntu/install_packages`
   * `bash common/install_atom_packages.bash`
