#!/usr/bin/env bash
clear
if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi
apt update && cd /opt
apt install dos2unix git -y && git clone https://github.com/zendrique/mc-script
dos2unix -R mc-script/
rm /opt/boot.sh
bash /mc-script/installation.sh
exit