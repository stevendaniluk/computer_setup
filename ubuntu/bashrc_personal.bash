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
export EDITOR='nano -w'

# Use thefuck package for annoying command line mistakes
eval $(thefuck --alias)

# ------------------------------------------------------------
# Shortcuts
# ------------------------------------------------------------
alias ~="cd ~"                              # Go Home
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ....='cd ../../../'                   # Go back 3 directory levels
alias .....='cd ../../../../'               # Go back 4 directory levels

alias update_all='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y'

# Undo all commits on the current branch
alias git_reset_all='git reset --soft `git merge-base HEAD main`'

setup_vcan_interface() {
    local interface_name=${1:-vcan0} # Default interface name is vcan0

    # If the interface doesn't exist, add it
    if ! ip link show "$interface_name" &>/dev/null; then
        # Load the vcan kernel module if not already loaded
        if ! lsmod | grep -q "^vcan"; then
            sudo modprobe vcan
        fi

        sudo ip link add dev "$interface_name" type vcan
    fi

    sudo ip link set up "$interface_name"
    echo "Virtual CAN interface '$interface_name' is now up."
}


# Function for formatting .h, .hpp, and .cpp files with clang
function format_cpp_code() {
    TARGET=${1%/}

    if [ -f "$TARGET" ]; then
        echo "Formatting "$TARGET
        clang-format -i $TARGET
    else
        if [ -z "$TARGET" ]; then
            TARGET="$(pwd)"
        fi

        find $TARGET -type f \( -iname \*.h -o -iname \*.hpp -o -iname \*.cpp \) -exec echo Formatting {} \; -exec clang-format -i {} \;
    fi
}
