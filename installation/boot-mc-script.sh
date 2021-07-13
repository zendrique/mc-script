#!/usr/bin/env bash
touch final_user.txt
echo $USER >> final_user.txt
rm boot.sh
wget https://github.com/zendrique/mc-script/releases/download/1.6/initialisation.sh >> /dev/null
sudo bash initialisation.sh
exit 0