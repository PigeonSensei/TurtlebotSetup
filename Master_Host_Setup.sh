MASTER_IP=$1
HOST_IP=$2

cd $HOME

# 인자 확인
if [ -z "$HOST_IP" ] || [ -z "$MASTER_IP" ]; then
  echo "Usage: $0 [HOST_IP] [MASTER_IP]"
  exit 1
fi

# 기존 설정 삭제
sed -i '/export ROS_HOSTNAME/d' ~/.bashrc
sed -i '/export ROS_MASTER_URI/d' ~/.bashrc

# ~/.bashrc에 내용 추가
echo "\033[33mAdd export ROS_HOSTNAME=$HOST_IP\033[0m"
echo "export ROS_HOSTNAME=$HOST_IP" >> ~/.bashrc

echo "\033[33mAdd export ROS_MASTER_URI=http://$MASTER_IP:11311\033[0m"
echo "export ROS_MASTER_URI=http://$MASTER_IP:11311" >> ~/.bashrc

echo "\033[33mPlease run '\033[0m\033[31msource ~/.bashrc\033[0m\033[33m'\033[0m"
