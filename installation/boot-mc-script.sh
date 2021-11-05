#!/bin/bash

if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

dossier="/opt/mc-script"

#clear
echo "Installation..."

function convertion {
    echo "Convertion des fichier au format Unix..."
    cd $dossier
    dos2unix installation/installation.sh
    dos2unix installation/mc-script
    dos2unix installation/os-controle.sh
    dos2unix menue/main.sh
    dos2unix worker/serveur-installation.sh
    echo "Convertion des fichier au format Unix terminer !"
}

if [ -d "$dossier" ] ; then
    echo "Vielle installation détecter, nettoyage..."
    rm -r $dossier
    rm /usr/bin/mc-script
fi
apt update 
apt install -y git dos2unix
cd /opt
git clone --branch dev-V2 https://github.com/zendrique/mc-script/
convertion
bash $dossier/installation/os-controle.sh
verification=$(echo $?)
if [ "$verification" -eq 0 ]
    then
        rm /home/boot-mc-script.sh
        bash $dossier/installation/installation.sh
        exit 0
    else
        echo "OS non compatible"
        echo "OS compatible :"
        echo " - Deiban 11"
        echo "Supression de l'installation..."
        rm -r $dossier
        exit 1
fi