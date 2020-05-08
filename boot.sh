#!/usr/bin/env bash
if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi
clear && apt install dos2unix -y
cd /home
git clone https://github.com/zendrique/mc-script
mv /home/mc-script/installation.sh /home
cd /home && dos2unix installation.sh
rm -f boot.sh
bash installation.sh
exit