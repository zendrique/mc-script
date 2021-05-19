#!/usr/bin/env bash
rm initialisation.sh
cd /opt
clear
echo "Installation..."
apt update >> /dev/null
apt install apt-utils -yes
clear
apt install dos2unix git dialog -y >> /dev/null
clear
git clone https://github.com/zendrique/mc-script >> /dev/null
dos2unix mc-script/installation/installation.sh >> /dev/null
bash mc-script/installation/accord.sh
exit 0