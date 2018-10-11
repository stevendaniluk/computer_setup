# ------------------------------------------------------------
# Custom Environment Settings
# ------------------------------------------------------------

# Set Leading Message To Display
green=$(tput setaf 10)
reset=$(tput sgr0)
export PS1="\[$green\]\u:\W$ \[$reset\]"

# Set Initial Working Diretory
cd ~

# Set the default editor, and add TextMate to the path
export PATH="$HOME/Misc.:$PATH" 
export EDITOR="subl -n -w"

# Use thefuck package for annoying command line mistakes
eval $(thefuck --alias)

# Enable tab completion for git
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# ------------------------------------------------------------
# Shortcuts
# ------------------------------------------------------------
alias ~="cd ~"                              # Go Home
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ....='cd ../../../'                   # Go back 3 directory levels

alias VM_start="prlctl start {144ea655-2300-4ad7-af5b-9e44bd2dd43b}"
alias VM_enter="prlctl enter {144ea655-2300-4ad7-af5b-9e44bd2dd43b}"
