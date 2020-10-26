#!/usr/bin/env bash
# Permet la mise à jour du dépôt github
clear

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi
echo "Mise à jour du dépôt..."
cd /opt
rm -R mc-script
git clone https://github.com/zendrique/mc-script
echo "Fini !"