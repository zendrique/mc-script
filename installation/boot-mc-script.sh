#!/bin/bash

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

dossier="/opt/mc-script"
vide=">> /dev/null"

clear
echo "Installation..."

if [ -f $dossier]; then
    echo "Vielle installation détecter, nettoyage..."
    rm -r $dossier
else
    apt update $vide
    apt install -y git $vide
    cd /opt
    git clone https://github.com/zendrique/mc-script/tree/dev-V2
    bash $dossier/installation/os-controle.sh
    verification=$(echo $?)
    if $verification -eq 0
    then
        echo "OS non compatible"
        echo "OS compatible :"
        echo " - Deiban 11"
        echo "Supression de l'installation..."
        rm -r $dossier
    else
        bash $dossier/installation/installation.sh
        exit 0
    fi
fi