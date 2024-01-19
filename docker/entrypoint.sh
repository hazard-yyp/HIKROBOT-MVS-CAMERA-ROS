#!/bin/zsh
. ~/.zshrc
cd /home/user/catkin_ws
# rosdep update && rosdep install --from-paths src --ignore-src -r -y
catkin build
echo "source /home/user/catkin_ws/devel/setup.zsh" >> ~/.zshrc
cd 
exec "$@"