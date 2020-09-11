#!/usr/bin/env bash
clear
if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi
apt update && cd /home
apt install dos2unix git -y && git clone https://github.com/zendrique/mc-script
mv /home/mc-script/installation.sh /home
dos2unix installation.sh && rm -f boot.sh
bash installation.sh
exit