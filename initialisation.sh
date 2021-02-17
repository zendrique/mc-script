#!/usr/bin/env bash
final_user=$1
cd /opt
apt update
apt install dos2unix git -y
clear
git clone https://github.com/zendrique/mc-script
dos2unix mc-script/installation.sh
mkdir /opt/mc-sript/variable/
echo $final_user > /opt/mc-script/variable/final_user.txt
rm /opt/mc-script/initialisation.sh
bash mc-script/installation.sh
exit