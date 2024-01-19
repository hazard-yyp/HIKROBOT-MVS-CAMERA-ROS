# HIKROBOT-MVS-CAMERA-ROS
The ros driver package of Hikvision Industrial Camera SDK. Support configuration parameters, the parameters have been optimized, and the photos have been transcoded to rgb format.

# Install
```
mkdir -p ~/ws_hikrobot_camera/src
git clone https://github.com/hazard-yyp/HIKROBOT-MVS-CAMERA-ROS.git
cd ~/ws_hikrobot_camera/src/HIKROBOT-MVS-CAMERA-ROS
sudo dpkg -i MVS-2.1.2_x86_64_20231116.deb # hikvision camera sdk
cd ~/ws_hikrobot_camera
catkin_make
```
# launch run
```
source ./devel/setup.bash 
roslaunch hikrobot_camera hikrobot_camera.launch
```
# launch run
use rviz subscribe topic： /hikrobot_camera/rgb
```
source ./devel/setup.bash 
roslaunch hikrobot_camera hikrobot_camera_rviz.launch
```
# docker support
not finish yet, no image output