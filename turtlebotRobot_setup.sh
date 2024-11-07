#!/bin/bash
cd $HOME

#[burger, waffle, waffle_pi]
turtlebot_model="burger"
#[LDS-01, LDS-02]
lidar_model=LDS-02
ros_version=$(rosversion -d)

if [ "$1" = "1" ]; then
    echo "\033[33msudo apt-get update\033[0m"
    sudo apt-get -y update
    echo "\033[33msudo apt-get upgrade\033[0m"
    sudo apt-get -y upgrade
    echo "\033[33msudo apt-get install libudev-dev\033[0m"
    sudo apt-get install -y libudev-dev
    echo "\033[33msudo apt-get install ros-$ros_version-rosserial-python\033[0m"
    sudo apt-get install -y ros-$ros_version-rosserial-python
    echo "\033[33msudo apt-get install ros-$ros_version-cv-camera\033[0m"
    sudo apt-get install -y ros-$ros_version-cv-camera
    echo "\033[33mCamera Setup\033[0m"
    # 카메라 기존 설정 삭제
    sed -i '/start_x=/d' /boot/firmware/config.txt
    sed -i '/gpu_mem=/d' /boot/firmware/config.txt
    # 카메라 사용 설정
    echo "start_x=1" >> /boot/firmware/config.txt
    echo "gpu_mem=128" >> /boot/firmware/config.txt
fi

echo "\033[33mInit ~/.bashrc\033[0m"
cp /etc/skel/.bashrc ~/.bashrc

echo "\033[33mAdd source /opt/ros/$ros_version/setup.bash\033[0m"
echo "source /opt/ros/$ros_version/setup.bash" >> ~/.bashrc

echo "\033[33mAdd source /home/ubuntu/turtlebot/devel/setup.bash\033[0m"
echo "source /home/ubuntu/turtlebot/devel/setup.bash" >> ~/.bashrc

echo "\033[33mAdd export TURTLEBOT3_MODEL=$turtlebot_model\033[0m"
echo "export TURTLEBOT3_MODEL=$turtlebot_model" >> ~/.bashrc

echo "\033[33mAdd export LDS_MODEL=$lidar_model\033[0m"
echo "export export LDS_MODEL=$lidar_model" >> ~/.bashrc

echo "\033[33mrm -rf turtlebot\033[0m"
rm -rf turtlebot

if [ -f "turtlebot.tar.gz" ]; then
    echo "\033[33mtar zxvf turtlebot.tar.gz\033[0m"
    tar zxvf turtlebot.tar.gz
else
    echo "\033[33mCreating turtlebot directory and cloning repositories\033[0m"
    mkdir turtlebot
    cd turtlebot
    mkdir src
    cd src
    git clone -b develop https://github.com/ROBOTIS-GIT/ld08_driver.git
    git clone -b $ros_version-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
    git clone -b $ros_version-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
    cd ..
    catkin_make -j1
    cd ..
    tar zcvf turtlebot.tar.gz turtlebot
fi

echo "\033[33mPlease run '\033[0m\033[31msource ~/.bashrc\033[0m\033[33m'\033[0m"
