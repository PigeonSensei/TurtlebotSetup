#!/bin/bash
cd $HOME

#[burger, waffle, waffle_pi]
turtlebot_model="burger"
ros_version=$(rosversion -d)

echo "\033[33mInit ~/.bashrc\033[0m"
cp /etc/skel/.bashrc ~/.bashrc

echo "\033[33mAdd source /opt/ros/$ros_version/setup.bash\033[0m"
echo "source /opt/ros/$ros_version/setup.bash" >> ~/.bashrc

echo "\033[33mAdd export TURTLEBOT3_MODEL=$turtlebot_model\033[0m"
echo "export TURTLEBOT3_MODEL=$turtlebot_model" >> ~/.bashrc

echo "\033[33msudo apt-get update\033[0m"
sudo apt-get -y update

echo "\033[33msudo apt-get upgrade\033[0m"
sudo apt-get -y upgrade

echo "\033[33msudo apt-get install ros-$ros_version-joy\033[0m"
sudo apt-get install -y ros-$ros_version-joy

echo "\033[33msudo apt-get install ros-$ros_version-teleop-twist-joy\033[0m"
sudo apt-get install -y ros-$ros_version-teleop-twist-joy

echo "\033[33msudo apt-get install ros-$ros_version-teleop-twist-keyboard\033[0m"
sudo apt-get install -y ros-$ros_version-teleop-twist-keyboard

echo "\033[33msudo apt-get install ros-$ros_version-laser-proc\033[0m"
sudo apt-get install -y ros-$ros_version-laser-proc

echo "\033[33msudo apt-get install ros-$ros_version-rgbd-launch\033[0m"
sudo apt-get install -y ros-$ros_version-rgbd-launch

echo "\033[33msudo apt-get install ros-$ros_version-rosserial-arduino\033[0m"
sudo apt-get install -y ros-$ros_version-rosserial-arduino

echo "\033[33msudo apt-get install ros-$ros_version-rosserial-python\033[0m"
sudo apt-get install -y ros-$ros_version-rosserial-python

echo "\033[33msudo apt-get install ros-$ros_version-rosserial-client\033[0m"
sudo apt-get install -y ros-$ros_version-rosserial-client

echo "\033[33msudo apt-get install ros-$ros_version-rosserial-msgs\033[0m"
sudo apt-get install -y ros-$ros_version-rosserial-msgs

echo "\033[33msudo apt-get install ros-$ros_version-amcl\033[0m"
sudo apt-get install -y ros-$ros_version-amcl

echo "\033[33msudo apt-get install ros-$ros_version-map-server\033[0m"
sudo apt-get install -y ros-$ros_version-map-server

echo "\033[33msudo apt-get install ros-$ros_version-move-base\033[0m"
sudo apt-get install -y ros-$ros_version-move-base

echo "\033[33msudo apt-get install ros-$ros_version-urdf\033[0m"
sudo apt-get install -y ros-$ros_version-urdf

echo "\033[33msudo apt-get install ros-$ros_version-xacro\033[0m"
sudo apt-get install -y ros-$ros_version-xacro

echo "\033[33msudo apt-get install ros-$ros_version-compressed-image-transport\033[0m"
sudo apt-get install -y ros-$ros_version-compressed-image-transport

echo "\033[33msudo apt-get install ros-$ros_version-rqt*\033[0m"
sudo apt-get install -y ros-$ros_version-rqt*

echo "\033[33msudo apt-get install ros-$ros_version-rviz\033[0m"
sudo apt-get install -y ros-$ros_version-rviz

echo "\033[33msudo apt-get install ros-$ros_version-gmapping\033[0m"
sudo apt-get install -y ros-$ros_version-gmapping

echo "\033[33msudo apt-get install ros-$ros_version-navigation\033[0m"
sudo apt-get install -y ros-$ros_version-navigation

echo "\033[33msudo apt-get install ros-$ros_version-interactive-markers\033[0m"
sudo apt-get install -y ros-$ros_version-interactive-markers

echo "\033[33msudo apt-get install ros-$ros_version-dynamixel-sdk\033[0m"
sudo apt-get install -y ros-$ros_version-dynamixel-sdk

echo "\033[33msudo apt-get install ros-$ros_version-turtlebot3-msgs\033[0m"
sudo apt-get install -y ros-$ros_version-turtlebot3-msgs

echo "\033[33msudo apt-get install ros-$ros_version-turtlebot3\033[0m"
sudo apt-get install -y ros-$ros_version-turtlebot3

echo "\033[33msudo apt-get install ros-$ros_version-turtlebot3-simulations\033[0m"
sudo apt-get install -y ros-$ros_version-turtlebot3-simulations

echo "\033[33msudo apt-get install ros-$ros_version-turtlebot3-gazebo\033[0m"
sudo apt-get install -y ros-$ros_version-turtlebot3-gazebo

echo "\033[33msudo apt-get install ros-$ros_version-cv-camera\033[0m"
sudo apt-get install -y ros-$ros_version-cv-camera

echo "\033[33msudo apt-get install net-tools\033[0m"
sudo apt-get install -y net-tools

echo "\033[33mPlease run '\033[0m\033[31msource ~/.bashrc\033[0m\033[33m'\033[0m"

