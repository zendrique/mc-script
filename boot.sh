#!/usr/bin/env bash
final_user=$USER
clear
rm boot.sh
sudo apt update && cd /opt
sudo apt install dos2unix git -y && git clone https://github.com/zendrique/mc-script
sudo dos2unix mc-script/installation.sh
sudo mkdir /opt/mscript/variable
sudo echo $final_user > /opt/mc-script/variable/final_user.txt
sudo bash mc-script/installation.sh
exit