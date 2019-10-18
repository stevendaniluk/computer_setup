# ------------------------------------------------------------
# Custom Environment Settings
# ------------------------------------------------------------

# Set Leading Message To Display
green=$(tput setaf 10)
reset=$(tput sgr0)
export PS1="\[$green\]\u:\W$ \[$reset\]"

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

alias update_all='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'

# Function for formatting .h, .hpp, and .cpp files with clang
function format_cpp_code() {
  DIR=${1%/}
  if [ -z "$DIR" ]; then
    DIR="$(pwd)"
  fi

  for filename in $DIR/*.{h,hpp,cpp}; do
    if [ -f "$filename" ]; then
      echo "Formatting "$filename
      clang-format -i $filename
    fi
  done
}

# ------------------------------------------------------------
# ROS Setup
# ------------------------------------------------------------

# Source the setup.bash
#source /opt/ros/melodic/setup.bash

# Source the catkin workspace
#source ~/ros_ws/devel/setup.bash

# Aliases
alias rviz='rosrun rviz rviz'
alias display_frames='rosrun tf view_frames && display frames.pdf'
alias print_ros_network='printf "ROS_MASTER_URI: %s\nROS_HOSTNAME: %s\nROS_IP: %s\n" "$ROS_MASTER_URI" "$ROS_HOSTNAME" "$ROS_IP"'

# Setup network (Master)
#export ROS_MASTER_URI=http://localhost:11311 
#export ROS_HOSTNAME=192.168.0.0
#export ROS_IP=192.168.0.0
 
# Setup network (Host)
#export ROS_MASTER_URI=http://192.168.0.2:11311 
#export ROS_HOSTNAME=192.168.1.233
#export ROS_IP=192.168.1.233
