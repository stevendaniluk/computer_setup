# ------------------------------------------------------------
# Custom Environment Settings
# ------------------------------------------------------------

# Set leading message to display "user@hostname:directory" with matching colours
green=$(tput setaf 10)
blue=$(tput setaf 4)
reset=$(tput sgr0)
export PS1="\[$green\]\u@\h\[$reset\]:\[$blue\]\W$\[$reset\] "

# Set Initial Working Diretory
cd ~

# Set the default editor
export EDITOR="subl -n -w"

# Use thefuck package for annoying command line mistakes
eval $(thefuck --alias)

# Enable tab completion for git
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Homebrew setup
export PATH="/usr/local/sbin:$PATH"

# ------------------------------------------------------------
# Shortcuts
# ------------------------------------------------------------
alias ~="cd ~"                              # Go Home
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ....='cd ../../../'                   # Go back 3 directory levels

alias homebrew_update_all="brew update; brew upgrade; brew upgrade --cask --greedy"

alias disable_lid_sleep="sudo pmset -a disablesleep 1"
alias enable_lid_sleep="sudo pmset -a disablesleep 0"
