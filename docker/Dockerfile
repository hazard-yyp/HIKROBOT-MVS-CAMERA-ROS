FROM ros:noetic-ros-base

ARG DEBIAN_FRONTEND=noninteractive

# Install basic apt tools
RUN apt update && apt upgrade -y && apt install -y \
    vim git wget zsh python3-rosdep build-essential cmake python3-catkin-tools python3-pip && \  
    # Add python3-dev and python3-pip for building Python packages
    apt-get install -y ros-noetic-cv-bridge ros-noetic-image-transport ros-noetic-camera-info-manager libqt5gui5 libqt5core5a libqt5dbus5 qt5-gtk-platformtheme && \
    # create catkin_ws
    mkdir -p /root/catkin_ws/src

# Install oh-my-zsh (if don't want can remove this code block and subsequent sourcing of ros .setup for .zshrc)
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t ys \
    -p git \
	-p z \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting

# RUN sudo apt install -y libeigen3-dev \
#     libyaml-cpp-dev \
#     ros-noetic-eigen-conversions

RUN . /opt/ros/${ROS_DISTRO}/setup.sh && \
    # Install dependencies using rosdep (note using root user to run rosdep update here might affect running packages for non-root users)
    cd /root/catkin_ws && rosdep update && rosdep install --from-paths src --ignore-src -r -y && \
    # Add executable permission to gazebo_status_node
    # chmod +x src/aqc_simulation/droc_gazebo/scripts/gazebo_status_node && \
    # Building package
    catkin_make && \
    # Copy over realsense gazebo plugin over to ros library
    #cp /root/catkin_ws/devel/lib/librealsense_gazebo_plugin.so /opt/ros/${ROS_DISTRO}/lib && \
    # Adding source to bash and zsh profiles
    echo "source /opt/ros/${ROS_DISTRO}/setup.bash\nsource ~/catkin_ws/devel/setup.bash" >> ~/.bashrc && \
    echo "source /opt/ros/${ROS_DISTRO}/setup.zsh\nsource ~/catkin_ws/devel/setup.zsh" >> ~/.zshrc


COPY . /root/catkin_ws/src
RUN cd /root/catkin_ws/src && \
    dpkg -i MVS-2.1.2_x86_64_20231116.deb

# Set up entrypoint
COPY docker/entrypoint.sh /entrypoint.sh
RUN sudo chmod +x /entrypoint.sh
# Set the default command to zsh
ENTRYPOINT [ "/entrypoint.sh" ] 
CMD zsh
