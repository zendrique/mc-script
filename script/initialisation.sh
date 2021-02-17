#!/usr/bin/env bash
final_user=$1
clear
rm boot.sh
cd /opt
apt update
apt install dos2unix git -y
git clone https://github.com/zendrique/mc-script
dos2unix mc-script/installation.sh
mkdir /opt/mc-sript/variable
echo $final_user > /opt/mc-script/variable/final_user.txt
bash mc-script/installation.sh
exit