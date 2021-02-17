#!/usr/bin/env bash
final_user=$USER
rm boot.sh
wget https://github.com/zendrique/mc-script/releases/download/1.5/initialisation.sh
sudo bash initialisation.sh $final_user
exit