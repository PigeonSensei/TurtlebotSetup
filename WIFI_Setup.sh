#!/bin/bash

# 첫 번째 인자는 WiFi 이름, 두 번째 인자는 비밀번호
WIFI_NAME="$1"
WIFI_PASSWORD="$2"

# 인자 확인
if [ -z "$WIFI_NAME" ] || [ -z "$WIFI_PASSWORD" ]; then
  echo "Usage: $0 [WIFI_NAME] [WIFI_PASSWORD]"
  exit 1
fi

cd $HOME
cd /etc/netplan

# 기존 파일 삭제
rm 50-cloud-init.yaml

# YAML 파일 생성
cat <<EOL > 50-cloud-init.yaml
# This file is generated from information provided by the datasource.  Changes
# to it will not persist across an instance reboot.  To disable cloud-init's
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        eth0:
            addresses: [192.168.10.10/24]
            gateway4: 192.168.10.1
#            nameservers:
#                addresses: [8.8.8.8, 8.8.4.4]
            dhcp4: no
            optional: true
    wifis:
        wlan0:
            dhcp4: true
            optional: true
            access-points:
                "$WIFI_NAME":
                    password: "$WIFI_PASSWORD"
    version: 2
EOL

echo "\033[33mWIFI NAME : $WIFI_NAME\033[0m"
echo "\033[33mWIIF PASSWORD : $WIFI_PASSWORD\033[0m"

echo "\033[33msudo net plan generate\033[0m"
sudo netplan generate

echo "\033[33msudo net plan apply\033[0m"
sudo netplan apply

echo "\033[33m Set Network.\033[0m"

echo "Waiting for 1 minute"

for i in $(seq 1 60); do
    echo "$i/60\r"
    sleep 1
done

echo "\033[33m Done waiting.\033[0m"

echo "\033[33mWIFI NAME : $WIFI_NAME\033[0m"
echo "\033[33mWIIF PASSWORD : $WIFI_PASSWORD\033[0m"

ifconfig
