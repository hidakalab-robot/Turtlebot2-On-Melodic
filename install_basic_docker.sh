#!/usr/bin/env sh

apt update
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
apt install python-catkin-tools -y
catkin build

cd src

git clone https://github.com/Yuki-Narita/turtlebot.git
git clone https://github.com/turtlebot/turtlebot_msgs.git
git clone https://github.com/turtlebot/turtlebot_apps.git
git clone https://github.com/turtlebot/turtlebot_simulator

git clone https://github.com/yujinrobot/kobuki_msgs.git
git clone https://github.com/yujinrobot/kobuki.git
mv kobuki/kobuki_description kobuki/kobuki_node \
  kobuki/kobuki_keyop kobuki/kobuki_safety_controller \
  kobuki/kobuki_bumper2pc ./
rm -rf kobuki

git clone https://github.com/yujinrobot/yujin_ocs.git
mv yujin_ocs/yocs_cmd_vel_mux yujin_ocs/yocs_controllers .
rm -rf yujin_ocs

apt install ros-melodic-kobuki-* -y
apt install ros-melodic-ecl-streams -y

#追加分
apt install -y ros-melodic-urdf ros-melodic-xacro ros-melodic-diagnostic-updater ros-melodic-joy ros-melodic-robot-state-publisher ros-melodic-diagnostic-aggregator
catkin build

apt install -y ros-melodic-navigation ros-melodic-rtabmap-ros ros-melodic-gmapping
git clone https://github.com/GT-RAIL/robot_pose_publisher.git
git clone -b melodic-test https://github.com/hidakalab-robot/multiple_robots_slam.git

catkin build
