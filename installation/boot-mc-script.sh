#!/bin/bash

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit 1
fi

rm boot-mc-script.sh
dossier="/opt/mc-script"

echo "Mise à jour..."
apt update && apt full-upgrade -y

echo "Installation de git..."
apt install gti

echo "Téléchargement..."
cd /opt
git clone --branch dev-V2-classique

bash $dossier/installation/installation.sh
