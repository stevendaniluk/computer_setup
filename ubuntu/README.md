# Ubuntu

## .bashrc Entries
Snippets to be added for various applications.

### ROS
```bash
# ------------------------------------------------------------
# ROS Setup
# ------------------------------------------------------------

# Source the setup.bash
#source /opt/ros/melodic/setup.bash
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
#export ROS_MASTER_URI=http://192.168.0.1:11311
#export ROS_HOSTNAME=192.168.0.2
#export ROS_IP=192.168.0.2
```

### OpenFOAM
```bash
# ------------------------------------------------------------
# OpenFOAM Setup
# ------------------------------------------------------------

#source /opt/openfoam9/etc/bashrc
#source /usr/lib/openfoam/openfoam2112/etc/bashrc
```
